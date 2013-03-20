//
//  l2ViewController.h
//  l2
//
//  Created by Peter on 13/3/13.
//  Copyright (c) 2013年 petercpg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface l2ViewController : UIViewController{
    IBOutlet UITextField *screen;
    NSMutableString *screenTemp;
    float tmpVal;
    int calcway;
    Boolean behindTheDecimal;
}
@end
