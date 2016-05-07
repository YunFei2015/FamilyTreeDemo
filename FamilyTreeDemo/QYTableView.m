//
//  QYTableView.m
//  FamilyTreeDemo
//
//  Created by 云菲 on 16/5/7.
//  Copyright © 2016年 云菲. All rights reserved.
//

#import "QYTableView.h"

@implementation QYTableView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self.subviews.firstObject addSubview:self.scrollView];
    }
    return self;
}

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        scrollView.contentSize = CGSizeMake(1000, self.frame.size.height);
        _scrollView = scrollView;
    }
    return _scrollView;
}

@end
