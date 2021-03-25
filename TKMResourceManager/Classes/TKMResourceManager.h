//
//  TKMResourceManager.h
//  TKMResourceManager
//
//  Created by Thief Toki on 2021/3/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKMResourceManager : NSObject

+ (instancetype)shared;

- (void)registerBundleName:(NSString *)bundleName;

+ (UIImage *)imageNamed:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
