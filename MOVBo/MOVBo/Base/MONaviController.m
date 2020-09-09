//
//  MONaviController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MONaviController.h"

@interface MONaviController ()

@end

@implementation MONaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
     if (self.childViewControllers.count >0) {
         viewController.hidesBottomBarWhenPushed = YES;
     }
    [super pushViewController:viewController animated:animated];
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
