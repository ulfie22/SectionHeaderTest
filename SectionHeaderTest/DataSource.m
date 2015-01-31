//
//  DataSource.m
//  SectionHeaderTest
//
//  Created by Andy Drexler on 1/31/15.
//  Copyright (c) 2015 NetSMART Enterprises. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

-(instancetype)init
{
    if (!(self = [super init]))
        return nil;
    
    _sections = @[
                  @{
                      @"title" : @"section 1",
                      @"items" : @[
                              @"item 1-1",
                              @"item 1-2",
                              @"item 1-3"
                              ]
                      },
                  @{
                      @"title" : @"section 2",
                      @"items" : @[
                              @"item 2-1",
                              @"item 2-2",
                              @"item 2-3"
                              ]
                      }
                  ];
    
    return self;
}
@end
