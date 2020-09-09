//
//  MOBaseController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/9.
//

#import "MOBaseController.h"
#import "MOOauthController.h"
#import "MOOauthVM.h"

@interface MOBaseController () <MOVisitorViewProtocol>

@end

@implementation MOBaseController

- (void)loadView {
    BOOL userLogin = MOOauthVM.shared.isLogin;
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
    MOOauthController *vc = MOOauthController.new;
    vc.didSignOn = ^{
        [self loadViewIfNeeded];
    };
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController: vc];
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
