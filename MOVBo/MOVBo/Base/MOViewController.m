//
//  MOViewController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MOViewController.h"
#import "MOOauthController.h"

@interface MOViewController () <MOVisitorViewProtocol>

@end

@implementation MOViewController

- (void)loadView {
    BOOL userLogin = false;
    if (userLogin) {
        [super loadView];
        self.view.bgColor(@"white");
    } else {
        [self setupVisitorView];
    }
}

- (void)setupVisitorView {
    MOVisitorView *view = [MOVisitorView new];
    view.delegate = self;
    self.visitorView = view;
    self.view = view;
}

#pragma mark - MOVisitorViewProtocol
- (void)visitorViewToSignOn {
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:MOOauthController.new];
    //        navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)visitorViewToSignIn {
    [SVProgressHUD showErrorWithStatus:@"coming soon.."];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


@end
