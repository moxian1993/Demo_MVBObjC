//
//  NetworkManager.h
//  MOVBo
//
//  Created by Xian Mo on 2020/9/8.
//

typedef NS_ENUM(NSUInteger, kRequestType) {
    get,
    post,
};

typedef void(^completedHandler)(id _Nullable json, NSError  * _Nullable error);

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : AFHTTPSessionManager

+ (void)mopost_Weibo_accessTokenWithClient_id:(NSString *)client_id
                                client_secret:(NSString *)client_secret
                                   grant_type:(NSString *)grant_type
                                         code:(NSString *)code
                                 redirect_uri:(NSString *)redirect_uri
                                    completed:(completedHandler)completed;
@end

NS_ASSUME_NONNULL_END
