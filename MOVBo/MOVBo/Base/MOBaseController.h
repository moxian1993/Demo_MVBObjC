//
//  MOBaseController.h
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import "MOViewController.h"
#import "MOVisitorView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOBaseController : MOViewController

@property (nonatomic, weak) MOVisitorView *visitorView;
@end

NS_ASSUME_NONNULL_END
