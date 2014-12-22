//
//  UtilsMacro.h
//  AiPlay
//
//  Created by wuhe on 14/12/3.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#ifndef AiPlay_UtilsMacro_h
#define AiPlay_UtilsMacro_h

#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green: g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green: g/255.0 blue:b/255.0 alpha:a/255.0]
#define RGBCSS(rgb) RGB((double)(rgb >> 16 & 0xff), (double)(rgb >> 8 & 0xff), (double)(rgb & 0xff))
#define ARGBCSS(argb) RGBA((double)(argb >> 16 & 0xff), (double)(argb >> 8 & 0xff), (double)(argb & 0xff), (double)(argb >> 24 & 0xff))

#endif
