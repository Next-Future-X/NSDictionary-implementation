//
//  MYDictionary.h
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDictionary : NSObject
/**
 * 初始化方法
 * @return 字典
 */
+ (instancetype _Nonnull)dictionary;
/**
 * 插入键值对
 * @param object 值
 * @param key 键
 */
- (void)setObject:(NSObject *_Nonnull)object forKey:(NSString *_Nonnull)key;
/**
 * 通过键查找值
 * @param key 键
 * @return 值
 */
- (NSObject *_Nullable)objectForKey:(NSString *_Nonnull)key;
/**
 * 移除键值对
 * @param key 键
 */
- (void)removeObjectForKey:(NSString *_Nonnull)key;
/**
 * 获取全部键组
 * @return 键组
 */
- (NSArray<NSString*>*_Nonnull)allKeys;
/**
 * 获取全部值组
 * @return 值组
 */
- (NSArray<NSObject*>*_Nonnull)allValues;
@end
