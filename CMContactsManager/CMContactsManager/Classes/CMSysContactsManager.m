//
//  CMSysContactsManager.m
//  CMContactsManager
//
//  Created by CrabMan on 2017/5/12.
//  Copyright © 2017年 CrabMan. All rights reserved.
//

#import "CMSysContactsManager.h"

#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface CMSysContactsManager ()<CNContactPickerDelegate>


@end

@implementation CMSysContactsManager

- (instancetype)shareInstance{
    __block CMSysContactsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CMSysContactsManager alloc]init];
    });
    return manager;

}


- (void)pushToContactsControllerFromController:(UIViewController *)controller {
    
    CNContactPickerViewController *contactVC = [[CNContactPickerViewController alloc]init];
    
    contactVC.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactsChanged:) name:CNContactStoreDidChangeNotification object:nil];
    
    
    [controller presentViewController:contactVC animated:YES completion:^{
        
    }];
    
    
}


- (void)contactsChanged:(NSNotification *)noti {
    
    NSLog(@"通讯录发生改变");
    
    
}


#pragma mark --- CNContactPickerDelegate

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker
{
    NSLog(@"取消选择联系人");
}
// 2.当选中某一个联系人时会执行该方法
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact
{
    
    
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact*> *)contacts {
    
    
}


@end
