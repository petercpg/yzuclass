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
    screen.text = @"0";
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
        screen.text = screenTemp;
    }
    
    switch (clickedBtn.tag) {
        case 10://Decimal
            if(behindTheDecimal != TRUE) {
                if(fmod([screenTemp floatValue],1)>0){
                    behindTheDecimal=TRUE;
                }
                behindTheDecimal = TRUE;
                [screenTemp appendFormat:@"."];
            }
            break;
        case 90://Clear
            [screenTemp setString:@""];
            screen.text=@"0";
            tmpVal=0;
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
            calcway=0;
            break;

    }
    
    if (clickedBtn.tag>=91 && clickedBtn.tag<=94){
        switch (calcway) {
            case 0:
                tmpVal = [screenTemp floatValue];
                break;
            case 1:
                tmpVal += [screenTemp floatValue]; //tmpVal is the temp buffer of total num
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
        switch(clickedBtn.tag) {
            case 91://+
                calcway=1;
                [screenTemp setString:@""];
                screen.text = [NSString stringWithFormat:@"%f", tmpVal];
                behindTheDecimal=FALSE;
                break;
            case 92://-
                calcway=2;
                [screenTemp setString:@""];
                screen.text = [NSString stringWithFormat:@"%f", tmpVal];
                behindTheDecimal=FALSE;
                break;
            case 93://*
                calcway=3;
                [screenTemp setString:@""];
                screen.text = [NSString stringWithFormat:@"%f", tmpVal];
                behindTheDecimal=FALSE;
                break;
            case 94://divide
                calcway=4;
                [screenTemp setString:@""];
                screen.text = [NSString stringWithFormat:@"%f", tmpVal];
                behindTheDecimal=FALSE;
                break;
        }
    }
    NSLog(@"screenTemp= %@", screenTemp);
    NSLog(@"calcway= %i", calcway);
    NSLog(@"tmpVal= %f", tmpVal);
    [result release];
}

@end
