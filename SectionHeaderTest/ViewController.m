//
//  ViewController.m
//  SectionHeaderTest
//
//  Created by Andy Drexler on 1/31/15.
//  Copyright (c) 2015 NetSMART Enterprises. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"
#import "TableCell.h"
#import "TableHeaderNode.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ViewController () <ASTableViewDataSource, ASTableViewDelegate>
{
    ASTableView *_tableView;
}

@property(nonatomic, strong) DataSource *data;
@property(nonatomic, strong) NSMutableDictionary *headers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _data = [[DataSource alloc] init];
    
    _tableView = [[ASTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.asyncDataSource = self;
    _tableView.asyncDelegate = self;
    
    
    // add async table view
    [self.view addSubview:_tableView];
    _tableView.frame = self.view.bounds;
    [_tableView reloadData];

    _headers = [[NSMutableDictionary alloc] init];
}

- (void)viewWillLayoutSubviews
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark ASTableView

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // doing nothing in this app
}

- (ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *sect = [_data.sections objectAtIndex:indexPath.section];
    NSArray *items = [sect objectForKey:@"items"];
    ASCellNode *node = [[TableCell alloc] initWithTitle:[items objectAtIndex:indexPath.row]];
    
    return node;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _data.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *sect = [_data.sections objectAtIndex:section];
    return [[sect objectForKey:@"items"] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    id key = @(section);
    NSDictionary *sect = [_data.sections objectAtIndex:section];
    TableHeaderNode *node = _headers[key];
    if (!node) {
        node = [[TableHeaderNode alloc] initWithTitle:[sect objectForKey:@"title"]];
        _headers[key] = node;
    }
    [node measure:CGSizeMake(tableView.bounds.size.width, FLT_MAX)];

    return node.view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // enable row selection (set to NO to turn it off)
    return YES;
}


@end
