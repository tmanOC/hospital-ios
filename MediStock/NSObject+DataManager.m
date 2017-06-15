//
//  NSObject+DataManager.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import "NSObject+DataManager.h"

@implementation NSObject (DataManager)
-(instancetype)initWithDataManager:(DataManager*)dataManager {
    self = [self init];
    if(self == nil) {
        return nil;
    }
    if([self respondsToSelector:NSSelectorFromString(@"setManager_data:")]) {
        [self performSelector:NSSelectorFromString(@"setManager_data:") onThread:[NSThread currentThread] withObject:dataManager waitUntilDone:true];
    }
    return self;
}
@end
