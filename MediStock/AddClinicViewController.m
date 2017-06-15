//
//  AddClinicViewController.m
//  MediStock
//
//  Created by Tielman Janse van Vuuren on 2017/06/15.
//  Copyright © 2017 foo. All rights reserved.
//

#import "AddClinicViewController.h"

@interface AddClinicViewController () <UITextFieldDelegate>

@end

@implementation AddClinicViewController {
    UITextField * field_name;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self fixViewSize];
    self.navigationItem.title = @"Add Clinic";
    self.view.backgroundColor = [UIColor whiteColor];
    field_name = [[UITextField alloc] initWithFrame:CGRectMake(15,15,self.view.width - 30,30)];
    field_name.placeholder = @"Clinic Name";
    field_name.layer.borderColor = [UIColor colorWithRed:0 green:0.5 blue:0.8 alpha:0.7].CGColor;
    field_name.layer.borderWidth = 1.0;
    [self.view addSubview:field_name];
    
    field_name.delegate = self;
    // Do any additional setup after loading the view.
    field_name.returnKeyType = UIReturnKeyDone;
    field_name.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //create a new clinic
    if(textField.text == nil || textField.text.length == 0) {
        return true;
    }
    [self.manager_data createHospitalWithName:textField.text];
    [self.navigationController popViewControllerAnimated:true];
    return true;
}
@end

