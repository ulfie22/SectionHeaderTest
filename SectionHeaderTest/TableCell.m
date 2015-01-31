//
//  TableCell.m
//  SectionHeaderTest
//
//  Created by Andy Drexler on 1/31/15.
//  Copyright (c) 2015 NetSMART Enterprises. All rights reserved.
//

#import "TableCell.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

static const CGFloat kOuterPadding = 16.0f;
static const CGFloat kInnerPadding = 16.0f;
static const CGFloat kIconHeight = 18.0f;
static const CGFloat kIconWidth = 20.0f;

@interface TableCell ()
{
    ASTextNode *_textNode;
    ASDisplayNode *_divider;
    ASImageNode *_iconNode;
}

@end

@implementation TableCell

-(instancetype)initWithTitle:(NSString *)title andIcon:(NSString *)iconFile {
    
    if (!(self = [super init]))
        return nil;
    
    _textNode = [[ASTextNode alloc] init];
    _iconNode = [[ASImageNode alloc] init];
    
    _iconNode.backgroundColor = [UIColor clearColor];
    _iconNode.image = [UIImage imageNamed:@"paper_2.png"];
    
    [self addSubnode:_iconNode];
    
    UIFont *theFont = [UIFont fontWithName:@"Avenir-Light" size:18.0];
    
    NSMutableAttributedString *myString = [[NSMutableAttributedString alloc] initWithString:title];
    
    [myString addAttribute:NSFontAttributeName value:theFont range:NSMakeRange(0,[title length])];
    
    _textNode.attributedString = [[NSAttributedString alloc] initWithAttributedString:myString];
    
    
    [self addSubnode:_textNode];
    
    // hairline cell separator
    _divider = [[ASDisplayNode alloc] init];
    _divider.backgroundColor = [UIColor lightGrayColor];
    [self addSubnode:_divider];
    
    self.userInteractionEnabled = YES;
    
    
    return self;
}

-(instancetype)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title andIcon:nil];
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    //DDLogCInfo(@"MainMenuCell calculateSizeThatFits constrained size w: %f h: %f", constrainedSize.width, constrainedSize.height);
    CGSize textSize = [_textNode measure:CGSizeMake(constrainedSize.width, 100)];
    //DDLogCInfo(@"MainMenuCell calculateSizeThatFits text size w: %f h: %f", textSize.width, textSize.height);
    
    //CGSize calcSize = _textNode.calculatedSize;
    //DDLogCInfo(@"MainMenuCell calculateSizeThatFits calculated size w: %f h: %f", calcSize.width, calcSize.height);
    
    CGSize forcedSize = CGSizeMake(constrainedSize.width, 44.0);
    
    return forcedSize;
}

- (void)layout
{
    CGFloat pixelHeight = 1.0f / [[UIScreen mainScreen] scale];
    _divider.frame = CGRectMake(0.0f, 0.0f, self.calculatedSize.width, pixelHeight);
    
    _iconNode.frame = CGRectMake(kOuterPadding, kOuterPadding + 2, kIconWidth, kIconHeight);
    
    CGSize textSize = _textNode.calculatedSize;
    //DDLogCInfo(@"MainMenuCell layout calculated size w: %f h: %f", textSize.width, textSize.height);
    //CGSize nodeSize = self.calculatedSize;
    //DDLogCInfo(@"MainMenuCell node size w: %f h: %f", nodeSize.width, nodeSize.height);
    //CGSize frameSize = self.frame.size;
    //DDLogCInfo(@"MainMenuCell cell frame size w: %f h: %f", frameSize.width, frameSize.height);
    CGSize calcSize = self.calculatedSize;
    //DDLogCInfo(@"MainMenuCell cell calc size w: %f h: %f", calcSize.width, calcSize.height);
    _textNode.frame = CGRectMake(kOuterPadding + kIconWidth + kInnerPadding, kOuterPadding, textSize.width, textSize.height);
    
}


@end
