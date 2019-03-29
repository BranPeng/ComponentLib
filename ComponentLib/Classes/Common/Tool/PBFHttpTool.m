//
//  PBFHttpTool.m
//  LHGIM
//
//  Created by bran on 16/8/10.
//  Copyright © 2016年 bran. All rights reserved.
//

#import "PBFHttpTool.h"
#import "AFNetworking.h"
#import <Foundation/Foundation.h>

@implementation PBFHttpTool

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    // 设置请求header
    [session.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [session.requestSerializer setValue:@"tapir" forHTTPHeaderField:@"SNG_DID"];
    [session.requestSerializer setValue:@"com.samsclub.now.qa" forHTTPHeaderField:@"SNG_APP_ID"];
    [session.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    
//    AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//
//    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
//    //如果是需要验证自建证书，需要设置为YES
//    securityPolicy.allowInvalidCertificates = YES;
//
//    //validatesDomainName 是否需要验证域名，默认为YES；
//    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
//    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
//    //如置为NO，建议自己添加对应域名的校验逻辑。
//    securityPolicy.validatesDomainName = YES;
//    session.securityPolicy = securityPolicy;
    

    
    // 设置请求超时时间
    session.requestSerializer.timeoutInterval = 100.f;
    
    // 2.发送请求
    [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}

+ (void)postLogin{
    
    NSDictionary *headers = @{ @"Content-Type": @"application/json",
                               @"SNG_DID": @"tapir",
                               @"SNG_APP_ID": @"com.samsclub.now.qa",
                               @"Cache-Control": @"no-cache",
                            };
    NSDictionary *parameters = @{ @"username": @"savingsprimary00706820@gmail.com",
                                  @"password": @"test123",
                                  @"s1": @"MzAxMDQ0Njk1OQAAAAAAAHTVIYQLs/lo45EIry7+LA6k/gp0rmGrsUpWBEC2q7J4EBSpdyOMlRx57FoiGWzqTM7LTT9SNzkCUcgVGazIVFLssqryK/wiEErJqWumT9EFRrnnJc7bM54N/rjrBZQ4jdORiFMtZ50HcEkZ+RVKLUhoI1j4gZums/B6897at6xooCzdQcNSaveLIZo5wIdqmdrFuJfTbHL6k/UtYLiqfRO/ies2J13Gz9iV8ukzL8xLycKUPU2qCWVCdsDwfPTj2xZuLYsLm+VRXnyEgXi1vz2wB3QkYeifijdTGJ591T+m9L52/cCSbHu7OspXX77WcTYRbSKpnhcB6J1BhwM4FqwHUrT2FmSLJ7hU9G3ugjtP44ClNBr0XJLi/gyrgLdAf3aEAfTkMClgyoMnmp4mP0lXJJzRhOTkXo/ZK1ZPZTXvQSHYWqVW5FziPOu8+LloPkeh4BFRsNmvkP6rGvdX7NdfmLfK02T0qdh7qCRend3xU1bqedg7ySmQv1X+h/0P1M9OctbqcFnXdkfh0CstroeLsI+Hty1Twy6q8GPjoXjA4bOYZ6g1DjCabEKx0ctGLeleabr7+dyrw/XkakMVh3wchEk3/7LoaAsXTupe8TWqVeFUEm4LDnjR5dVntwb9RpGFMdcxy+JHFycj7aLlr8O9t5kjcNUCwT/rJBs1ecRwphhDP9yXnpcTvKVVKlW1EAFVbRO8k1ENG7WvmmAtm6EWsIZLRtemNupEhVfxCkm9pEkkFIFr9lfnO8koyFN5pw==+036+014" };
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://samssng-qa.walmart.com/api/v1/auth/login"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:100.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                    if (error) {
//                                                        NSLog(@"%@", error);
//                                                    } else {
//                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//                                                        NSLog(@"%@", httpResponse);
//                                                    }
//                                                }];
//    [dataTask resume];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                      
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    
                                                    if (error) {
                                                        
                                                        NSLog(@"Error...");
                                                        
                                                        NSLog(@"%@", error);
                                                        
                                                    } else {
                                                        
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        
                                                        NSLog(@"%@", httpResponse);
                                                        
                                                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                        
                                                        NSLog(@"%@", json);
                                                        
                                                    }
                                                    
                                                    NSLog(@"Finish the request...");
                                                    
                                                }];
    [dataTask resume];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    // 2.发送请求
    [session POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (FormData *formData1 in formDataArray) {
            [formData appendPartWithFileData:formData1.data name:formData1.name fileName:formData1.filename mimeType:formData1.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 2.发送请求
    [session GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        if(responseObject != nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
            if (success) {
                success(dic);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
/**
 *  用来封装文件数据的模型
 */
@implementation FormData

@end
