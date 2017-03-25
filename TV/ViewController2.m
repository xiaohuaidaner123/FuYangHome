//
//  ViewController2.m
//  view
//
//  Created by iKing on 2017/3/21.
//  Copyright © 2017年 iKing. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell.h"
#import "AFNetworking.h"
#import <AlipaySDK/AlipaySDK.h>

@interface ViewController2 ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付订单";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认支付" style:UIBarButtonItemStyleDone target:self action:@selector(pay)];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
- (void)pay {
    NSDictionary *parameters = @{
                                 @"subject": @"大乐透",
                                 @"out_trade_no": @"70501111111S001111119",
                                 @"total_amount": @"9.00"
                                 };
    [[HttpRequestManager shareManager] addPOSTURL:@"/Order/OrderBuy" person:RequestPersonWeiMing parameters:parameters success:^(id successResponse) {

        NSString *content = successResponse[@"data"];
        
        NSMutableArray<NSString *> *subStrings = [[content componentsSeparatedByString:@"&"] mutableCopy];
        [subStrings removeLastObject];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        for (NSString *sub in subStrings) {
            NSArray *str = [sub componentsSeparatedByString:@"="];
            dict[str.firstObject] = str.lastObject;
        }
        
        [dict removeObjectForKey:@"alipay_sdk"];
        [dict removeObjectForKey:@"format"];
        [dict removeObjectForKey:@"notify_url"];
        
        NSMutableArray *arr = [NSMutableArray array];
        NSArray *sorted = [dict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        for (NSString *key in sorted) {
            [arr addObject:[NSString stringWithFormat:@"%@=%@", key, dict[key]]];
        }
        
        NSLog(@"%@", arr);
        NSString *payOrder = [arr componentsJoinedByString:@"&"];

        [[AlipaySDK defaultService] payOrder:payOrder fromScheme:@"fuyangjiaju" callback:^(NSDictionary *resultDic) {
            NSLog(@"%@", resultDic);
        }];
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (NSString*)orderItemWithKey:(NSString*)key andValue:(NSString*)value encoded:(BOOL)bEncoded
{
    if (key.length > 0 && value.length > 0) {
        if (bEncoded) {
            value = [self encodeValue:value];
        }
        return [NSString stringWithFormat:@"%@=%@", key, value];
    }
    return nil;
}

- (NSString*)encodeValue:(NSString*)value
{
    NSString* encodedValue = value;
    if (value.length > 0) {
        NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+ $,./?%#[]"] invertedSet];
        
        encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    }
    return encodedValue;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 1;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"数量";
                cell.detailTextLabel.text = @"1";
            } else {
                cell.textLabel.text = @"总价";
                cell.detailTextLabel.text = @"￥80";
            }
        } else {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"抵用券/优惠代码";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            } else {
                cell.textLabel.text = @"还需支付";
                cell.detailTextLabel.text = @"￥80";
            }
        }
        return cell;
    } else {
        TableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TableViewCell class]) owner:nil options:nil].lastObject;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        return cell;
    }
}


//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        for (NSString *sub in subStrings) {
//            NSArray<NSString *> *dictionary = [sub componentsSeparatedByString:@"="];
//            dict[dictionary.firstObject] = dictionary.lastObject;
//        }
//        NSString *sign = [dict valueForKey:@"sign"];
//        NSString *newsign = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)sign, NULL, (CFStringRef)@"!*'();:@&=+ $,./?%#[]", kCFStringEncodingUTF8));
//        dict[@"sign"] = newsign;
//
//        NSMutableArray *arr = [NSMutableArray array];
//        for (NSString *key in dict.allKeys) {
//            [arr addObject:[NSString stringWithFormat:@"%@=%@", key, [dict valueForKey:key]]];
//        }
//        NSString *payOrder = [arr componentsJoinedByString:@"&"];
//        NSData *contentData = [NSJSONSerialization dataWithJSONObject:content options:NSJSONWritingPrettyPrinted error:nil];
//        NSString *payOrder = [[NSString alloc] initWithData:contentData encoding:NSUTF8StringEncoding];
//        NSString *payOrder = [self encodeValue:content];

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
