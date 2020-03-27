# updateView
升级弹框，富文本

NSString *str = @"You can try the following features in new version:\n1.Send message to your frends.\n2.Send cash gift through group chat.\n3.Charge your mobile numbers without fees.\nDo you want to download new version and try it?";
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range1 = [str rangeOfString:@"You can try the following features in new version:"];
    NSRange range2 = [str rangeOfString:@"1.Send message to your frends.\n2.Send cash gift through group chat.\n3.Charge your mobile numbers without fees."];
    NSRange range3 = [str rangeOfString:@"Do you want to download new version and try it?"];
     // 设置字体大小
    [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:range1];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:range2];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:range3];
     
     // 下划线
//     [attrStr addAttribute:NSUnderlineStyleAttributeName value:@(1) range:range];
//     [attrStr addAttribute:NSUnderlineColorAttributeName value:[UIColor blueColor] range:range];
     // 删除线
//     [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
//     [attrStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor greenColor] range:range];

     // 设置颜色
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:0x1D1D1D] range:range1];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:0x888888] range:range2];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:0x1D1D1D] range:range3];
     // 背景色
//     [attrStr addAttribute:NSBackgroundColorAttributeName value:[UIColor lightGrayColor] range:range2];
    
    // 设置段落样式
     NSMutableParagraphStyle *muParagraph1 = [[NSMutableParagraphStyle alloc]init];
     muParagraph1.lineSpacing = 3; // 行距
     muParagraph1.paragraphSpacing = 2; // 段距
//     muParagraph.firstLineHeadIndent = 30; // 首行缩进
     NSMutableParagraphStyle *muParagraph2 = [[NSMutableParagraphStyle alloc]init];
     muParagraph2.lineSpacing = 1; // 行距
     muParagraph2.paragraphSpacing = 1; // 段距
     [attrStr addAttribute:NSParagraphStyleAttributeName value:muParagraph1 range:range1];
     [attrStr addAttribute:NSParagraphStyleAttributeName value:muParagraph2 range:range2];
     [attrStr addAttribute:NSParagraphStyleAttributeName value:muParagraph1 range:range3];
     // 阴影
//     NSShadow *shadow = [[NSShadow alloc]init];
//     shadow.shadowOffset = CGSizeMake(2, 2);
//     shadow.shadowColor = [UIColor yellowColor];
//     shadow.shadowBlurRadius = 1;
//     [attrStr addAttribute:NSShadowAttributeName value:shadow range:range2];
     
     // 链接
//     [attrStr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.baidu.com"] range:range3];
    
    [SLDUpdateView showTitle:@"New PayBy Version Found" des:attrStr leftTitle:@"取消" rightTitle:@"升级" superView:self.view forcedUpdate:YES clickBlock:^(BOOL isSuccess) {
        ;
    }];
