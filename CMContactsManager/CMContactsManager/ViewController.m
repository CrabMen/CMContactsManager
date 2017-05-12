//
//  ViewController.m
//  CMContactsManager
//
//  Created by CrabMan on 2017/5/9.
//  Copyright © 2017年 CrabMan. All rights reserved.
//

#import "ViewController.h"
#import "CMSysAddressBookManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    
    btn.center = self.view.center;
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
}



- (void)click:(UIButton *)sender {

    [[CMSysAddressBookManager sharedManager]pushToAddressBookFromController:self];
    
    [[CMSysAddressBookManager sharedManager]setAddressBookBlock:^(NSString *phoneNum, NSString *name) {
        NSLog(@"phone:%@,name:%@",phoneNum,name);
    }];



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
