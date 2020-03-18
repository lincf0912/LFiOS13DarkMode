//
//  UIColor+LFiOS13DarkModeSystemColors.h
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/17.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LFiOS13DarkModeSystemColors)

#pragma mark System colors

/* Some colors that are used by system elements and applications.
 * These return named colors whose values may vary between different contexts and releases.
 * Do not make assumptions about the color spaces or actual colors used.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemRedColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGreenColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemBlueColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemOrangeColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemYellowColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemPinkColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemPurpleColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemTealColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemIndigoColor;

/* Shades of gray. systemGray is the base gray color.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGrayColor;

/* The numbered variations, systemGray2 through systemGray6, are grays which increasingly
 * trend away from systemGray and in the direction of systemBackgroundColor.
 *
 * In UIUserInterfaceStyleLight: systemGray1 is slightly lighter than systemGray.
 *                               systemGray2 is lighter than that, and so on.
 * In UIUserInterfaceStyleDark:  systemGray1 is slightly darker than systemGray.
 *                               systemGray2 is darker than that, and so on.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGray2Color;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGray3Color;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGray4Color;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGray5Color;
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGray6Color;

#pragma mark Foreground colors

/* Foreground colors for static text and related elements.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13LabelColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SecondaryLabelColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13TertiaryLabelColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13QuaternaryLabelColor;

/* Foreground color for standard system links.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13LinkColor;

/* Foreground color for placeholder text in controls or text fields or text views.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13PlaceholderTextColor;

/* Foreground colors for separators (thin border or divider lines).
 * `separatorColor` may be partially transparent, so it can go on top of any content.
 * `opaqueSeparatorColor` is intended to look similar, but is guaranteed to be opaque, so it will
 * completely cover anything behind it. Depending on the situation, you may need one or the other.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SeparatorColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13OpaqueSeparatorColor;

#pragma mark Background colors

/* We provide two design systems (also known as "stacks") for structuring an iOS app's backgrounds.
 *
 * Each stack has three "levels" of background colors. The first color is intended to be the
 * main background, farthest back. Secondary and tertiary colors are layered on top
 * of the main background, when appropriate.
 *
 * Inside of a discrete piece of UI, choose a stack, then use colors from that stack.
 * We do not recommend mixing and matching background colors between stacks.
 * The foreground colors above are designed to work in both stacks.
 *
 * 1. systemBackground
 *    Use this stack for views with standard table views, and designs which have a white
 *    primary background in light mode.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemBackgroundColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SecondarySystemBackgroundColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13TertiarySystemBackgroundColor;

/* 2. systemGroupedBackground
 *    Use this stack for views with grouped content, such as grouped tables and
 *    platter-based designs. These are like grouped table views, but you may use these
 *    colors in places where a table view wouldn't make sense.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemGroupedBackgroundColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13SecondarySystemGroupedBackgroundColor;
+ (UIColor *(^)(UIColor *color))lf_iOS13TertiarySystemGroupedBackgroundColor;

#pragma mark Fill colors

/* Fill colors for UI elements.
 * These are meant to be used over the background colors, since their alpha component is less than 1.
 *
 * systemFillColor is appropriate for filling thin and small shapes.
 * Example: The track of a slider.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SystemFillColor;

/* secondarySystemFillColor is appropriate for filling medium-size shapes.
 * Example: The background of a switch.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13SecondarySystemFillColor;

/* tertiarySystemFillColor is appropriate for filling large shapes.
 * Examples: Input fields, search bars, buttons.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13TertiarySystemFillColor;

/* quaternarySystemFillColor is appropriate for filling large areas containing complex content.
 * Example: Expanded table cells.
 */
+ (UIColor *(^)(UIColor *color))lf_iOS13QuaternarySystemFillColor;


@end

NS_ASSUME_NONNULL_END
