//
//  TitTableView.h
//  TouchDemo
//
//  Created by Daniel on 16/6/29.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style touchBlock:(UIView * (^)(BOOL isHidden))block;

@end
