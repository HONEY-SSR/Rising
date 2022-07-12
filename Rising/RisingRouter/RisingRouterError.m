//
//  RisingRouterError.m
//  Rising
//
//  Created by SSR on 2022/7/12.
//

#import "RisingRouterError.h"

@implementation RisingRouterError

+ (instancetype)errorWithCode:(RisingRouterErrorCode)code {
    
    RisingRouterError *error = [[RisingRouterError alloc] init];
    error.errorCode = code;
    
    return error;
}

- (instancetype)errorAppendRequest:(RisingRouterRequest *)request {
    _errorRequest = request;
    return self;
}

@end
