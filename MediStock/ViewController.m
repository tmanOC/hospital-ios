//
//  ViewController.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/13.
//  Copyright © 2017 foo. All rights reserved.
//

#import "ViewController.h"
#import "AddClinicViewController.h"
#import "ClinicViewController.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController {
    UITableView* view_table;
    RLMResults<Hospital*>* hospitals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Clinics";
    UIBarButtonItem * add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClinic)];
    
    self.navigationItem.rightBarButtonItems = @[add];
    [self fixViewSize];
    self.view.backgroundColor = [UIColor whiteColor];
    view_table = [UITableView new];
    view_table.delegate = self;
    view_table.dataSource = self;
    view_table.size = self.view.size;
    [self.view addSubview:view_table];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    hospitals = [self.manager_data getAllHospitals];
    [view_table reloadData];
}

-(void)addClinic {
    AddClinicViewController * clinic = [[AddClinicViewController alloc] initWithDataManager:self.manager_data];
    [self.navigationController pushViewController:clinic animated:true];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(hospitals == nil) {
        return 0;
    }
    return hospitals.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [view_table dequeueReusableCellWithIdentifier:@"HOSPITAL"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HOSPITAL"];
    }
    cell.textLabel.text = [hospitals objectAtIndex:indexPath.row].name;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ClinicViewController * vc = [[ClinicViewController alloc] initWithDataManager:self.manager_data andHospital:hospitals[indexPath.row]];
    [self.navigationController pushViewController:vc animated:true];
}
@end
