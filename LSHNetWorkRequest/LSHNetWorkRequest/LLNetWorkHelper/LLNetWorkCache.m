//
//  LLNetWorkCache.m
//  LSHNetWorkRequest
//
//  Created by 刘胜华 on 16/10/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "LLNetWorkCache.h"
#import "YYCache.h"
@implementation LLNetWorkCache

static NSString *const NetworkResponseCache = @"NetworkResponseCache";
static YYCache *_dataCache;


+ (void)initialize
{
    _dataCache = [YYCache cacheWithName:NetworkResponseCache];
}

+ (void)saveResponseCache:(id)responseCache forKey:(NSString *)key
{
    //异步缓存,不会阻塞主线程
    [_dataCache setObject:responseCache forKey:key withBlock:nil];
}

+ (id)getResponseCacheForKey:(NSString *)key
{
    return [_dataCache objectForKey:key];
}

@end
