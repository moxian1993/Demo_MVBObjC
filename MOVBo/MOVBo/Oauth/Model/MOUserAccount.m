//
//  MOUserAccount.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import "MOUserAccount.h"

@implementation MOUserAccount

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    _isRealName = [dic[@"isRealName"] boolValue];
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[dic[@"expires_in"] doubleValue]];

    return YES;
}


#pragma mark - NSCoding
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [self modelEncodeWithCoder:coder];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    return [self modelInitWithCoder:coder];
}

@end
