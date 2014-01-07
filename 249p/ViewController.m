//
//  ViewController.m
//  249p
//
//  Created by Youp on 2014. 1. 8..
//  Copyright (c) 2014년 admin. All rights reserved.
//

#import "ViewController.h"
#define TAG_CONTENT 99

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

// 너비 맞추기
-(IBAction)fitToWidth:(id)sender{
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.width/contentView.frame.size.width;
    NSLog(@"scale : %f", scale);
    [self.scrollView setZoomScale:scale animated:YES];
}

// 높이 맞추기
-(IBAction)fitToHeight:(id)sender{
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.height/ contentView.frame.size.height;
    NSLog(@"scale : %f", scale);
    [self.scrollView setZoomScale:scale animated:YES];
}

// 2배로
-(IBAction)scaleDouble:(id)sender
{
    float x = self.scrollView.contentOffset.x;
    float y = self.scrollView.contentOffset.y;
    float w = self.scrollView.frame.size.width/2;
    float h = self.scrollView.frame.size.height/2;
    
    CGRect doubleRect = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:doubleRect animated:YES];
    
}

// 확대/축소대상의 뷰
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [self.view viewWithTag:TAG_CONTENT];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 화면보다 큰뷰를 IB에서 다루기 힘들다. 코드로 작성
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.tag = TAG_CONTENT;
    
    [self.scrollView addSubview:imageView];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = imageView.frame.size;
    self.scrollView.minimumZoomScale = self.scrollView.frame.size.width/imageView.frame.size.width;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
