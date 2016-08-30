//
//  Checklist.m
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/30/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist

//加载已有的checklists
-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super init])){
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.name = [aDecoder decodeObjectForKey:@"Items"];
    }
    return self;
}


#pragma mark
//增加新的checklist
-(id)init{
    if((self =[super init])){
        self.items = [[NSMutableArray alloc]initWithCapacity:20];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
}
@end
