//
//  ViewController.m
//  IncorrectCollectionViewCellWidth
//
//  Created by Iulian Onofrei on 07/02/2019.
//  Copyright © 2019 Iulian Onofrei. All rights reserved.
//

#import "ViewController.h"

#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

	[super viewDidLoad];
}

- (IBAction)onStartTap:(UIButton *)sender {

	MyViewController *viewController = [[MyViewController alloc] init];

	[self presentViewController:viewController animated:YES completion:nil];
}

@end
