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
    RouterParameterConflict,    // 参数互斥
    
    RouterChildPushError        // push失败
};

@interface RisingRouterResponse : NSObject

@property (nonatomic, nullable) Class responseClass;

@property (nonatomic) BOOL pushed;

@property (nonatomic) RisingRouterResponseError errorCode;

@property (nonatomic, strong, nullable) NSDictionary *responseParameters;

+ (instancetype)responseSuccessPushed:(BOOL)isPushed;

+ (instancetype)responseErrorPushed:(BOOL)isPushed errorCode:(RisingRouterResponseError)code suggestPrameters:(NSDictionary * _Nullable)responseParameters;

@end

NS_ASSUME_NONNULL_END
