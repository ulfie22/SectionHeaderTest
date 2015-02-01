//
//  TableHeaderNode.m
//  SectionHeaderTest
//
//  Created by Andy Drexler on 1/31/15.
//  Copyright (c) 2015 NetSMART Enterprises. All rights reserved.
//

#import "TableHeaderNode.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

static const CGFloat kOuterPadding = 16.0f;

@interface TableHeaderNode ()
{
    ASTextNode *_textNode;
}

@end

@implementation TableHeaderNode

-(instancetype)initWithTitle:(NSString *)title {
    
    if (!(self = [super init]))
        return nil;
    
    self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    _textNode = [[ASTextNode alloc] init];
    UIFont *theFont = [UIFont fontWithName:@"Avenir-Light" size:12.0];
    
    NSMutableAttributedString *myString = [[NSMutableAttributedString alloc] initWithString:title];
    
    [myString addAttribute:NSFontAttributeName value:theFont range:NSMakeRange(0,[title length])];
    
    _textNode.attributedString = [[NSAttributedString alloc] initWithAttributedString:myString];
    
    [self addSubnode:_textNode];
    
    return self;
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    //DDLogCInfo(@"TableHeaderNode calculateSizeThatFits constrained size w: %f h: %f", constrainedSize.width, constrainedSize.height);
    CGSize textSize = [_textNode measure:CGSizeMake(constrainedSize.width, 44.0)];
    CGSize forcedSize = CGSizeMake(constrainedSize.width, 44.0);
    
    return forcedSize;
}

- (void)layout
{
    
    /*
    //CGSize textSize = _textNode.calculatedSize;
    CGSize textSize1 = [_textNode measure:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    CGSize textSize = _textNode.calculatedSize;
    //DDLogCInfo(@"TableHeaderNode layout calculated size w: %f h: %f", textSize.width, textSize.height);
    
    //float w = self.frame.size.width - (2 * kOuterPadding);
    _textNode.frame = CGRectMake(kOuterPadding, kOuterPadding, textSize.width, textSize.height);
    */
    
    CGPoint textOrigin = CGPointMake(kOuterPadding, kOuterPadding);
    _textNode.frame = (CGRect){ .origin = textOrigin, .size = _textNode.calculatedSize };

    
}

@end
