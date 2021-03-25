//
//  TKMResourceManager.m
//  TKMResourceManager
//
//  Created by Thief Toki on 2021/3/25.
//

#import "TKMResourceManager.h"

@interface TKMResourceManager ()

@property (nonatomic, strong) NSString *bundleName;

@end

@implementation TKMResourceManager

#pragma mark - shared

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - 

- (void)registerBundleName:(NSString *)bundleName {
    self.bundleName = bundleName;
}

#pragma mark - 

+ (UIImage *)imageNamed:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) return image;
    
    NSString *path;
    if ([TKMResourceManager shared].bundleName.length > 0) {
        path = [[NSBundle mainBundle] pathForResource:[TKMResourceManager shared].bundleName ofType:@"bundle"];
    }
    if (!path){
        path = [[NSBundle mainBundle] pathForResource:NSStringFromClass([TKMResourceManager class]) ofType:@"bundle"];
    }
    
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSLog(@"Bundle: %@", bundle);
    if (@available(iOS 13.0, *)) {
        return [UIImage imageNamed:imageName inBundle:bundle withConfiguration:nil];
    } else {
        return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    }
}

@end
