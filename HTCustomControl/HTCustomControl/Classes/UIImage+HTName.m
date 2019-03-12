//
//  UIImage+HTName.m
//  HTCustomControl
//
//  Created by Henry on 2019/3/12.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "UIImage+HTName.h"

@implementation UIImage (HTName)

+ (UIImage *)imageWithName:(NSString *)name inBundle:(NSString *)bundleName {
    
    NSBundle *bundle = [self getBundleWithName:bundleName];
    
    NSString *res = name.stringByDeletingPathExtension;
    
    // 路径 后缀名
    NSString *ext = name.pathExtension;
    NSArray *exts = ext.length > 0 ? @[ext] : @[@"", @"png", @"jpeg", @"jpg", @"gif", @"webp", @"apng"];
    
    NSArray *scales = [self getScaleArray];
    CGFloat scale = 1;
    NSString *path = nil;
    
    for (NSNumber *s in scales) {
        scale = s.floatValue;
        NSString *scaledName = [self stringByAppendingString:res scale:scale];
        for (NSString *e in exts) {
            path = [bundle pathForResource:scaledName ofType:e];
            if (path) break;
        }
        if (path) break;
    }
    if (path.length == 0) return nil;
    
    return [UIImage imageWithContentsOfFile:path];
}

#pragma mark ------------ Private Methods -------------
+ (NSBundle *)getBundleWithName:(NSString *)bundleName {
    NSString *pathComponent = [NSString stringWithFormat:@"%@.bundle", bundleName];
    NSString *bundlePath =[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:pathComponent];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return bundle;
}

+ (NSString *)stringByAppendingString:(NSString *)str scale:(CGFloat)scale  {
    if (fabs(scale - 1) <= __FLT_EPSILON__ || str.length == 0 || [str hasSuffix:@"/"]) return self.copy;
    return [str stringByAppendingFormat:@"@%@x", @(scale)];
}

+ (NSArray *)getScaleArray {
    NSArray *scales;
    CGFloat screenScale = [UIScreen mainScreen].scale;
    if (screenScale <= 1) {
        scales = @[ @1, @2, @3 ];
    } else if (screenScale <= 2) {
        scales = @[ @2, @3, @1 ];
    } else {
        scales = @[ @3, @2, @1 ];
    }
    return scales;
}

@end
