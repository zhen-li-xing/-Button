//
//  CollectionViewCell.h
//  Button
//
//  Created by chanyezhenghe on 16/4/1.
//  Copyright © 2016年 chanyezhenghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell



@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UIImageView *img;


@property (nonatomic,assign)BOOL IsSelected;

@end
