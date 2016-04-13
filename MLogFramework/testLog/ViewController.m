//
//  ViewController.m
//  testLog
//
//  Created by Micker on 15/4/13.
//  Copyright © 2016年 micker. All rights reserved.
//

#import "ViewController.h"
#import "MLog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FRAMELOG(self.view.bounds);
    POINTLOG(self.view.center)
    SIZELOG(self.view.bounds.size);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
