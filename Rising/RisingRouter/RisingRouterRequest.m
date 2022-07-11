//
//  RisingRouterRequest.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "RisingRouterRequest.h"

@implementation RisingRouterRequest

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        _requestPath = url.path;
        _parameters = NSMutableDictionary.dictionary;
        NSString *urlStr = url.query;
        for (NSString *param in [urlStr componentsSeparatedByString:@"&"]) {
            NSArray *elts = [param componentsSeparatedByString:@"="];
            if (elts.count < 2)
                continue;
            id firstEle = [elts firstObject];
            id lastEle = [elts lastObject];
            if (firstEle && lastEle) {
                _parameters[firstEle] = lastEle;
            }
        }
    }
    return self;
}

- (instancetype)initWithPath:(NSString *)requestPath parameters:(RisingParameters)parameters {
    self = [super init];
    if (self) {
        _requestPath = requestPath;
        _parameters = parameters;
    }
    return self;
}


@end
