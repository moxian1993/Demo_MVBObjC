//
//  MOHomeController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MOHomeController.h"

@interface MOHomeController ()

@end

@implementation MOHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupNavi];
}

- (void)setupNavi {
    [self.navigationItem setRightBarButtonItem:[UIBarButtonItem.alloc initWithCustomView:Button.img(@"navigationbar_pop").highImg(@"navigationbar_pop_highlighted").onClick(^{
        
    })]];
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
