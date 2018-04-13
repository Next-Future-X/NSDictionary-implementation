//
//  MYDictionary.m
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//

#import "MYDictionary.h"
#import "MYLinkedArray.h"
#import "MYKeyValueObject.h"

//存储key的初始哈希值
static const NSUInteger originHashCode     = 5381;
//存储key的取余
static const NSUInteger remainderHashCode  = 1013;
//字典中最多能存放linkedArray的个数 (由获取hashCode的函数决定)
static const NSUInteger linkedArrayCount   = 1014;

@implementation MYDictionary
{
    MYLinkedArray *_dictList[linkedArrayCount];
}

+ (instancetype)dictionary
{
    return [[self alloc] init];
}

- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    if (!key || !object) {
        return;
    }
    NSUInteger keyHash = [self getDictionaryKeyHashCodeWithKey:key];
    MYKeyValueObject * currentObj = [MYKeyValueObject createWithKey:key andValue:object];
    MYLinkedArray * currentArr = _dictList[keyHash];
    if (currentArr) {
        for (int i = 0; i < currentArr.length; i++) {
            MYKeyValueObject * kvObject = [currentArr objectAtIndex:i];
            if ([kvObject isEqual:currentObj]) {
                [kvObject copyFromOtherObject:currentObj];
                return;
            }
        }
        [currentArr addObject:currentObj];
    } else {
        currentArr = [MYLinkedArray array];
        [currentArr addObject:currentObj];
    }
    _dictList[keyHash] = currentArr;
}

- (NSObject *)objectForKey:(NSString *)key
{
    if (!key) {
        return nil;
    }
    NSUInteger keyHash = [self getDictionaryKeyHashCodeWithKey:key];
    MYLinkedArray * currentArr = _dictList[keyHash];
    if (currentArr && currentArr.length) {
        for (int i = 0; i < currentArr.length; i++) {
            MYKeyValueObject * obj = [currentArr objectAtIndex:i];
            if ([obj.key isEqualToString:key]) {
                return obj.value;
            }
        }
        return nil;
    }
    return nil;
}

- (void)removeObjectForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    NSUInteger keyHash = [self getDictionaryKeyHashCodeWithKey:key];
    MYLinkedArray * currentArr = _dictList[keyHash];
    if (currentArr && currentArr.length) {
        for (int i = 0; i < currentArr.length; i++) {
            MYKeyValueObject * obj = [currentArr objectAtIndex:i];
            if ([obj.key isEqualToString:key]) {
                [currentArr removeObject:obj];
                return;
            }
        }
    }
}

- (NSArray<NSString *> *)allKeys
{
    NSMutableArray<NSString *>* tempArray = [NSMutableArray array];
    for (int i = 0; i < linkedArrayCount; i++) {
        MYLinkedArray * array = _dictList[i];
        if (array && array.length) {
            for (int j = 0; j < array.length; j++) {
                MYKeyValueObject * obj = [array objectAtIndex:j];
                [tempArray addObject:obj.key];
            }
        }
    }
    return tempArray.copy;
}

- (NSArray<NSObject *> *)allValues
{
    NSMutableArray<NSObject *>* tempArray = [NSMutableArray array];
    for (int i = 0; i < linkedArrayCount; i++) {
        MYLinkedArray * array = _dictList[i];
        if (array && array.length) {
            for (int j = 0; j < array.length; j++) {
                MYKeyValueObject * obj = [array objectAtIndex:j];
                [tempArray addObject:obj.value];
            }
        }
    }
    return tempArray.copy;
}

- (NSUInteger)getDictionaryKeyHashCodeWithKey:(NSString *)key
{
    NSUInteger totalHash = originHashCode * 33 + key.hash;
//    for (int i = 0; i < key.length; i++) {
//        unichar charCode = [key characterAtIndex:i];
//        totalHash = totalHash * 33 + charCode;
//    }
    return totalHash % remainderHashCode;
}

- (NSString *)description
{
    NSMutableString * tempStr = [NSMutableString stringWithString:@"{\n"];
    for (int i = 0; i < linkedArrayCount; i++) {
        MYLinkedArray * arr = _dictList[i];
        if (arr && arr.length) {
            [tempStr appendString:[NSString stringWithFormat:@"%@",arr.description]];
        }
    }
    [tempStr appendString:@"}"];
    return tempStr.copy;
}

@end
