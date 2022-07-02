//
//  RisingHeader.m
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>
#import "RisingHeader.h"

void RisingDetailLog(RisingLogType R_, const char *__func) {
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
    printf("%s", __func);
}
