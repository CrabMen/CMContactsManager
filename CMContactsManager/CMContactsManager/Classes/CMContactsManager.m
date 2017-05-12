//
//  CMContactsManager.m
//  CMContactsManager
//
//  Created by CrabMan on 2017/5/9.
//  Copyright © 2017年 CrabMan. All rights reserved.
//

#import "CMContactsManager.h"
#import <UIKit/UIKit.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface CMContactsManager () <CNContactPickerDelegate>

@end

@implementation CMContactsManager

+ (instancetype)shareInstance {
  __block  CMContactsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CMContactsManager alloc]init];
    });
    
    return manager;
}


/**检查用户授权状态*/
- (void)checkUserAuthorization {

    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    if (status == CNAuthorizationStatusNotDetermined) {
        
        
        
        
    } else if (status == CNAuthorizationStatusAuthorized) {
        
    
    } else if (status == CNAuthorizationStatusDenied) {
    
    
      NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:url];
        
    }
}






@end
