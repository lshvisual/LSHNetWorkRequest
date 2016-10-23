//
//  LLNetWorkHelper.h
//  LSHNetWorkRequest
//
//  Created by 刘胜华 on 16/10/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,LLNetWorkStatus){
    
    /** 未知网络 */
    LLNetWorkStatusUnknow,
    /**无网络 */
    LLNetWorkStatusNotReachable,
    /**手机网络*/
    LLNetWorkStatusWWAN,
    /**WIFI网络*/
    LLNetWorkStatusWIFI
    
};
/** 网络请求成功Block回调 */
typedef void(^HttpRequestSuccessCallBack)(id responseObject);

/** 网络请求失败Block回调 */
typedef void(^HttpRequestFailCallBack)(NSError *error);

/** 网络请求缓存Block */
typedef void(^HttpRequestCache)(id responseCanche);

/** 请求任务 */
typedef NSURLSessionTask LLURLSessionTask;



@interface LLNetWorkHelper : NSObject


/**
 *  @brief 单例方法
 *
 *  @return 返回单例对象
 */
+(instancetype)shareInstance;


/**
 *  @brief GET请求 无缓存
 *
 *  @param URL          请求地址
 *  @param ParameDic    请求参数
 *  @param SuccessBack  请求成功回调
 *  @param FailCallBack 请求失败回调
 *
 *  @return 返回的对象可取消请求,调用cancle方法
 */

+(LLURLSessionTask *)GET:(NSString *)URL Parameters:(NSDictionary *)ParametersDic SuccessCallBack:(HttpRequestSuccessCallBack )SuccessCallBack FailCallBack:(HttpRequestFailCallBack )FailCallBack;



/**
 *  @brief GET请求 有缓存
 *
 *  @param URL             请求地址
 *  @param ParametersDic   请求参数
 *  @param responseCache   缓存数据回调
 *  @param SuccessCallBack 请求成功回调
 *  @param FailCallBack    请求失败回调
 *
 *  @return 返回的对象可取消请求,调用cancle方法
 */

+(LLURLSessionTask *)GET:(NSString *)URL Parameters:(NSDictionary *)ParametersDic responseCache:(HttpRequestCache)responseCache SuccessCallBack:(HttpRequestSuccessCallBack )SuccessCallBack FailCallBack:(HttpRequestFailCallBack )FailCallBack;



/**
 *  @brief POST请求 无缓存
 *
 *  @param URL          请求地址
 *  @param ParameDic    请求参数
 *  @param SuccessBack  请求成功回调
 *  @param FailCallBack 请求失败回调
 *
 *  @return 返回的对象可取消请求,调用cancle方法
 */

+(LLURLSessionTask *)POST:(NSString *)URL Parameters:(NSDictionary *)ParametersDic SuccessCallBack:(HttpRequestSuccessCallBack )SuccessCallBack FailCallBack:(HttpRequestFailCallBack )FailCallBack;



/**
 *  @brief POST请求 有缓存
 *
 *  @param URL             请求地址
 *  @param ParametersDic   请求参数
 *  @param responseCache   缓存数据回调
 *  @param SuccessCallBack 请求成功回调
 *  @param FailCallBack    请求失败回调
 *
 *  @return 返回的对象可取消请求,调用cancle方法
 */

+(LLURLSessionTask *)POST:(NSString *)URL Parameters:(NSDictionary *)ParametersDic responseCache:(HttpRequestCache)responseCache SuccessCallBack:(HttpRequestSuccessCallBack )SuccessCallBack FailCallBack:(HttpRequestFailCallBack )FailCallBack;





@end
