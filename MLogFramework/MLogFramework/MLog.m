//
//  MLog.m
//  MLogFramework
//
//  Created by Micker on 15/4/13.
//  Copyright © 2016年 micker. All rights reserved.
//

#import "MLog.h"

static NSInteger G_M_DEBUG_START_LEVEL = M_LOG_LEVEL_TYPE_UNDEF;

@implementation MLog

+ (void) startLevel:(M_LOG_LEVEL_TYPE) level {
    if (level<M_LOG_LEVEL_TYPE_UNDEF || level>M_LOG_LEVEL_TYPE_FATAL) {
        return;
    }
    G_M_DEBUG_START_LEVEL = level;
}

+(void)  MLog:(M_LOG_LEVEL_TYPE)level
         file:(const char*)sourceFile
   lineNumber:(int)lineNumber
         func:(const char *)funcName
       format:(NSString*)format,...
{
    if (level < G_M_DEBUG_START_LEVEL) {
        return;
    }
    
    NSInteger logLevel = level==0 ? M_LOG_LEVEL_TYPE_UNDEF:level;
    NSString* func = [[NSString alloc] initWithBytes:funcName length:strlen(funcName) encoding:NSUTF8StringEncoding];
    if ([func length] > 50) {
        func = [func substringToIndex:50];
    }
    NSString* levelDesc = @"UDF";
    
    switch (logLevel)
    {
        case M_LOG_LEVEL_TYPE_DEBUG:
        {
            levelDesc = @"D";
            break;
        }
        case M_LOG_LEVEL_TYPE_INFO:
        {
            levelDesc = @"I";
            break;
        }
        case M_LOG_LEVEL_TYPE_WARN:
        {
            levelDesc = @"W";
            break;
        }
        case M_LOG_LEVEL_TYPE_ERROR:
        {
            levelDesc = @"E";
            break;
        }
        case M_LOG_LEVEL_TYPE_FATAL:
        {
            levelDesc = @"F";
            break;
        }
        default:
            break;
    }
    
    va_list vl;
    NSString* newFormat = [NSString stringWithFormat:@"[%@] %@ ",levelDesc,format];
    newFormat = [newFormat stringByAppendingFormat:@"%@:%d",func,lineNumber];
    va_start(vl,format);
    NSLogv(newFormat,vl);
    va_end(vl);
}
@end
