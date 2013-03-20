//
//  l2ViewController.m
//  l2
//
//  Created by Peter on 13/3/13.
//  Copyright (c) 2013年 petercpg. All rights reserved.
//

#import "l2ViewController.h"

@interface l2ViewController ()

@end

@implementation l2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    screen.text = 0;
    screenTemp = [[NSMutableString alloc] init];
    //float tmpVal;
    calcway = 0;
}	

- (void)viewDidUnload{
    [screenTemp release];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBtnClicked:(id)sender {
    UIButton *clickedBtn = (UIButton *)sender;
    NSMutableString *result = [[NSMutableString alloc] init];
    NSLog(@"clicked %i", clickedBtn.tag);
    
    if(clickedBtn.tag<=9){ //Numbers
        [result appendFormat:@"%i", clickedBtn.tag]; //result is the button that user clicked
        [screenTemp appendString:result]; //screenTemp is the buffer of what user clicks
    }
    switch (clickedBtn.tag) {
        case 10://Decimal
            if(behindTheDecimal != TRUE) {
                behindTheDecimal = TRUE;
                [screenTemp appendFormat:@"."];
            }
            break;
        case 90://Clear
            screenTemp=[NSMutableString stringWithString:@""];
            screen.text=@"0";
            break;
        default:
            break;
    }
    
    switch(clickedBtn.tag) {
        case 91://+
            tmpVal += [screenTemp floatValue]; //tmpVal is the temp buffer of total num
            [screenTemp setString:@""];
            calcway = 1;
            screen.text = @"0";
            break;
        case 92://-
            tmpVal -= [screenTemp floatValue];
            [screenTemp setString:@""];
            calcway = 2;
            screen.text = @"0";
            break;
        case 93://*
            tmpVal *= [screenTemp floatValue];
            [screenTemp setString:@""];
            screen.text = @"0";
            calcway = 3;
            break;
        case 94://divide
            tmpVal /= [screenTemp floatValue];
            [screenTemp setString:@""];
            screen.text = @"0";
            calcway = 4;
            break;
        case 99://do calc
            switch(calcway){
                case 1:
                    tmpVal += [screenTemp floatValue];
                    break;
                case 2:
                    tmpVal -= [screenTemp floatValue];
                    break;
                case 3:
                    tmpVal *= [screenTemp floatValue];
                    break;
                case 4:
                    tmpVal /= [screenTemp floatValue];
                    break;
            }		
            screen.text = [NSString stringWithFormat:@"%f", tmpVal];
            [screenTemp setString:@""];
            calcway=0;
            break;
    }
    screen.text = [NSString stringWithFormat:@"%@", screenTemp];
    NSLog(@"screenTemp= %@", screenTemp);
    NSLog(@"calcway= %i", calcway);
    NSLog(@"tmpVal= %f", tmpVal);
    [result release];
}
@end
