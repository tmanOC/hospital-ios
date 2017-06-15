//
//  DatabaseObjects.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import "DatabaseObjects.h"

@implementation Medicine
@end

@implementation Hospital
@end

@implementation HospitalMedicine
+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"hospital": [RLMPropertyDescriptor descriptorWithClass:Hospital.class propertyName:@"hospital_medicines"],
             };
}
@end

@implementation MedicineDelivery
@end

@implementation Truck
@end
@implementation Delivery
@end


