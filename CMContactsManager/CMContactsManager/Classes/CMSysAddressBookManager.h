//
//  CMAddressBook.h
//  addressBook
//
//  Created by CrabMan on 16/8/6.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^completion)(NSString *phoneNum,NSString *name);

@interface CMSysAddressBookManager : NSObject

@property (nonatomic,strong) completion addressBookBlock;


+ (id)sharedManager ;

- (void)setAddressBookBlock:(completion)addressBookBlock;
- (void)pushToAddressBookFromController:(UIViewController *)vc;



@end
