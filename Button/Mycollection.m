//
//  Mycollection.m
//  Button
//
//  Created by chanyezhenghe on 16/4/1.
//  Copyright © 2016年 chanyezhenghe. All rights reserved.
//

#import "Mycollection.h"
#import "MyCollectionViewCell.h"


@implementation Mycollection

- (UICollectionViewFlowLayout *) flowLayout{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.。。。。。。//各属性设置
    flowLayout.headerReferenceSize = CGSizeMake(300.0f, 50.0f);  //设置head大小
    flowLayout.footerReferenceSize = CGSizeMake(300.0f, 50.0f);
    return flowLayout;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        _arr = [NSArray array];
        _arr = @[@"抵押项目",
                 @"贷款项目",
                 @"私募项目",
                 @"信托项目",
                 @"担保项目",
                 @"并购项目",
                 @"引资项目",
                 @"投资项目"];
        [self registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        self.backgroundColor = [UIColor clearColor];
        
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        
        
        _cellArr = [NSMutableArray array];
    }
    
    
    
    
    self.delegate = self;
    self.dataSource = self;
    return self;
    
}
#pragma mark --  footer
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(self.frame.size.width, 44);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //查找是否有闲置的脚视图
    UICollectionReusableView * footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
//    footer.backgroundColor = [UIColor greenColor];
//    NSLog(@"%@",_cellArr);
    
    LZButton * btn = [LZButton addRect:CGRectMake(0, 0, self.frame.size.width / 2, 44) Title:@"清空已选" andBlock:^(LZButton *button) {
        for (MyCollectionViewCell * cell in _cellArr) {
            if (cell.IsSelected == YES) {
                cell.IsSelected = NO;
                cell.img.hidden = YES;
                [cell.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
        }
        [_cellArr removeAllObjects];
        [self reloadData];
    }];
    
    [footer addSubview:btn];
    
    LZButton * sureBtn = [LZButton addRect:CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, 44) Title:@"确定" andBlock:^(LZButton *button) {
        _click(_cellArr);
    }];
    
    [footer addSubview:sureBtn];
    

    return footer;
}


#pragma mark   UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.btn setTitle:_arr[indexPath.row] forState:UIControlStateNormal];
    
    [_cellArr addObject:cell];
    
    
    return cell;
}





- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.frame.size.width - 30) / 2 , 44);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //设置每个item的边距
    return UIEdgeInsetsMake(5, 10, 5, 10);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    //设置每个item之间的最小距离
    //默认的最小边距 > 5
    return 5;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return CGSizeMake(SCREEN_SIZE.width, 244);
//    }
//    return CGSizeMake(SCREEN_SIZE.width, 44);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
