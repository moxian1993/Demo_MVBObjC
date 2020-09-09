//
//  MOSVProgressHUDManager.h
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#import <SVProgressHUD.h>
NS_ASSUME_NONNULL_BEGIN

/**
 不需要导入到任何文件中
 应在有 SceneDelegate 的项目中(iOS 11)使用，否则应注释掉
*/
@interface AppDelegate (SVProgressHUD)

@end

/**
 如果有包含 AppDelegate 的分类，应在 SceneDelegate 中做初始化配置
 */
@interface MOSVProgressHUDManager : SVProgressHUD

/** 自定义配置 */
+ (void)setupConfig;

/** 是否点按即消失 */
+ (void)tapToDimiss:(BOOL)enable;

@end

NS_ASSUME_NONNULL_END
