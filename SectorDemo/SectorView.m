//
//  SectorView.m
//  SectorDemo
//
//  Created by ZhangYuanqing on 14-10-24.
//  Copyright (c) 2014年 CBSi. All rights reserved.
//

#import "SectorView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface SectorView ()

@property (nonatomic, retain) NSArray *storeColors;
@property (nonatomic, retain) NSArray *percents;

@property (nonatomic, retain) NSMutableArray *titleLabels;

@end

@implementation SectorView

- (id)initWithPercents:(NSArray *)percents {
    
    self = [super init];
    
    if (self) {
        self.storeColors = @[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor]];
        self.percents = percents;
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabels = [NSMutableArray arrayWithCapacity:0];
    }
    
    return self;
}

- (void)reDraw {
    
    [self setNeedsDisplay];
}

- (void)reConfigurePercents:(NSArray *)percents {
    
    self.percents = percents;
}

- (void)drawRect:(CGRect)rect {
    
    for (UILabel *label in self.titleLabels) {
        [label removeFromSuperview];
    }
    
    [self.titleLabels removeAllObjects];
    
    CGFloat radius = 100;
    
    CGFloat starttime = -M_PI; //1 pm = 1/6 rad
//    CGFloat endtime = 0;  //6 pm = 1 rad
    
    NSMutableArray *rads = [NSMutableArray arrayWithObject:@(starttime)];
    
//    self.percents = @[@(15), @(15), @(60), @(10)];
    
    self.storeColors = @[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor]];
    
    for (int i = 0; i < self.percents.count; i ++) {
            
            CGFloat percent1 = [self.percents[0] floatValue];
            
            for (int j = 1; j <= i ; j ++) {
                percent1 += [self.percents[j] floatValue];
            }
            CGFloat endTime1 = - (100 - percent1) / 100 * M_PI;
            
            [rads addObject:@(endTime1)];
        
        
    }
    [rads removeLastObject];
    [rads addObject:@(0)];
    
    for (int i = 0; i < self.percents.count; i ++) {
        
        CGFloat startrad = [rads[i] floatValue];
        CGFloat endrad = [rads[i + 1] floatValue];
        
        CGPoint center = CGPointMake(kScreenWidth / 2,radius * 1.5);
        UIBezierPath *arc = [UIBezierPath bezierPath]; //empty path
        [arc moveToPoint:center];
        CGPoint next;
        next.x = center.x + radius * cos(startrad);
        next.y = center.y + radius * sin(startrad);
        [arc addLineToPoint:next]; //go one end of arc
        [arc addArcWithCenter:center radius:radius startAngle:startrad endAngle:endrad clockwise:YES]; //add the arc
        [arc addLineToPoint:center]; //back to center
        
        UIColor *color = self.storeColors[i % self.storeColors.count];
        
        [color set];
        [arc fill];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 50, 20)];
        CGPoint labelPoint;
        labelPoint.x = center.x + radius * cos((endrad + startrad) / 2);
        labelPoint.y = center.y + radius * sin((endrad + startrad) / 2);
        titleLabel.transform = CGAffineTransformMakeRotation(M_PI / 2 + ((endrad + startrad) / 2));
        titleLabel.center = labelPoint;
        titleLabel.text = [NSString stringWithFormat:@"%ld ps", (long)[self.percents[i] integerValue]];
        titleLabel.backgroundColor = [UIColor clearColor];
    
        [self addSubview:titleLabel];
        [self.titleLabels addObject:titleLabel];
        titleLabel.hidden = !self.showTitles;
        
    }
    
    //draw mask view
    
//    CGPoint center = CGPointMake(150, radius * 1.5);
//    UIBezierPath *arc = [UIBezierPath bezierPath];
//    [arc moveToPoint:center];
////    [[UIColor blueColor] setStroke];
//    CGPoint next;
//    next.x = center.x + 80 * cos(starttime);
//    next.y = center.y + 80 * sin(starttime);
//    [arc addLineToPoint:next];
//    [arc addArcWithCenter:center radius:80 startAngle:starttime endAngle:0 clockwise:YES];
//    [arc addLineToPoint:center];
////    [arc stroke];
//    [[UIColor purpleColor] set];
//    [arc fill];
}

@end
