//
//  QYHcustomCollectionViewCell.m
//  CollectionView
//
//  Created by hao on 17/9/29.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "QYHcustomCollectionViewCell.h"
@interface QYHcustomCollectionViewCell()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation QYHcustomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModule:(NSString *)module
{
    _module = [module copy];
    
    [self.myTableView reloadData];
    
}
#pragma mark TableViewDataAction
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const tableViewCellID = @"MyCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@--%ld",self.module,indexPath.row];
    
    return cell;
}

@end
