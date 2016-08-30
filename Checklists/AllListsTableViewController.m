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

@interface AllListsTableViewController ()

@end

@implementation AllListsTableViewController{
    NSMutableArray *_lists;
}


-(id)initWithCoder:(NSCoder *)aDecoder{ if((self =[super initWithCoder:aDecoder])){
    _lists = [[NSMutableArray alloc]initWithCapacity:20];
    Checklist *list;
    list = [[Checklist alloc]init];
    list.name = @"娱乐";
    [_lists addObject:list];
    list = [[Checklist alloc]init];
    list.name = @"工作";
    [_lists addObject:list];
    list = [[Checklist alloc]init];
    list.name = @"学习";
    [_lists addObject:list];
    list = [[Checklist alloc]init];
    list.name = @"家庭";
    [_lists addObject:list];
    
    for(Checklist *list in _lists){
        ChecklistItem *item = [[ChecklistItem alloc]init];
        item.text = [NSString stringWithFormat:@"item for : %@", list.name];
        [list.items addObject:item];
    }
}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_lists count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Checklist *checklist = _lists[indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Checklist *checklist = _lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_lists removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    ListDetailViewController *controller = (ListDetailViewController*)navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = _lists[indexPath.row];
    controller.checklistToEdit = checklist;
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowChecklist"]){
        ViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    }else if ([segue.identifier isEqualToString:@"AddChecklist"]){
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController*)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist{
    NSInteger index = [_lists indexOfObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist{
    NSInteger newRowIndex = [_lists count];
    [_lists addObject:checklist];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
