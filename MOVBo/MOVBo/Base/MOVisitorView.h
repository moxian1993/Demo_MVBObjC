//
//  MOVisitorView.h
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MOVisitorViewProtocol <NSObject>

@required
- (void)visitorViewToSignOn;
- (void)visitorViewToSignIn;

@end

@interface MOVisitorView : UIView

@property (nonatomic, weak) id <MOVisitorViewProtocol> delegate;

- (void)updateTitle:(NSString *)title imageName:(NSString *)imageName isHome:(BOOL)isHome;

@end

NS_ASSUME_NONNULL_END
