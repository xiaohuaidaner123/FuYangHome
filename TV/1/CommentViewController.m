//
//  CommentViewController.m
//  家居定制
//
//  Created by iKing on 2017/3/23.
//  Copyright © 2017年 Appcoda. All rights reserved.
//

#import "CommentViewController.h"
#import "EaseTextView.h"

@interface CommentViewController ()<EaseTextViewDelegate>

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评论";
    EaseTextView *textView = [[EaseTextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    textView.placeHolder = @"说点什么吧。。。";
    textView.delegate = self;
    [self.view addSubview:textView];
    
    UIButton *commit = [UIButton buttonWithTitle:@"提交" fontSize:16 titleColor:UIColorWhite background:RGB(74, 204, 183) cornerRadius:7];
    [commit addActionHandler:^{
        [self commit];
    }];
    commit.frame = CGRectMake(0, textView.bottom+30, rateWidth(220), 40);
    commit.centerX = self.view.centerX;
    [self.view addSubview:commit];
}

- (void)commit {
    NSDictionary *parameters = @{
                                 @"reviewer.id": self.user.ID,
                                 @"magazine.magazineId": self.model.magazineId,
//                                 @"commentContent"
                                 };
    [[HttpRequestManager shareManager] addPOSTURL:@"" person:RequestPersonKaiKang parameters:parameters success:^(id successResponse) {
        NSLog(@"%@", successResponse);
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
