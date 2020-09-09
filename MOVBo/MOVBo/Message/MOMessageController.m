//
//  MOMessageController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MOMessageController.h"

@interface MOMessageController ()

@end

@implementation MOMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.visitorView updateTitle:@"登录后，别人评论你的微博，发给你的消息，都会在这里收到通知" imageName:@"visitordiscover_image_message" isHome:NO];
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
