//
//  AllListsTableViewController.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/30/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsTableViewController : UITableViewController<ListDetailViewControllerDelegate,
            UINavigationControllerDelegate>

@property(nonatomic,strong)DataModel *dataModel;

@end
