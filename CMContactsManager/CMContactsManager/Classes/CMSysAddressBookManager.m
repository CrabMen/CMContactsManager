//
//  CMAddressBook.m
//  addressBook
//
//  Created by CrabMan on 16/8/6.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "CMSysAddressBookManager.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>



@interface CMSysAddressBookManager ()<ABPeoplePickerNavigationControllerDelegate>@property (nonatomic,strong) CMSysAddressBookManager *manager;

@property (nonatomic,strong) UIViewController *viewController;
@property (nonatomic,strong) NSString *phoneNum;
@property (nonatomic,strong) NSString *name;



@end

static CMSysAddressBookManager *_manager = nil;

@implementation CMSysAddressBookManager
+ (id)sharedManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[CMSysAddressBookManager alloc]init];
    });
    return _manager;
}


- (void)pushToAddressBookFromController:(UIViewController *)vc  {
    
    
    
        [self pushTopeopleNaviControllerFrom:vc];
    

}

#pragma mark --- iOS 8 之前
-(void)pushTopeopleNaviControllerFrom:(UIViewController *)vc {

    ABPeoplePickerNavigationController *peoplePickController = [[ABPeoplePickerNavigationController alloc] init];
    peoplePickController.peoplePickerDelegate = self;
    
    //    if([[UIDevice currentDevice].systemVersion intValue] > 9.0){
    //        peoplePickController.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
    //    }
    
    [vc presentViewController:peoplePickController animated:YES completion:^{
        
     }];

}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person {
    
    ABMultiValueRef valuesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    //手机号
    CFStringRef telValue = ABMultiValueCopyValueAtIndex(valuesRef,0);
    //   self.label.text = (__bridge NSString *)telValue;
    //全名
    CFStringRef anFullName = ABRecordCopyCompositeName(person);
    
   // self.label.text = [NSString stringWithFormat:@"%@:%@",(__bridge_transfer NSString*)anFullName,(__bridge_transfer NSString *)telValue];
    
    self.phoneNum = (__bridge_transfer NSString *)telValue;
    self.name = (__bridge_transfer NSString*)anFullName;
    //self.completionBlock(self.phoneNum,self.name);
    self.addressBookBlock(self.phoneNum,self.name);
}




@end
