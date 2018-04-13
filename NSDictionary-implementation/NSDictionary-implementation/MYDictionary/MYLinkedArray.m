//
//  MYLinkedArray.m
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//

#import "MYLinkedArray.h"
#import "MYKeyValueObject.h"

@interface MYLinkedArray()
//存放键值对的数组
@property (strong, nonatomic) NSMutableArray * cacheList;
@end

@implementation MYLinkedArray

+ (instancetype)array
{
    MYLinkedArray * array = [[MYLinkedArray alloc] init];
    array.cacheList = [NSMutableArray array];
    return array;
}

- (NSUInteger)length
{
    return _cacheList.count;
}

- (void)addObject:(MYKeyValueObject *)object
{
    for (MYKeyValueObject * obj in _cacheList) {
        if ([obj isEqual:object]) {
            [obj copyFromOtherObject:object];
            return;
        }
    }
    [_cacheList addObject:object];
}

- (void)removeObject:(NSObject *)object
{
    [_cacheList removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [_cacheList removeObjectAtIndex:index];
}

- (MYKeyValueObject *)objectAtIndex:(NSUInteger)index
{
    return [_cacheList objectAtIndex:index];
}

- (BOOL)containsObject:(NSObject *)object
{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    MYKeyValueObject * currentObj = (MYKeyValueObject *)object;
    for (MYKeyValueObject * obj in _cacheList) {
        if ([obj isEqual:currentObj]) {
            return YES;
        }
    }
    return NO;
}

- (NSString *)description
{
    NSMutableString * tempStr = [NSMutableString string];
    for (MYKeyValueObject * obj in _cacheList) {
        [tempStr appendString:[NSString stringWithFormat:@"%@ = %@\n",obj.key,obj.value]];
    }
    return tempStr.copy;
}

@end
