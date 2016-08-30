//
//  ChecklistItem.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/26/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem: NSObject<NSCoding>
    @property(nonatomic,copy)NSString *text;
    @property(nonatomic,assign)BOOL checked;

    -(void)toggleChecked;
@end
