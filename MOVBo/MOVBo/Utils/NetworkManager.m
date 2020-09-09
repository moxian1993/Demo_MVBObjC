//
//  NetworkManager.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/8.
//

#import "NetworkManager.h"

static NSString *MOPOST_WEIBO_ACCESSTOKEN = @"https://api.weibo.com/oauth2/access_token";


@implementation NetworkManager

static NetworkManager *_instance;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        [self settings];
    });
    return _instance;
}


+ (void)settings {
    
//    self.responseSerializer.acceptableContentTypes = self.responseSerializer.acceptableContentTypes setByAddingObject:@""
    
}

+ (void)request:(kRequestType)type url:(NSString *)urlStr params:(nullable id)params completed:(completedHandler)completed {
    NSString *method;
    switch (type) {
        case get: {
            method = @"GET";
            break;
        }
        case post: {
            method = @"POST";
            break;
        }
    }
    
    [[[self shared] dataTaskWithHTTPMethod:method
                                 URLString:urlStr
                                parameters:params
                                   headers:nil
                            uploadProgress:nil
                          downloadProgress:nil
                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completed) {
            completed(responseObject, nil);
        }
    }
                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completed) {
            completed(nil, error);
        }
    }] resume];
}


#pragma mark -
#pragma mark - request
+ (void)mopost_Weibo_accessTokenWithClient_id:(NSString *)client_id
                                client_secret:(NSString *)client_secret
                                   grant_type:(NSString *)grant_type
                                         code:(NSString *)code
                                 redirect_uri:(NSString *)redirect_uri
                                    completed:(completedHandler)completed {
    NSDictionary *params = @{@"client_id": client_id,
                             @"client_secret": client_secret,
                             @"grant_type": grant_type,
                             @"code": code,
                             @"redirect_uri": redirect_uri
    };
    [self request:post url:MOPOST_WEIBO_ACCESSTOKEN params:params completed:completed];
}




@end
