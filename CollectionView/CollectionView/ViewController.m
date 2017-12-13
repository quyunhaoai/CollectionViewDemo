//
//  ViewController.m
//  CollectionView
//
//  Created by hao on 17/9/29.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "ViewController.h"
#import "QYHcustomCollectionViewCell.h"
#import "QYHheadCollectionReusableView.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *titleArray;
@end
static NSString *const QYHcustomCollectionID =@"QYHcustomCollectionViewCell";
@implementation ViewController
-(NSArray *)titleArray{
    if (_titleArray == nil) {
        
        _titleArray = @[@"政治",@"体育",@"新闻",@"图片",@"视频",
                        @"政治1",@"体育1",@"新闻1",@"图片1",@"视频1",
                        @"政治2",@"体育2",@"新闻2",@"图片2",@"视频2",
                        ];
    }
    return _titleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UICollectionViewFlowLayout *Layout = [[UICollectionViewFlowLayout alloc]init];
    Layout.itemSize = self.view.bounds.size;//设置每一个ITEM跟控制器一样大小
    Layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//水平滚动
    Layout.minimumLineSpacing = 0;//设置每个item中间的间距， 垂直滚动时指行距
    Layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 0);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:Layout];

    [collectionView setBackgroundColor:[UIColor grayColor]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([QYHcustomCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:QYHcustomCollectionID];
    [collectionView registerNib:[UINib nibWithNibName:@"QYHheadCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [self.view addSubview:collectionView];
}

#pragma mark UICollectionViewDataSource  
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QYHcustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:QYHcustomCollectionID forIndexPath:indexPath];
    
    cell.module = self.titleArray[indexPath.row];
    NSLog(@"%p",cell);
    return cell;
}

-(CGPoint)collectionView:(UICollectionView *)collectionView targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
{
    
    CGPoint point = CGPointZero;
    return point;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    return headView;
}

#pragma mark UICollectionViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%d",(int)(scrollView.contentOffset.x / scrollView.bounds.size.width));
    
}


@end
