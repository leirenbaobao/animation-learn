//
//  TableViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/9/11.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "TableViewController.h"

@interface CustomCell : UITableViewCell

@end

@implementation CustomCell

@end

@interface TableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    [_tableView registerClass:CustomCell.class forCellReuseIdentifier:@"custom"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

@end
