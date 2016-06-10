//
//  ViewController.h
//  CicleLayoutTest
//
//  Created by jimmyzhang on 16/6/9.
//  Copyright © 2016年 jimmyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *grid;

@end

