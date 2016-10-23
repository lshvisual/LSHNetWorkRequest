//
//  LLNetWorkCache.h
//  LSHNetWorkRequest
//
//  Created by 刘胜华 on 16/10/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNetWorkCache : NSObject

/**
 *  缓存网络数据
 *
 *  @param responseCache 服务器返回的数据
 *  @param key           缓存数据对应的key值,推荐填入请求的URL
 */
+(void)saveResponseCache:(id)responseCache forKey:(NSString *)key;

/**
 *  取出缓存的数据
 *
 *  @param key 根据存入时候填入的key值来取出对应的数据
 *
 *  @return 缓存的数据
 */
+(id)getResponseCacheForKey:(NSString *)key;


@end
