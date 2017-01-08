//
//  NSAttributedString+AshApps.m
//  AshApps
//
//  Created by Aaron Ash on 12/12/16.
//  Copyright © 2016 AshApps. All rights reserved.
//

#import "NSAttributedString+AshApps.h"

@implementation NSAttributedString (AshApps)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string font:(UIFont*)font color:(nullable UIColor *)color firstWordColor:(nullable UIColor *)firstWordColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    if (string) {
        NSDictionary *attributes                    = @{NSForegroundColorAttributeName: color ? : [UIColor blackColor],
                                                        NSFontAttributeName: font};
        attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedString addAttributes:attributes range:NSMakeRange(0, string.length)];
        
        if (firstWordColor) {
            NSRange firstSpaceRange = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
            NSRange firstWordRange  = NSMakeRange(0, firstSpaceRange.location);
            [attributedString addAttribute:NSForegroundColorAttributeName value:firstWordColor range:firstWordRange];
        }
    }
    
    return attributedString;
}

@end
