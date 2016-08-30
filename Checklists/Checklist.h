//
//  Checklist.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/30/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *items;
@end
