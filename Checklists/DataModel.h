//
//  DataModel.h
//  Checklists
//
//  Created by Nancy's MacbookPro on 8/30/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property(nonatomic,strong)NSMutableArray *lists;

-(void)saveChecklists;
-(NSInteger)indexOfSelectedChecklist;
-(void)setIndexOfSelectedChecklist:(NSInteger)index;
-(void)sortChecklists;
@end
