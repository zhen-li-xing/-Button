//
//  ViewController.m
//  Button
//
//  Created by chanyezhenghe on 16/4/1.
//  Copyright © 2016年 chanyezhenghe. All rights reserved.
//

#import "ViewController.h"
#import "LZButton.h"
#import "Mycollection.h"
#import "MyCollectionViewCell.h"

@interface ViewController ()

@property (nonatomic,strong)UIView * myView;
@property (nonatomic,strong)LZButton * btn;
@property (nonatomic,strong)Mycollection * collection;
@property (nonatomic,strong)UIView * bgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
    _btn = [LZButton addRect:CGRectMake(50, 100, self.view.frame.size.width - 100, 44) Title:@"点击" andBlock:^(LZButton *button) {
        if (button.selected == NO) {
            _myView.hidden = NO;
            _btn.selected = YES;
            _bgView.hidden = NO;
        }else if (button.selected == YES){
            _myView.hidden = YES;
            _btn.selected = NO;
            _bgView.hidden = YES;
        }
    }];
    [self.view addSubview:_btn];
    
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        _bgView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
        
        _bgView.hidden = YES;
        
        _bgView.userInteractionEnabled = YES;
        
    }
    [self.view addSubview:_bgView];
    
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 44 * 6)];
        _myView.backgroundColor = [UIColor grayColor];
        [self.bgView addSubview:_myView];
        
        _myView.hidden = YES;
        _btn.selected = NO;
        _myView.userInteractionEnabled = YES;
    }
    
    [self addCollectionView];
    
    
}

- (void)addCollectionView{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //滚动的样式
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //创建CollectionView
    _collection = [[Mycollection alloc] initWithFrame:self.myView.bounds collectionViewLayout:layout];
    
    __block ViewController * cc = self;
    [_collection setClick:^(NSMutableArray * arr) {
        cc.myView.hidden = YES;
        cc.btn.selected = NO;
        cc.bgView.hidden = YES;
        

            
            NSMutableArray * nameArr = [NSMutableArray array];
            
            for (MyCollectionViewCell * cell  in arr) {
                if (cell.IsSelected == YES) {
                    [nameArr addObject:cell];
                }
                
            }
            if (nameArr.count > 0) {
                MyCollectionViewCell * cell = nameArr.lastObject;
                [cc.btn setTitle:cell.btn.titleLabel.text forState:UIControlStateNormal];
            }else{
                [cc.btn setTitle:@"点击" forState:UIControlStateNormal];
            }
            
        
        
    }];
    
    
    [_myView addSubview:_collection];
    
    
}






- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _myView.hidden = YES;
    _bgView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
