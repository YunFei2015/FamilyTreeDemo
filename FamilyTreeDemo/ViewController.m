//
//  ViewController.m
//  FamilyTreeDemo
//
//  Created by 云菲 on 16/5/7.
//  Copyright © 2016年 云菲. All rights reserved.
//

//家谱可以左右移动，列表不动
//家谱和列表可以一起放大，一起上下拖动

#import "ViewController.h"
#import "QYTableView.h"
#import "QYTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet QYTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_tableView registerNib:[UINib nibWithNibName:@"QYTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoom)];
    doubleTap.numberOfTapsRequired = 2;
    [_tableView addGestureRecognizer:doubleTap];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_tableView reloadData];
    
    //根据数据源创建家谱树
    UIView *familyTreeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 500)];//每行高度100
    familyTreeView.backgroundColor = [UIColor clearColor];
    [_tableView.scrollView addSubview:familyTreeView];
    
    //在每一代的cell对应的位置创建人物图,主要是y、height和cell的相同
    for (int i = 0; i < 5; i++) {
        QYTableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        CGRect frame = cell.frame;
        UIView *personsView = [self addPersonViewWithFrame:CGRectMake(10, frame.origin.y, 100, frame.size.height)];
        [familyTreeView addSubview:personsView];
    }
}

-(UIView *)addPersonViewWithFrame:(CGRect)frame{
    UIView *personsView = [[UIView alloc] initWithFrame:frame];
    personsView.backgroundColor = [UIColor clearColor];
    
    UILabel *personLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
    personLab.text = @"person";
    [personsView addSubview:personLab];
    UILabel *personLab1 = [[UILabel alloc] initWithFrame:CGRectMake(300, 10, 200, 30)];
    personLab1.text = @"person1";
    [personsView addSubview:personLab1];
    UILabel *personLab2 = [[UILabel alloc] initWithFrame:CGRectMake(500, 10, 200, 30)];
    personLab2.text = @"person2";
    [personsView addSubview:personLab2];
    UILabel *personLab3 = [[UILabel alloc] initWithFrame:CGRectMake(700, 10, 200, 30)];
    personLab3.text = @"person3";
    [personsView addSubview:personLab3];
    
    return personsView;
}

-(void)zoom{
    [_tableView setZoomScale:2 animated:YES];
}


#pragma mark - UITableView Delegate & Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLab.text = [@(indexPath.row) stringValue];
    
    
    return cell;
}

#pragma mark - UIScrollView Delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _tableView.subviews.firstObject;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
