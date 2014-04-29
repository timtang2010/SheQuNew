//
//  PolicyHelperImageView.m
//  shequ
//
//  Created by yuxin tang on 14-4-25.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "PolicyHelperImageView.h"
#import "UrlImageButton.h"

@implementation PolicyHelperImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//新定义初始化视图方法
- (id)initWithImageName:(NSString *)imageName title:(NSString *)titleStr x:(float)xPoint y:(float)yPoint width:(float)width height:(float)height
{
    //调用原始的初始化方法
    self = [super initWithFrame:CGRectMake(xPoint,
                                           yPoint,
                                           width,
                                           height)];
    if (self) {
        //Initialization code
        //设置图片视图 //CGRectMake(4, 64, 312, height) 64挡住了网页的点击事件 所以改成0
        //因为它的容器的位置是屏幕的左上角，而我们的容器的位置是在tag是322的imageView那里，不需要有一个64的偏移量
        UrlImageButton *imageView = [[UrlImageButton alloc] initWithFrame:CGRectMake(3, 0, width, height)];
        //设置网络图片路径
        [imageView setImageFromUrl:YES withUrl:imageName];
        //设置点击方法
        [imageView addTarget:self
                      action:@selector(click)
            forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:imageView];
        
        //设置背景条
        UIView *titleBack = [[UIView alloc]initWithFrame:CGRectMake(3, self.frame.size.height - 25, width, 25)];
        titleBack.backgroundColor = [UIColor blackColor];
        titleBack.alpha = 0.6;
        [self addSubview:titleBack];
        
        
        //设置标题文字
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, self.frame.size.height-25, width, 25)];
        titleLabel.text = titleStr;
        
        [titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
        
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        NSLog(@"%@, %@, %@", imageName, titleStr, self);
        
        
        
    }
    return self;
}

- (void)click {
    [self.uBdelegate click:self.tag];
}


@end
