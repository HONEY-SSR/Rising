//
//  RisingRouterResponse.m
//  Rising
//
//  Created by SSR on 2022/7/18.
//

#import "RisingRouterResponse.h"

@implementation RisingRouterResponse

+ (instancetype)responseSuccessPushed:(BOOL)isPushed {
    RisingRouterResponse *response = [[RisingRouterResponse alloc] init];
    response.pushed = isPushed;
    return response;
}

+ (instancetype)responseErrorPushed:(BOOL)isPushed errorCode:(RisingRouterResponseError)code errorDescription:(NSString *)responseParameters {
    RisingRouterResponse *response = [[RisingRouterResponse alloc] init];
    response.pushed = isPushed;
    response.errorCode = code;
    response.errorDescription = responseParameters;
    return response;
}

- (NSString *)description {
    NSMutableString *string = NSMutableString.string;
    
    
    switch (self.errorCode) {
        case RouterResponseSuccess: {
            [string appendString:@"响应成功 "];
        } break;
        case RouterParameterLoss: {
            [string appendString:@"参数缺失 "];
        } break;
        case RouterParameterMatchFaild: {
            [string appendString:@"匹配失败 "];
        } break;
        case RouterParameterClassError: {
            [string appendString:@"类型错误 "];
        }
        case RouterParameterConflict: {
            [string appendString:@"参数互斥 "];
        } break;
        case RouterWithoutNavagation: {
            [string appendString:@"无栈管理 "];
        } break;
    }
    
    return string.copy;
}

@end
