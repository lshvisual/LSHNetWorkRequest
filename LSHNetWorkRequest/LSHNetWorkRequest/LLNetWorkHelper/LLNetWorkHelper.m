//
//  LLNetWorkHelper.m
//  LSHNetWorkRequest
//
//  Created by 刘胜华 on 16/10/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "LLNetWorkHelper.h"
#import "AFNetworking.h"
#import "LLNetWorkCache.h"

@implementation LLNetWorkHelper


+(instancetype)shareInstance{
    static LLNetWorkHelper *helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper =[[LLNetWorkHelper alloc]init];
    });

    return helper;
}

//GET请求无缓存
+(LLURLSessionTask *)GET:(NSString *)URL Parameters:(NSDictionary *)ParametersDic SuccessCallBack:( HttpRequestSuccessCallBack)SuccessCallBack FailCallBack:( HttpRequestFailCallBack)FailCallBack{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    return [manager GET:URL parameters:ParametersDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        SuccessCallBack(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        FailCallBack(error);
    }];


}

//GET请求有缓存
+(LLURLSessionTask *)GET:(NSString *)URL Parameters:(NSDictionary *)ParametersDic responseCache:( HttpRequestCache)responseCache SuccessCallBack:(HttpRequestSuccessCallBack)SuccessCallBack FailCallBack:(HttpRequestFailCallBack)FailCallBack{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    return [manager GET:URL parameters:ParametersDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        SuccessCallBack(responseObject);
        //异步缓存数据
        [LLNetWorkCache saveResponseCache:responseObject forKey:URL];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        FailCallBack(error);
    }];

}

//POST请求无缓存
+(LLURLSessionTask *)POST:(NSString *)URL Parameters:(NSDictionary *)ParametersDic SuccessCallBack:(HttpRequestSuccessCallBack)SuccessCallBack FailCallBack:(HttpRequestFailCallBack)FailCallBack{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    return [manager POST:URL parameters:ParametersDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SuccessCallBack(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        FailCallBack(error);
    }];
    
}

//请求有缓存
+(LLURLSessionTask *)POST:(NSString *)URL Parameters:(NSDictionary *)ParametersDic responseCache:(HttpRequestCache)responseCache SuccessCallBack:(HttpRequestSuccessCallBack)SuccessCallBack FailCallBack:(HttpRequestFailCallBack)FailCallBack{

    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    return [manager POST:URL parameters:ParametersDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SuccessCallBack(responseObject);

        //异步缓存数据
        responseCache(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        FailCallBack(error);
    }];

}

//携带body POST请求
+(LLURLSessionTask *)POST:(NSString *)URL Parameters:(NSDictionary *)ParametersDic Body:(id)body SuccessCallBack:(HttpRequestSuccessCallBack)SuccessCallBack FailCallBack:(HttpRequestFailCallBack)FailCallBack{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    if ([body isKindOfClass:[NSDictionary class]]|| [body isKindOfClass:[NSMutableDictionary class]]) {
        //body是字典
        
        
    }else if ([body isKindOfClass:[NSString class]]){
    
    
    }
    
    
    return 0;

}




@end
