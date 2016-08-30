//
//  ViewController.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/26/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@class Checklist;

@interface ViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property(nonatomic,strong)Checklist *checklist;

@end

