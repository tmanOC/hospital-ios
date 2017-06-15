//
//  DataManager.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import "DataManager.h"


@implementation DataManager {
    NSString* name_realm;
}
-(instancetype)initWithRealmName:(NSString*)name {
    self = [super init];
    if(!self) {
        return nil;
    }
    name_realm = name;
    return self;
}
-(RLMRealm*)realm {
    return [self realmWithName:name_realm];
}
-(RLMRealm*)realmWithName:(NSString*)name {
    RLMRealmConfiguration * config = [RLMRealmConfiguration defaultConfiguration];
    if(name != nil) {
        config.inMemoryIdentifier = name;
    }
    return [RLMRealm realmWithConfiguration:config error:nil];
}

-(void)createHospitalWithName:(NSString*)name {
    Hospital * hospital = [Hospital new];
    hospital.name = name;
    RLMRealm * realm = [self realm];
    [realm beginWriteTransaction];
    [realm addObject:hospital];
    [realm commitWriteTransaction];
}

-(RLMResults<Hospital*>*)getAllHospitals {
    return [Hospital allObjectsInRealm:[self realm]];
}
@end
