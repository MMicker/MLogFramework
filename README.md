#MLogFramework
##前言
[MLogFramework](https://github.com/was0107/MLogFramework),用于在控制台输出各日志信息
##简介
*  日志类大家都会用到，为什么还在此多此一举呢，此库的设计之初就是为了指定日志的级别，并且能够根据级别进行输出控制，所以就有了这个库；

##功能
*  共定义6种输出类型，未定义、调试、信息、错误、警告、致命六种；
*  提供Debug\Info\Warn\Error\Fatal\Frame\Size\Point\Vector九种快捷输出宏
*  后续会增强此组件，可以定制输出到控制台，文件，网络等目地

##参数说明

宏定义
```
#define LOG(lv,s,...)       [MLog MLog:lv file:__FILE__ lineNumber:__LINE__ func:__FUNCTION__ format:(s),##__VA_ARGS__]

#define DEBUGLOG(s,...)     LOG(M_LOG_LEVEL_TYPE_DEBUG,s,##__VA_ARGS__)
#define INFOLOG(s,...)      LOG(M_LOG_LEVEL_TYPE_INFO,s,##__VA_ARGS__)
#define WARNLOG(s,...)      LOG(M_LOG_LEVEL_TYPE_WARN,s,##__VA_ARGS__)
#define ERRLOG(s,...)       LOG(M_LOG_LEVEL_TYPE_ERROR,s,##__VA_ARGS__)
#define FATALLOG(s,...)     LOG(M_LOG_LEVEL_TYPE_FATAL,s,##__VA_ARGS__)

#define FRAMELOG(rect)      DEBUGLOG(NSStringFromCGRect(rect));
#define SIZELOG(size)       DEBUGLOG(NSStringFromCGSize(size));
#define POINTLOG(point)     DEBUGLOG(NSStringFromCGPoint(point));
#define VECTORLOG(vec)      DEBUGLOG(NSStringFromCGVector(vec));
```

核心函数
```
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
```

举例
```
DEBUGLOG(@"debug log");
INFOLOG(@"info log");
WARNLOG(@"warn log");
ERRLOG(@"err log");
FATALLOG(@"fatal log");
FRAMELOG(self.view.bounds);
POINTLOG(self.view.bounds.origin);
SIZELOG(self.view.bounds.size);

对应输出

2015-12-08 12:57:51.526 testLog[2589:76638] [D] debug log -[ViewController viewDidLoad]:20
2015-12-08 12:57:51.526 testLog[2589:76638] [I] info log -[ViewController viewDidLoad]:21
2015-12-08 12:57:51.527 testLog[2589:76638] [W] warn log -[ViewController viewDidLoad]:22
2015-12-08 12:57:51.527 testLog[2589:76638] [E] err log -[ViewController viewDidLoad]:23
2015-12-08 12:57:51.527 testLog[2589:76638] [F] fatal log -[ViewController viewDidLoad]:24
2015-12-08 12:57:51.527 testLog[2589:76638] [D] frame = {{0, 0}, {375, 667}} -[ViewController viewDidLoad]:25
2015-12-08 12:57:51.527 testLog[2589:76638] [D] point = {187.5, 333.5} -[ViewController viewDidLoad]:26
2015-12-08 12:57:51.528 testLog[2589:76638] [D] size = {375, 667} -[ViewController viewDidLoad]:27

```

##注意事项:
1、无；

