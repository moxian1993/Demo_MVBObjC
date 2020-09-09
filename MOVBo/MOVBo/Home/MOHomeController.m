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
    [self.visitorView updateTitle:@"关注一些人，回到这里看看有什么惊喜" imageName:@"visitordiscover_feed_image_smallicon" isHome:YES];
    [self setupNavi];
}

- (void)setupNavi {
    [self.navigationItem setRightBarButtonItem:[UIBarButtonItem.alloc initWithCustomView:Button.img(@"navigationbar_pop").highImg(@"navigationbar_pop_highlighted").onClick(^{
        
    })]];
    
}

@end
