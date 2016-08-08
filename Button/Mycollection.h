//
//  Mycollection.h
//  Button
//
//  Created by chanyezhenghe on 16/4/1.
//  Copyright © 2016年 chanyezhenghe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZButton.h"

@interface Mycollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong)NSArray * arr;
@property (nonatomic,strong)NSMutableArray * cellArr;


@property (copy,nonatomic)void(^click)(NSMutableArray * array);

@end
