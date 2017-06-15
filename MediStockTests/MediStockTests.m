//
//  MediStockTests.m
//  MediStockTests
//
//  Created by Tielman Janse van Vuuren on 2017/06/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DatabaseObjects.h"
#import "DataManager.h"
@interface MediStockTests : XCTestCase

@end

@implementation MediStockTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //config.inMemoryIdentifier = self.name;
    //NSLog(@"%@",self.name);
    //[RLMRealmConfiguration setDefaultConfiguration:config];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testRealm {
    
    Hospital * hospital = [[Hospital alloc] init];
    hospital.name = @"A Hospital";
    RLMRealm * realm = [RLMRealm defaultRealm];
    HospitalMedicine * medicine_stock = [[HospitalMedicine alloc] init];
    //medicine.medicine
    Medicine * medicine = [Medicine new];
    medicine.name = @"Awesome Medication";
    medicine.cost = 40;
    medicine_stock.quantity = 10;
    
    medicine_stock.medicine = medicine;
    [hospital.hospital_medicines addObject:medicine_stock];
    [realm beginWriteTransaction];
    [realm addObject:hospital];
    [realm addObject:medicine_stock];
    [realm addObject:medicine];
    
   
    [realm commitWriteTransaction];
    NSLog(@"hospital %@",medicine_stock.hospital);
    //HospitalMedicine *
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(NSString*)cleanedString:(NSString*)oldString {
    NSString* string = [oldString stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
    return string;
}

- (void)testDataManager {
    NSString * string = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];
    string = [self cleanedString:string];
    DataManager * manager_data = [[DataManager alloc] initWithRealmName:string];
    [manager_data createHospitalWithName:@"General"];
    RLMResults<Hospital*>* results = [manager_data getAllHospitals];
    XCTAssert([results objectAtIndex:0] != nil);
    NSLog(@"%@",[results objectAtIndex:0]);
}

@end
