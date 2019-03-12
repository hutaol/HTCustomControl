//
//  ViewController.m
//  HTCustomControl
//
//  Created by Henry on 2019/3/8.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "ViewController.h"
#import "HTPopoverView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)bottom:(id)sender {
    HTPopoverView *pop = [HTPopoverView new];
    pop.mode = HTPopoverViewModeBottom;
    pop.contentHeight = 400;
    [pop show];
}

- (IBAction)center:(id)sender {
    HTPopoverView *pop = [HTPopoverView new];
    pop.mode = HTPopoverViewModeCenter;
    [pop show];
}




@end
