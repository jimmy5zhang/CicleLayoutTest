//
//  ViewController.m
//  CicleLayoutTest
//
//  Created by jimmyzhang on 16/6/9.
//  Copyright © 2016年 jimmyzhang. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayout.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSInteger cellCount;
}

- (void)viewDidLoad {
    // 设置开始的时候包含16个单元格
    cellCount = 16;
    // 创建自定义的CircleLayout布局对象
    CircleLayout* circleLayout = [[CircleLayout alloc] init];
    // 设置使用自定义布局
    self.grid.collectionViewLayout = circleLayout;
    // 设置背景色
    self.grid.backgroundColor = [UIColor grayColor];
    // 为UICollectionView设置dataSource和delegate
    self.grid.dataSource = self;
    self.grid.delegate = self;
    // 创建一个处理点击的手势处理器
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    // 为UICollectionView增加一个手势处理器
    [self.grid addGestureRecognizer:tapRecognizer];
}

// 该方法的返回值决定该UICollectionView包含多少个单元格
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cellCount;
}

// 该方法的返回值决定该UICollectionView指定位置的单元格控件
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"cellId";
    // 从可重用表格的队列中取出一个表格行
    UICollectionViewCell* cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:cellId
                                  forIndexPath:indexPath];
    return cell;
}

// 定义处理点击手势的方法
- (void)handleTap:(UITapGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateEnded){
        // 获取触碰点的位置
        CGPoint inititalPinchPoint = [sender locationInView:self.grid];
        // 获取点击点所有的NSIndexPath（可用于获取被点击的单元格）
        NSIndexPath* tappedCellPath = [self.grid indexPathForItemAtPoint:inititalPinchPoint];
        // 如果被点击的单元格存在
        if(tappedCellPath){
            // 减少一个单元格
            cellCount --;
            // 删除被点击的单元格
            [self.grid deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
        }else{
            // 增加一个单元格
            cellCount ++ ;
            // 在UICollectionView的开始处添加一个单元格
            [self.grid insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
        }
    }
}

@end
