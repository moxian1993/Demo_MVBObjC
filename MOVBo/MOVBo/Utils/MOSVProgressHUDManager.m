//
//  MOSVProgressHUDManager.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import "MOSVProgressHUDManager.h"
#import "SceneDelegate.h"
#import <objc/runtime.h>

/**
 不需要导入到任何文件中
 应在有 SceneDelegate 的项目中(iOS 11)使用，否则应注释掉
*/
@implementation AppDelegate (SVProgressHUD)

- (UIWindow *)window {
    UIWindowScene *scene = (UIWindowScene *)UIApplication.sharedApplication.connectedScenes.allObjects[0];

    SceneDelegate *sceneDelegate = (SceneDelegate *)scene.delegate;
    return sceneDelegate.window ?: nil;
}

@end

// ---------------------
@protocol FakeProxy <NSObject> // 类的前向引用

@optional
+ (SVProgressHUD *)sharedView;

@end

@interface MOSVProgressHUDManager () <FakeProxy>
@end

@implementation MOSVProgressHUDManager

+ (void)setupConfig {
    /*
     SVProgressHUDStyleLight,        // 白色半透明背景，字体黑色
     SVProgressHUDStyleDark,         // 黑色背景，字体白色
     SVProgressHUDStyleCustom        // 白色背景，字体黑色
     */
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    
    /**
     SVProgressHUDMaskTypeNone：默认图层样式，当HUD显示的时候，允许用户交互。
     SVProgressHUDMaskTypeClear：当HUD显示的时候，不允许用户交互。
     SVProgressHUDMaskTypeBlack：当HUD显示的时候，不允许用户交互，且显示黑色背景图层。
     SVProgressHUDMaskTypeGradient：当HUD显示的时候，不允许用户交互，且显示渐变的背景图层。
     SVProgressHUDMaskTypeCustom：当HUD显示的时候，不允许用户交互，且显示背景图层自定义的颜色。
     */
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    
    /*
     SVProgressHUDAnimationTypeFlat,     // 默认动画类型，自定义平面动画
     SVProgressHUDAnimationTypeNative    // iOS native UIActivityIndicatorView
     */
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
}

+ (void)tapToDimiss:(BOOL)enable {
    SVProgressHUD *hud = [self sharedView];
    hud.userInteractionEnabled = enable;
    if (enable) {
        UITapGestureRecognizer *tap = objc_getAssociatedObject(hud, _cmd);
        if (!tap) {
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
            objc_setAssociatedObject(hud, _cmd, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [hud addGestureRecognizer:tap];
        }
    }
}

+ (void)tapped {
    [SVProgressHUD dismiss];
}

@end
