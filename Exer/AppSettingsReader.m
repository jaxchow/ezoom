//
//  AppSettingsReader.m
//  Exer
//
//  Created by jax chow on 12/25/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "AppSettingsReader.h"

@implementation AppSettingsReader

static AppSettingsReader *g_instance = nil;

+ (AppSettingsReader *)sharedInstance
{
    @synchronized(self) {
        if ( g_instance == nil ) {
            g_instance = [[self alloc] init];
        }
    }
    return g_instance;
}

//获得plist路径
-(NSString*)getPlistPath{
    //沙盒中的文件路径
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    NSString *plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"AppSettings.plist"];       //根据需要更改文件名
    return plistPath;
}

//判断沙盒中名为plistname的文件是否存在
-(BOOL) isPlistFileExists{
    
    NSString *plistPath =[[AppSettingsReader sharedInstance]getPlistPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if( [fileManager fileExistsAtPath:plistPath]== NO ) {
        NSLog(@"not exists");
        return NO;
    }else{
        return YES;
    }
    
}

-(void)initPlist{
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    
    //如果plist文件不存在，将工程中已建起的plist文件写入沙盒中
    if (! [[AppSettingsReader sharedInstance] isPlistFileExists]) {
        
        //从自己建立的plist文件 复制到沙盒中 ，方法一
        NSError *error;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"WBBooks" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:plistPath error:&error];
        
        //方法二
        //        NSString *path = [[NSBundle mainBundle] pathForResource:@"WBBooks"ofType:@"plist"];
        //        NSMutableDictionary *activityDics = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        //        [activityDics writeToFile:plistPath atomically:YES];
    }
}


//判断key的书是否存在
-(BOOL)isBookExistsForKey:(NSString*)key{
    
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    NSMutableDictionary *WBBooksDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    //根目录下存在名为bookname的字典
    if ([WBBooksDictionary objectForKey:key]) {
        return YES;
    }else{
        return NO;
    }
}


//根据key值删除对应书籍
-(void)removeBookWithKey:(NSString *)key{
    
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    NSMutableDictionary *WBBooksDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    [WBBooksDictionary removeObjectForKey:key];
    [WBBooksDictionary writeToFile:plistPath atomically:YES]; //删除后重新写入
    
}



//删除plistPath路径对应的文件
-(void)deletePlist{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    [fileManager removeItemAtPath:plistPath error:nil];
    
}

//将dictionary写入plist文件，前提：dictionary已经准备好
-(void)writePlist:(NSMutableDictionary*)dictionary forKey:(NSString *)key{
    
    NSMutableDictionary *plistDictionary = [[NSMutableDictionary alloc]init];
    
    //如果已存在则读取现有数据
    if ([[AppSettingsReader sharedInstance]isPlistFileExists]) {
        plistDictionary = [[AppSettingsReader sharedInstance]readPlist];
    }
    
    
    
    //增加一个数据
    [plistDictionary setValue:dictionary forKey:key]; //在plistDictionary增加一个key为...的value
    
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    
    if([plistDictionary writeToFile:plistPath atomically:YES]){
        NSLog(@"write ok!");
    }else{
        NSLog(@"ddd");
    }
    
}

//
-(NSMutableDictionary*)readPlist{
    
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    return resultDictionary;
}

//读取plist文件内容复制给dictionary   备用
-(void)readPlist:(NSMutableDictionary **)dictionary{
    NSString *plistPath = [[AppSettingsReader sharedInstance] getPlistPath];
    *dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
}

//更改一条数据，就是把dictionary内key重写
-(void)replaceDictionary:(NSMutableDictionary *)newDictionary withDictionaryKey:(NSString *)key{
    
    [[AppSettingsReader sharedInstance]removeBookWithKey:key];
    [[AppSettingsReader sharedInstance]writePlist:newDictionary forKey:key];
    
}


-(NSInteger)getBooksCount{
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    dictionary = [[AppSettingsReader sharedInstance] readPlist];
    return [dictionary count];
    
}
@end
