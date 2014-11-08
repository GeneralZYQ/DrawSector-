//
//  SectorView.h
//  SectorDemo
//
//  Created by ZhangYuanqing on 14-10-24.
//  Copyright (c) 2014年 CBSi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectorView : UIView

- (id)initWithPercents:(NSArray *)percents;
- (void)reConfigurePercents:(NSArray *)percents;

- (void)reDraw;

@end
