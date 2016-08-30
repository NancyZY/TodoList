//
//  itemDetailViewContyroller.m
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/29/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()
- (IBAction)cancle:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ItemDetailViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.itemToEdit != nil){
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancle:(id)sender {
    [self.delegate itemDetailViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    if(self.itemToEdit == nil){
        ChecklistItem *item = [[ChecklistItem alloc]init];
        item.text = self.textField.text;
        [self.delegate itemDetailViewController:self didFinishAddingItem:item];
    }else{
        self.itemToEdit.text = self.textField.text;
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    if([newText length] >0){
//        self.doneBarButton.enabled = YES;
//    }else{
//            self.doneBarButton.enabled = NO;
//    }
    
    self.doneBarButton.enabled = ([newText length] > 0);    
    return YES;
}
@end
