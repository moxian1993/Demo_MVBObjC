//
//  MOOauthVM.h
//  MOVBo
//
//  Created by Xian Mo on 2020/9/8.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "MOUserAccount.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOOauthVM : NSObject

@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, strong) MOUserAccount *userAccount;

@property (nonatomic, copy) NSURLRequest *authorizeRequest;

+ (instancetype)shared;
- (void)injectJSForWebView:(WKWebView *)webView;
- (void)getATWithCode:(NSString *)code completed:(void(^)(id  _Nullable json, NSError * _Nullable error))completed;
@end

NS_ASSUME_NONNULL_END
