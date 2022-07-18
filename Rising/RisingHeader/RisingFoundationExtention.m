//
//  RisingFoundationExtention.m
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>
#import "RisingFoundationExtention.h"

void RisingSingleLog(NSString *format, ...) {
    va_list list;
    va_start(list, format);
    printf("%s\n", [[NSString alloc] initWithFormat:format arguments:list].UTF8String);
    va_end(list);
}
