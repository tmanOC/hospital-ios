//
//  DataManager.h
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/14.
//  Copyright © 2017 foo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "DatabaseObjects.h"


@interface DataManager : NSObject
-(instancetype)initWithRealmName:(NSString*)name;
-(void)createHospitalWithName:(NSString*)name;
-(RLMResults<Hospital*>*)getAllHospitals;
-(RLMRealm*)realm;
@end
