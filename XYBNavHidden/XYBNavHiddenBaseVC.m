//
//  XYBNavHiddenBaseVC.m
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/22.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#import "XYBNavHiddenBaseVC.h"
#import "UIButton+XYBBtnClickBlock.h"


#define Screen_Height   ([UIScreen mainScreen].bounds.size.height)
#define KIs_IphoneX     (Screen_Height >= 812)
#define Screen_width    ([UIScreen mainScreen].bounds.size.width)
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
@interface XYBNavHiddenBaseVC ()<UIScrollViewDelegate>

@property (nonatomic , strong)UIView *navBackView;
@property (nonatomic , strong)UILabel *titleLab;

@end

@implementation XYBNavHiddenBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.userInteractionEnabled = YES;
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.navBackView];
    [self.view bringSubviewToFront:self.navBackView];
    
    [self.navBackView addSubview:self.titleLab];
}

- (void)setTitle:(NSString *)title
{
    self.titleLab.text = title;
}


- (UIView *)navBackView
{
    if (!_navBackView) {
        _navBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, KIs_IphoneX?84:64)];
        _navBackView.backgroundColor = RGBACOLOR(0, 0, 0, 0);
        _navBackView.userInteractionEnabled = YES;
    }
    return _navBackView;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(Screen_width/2-50, KIs_IphoneX?40:20, 100, 44)];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.font = [UIFont systemFontOfSize:17];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_Height)];
        _scrollView.contentSize = CGSizeMake(Screen_width, Screen_Height+100);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.userInteractionEnabled = YES;
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.navBackView.backgroundColor = RGBACOLOR(0, 0, 0, scrollView.contentOffset.y/200);
}

- (void)leftBtnItemTitleWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block
{
    for (NSInteger i=0; i<titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15+64*i, KIs_IphoneX?40:20, 64, 44);
        if (i==0) {
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.navBackView addSubview:btn];
        btn.click = ^{
            if (block) {
                block(i);
            }
        };
    }
}

- (void)leftBtnItemImageWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block
{
    for (NSInteger i=0; i<titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15+64*i, KIs_IphoneX?40:20, 64, 44);
        [btn setImageEdgeInsets:UIEdgeInsetsMake(2, 12, 2, 12)];
        if (i==0) {
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        [btn setImage:[UIImage imageNamed:titleArr[i]] forState:UIControlStateNormal];
        [self.navBackView addSubview:btn];
        btn.click = ^{
            if (block) {
                block(i);
            }
        };
    }
}

- (void)rightBtnItemTitleWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block
{
    for (NSInteger i=0; i<titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(Screen_width-79-64*i, KIs_IphoneX?40:20, 64, 44);
        if (i==0) {
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.navBackView addSubview:btn];
        btn.click = ^{
            if (block) {
                block(i);
            }
        };
    }
}
- (void)rightBtnItemImageWithArr:(NSArray *) titleArr WithCliclBlock:(void(^)(NSInteger index))block
{
    for (NSInteger i=0; i<titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(Screen_width-79-64*i, KIs_IphoneX?40:20, 64, 44);
        [btn setImageEdgeInsets:UIEdgeInsetsMake(2, 12, 2, 12)];
        if (i==0) {
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        [btn setImage:[UIImage imageNamed:titleArr[i]] forState:UIControlStateNormal];
        [self.navBackView addSubview:btn];
        btn.click = ^{
            if (block) {
                block(i);
            }
        };
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
