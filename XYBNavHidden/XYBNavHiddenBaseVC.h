//
//  XYBNavHiddenBaseVC.h
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/22.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYBNavHiddenBaseVC : UIViewController
@property (nonatomic , strong)UIScrollView *scrollView;



- (void)leftBtnItemTitleWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block;
- (void)leftBtnItemImageWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block;
- (void)rightBtnItemTitleWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block;
- (void)rightBtnItemImageWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block;
@end

NS_ASSUME_NONNULL_END
