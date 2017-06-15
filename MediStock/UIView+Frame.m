//
//  UIView+Frame.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(CGFloat)x {
    return self.frame.origin.x;
}
-(CGFloat)y {
    return self.frame.origin.y;
}
-(CGFloat)width {
    return self.frame.size.width;
}
-(CGFloat)height {
    return self.frame.size.height;
}
-(void)setX:(CGFloat)x {
    [self setFrame:CGRectMake(x, self.y, self.width, self.height)];
}
-(void)setY:(CGFloat)y {
    [self setFrame:CGRectMake(self.x, y, self.width, self.height)];
}
-(void)setWidth:(CGFloat)width {
    [self setFrame:CGRectMake(self.x, self.y, width, self.height)];
}
-(void)setHeight:(CGFloat)height {
    [self setFrame:CGRectMake(self.x, self.y, self.width, height)];
}
-(CGSize)size {
    return self.frame.size;
}
-(void)setSize:(CGSize)size {
    [self setFrame:CGRectMake(self.x, self.y, size.width, size.height)];
}
-(CGFloat)bottom {
    return self.y + self.height;
}
-(CGFloat)right {
    return self.x + self.width;
}
@end
