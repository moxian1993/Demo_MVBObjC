//
//  MOVisitorView.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import "MOVisitorView.h"

@interface MOVisitorView ()

@property (nonatomic, weak) UIImageView *circleImgView;
@property (nonatomic, weak) UIImageView *coverImgView;
@property (nonatomic, weak) UIImageView *centerImgView;
@property (nonatomic, weak) UILabel *tipLab;

@end

@implementation MOVisitorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor colorWithWhite:237.0 / 255.0 alpha:1];
    
    UIImageView *circleImgView = ImageView.img(@"visitordiscover_feed_image_smallicon").addTo(self).makeCons(^{
        make.centerX.equal.superview.constants(0);
        make.centerY.equal.superview.constants(-80);
    });
    self.circleImgView = circleImgView;
    
    UIImageView *coverImgView = ImageView.img(@"visitordiscover_feed_mask_smallicon").addTo(self).makeCons(^{
        make.center.equal.view(circleImgView).constants(0);
    });
    self.coverImgView = coverImgView;
    
    UIImageView *centerImgView = ImageView.img(@"visitordiscover_feed_image_house").addTo(self).makeCons(^{
        make.center.equal.view(circleImgView).constants(0);
    });
    self.centerImgView = centerImgView;
    
    UILabel *tipLab = Label.str(@"关注一些人，回到这里看看有什么惊喜").fnt(15).color(@"darkGray").centerAlignment.lines(0).lineGap(5).addTo(self).makeCons(^{
        make.top.equal.view(circleImgView).bottom.constants(20);
        make.centerX.equal.view(circleImgView).constants(0);
        make.width.equal.constants(250);
    });
    self.tipLab = tipLab;
    
    Button.str(@"登录").fnt(14).color(@"darkGray").bgImg(@"common_button_white").addTo(self).makeCons(^{
         make.left.equal.view(tipLab).constants(0);
         make.top.equal.view(tipLab).bottom.constants(20);
         make.width.equal.constants(100);
    }).onClick(^{
        if ([self.delegate respondsToSelector:@selector(visitorViewToSignOn)]) {
            [self.delegate visitorViewToSignOn];
        }
    });
    
    Button.str(@"注册").fnt(14).color(@"orange").bgImg(@"common_button_white").addTo(self).makeCons(^{
         make.right.equal.view(tipLab).constants(0);
         make.top.equal.view(tipLab).bottom.constants(20);
         make.width.equal.constants(100);
    }).onClick(^{
        if ([self.delegate respondsToSelector:@selector(visitorViewToSignIn)]) {
            [self.delegate visitorViewToSignIn];
        }
    });
}

- (void)startAnimation {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    ani.toValue = @(M_PI *2);
    ani.duration = 5;
    ani.repeatCount = CGFLOAT_MAX;
    ani.removedOnCompletion = NO;
    [self.circleImgView.layer addAnimation:ani forKey:@"ani"];
}

- (void)updateTitle:(NSString *)title imageName:(NSString *)imageName isHome:(BOOL)isHome {
    self.tipLab.text = title;
    self.circleImgView.image = Img(imageName);
    if (isHome) {
        [self startAnimation];
    } else {
        self.coverImgView.hidden = YES;
        self.centerImgView.hidden = YES;
    }
}




- (void)dealloc {
    [self.circleImgView.layer removeAllAnimations];
}



@end
