//
//  MOOauthController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/8.
//

#import "MOOauthController.h"
#import "MOOauthVM.h"
#import <WebKit/WebKit.h>

@interface MOOauthController () <WKNavigationDelegate>
@property (nonatomic, strong) MOOauthVM *oauthVM;
@property (nonatomic, weak) WKWebView *webView;

@end

@implementation MOOauthController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.oauthVM = [MOOauthVM shared];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    webView.navigationDelegate = self;
    webView.embedIn(self.view);
    
    [webView loadRequest: _oauthVM.authorizeRequest];
    self.webView = webView;

    Style(@"button").fnt(15).color(@"gray");
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:Button.str(@"返回").styles(@"button").onClick(^{
        [self dismissViewControllerAnimated:YES completion:nil];
    })];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView: Button.str(@"快速填充").styles(@"button").onClick(^(UIButton *btn){
        [self.oauthVM injectJSForWebView:webView];
    })];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void(^)(WKNavigationActionPolicy))decisionHandler {
    
    NSURL *url = navigationAction.request.URL;
    
    if ([url.host isEqualToString:@"www.baidu.com"] && [url.query containsString:@"code"]) {
        [SVProgressHUD show];
        [self.oauthVM getATWithCode:[url.query substringFromIndex:5] completed:^(id  _Nullable json, NSError * _Nullable error) {
            if (self.didSignOn) {            
                self.didSignOn();
            }
            [SVProgressHUD dismissWithDelay:0.5];
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void(^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
}

@end
