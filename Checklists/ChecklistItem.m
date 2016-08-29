//
//  ChecklistItem.m
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/26/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "ChecklistItem.h"

@interface ChecklistItem ()
    
@end

@implementation ChecklistItem


-(void)toggleChecked{
    self.checked = !self.checked;
}

@end
