//
//  DatabaseObjects.h
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import <Realm/Realm.h>

@interface Medicine : RLMObject
@property NSString* name;
@property double cost;
@end
RLM_ARRAY_TYPE(Medicine)

@class Hospital;
@interface HospitalMedicine : RLMObject
//@property Hospital* hospital;
@property Medicine* medicine;
@property (readonly)RLMLinkingObjects* hospital;
@property double quantity;
@end
RLM_ARRAY_TYPE(HospitalMedicine)

@interface Hospital : RLMObject
@property NSString* name;
@property RLMArray<HospitalMedicine*><HospitalMedicine>* hospital_medicines;
@end
RLM_ARRAY_TYPE(Hospital)

@class Delivery;
@interface MedicineDelivery : RLMObject
@property double quantity;
@property Medicine *medicine;
@property Delivery *delivery;
@end
RLM_ARRAY_TYPE(MedicineDelivery)

@interface Truck : RLMObject
@property NSString* name;
@end
RLM_ARRAY_TYPE(Truck)

@interface Delivery : RLMObject
@property Hospital *hospital;
@property Truck * truck;
@property NSDate * time_scheduled;
@end
RLM_ARRAY_TYPE(Delivery)





