//
//  TableCell.h
//  SectionHeaderTest
//
//  Created by Andy Drexler on 1/31/15.
//  Copyright (c) 2015 NetSMART Enterprises. All rights reserved.
//

#import "ASCellNode.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface TableCell : ASCellNode

-(instancetype)initWithTitle:(NSString *)title andIcon:(NSString *)iconFile;
-(instancetype)initWithTitle:(NSString *)title;

@end
