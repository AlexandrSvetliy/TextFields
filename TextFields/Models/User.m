//
//  User.m
//  TextFields
//
//  Created by Александр Светлый on 07.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import "User.h"

@interface User()

@property (nonatomic, copy)   NSString *firstName;
@property (nonatomic, copy)   NSString *lastName;
@property (nonatomic, assign) NSDate *birthday;
@property (nonatomic, assign) BOOL sex;
@property (nonatomic, copy)   NSString *country;

@end

@implementation User

- (instancetype)init {
    self = [super init];
    if (self) {
        _firstName = @"";
        _lastName = @"";
        _sex = 0;
        _birthday = nil;
        _country = nil;
    }
    return self;
}
- (instancetype)initWithFirstName:(NSString*)firstName
                         LastName:(NSString*)lastName
                              Sex:(BOOL)sex
                         Birthday:(NSDate*)birthday
                          Country:(NSString*)country
{
    _firstName = firstName;
    _lastName = lastName;
    _sex = sex;
    _birthday = birthday;
    _country = country;
    return self;
}

- (NSString*) getUserInfo {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd.MM.YYYY"];
    return [NSString stringWithFormat:@"User: %@ %@\nBirthday: %@\nSex: %@\nCountry: %@",self.firstName,self.lastName,[formater stringFromDate:self.birthday],self.sex?@"WOMAN":@"MAN",self.country];
}

@end
