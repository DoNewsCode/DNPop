//
//  DNTestPopViewController.m
//  DNPop_Example
//
//  Created by Ming on 2020/11/6.
//  Copyright © 2020 陈金铭. All rights reserved.
//

#import "DNTestPopViewController.h"

@interface DNTestPopViewController ()

@end

@implementation DNTestPopViewController

- (instancetype)initAlertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(DNPopViewControllerStyle)preferredStyle {
    self = [super initAlertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (self) {
        
    }
    return self;
}

- (instancetype)initAlertControllerWithPreferredStyle:(DNPopViewControllerStyle )preferredStyle {
    self = [super initAlertControllerWithPreferredStyle:preferredStyle];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)dealloc {
    NSLog(@"DNTestPopViewController ---- dealloc");
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
