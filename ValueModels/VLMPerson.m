//
//  VLMPerson.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 Vincent Coetzee
//
//  Distributed under the permissive zlib license
//  Get the latest version from here:
//
//  https://github.com/vincent-coetzee/ValueModels
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "VLMPerson.h"
#import "NSDate+Extensions.h"

@implementation VLMPerson

+ (instancetype) personWithFirstName: (NSString*) first lastName: (NSString*) last dateOfBirth: (NSDate*) date
    {
    VLMPerson* person;
    
    person = [self new];
    person.firstName = first;
    person.lastName = last;
    person.dateOfBirth = date;
    return(person);
    }

+ (NSArray*) listOfPeople
    {
    NSMutableArray* list;
    
    list = [NSMutableArray array];
    [list addObject: [VLMPerson personWithFirstName: @"Peter" lastName: @"Pan" dateOfBirth: [NSDate distantPast]]];
    [list addObject: [VLMPerson personWithFirstName: @"James" lastName: @"Bond" dateOfBirth: [NSDate day: 12 month: 12 year: 1942]]];
    [list addObject: [VLMPerson personWithFirstName: @"Isaac" lastName: @"Asimov" dateOfBirth: [NSDate day: 1 month: 11 year: 1935]]];
    [list addObject: [VLMPerson personWithFirstName: @"Peter" lastName: @"James" dateOfBirth: [NSDate day: 5 month: 7 year: 1980]]];
    [list addObject: [VLMPerson personWithFirstName: @"Alistair" lastName: @"Reynolds" dateOfBirth: [NSDate day: 7 month: 9 year: 1968]]];
    [list addObject: [VLMPerson personWithFirstName: @"Frederik" lastName: @"Pohl" dateOfBirth: [NSDate day: 9 month: 4 year: 1945]]];
    [list addObject: [VLMPerson personWithFirstName: @"James" lastName: @"Kirk" dateOfBirth: [NSDate day: 4 month: 6 year: 2345]]];
    [list addObject: [VLMPerson personWithFirstName: @"Bones" lastName: @"McCoy" dateOfBirth: [NSDate day: 9 month: 3 year: 2325]]];
    [list addObject: [VLMPerson personWithFirstName: @"Montgomery" lastName: @"Scott" dateOfBirth: [NSDate day: 9 month: 1 year: 2322]]];
    [list addObject: [VLMPerson personWithFirstName: @"Amanda" lastName: @"Grayson" dateOfBirth: [NSDate day: 7 month: 8 year: 2310]]];
    return(list);
    }

@end
