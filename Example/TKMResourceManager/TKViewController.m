//
//  TKViewController.m
//  TKMResourceManager
//
//  Created by zhengxianda0512@gmail.com on 03/25/2021.
//  Copyright (c) 2021 zhengxianda0512@gmail.com. All rights reserved.
//

#import "TKViewController.h"

#import <TKMResourceManager/TKMResourceManager.h>

@interface TKViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //用ppl build 打包时不指定 --bundle-merge；
    //用ppl publish 发布时不指定 --build-bundle-merge；
    //可使用默认Bundle加载图片
    NSLog(@"默认Bundle中的Logo：%@", [TKMResourceManager imageNamed:@"logo"]);
    
    
    //用ppl build 打包时指定 --bundle-merge=TKModularization；
    //用ppl publish 发布时指定 --build-bundle-merge=TKModularization；
    //应使用指定的TKModularization.bundle加载图片
    [[TKMResourceManager shared] registerBundleName:@"TKModularization"];
    NSLog(@"指定Bundle中的Logo：%@", [TKMResourceManager imageNamed:@"logo"]);
}

- (void)viewDidAppear:(BOOL)animated {
    self.imageView.image = [TKMResourceManager imageNamed:@"logo"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
