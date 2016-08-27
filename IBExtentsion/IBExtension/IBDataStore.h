//
//  IBDataStore.h
//  IBComponent
//
//  Created by jjs-imac-qhy on 16/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ObjKey @"ObjKey"

#ifndef IBBaseName
#define IBBaseName @"YHIB"
#endif

@interface IBDataStore : NSObject

@property (strong, nonatomic)NSMutableDictionary<NSString *,NSMutableDictionary *> *UIStyles;

@property (nonatomic, copy)NSString *plistFileName;

+ (instancetype)sharedInstance;

- (void)saveDataForKey:(NSString *)key value:(NSMutableDictionary *)value;

- (NSMutableDictionary *)readDataForKey:(NSString *)key;

- (void)writeToStoryboardFile;

- (void)initUIStyle;

@end
