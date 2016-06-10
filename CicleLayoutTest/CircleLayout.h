//
//  CircleLayout.h
//  DelegateFlowLayoutTest
//
//  Created by jimmyzhang on 16/6/9.
//  Copyright © 2016年 jimmyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) CGPoint center;

@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, assign) NSInteger cellCount;

@end
