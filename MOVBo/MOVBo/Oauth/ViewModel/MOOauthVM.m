//
//  MOOauthVM.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/8.
//

#import "MOOauthVM.h"
#import "NetworkManager.h"

#define kClient_id       @"3157073363"
#define kClient_secret   @"3d4f215c62f4391ac3a02a0f57d2119b"
#define kRedirect_uri    @"https://www.baidu.com"
#define kGrant_type      @"authorization_code"

@interface MOOauthVM ()

@end

@implementation MOOauthVM

static MOOauthVM *_instance;
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

//- (instancetype)init {
//    if (self = [super init]) {
//        self.userAccount = [self getAccount];
//    }
//    return self;
//}

- (BOOL)isLogin {
    if (self.userAccount &&
        [self.userAccount.expires_date compare:[NSDate date]] == NSOrderedDescending) {
        return YES;
    }
    return NO;
}

- (NSURLRequest *)authorizeRequest {
    NSString *urlStr = @"https://api.weibo.com/oauth2/authorize?".a(@"client_id=").a(kClient_id).a(@"&redirect_uri=").a(kRedirect_uri);
    
    return [NSURLRequest requestWithURL: Url(urlStr)];
}

- (void)injectJSForWebView:(WKWebView *)webView {
    if (![webView.URL.host isEqualToString:@"passport.weibo.cn"]) {
        return;
    }
    NSString *jsStr = @"document.getElementById('loginName').value = '17621136360', document.getElementById('loginPassword').value = 'moxian1993'";
    [webView evaluateJavaScript:jsStr completionHandler:nil];
}

- (void)saveAccount:(MOUserAccount *)account {
    [NSKeyedArchiver archiveRootObject:account toFile:kAccountPath.path];
}

- (MOUserAccount *)getAccount {
    MOUserAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountPath.path];
    return account;
}

#pragma mark - request
- (void)getATWithCode:(NSString *)code completed:(void(^)(id  _Nullable json, NSError * _Nullable error))completed {
    [NetworkManager mopost_Weibo_accessTokenWithClient_id:kClient_id
                                            client_secret:kClient_secret
                                               grant_type:kGrant_type
                                                     code:code
                                             redirect_uri:kRedirect_uri
                                                completed:^(id  _Nullable json, NSError * _Nullable error) {
        if (error) {
            if (completed) {
                completed(nil, error);
            }
        } else {
            if (completed) {
                completed(json, nil);
            }
            MOUserAccount *account = [MOUserAccount modelWithJSON:json];
            self.userAccount = account;
            [self saveAccount: account];
        }
    }];
}



@end
