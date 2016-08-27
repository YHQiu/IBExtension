//
//  IBDataStore.m
//  IBComponent
//
//  Created by jjs-imac-qhy on 16/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//


#import "IBDataStore.h"
#import "IBDefine.h"
#import <UIKit/UIKit.h>

@implementation IBDataStore

+ (instancetype)sharedInstance{
    static IBDataStore *instance = nil;
    static dispatch_once_t predicaty;
    dispatch_once(&predicaty, ^{
        instance = [[IBDataStore alloc]init];
        [[NSNotificationCenter defaultCenter]addObserver:instance selector:@selector(writeToStoryboardFile) name:UIApplicationDidEnterBackgroundNotification object:nil];
    });
    return instance;
}
- (void)saveDataForKey:(NSString *)key value:(NSMutableDictionary *)value{
    [self.UIStyles setObject:value forKey:key];
}

- (NSMutableDictionary *)readDataForKey:(NSString *)key{
    return [self.UIStyles valueForKey:key];
}
- (void)initUIStyle{
    //UIStoryboard *st =[UIStoryboard storyboardWithName:IBBaseName bundle:[NSBundle bundleForClass:[self class]]];
}
#pragma -mark Getter
- (NSMutableDictionary<NSString *,NSMutableDictionary *> *)UIStyles{
    if (_UIStyles) {
        return _UIStyles;
    }
    _UIStyles = [NSMutableDictionary dictionary];
    return _UIStyles;
}

- (void)writeToStoryboardFile{
    NSString *storyboardString = [NSString stringWithFormat:@""];
    storyboardString = [storyboardString stringByAppendingString:[self begin]];
    
    for (NSDictionary *dic in self.UIStyles) {
        if ([dic[ObjKey] isEqualToString:@"UILabel"]) {
            
            
        }
    }
    
    storyboardString = [storyboardString stringByAppendingString:[self end]];
    NSData *data = [storyboardString dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *name = @"IBExtension.storyboard";
    path = [path stringByAppendingPathComponent:name];
    [manager removeItemAtPath:path error:nil];
    if([manager createFileAtPath:path contents:data attributes:nil]){
        NSLog(@"IBExensionLog:Write To %@ Success",path);
    }
    else{
        NSLog(@"IBExensionLog:Write To %@ Failed",path);
    }
}

- (NSString *)begin{
    return [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@",
            xml_version,
            document,
            dependencies,
            deployment_,
            plugIn_,
            capability_,
            _dependencies,
            scenes,
            _Name_([self controlerNameWithPage:1]),
            scene([self sceneId]),
            objects,
            tableViewController([self controlerNameWithPage:1],[self controllerIdWithPage:1]),
            tableView([self tableViewId]),
            rect_table_,
            autoresizingMask,
            color_
            ];
}
- (NSString *)end{
    return [NSString stringWithFormat:@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@",
            _tableView,
            freeformSimulatedSizeMetrics_,
            size_key_freeformSize,
            _tableViewController,
            placeholder_,
            _objects,
            point_,
            _scene,
            _scenes,
            _document
            ];
}
- (NSString *)sceneId{
    return  @"sceneID_jjkfjk";
}
                                - (NSString *)controlerNameWithPage:(NSUInteger)page{
                                    return @"sefjj";
                                }
- (NSString *)controllerIdWithPage:(NSUInteger)page{
    return @"ctlId_Sel";
}
- (NSString *)tableViewId{
    return  @"ctl_iffd_geqwr";
}

@end
