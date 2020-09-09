//
//  MOProfileController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MOProfileController.h"

@interface MOProfileController ()

@end

@implementation MOProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.visitorView updateTitle:@"登录后，你的微博、相册、个人资料会显示在这里，展示给别人" imageName:@"visitordiscover_image_profile" isHome:NO];
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
