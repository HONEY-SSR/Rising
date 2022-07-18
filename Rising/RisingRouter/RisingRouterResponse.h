//
//  RisingRouterResponse.h
//  Rising
//
//  Created by SSR on 2022/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RisingRouterResponseError) {
    RouterResponseSuccess,      // 成功响应
    
    RouterParameterLoss,        // 参数缺失
    RouterParameterMatchFaild,  // 匹配失败
    RouterParameterClassError,  // 类型错误
    RouterParameterConflict,    // 参数互斥
    
    RouterWithoutNavagation     // 无栈管理
};

@interface RisingRouterResponse : NSObject

/// 响应的类
@property (nonatomic, nullable) Class responseClass;

/// 是否被push
@property (nonatomic) BOOL pushed;

/// 错误代码
@property (nonatomic) RisingRouterResponseError errorCode;

/// 错误描述
@property (nonatomic, copy) NSString *errorDescription;

+ (instancetype)responseSuccessPushed:(BOOL)isPushed;

+ (instancetype)responseErrorPushed:(BOOL)isPushed errorCode:(RisingRouterResponseError)code errorDescription:(NSString * _Nullable)responseParameters;

@end

NS_ASSUME_NONNULL_END
