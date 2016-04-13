//
//  MLog.h
//  MLogFramework
//
//  Created by Micker on 15/4/13.
//  Copyright © 2016年 micker. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger , M_LOG_LEVEL_TYPE) {
    M_LOG_LEVEL_TYPE_UNDEF = 0,     //未定义
    M_LOG_LEVEL_TYPE_DEBUG,         //调试
    M_LOG_LEVEL_TYPE_INFO,          //提示
    M_LOG_LEVEL_TYPE_WARN,          //警告
    M_LOG_LEVEL_TYPE_ERROR,         //错误
    M_LOG_LEVEL_TYPE_FATAL          //致命
};


#define LOG(lv,s,...)       [MLog MLog:lv file:__FILE__ lineNumber:__LINE__ func:__FUNCTION__ format:(s),##__VA_ARGS__]

#define DEBUGLOG(s,...)     LOG(M_LOG_LEVEL_TYPE_DEBUG,s,##__VA_ARGS__)
#define INFOLOG(s,...)      LOG(M_LOG_LEVEL_TYPE_INFO,s,##__VA_ARGS__)
#define WARNLOG(s,...)      LOG(M_LOG_LEVEL_TYPE_WARN,s,##__VA_ARGS__)
#define ERRLOG(s,...)       LOG(M_LOG_LEVEL_TYPE_ERROR,s,##__VA_ARGS__)
#define FATALLOG(s,...)     LOG(M_LOG_LEVEL_TYPE_FATAL,s,##__VA_ARGS__)

#define FRAMELOG(rect)      DEBUGLOG(@"frame = %@",NSStringFromCGRect(rect));
#define SIZELOG(size)       DEBUGLOG(@"size = %@",NSStringFromCGSize(size));
#define POINTLOG(point)     DEBUGLOG(@"point = %@",NSStringFromCGPoint(point));
#define VECTORLOG(vec)      DEBUGLOG(@"vector = %@",NSStringFromCGVector(vec));


@interface MLog : NSObject

+ (void) startLevel:(M_LOG_LEVEL_TYPE) leve;

/**
 * @brief 格式化输出日志信息
 *
 *
 * @param [in]  N/A    level        日志级别
 * @param [in]  N/A    sourceFile   源文件
 * @param [in]  N/A    lineNumber   行数
 * @param [in]  N/A    funcName     方法名
 * @param [in]  N/A    format
 * @param [out] N/A
 * @return     void
 * @note
 */
+(void)  MLog:(M_LOG_LEVEL_TYPE)level
         file:(const char*)sourceFile
   lineNumber:(int)lineNumber
         func:(const char *)funcName
       format:(NSString*)format,...;
@end