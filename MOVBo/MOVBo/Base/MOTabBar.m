//
//  MOTabBar.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MOTabBar.h"

@implementation MOTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat x = Screen_Width / 5;
    static NSInteger num = 0;
    for (id item in self.subviews) {
        if ([item isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            UIView *v = item;
            if (num == 2) {
                num ++;
            }
            v.frame = CGRectMake(num * x, 0, x, v.h);
            num++;
        }
    }
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 此处调用保证只执行一次
        [self addBtn];
    }
    return self;
}

- (void)addBtn {
    UIButton *btn = Button.img(@"tabbar_compose_icon_add").highImg(@"tabbar_compose_icon_add_highlighted").bgImg(@"tabbar_compose_button").highBgImg(@"tabbar_compose_button_highlighted").fitSize;
    CGFloat x = Screen_Width / 5;
    btn.frame = CGRectMake(2 *x, 0, x, btn.h);
    [self addSubview:btn];
}


@end
