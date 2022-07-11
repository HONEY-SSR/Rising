//
//  RisingFoundationExtention.m
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>
#import "RisingFoundationExtention.h"

void RisingTypeLog(RisingLogType R_) {
    switch (R_) {
        case R_defualt:
            printf("⚫️");
            break;
        case R_success:
            printf("🟢");
            break;
        case R_warning:
            printf("🟡");
            break;
        case R_error:
            printf("🔴");
            break;
        case R_uncertain:
            printf("🟤");
            break;
        case R_debug:
            printf("🟣");
            break;
    }
}
