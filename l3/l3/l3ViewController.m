//
//  l3ViewController.m
//  l3
//
//  Created by Peter on 13/3/20.
//  Copyright (c) 2013年 petercpg. All rights reserved.
//

#import "l3ViewController.h"

@interface l3ViewController ()

@end

@implementation l3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"Begin editing");
    
    CGRect textFieldRect = textField.frame;
    viewFrame.origin.y -=250;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
}
@end
