//
//  HLTDiscoverViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTDiscoverViewController.h"
#import "HLTCollectionReusableView.h"
#import "BusinessLogicLayer/HLTActivityBL.h"
#import "PersistenceLayer/HLTActivity.h"
#import "HLTCollectionViewCell.h"
#import "HLTCellButton.h"


static const NSUInteger kDiscoverViewCellMargin = 10;
static const NSUInteger kDiscoverViewCellCount = 2;
static const NSUInteger kDiscoverViewSectionCount = 2;


@interface HLTDiscoverViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) HLTCollectionReusableView *reusableView;
@property (nonatomic, copy) NSArray *cellImageNames;
@property (nonatomic, copy) NSArray *cellTitles;

@end

@implementation HLTDiscoverViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)loadView
{
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发现";
    HLTActivityBL *activityBL = [[HLTActivityBL alloc] init];
    [activityBL loadActivityWithType:@"recommendable" parameters:nil success:^(NSArray *array) {
        NSMutableArray *tempArray = [NSMutableArray array];
        for (HLTActivity *activity in array) {
            [tempArray addObject:activity.bannerUrl];
        }
        self.reusableView.bannerURLs = tempArray;
    } failure:^(NSError *error) {
        NSLog(@"Activity loading error: %@", error);
    }];
    
    // Register cell classes
    [self.collectionView registerClass:[HLTCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerClass:[HLTCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

- (NSArray *)cellImageNames
{
    if (!_cellImageNames) {
        _cellImageNames = @[@"bg_note_172x168_", @"bg_circle_172x168_", @"bg_moment_172x168_", @"bg_rank_172x168_"];
    }
    return _cellImageNames;
}

- (NSArray *)cellTitles
{
    if (!_cellTitles) {
        _cellTitles = @[@"代码笔记", @"技术圈", @"最新动态", @"用户排行榜"];
    }
    return _cellTitles;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return kDiscoverViewSectionCount;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kDiscoverViewCellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HLTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    int index = indexPath.section * kDiscoverViewSectionCount + indexPath.row;
    [cell.button setTitle:self.cellTitles[index] forState:UIControlStateNormal];
    [cell.button setImage:[UIImage imageNamed:self.cellImageNames[index]] forState:UIControlStateNormal];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HLTCollectionReusableView *reusableView = (HLTCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    self.reusableView = reusableView;
    return reusableView;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = (self.view.frame.size.width - 3 * kDiscoverViewCellMargin) / 2;
    CGFloat cellHeight = cellWidth + 15;
    return CGSizeMake(cellWidth, cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kDiscoverViewCellMargin, kDiscoverViewCellMargin, kDiscoverViewCellMargin, kDiscoverViewCellMargin);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(self.view.frame.size.width, 250);
    }
    return CGSizeZero;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
