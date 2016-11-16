//
//  HLTCollectionReusableView.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTCollectionReusableView.h"
#import "UIImageView+WebCache.h"

@interface HLTCollectionReusableView() <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;

@end
@implementation HLTCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HLTCollectionReusableView" owner:nil options:nil] firstObject];
}

- (void)setBannerURLs:(NSArray *)bannerURLs
{
    _bannerURLs = [bannerURLs copy];
    
    for (int i = 0; i < bannerURLs.count; i++) {
        CGRect imageRect = self.scrollView.bounds;
        imageRect.origin.x = i * imageRect.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageRect];
        [imageView sd_setImageWithURL:[NSURL URLWithString:bannerURLs[i]] placeholderImage:[UIImage imageNamed:@"banner_placeholder_750x400_"]];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(bannerURLs.count * self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.bannerURLs.count;
    CGFloat pageControlW = 50;
    CGFloat pageControlH = 10;
    CGFloat pageControlX = self.center.x - pageControlW * 0.5;
    CGFloat pageControlY = self.scrollView.frame.size.height - pageControlH * 2;
    pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlW, pageControlH);
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

- (IBAction)moreAcitivityBtnClicked:(id)sender
{
    
}

@end
