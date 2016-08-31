//
//  IconPickerViewController.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/31/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IconPickerViewController;
@protocol IconPickerViewControllerDelegate <NSObject>

-(void)iconPicker:(IconPickerViewController*)picker didPickIcon:(NSString*)iconName;

@end


@interface IconPickerViewController : UITableViewController

@property(nonatomic,weak)id <IconPickerViewControllerDelegate>delegate;

@end
