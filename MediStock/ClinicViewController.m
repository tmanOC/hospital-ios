//
//  ClinicViewController.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/15.
//  Copyright © 2017 foo. All rights reserved.
//

#import "ClinicViewController.h"

@interface ClinicViewController ()

@end

@implementation ClinicViewController {
    Hospital * hospital_current;
    UITableView * view_table;
}
-(instancetype) initWithDataManager:(DataManager *)dataManager andHospital:(Hospital*)hospital {
    self = [super initWithDataManager:dataManager];
    if(self == nil) {
        return nil;
    }
    hospital_current = hospital;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self fixViewSize];
    self.navigationItem.title = hospital_current.name;
    self.view.backgroundColor = [UIColor whiteColor];
    
    view_table = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view_table];
}
@end
