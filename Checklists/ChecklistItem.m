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

-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super init])){
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeObjectForKey:@"Checked"];
    }
    return self;
}

-(void)toggleChecked{
    self.checked = !self.checked;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}
@end
