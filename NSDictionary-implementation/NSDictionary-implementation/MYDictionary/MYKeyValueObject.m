//
//  MYKeyValueObject.m
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//

#import "MYKeyValueObject.h"

@implementation MYKeyValueObject

+ (instancetype)createWithKey:(NSString *)key andValue:(NSObject *)value
{
    MYKeyValueObject * obj = [[MYKeyValueObject alloc] init];
    obj.key = key;
    obj.value = value;
    return obj;
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[self class]]) {
        MYKeyValueObject * obj = (MYKeyValueObject *)object;
        if ([self.key isEqualToString:obj.key]) {
            return YES;
        }
    }
    return NO;
}

- (void)copyFromOtherObject:(MYKeyValueObject *)object
{
    self.key = object.key;
    self.value = object.value;
}

@end
