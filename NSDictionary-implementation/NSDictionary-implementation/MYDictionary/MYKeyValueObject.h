//
//  MYKeyValueObject.h
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//


/* 尝试使用结构体
struct MYKeyValueStruct {
    char * _Nonnull key;
    id _Nonnull valu;
};
*/

#import <Foundation/Foundation.h>
//作为存储key:value的数据
@interface MYKeyValueObject : NSObject
/**
 * 键
 */
@property (copy, nonatomic) NSString * _Nonnull key;
/**
 * 值
 */
@property (strong, nonatomic) NSObject * _Nonnull value;

/**
 * 构造方法
 * @param key 键
 * @param value 值
 * @return 存储数据
 */
+ (instancetype _Nonnull)createWithKey:(NSString * _Nonnull)key andValue:(NSObject * _Nonnull)value;
/**
 * 赋值数据
 * @param object 另一个数据
 */
- (void)copyFromOtherObject:(MYKeyValueObject *_Nonnull)object;
@end
