//
//  ClinicViewController.h
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/15.
//  Copyright © 2017 foo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClinicViewController : UIViewController
@property (nonatomic)DataManager* manager_data;
-(instancetype) initWithDataManager:(DataManager *)dataManager andHospital:(Hospital*)hospital;
@end
