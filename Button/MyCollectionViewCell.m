//
//  CollectionViewCell.m
//  Button
//
//  Created by chanyezhenghe on 16/4/1.
//  Copyright © 2016年 chanyezhenghe. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _img.hidden = YES;

    [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    
}

- (IBAction)btnClick:(id)sender {
    
    if (_IsSelected == YES) {
        
        _img.hidden = YES;
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _IsSelected = NO;
    }else if (_IsSelected == NO){
        _img.hidden = NO;
        [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _IsSelected = YES;
    }
    
    
    
}



@end
