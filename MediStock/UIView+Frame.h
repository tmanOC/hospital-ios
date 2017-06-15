//
//  UIView+Frame.h
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property CGFloat x;
@property CGFloat y;
@property CGFloat height;
@property CGFloat width;
@property CGSize size;
@property (readonly)CGFloat bottom;
@property (readonly)CGFloat right;
@end
