//
//  ViewController.m
//  TouchDemo
//
//  Created by Daniel on 16/6/29.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "TitTableView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIScrollView *backView;
@property (nonatomic, strong)TitTableView *tableView;
@property (nonatomic, strong)UIView *tableHeader;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HitDemo";

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.backView];
    [self.view addSubview:self.tableView];
}

- (UIScrollView *)backView {
    if (!_backView) {
        _backView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
        _backView.delegate = self;
        _backView.clipsToBounds = YES;
        _backView.backgroundColor = [UIColor redColor];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _backView.frame.size.width*2, _backView.frame.size.height*2)];
        imgView.image = [UIImage imageNamed:@"cat.png"];
        [_backView addSubview:imgView];
        _backView.contentSize = imgView.frame.size;
        _backView.bounces = NO;
    }
    return _backView;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.backView) {
        self.tableView.hidden = NO;
    }
}

/*======================================================================================*/

- (UITableView *)tableView {
    
    __weak typeof(self) blockSelf = self;
    
    if (!_tableView) {
        _tableView = [[TitTableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain touchBlock:^UIView *(BOOL isHidden) {
            blockSelf.tableView.hidden = isHidden;
            return _backView;
        }];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeader;
        _tableView.backgroundColor = [UIColor clearColor];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSArray *colors = @[[UIColor redColor],[UIColor yellowColor],[UIColor orangeColor]];
    cell.backgroundColor = colors[indexPath.row%3];
    return cell;
}

- (UIView *)tableHeader {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    view.backgroundColor = [UIColor clearColor];

    return view;
}

@end
