//
//  MOOauthController.h
//  MOVBo
//
//  Created by Xian Mo on 2020/9/8.
//

#import "MOViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOOauthController : MOViewController

@property (nonatomic, copy) void(^didSignOn)(void);

@end

NS_ASSUME_NONNULL_END
