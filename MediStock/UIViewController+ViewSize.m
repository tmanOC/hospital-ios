//
//  UIViewController+ViewSize.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/15.
//  Copyright © 2017 foo. All rights reserved.
//

#import "UIViewController+ViewSize.h"

@implementation UIViewController (ViewSize)
-(void)fixViewSize {
    self.view.width = UIScreen.mainScreen.bounds.size.width;
    CGFloat height_top;
    if(self.navigationController == nil) {
        height_top = 0;
    } else if(self.navigationController.navigationBarHidden) {
        height_top = 0;
    } else {
        height_top = UIApplication.sharedApplication.statusBarFrame.size.height + self.navigationController.navigationBar.height;
    }
    self.view.height = UIScreen.mainScreen.bounds.size.height - height_top;
}
@end
