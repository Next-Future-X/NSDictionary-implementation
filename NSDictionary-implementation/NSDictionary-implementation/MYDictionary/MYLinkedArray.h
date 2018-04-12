//
//  MYLinkedArray.h
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MYKeyValueObject;

@interface MYLinkedArray : NSObject
/**
 * 数组长度
 */
@property (assign, nonatomic, readonly) NSUInteger length;
/**
 * 初始化方法
 * @return 数组
 */
+ (instancetype _Nonnull)array;
/**
 * 添加元素
 * @param object 元素对象
 */
- (void)addObject:(MYKeyValueObject *_Nonnull)object;
/**
 * 移除元素
 * @param object 元素对象
 */
- (void)removeObject:(NSObject *_Nonnull)object;
/**
 * 移除对应索引的元素
 * @param index 索引值
 */
- (void)removeObjectAtIndex:(NSUInteger)index;
/**
 * 获取对应索引的元素
 * @param index 索引值
 * @return 元素对象
 */
- (MYKeyValueObject *_Nonnull)objectAtIndex:(NSUInteger)index;
/**
 * 是否包含元素
 * @param object 元素对象
 * @return 是否包含
 */
- (BOOL)containsObject:(NSObject *_Nonnull)object;
@end
