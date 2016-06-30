//
//  TitTableView.m
//  TouchDemo
//
//  Created by Daniel on 16/6/29.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "TitTableView.h"

@implementation TitTableView {
    typeof(UIView * (^)(BOOL isHidden)) touchBlock;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style touchBlock:(UIView * (^)(BOOL isHidden))block {
    if (self = [super initWithFrame:frame style:style]) {
        touchBlock = block;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self.tableHeaderView pointInside:point withEvent:event]) {
        return touchBlock(YES);
    }
    return [super hitTest:point withEvent:event];
}

@end
