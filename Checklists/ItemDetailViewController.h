//
//  itemDetailViewContyroller.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/29/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>
-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController*)controller;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishAddingItem:(ChecklistItem*) item;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishEditingItem:(ChecklistItem*)item;
@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <ItemDetailViewControllerDelegate> delegate;
@property(nonatomic,strong) ChecklistItem *itemToEdit;
@end
