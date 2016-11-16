//
//  HLTCollectionCreatedViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/11.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTCollectionCreatedViewController.h"
#import "HLTMyCollectionTextField.h"
#import "HLTMyCollectionCellItem.h"
#import "MBProgressHUD.h"

@interface HLTCollectionCreatedViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *collectionNameField;
@property (weak, nonatomic) IBOutlet HLTMyCollectionTextField *textView;
@end

@implementation HLTCollectionCreatedViewController

- (instancetype)init {
    
    if (self = [super init]) {
        UIImage *image = [[UIImage imageNamed:@"back_arrow_13x21_"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(goBackAction)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"存储" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.delegate = self;
    self.textView.placeholder = @"请输入100字以内收藏夹描述";
}

- (void)goBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)save
{
    [self.view endEditing:YES];
    if ([self.collectionNameField.text length] == 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"收藏夹不能为空";
        hud.mode = MBProgressHUDModeText;
        [hud hideAnimated:YES afterDelay:1.0];
        return;
    }
    HLTMyCollectionCellItem *cellItem = [[HLTMyCollectionCellItem alloc] init];
    cellItem.groupName = self.collectionNameField.text;
    cellItem.descripStr = self.textView.text;
    
    if ([self.delegate respondsToSelector:@selector(addNewCollection:)]) {
        [self.delegate addNewCollection:cellItem];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  当textView文本内容有变化时调用
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.textView.placeholder = [textView.text length] > 0 ? @"" : @"请输入100字以内收藏夹描述";
}

@end
