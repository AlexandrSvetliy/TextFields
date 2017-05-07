//
//  User.h
//  TextFields
//
//  Created by Александр Светлый on 07.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign) NSDate *birthday;
@property (nonatomic, assign) BOOL sex;
@property (nonatomic, copy) NSString *country;

- (NSString*) getUserInfo;
- (instancetype)initWithFirstName:(NSString*)firstName
                         LastName:(NSString*)lastName
                              Sex:(BOOL)sex
                         Birthday:(NSDate*)birthday
                          Country:(NSString*)country;

@end
