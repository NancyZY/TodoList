//
//  AllListsTableViewController.m
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/30/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "AllListsTableViewController.h"
#import "Checklist.h"
#import "ViewController.h"
#import "ChecklistItem.h"
#import "DataModel.h"

@interface AllListsTableViewController ()

@end

@implementation AllListsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
    NSInteger index = [self.dataModel indexOfSelectedChecklist];
    if(index >=0 && index <[self.dataModel.lists count]){
        Checklist *checklist = self.dataModel.lists[index];
        [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataModel.lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d Remaining", [checklist countUncheckedItems]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataModel setIndexOfSelectedChecklist:indexPath.row];
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

// Mark Navigation delegate
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(viewController == self){
        [self.dataModel setIndexOfSelectedChecklist:-1];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    } else if ([segue.identifier isEqualToString:@"AddChecklist"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist
{
    NSInteger newRowIndex = [self.dataModel.lists count];
    [self.dataModel.lists addObject:checklist];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist
{
    NSInteger index = [self.dataModel.lists indexOfObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    
    ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    controller.checklistToEdit = checklist;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}


@end
