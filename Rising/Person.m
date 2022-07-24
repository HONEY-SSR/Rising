//
//  Person.m
//  Rising
//
//  Created by SSR on 2022/7/23.
//

#import "Person.h"

@implementation Person

- (void)call {
    [self test];
}

- (void)test {
    NSLog(@"person");
}

@end

@implementation Student

- (void)test {
    NSLog(@"student");
}

@end
