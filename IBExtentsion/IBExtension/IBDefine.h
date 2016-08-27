//
//  IBDefine.h
//  IBComponent
//
//  Created by jjs-imac-qhy on 16/5/2016.
//  Copyright © 2016 YH. All rights reserved.
//

#ifndef IBDefine_h
#define IBDefine_h

#ifndef IBExtension_Init
#define IBExtension_Init NO
#endif

#ifndef xml_version
#define xml_version @"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>"
#endif

#ifndef document
#define document @"<document type=\"com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB\" version=\"3.0\" toolsVersion=\"10116\" systemVersion=\"15B42\" targetRuntime=\"iOS.CocoaTouch\" propertyAccessControl=\"none\" useAutolayout=\"YES\" useTraitCollections=\"YES\""
#endif
#define _document @"</document>"

#define dependencies @"<dependencies>"
#define _dependencies @"</dependencies>"

#define deployment_ @"<deployment identifier=\"iOS\"/>"

#define plugIn_ @"<plugIn identifier=\"com.apple.InterfaceBuilder.IBCocoaTouchPlugin\" version=\"10085\"/>"
#define capability_ @"<capability name=\"Constraints to layout margins\" minToolsVersion=\"6.0\"/>"

#define scenes @"<scenes>"
#define _scenes @"</scenes>"

#define _Name_(Name) [NSString stringWithFormat:@"<!--\"%@\"-->",Name]

#define scene(ID) [NSString stringWithFormat:@"<scene sceneID=\"%@\">",ID]
#define _scene @"</scene>"

#define objects @"<objects>"
#define _objects @"</objects>"

#define tableViewController(Name,ID) [NSString stringWithFormat:@"<tableViewController title=\"%@\" id=\"%@\" sceneMemberID=\"viewController\">",Name,ID]
#define _tableViewController @"</tableViewController>"

#define tableView(ID) [NSString stringWithFormat:@"<tableView key=\"view\" clipsSubviews=\"YES\" contentMode=\"scaleToFill\" alwaysBounceVertical=\"YES\" dataMode=\"static\" style=\"plain\" separatorStyle=\"default\" rowHeight=\"44\" sectionHeaderHeight=\"28\" sectionFooterHeight=\"28\" id=\"%@\">",ID]
#define _tableView @"</tableView>"

#define rect_table_ @"<rect key=\"frame\" x=\"0.0\" y=\"0.0\" width=\"600\" height=\"1200\"/>"

#define autoresizingMask @"<autoresizingMask key=\"autoresizingMask\" widthSizable=\"YES\" heightSizable=\"YES\"/>"

#define color_ @"<color key=\"backgroundColor\" white=\"1\" alpha=\"1\" colorSpace=\"calibratedWhite\"/>"

#define sections @"<sections>"
#define _sections @"</sections>"

#define tableViewSection(Name,ID) [NSString stirngWithFormat:@"<tableViewSection headerTitle=\"%@\" id=\"%@\">",Name,ID]
#define _tableViewSection @"</tableViewSection>"

#define cells @"<cells>"
#define _cells @"</cells>"

#define tableViewCell(ID) [NSString stringWithFormat:@"<tableViewCell clipsSubviews=\"YES\" contentMode=\"scaleToFill\" selectionStyle=\"default\" indentationWidth=\"10\" id=\"%@\">",ID]
#define _tableViewCell @"</tableViewCell>"

#define rect_cell @"<rect key=\"frame\" x=\"0.0\" y=\"72\" width=\"600\" height=\"44\"/>"

#define autoresizingMask_ @"<autoresizingMask key=\"autoresizingMask\"/>"

#define tableViewCellContentView(CellID,ID) [NSString stringWithFormat:@"<tableViewCellContentView key=\"contentView\" opaque=\"NO\" clipsSubviews=\"YES\" multipleTouchEnabled=\"YES\" contentMode=\"center\" tableViewCell=\"%@\" id=\"%@\">",CellID,ID]
#define _tableViewCellContentView @"</tableViewCellContentView>"

#define rect_tableViewCellContentView @"<rect key=\"frame\" x=\"0.0\" y=\"0.0\" width=\"600\" height=\"43.5\"/>"

#define subviews @"<subviews>"
#define _subviews @"</subviews>"

#define freeformSimulatedSizeMetrics_ @"<freeformSimulatedSizeMetrics key=\"simulatedDestinationMetrics\"/>"
#define size_key_freeformSize @"<size key=\"freeformSize\" width=\"600\" height=\"1200\"/>"

#define placeholder_ @"<placeholder placeholderIdentifier=\"IBFirstResponder\" id=\"WoK-lk-5FM\" userLabel=\"First Responder\" sceneMemberID=\"firstResponder\"/>"
#define point_ @"<point key=\"canvasLocation\" x=\"475\" y=\"326\"/>"

//Color
#define color(colorKey,r,g,b,a) colorKey?[NSString stringWithFormat:@"<color key=\"%@\" red=\"%f\" green=\"%f\" blue=\"%f\" alpha=\"%f\" colorSpace=\"custom\" customColorSpace=\"sRGB\"/>",colorKey,r,g,b,a]:[NSString stringWithFormat:@"<nil key=%@/>",colorKey]
#define textColor(r,g,b,a) color(@"textColor",r,g,b,a)
#define highlightedColor(r,g,b,a) color(@"highlightedColor",r,g,b,a)
#define shadowColor(r,g,b,a) color(@"shadowColor",r,g,b,a)

//Label
#define label(ID) [NSString stringWithFormat:@"<label opaque=\"NO\" userInteractionEnabled=\"NO\" contentMode=\"left\" horizontalHuggingPriority=\"251\" verticalHuggingPriority=\"251\" fixedFrame=\"YES\" text=\"Label\" textAlignment=\"natural\" lineBreakMode=\"tailTruncation\" baselineAdjustment=\"alignBaselines\" adjustsFontSizeToFit=\"NO\" translatesAutoresizingMaskIntoConstraints=\"NO\" id=\"%@\" customClass=\"IBLabel\">",ID]
#define _label @"</label>"

//Font
#define fontDescription(typeKey,pointSize) [NSString stringWithFormat:@"<fontDescription key=\"fontDescription\" type=\"%@\" pointSize=\"%.2f\"/>",typeKey,point]

//userDefinedRuntimeAttributes
#define userDefinedRuntimeAttributes @"<userDefinedRuntimeAttributes>"
#define _userDefinedRuntimeAttributes @"</userDefinedRuntimeAttributes>"
#define userDefinedRuntimeAttribute(typeKey,keyPathKey) [NSString stringWithFormat:@"<userDefinedRuntimeAttribute type=\"%@\" keyPath=\"%@\">",typeKey,keyPathKey]
#define keyNormal(Value) [NSString stringWithFormat;@"<real key=\"value\" value=\"%@\"/>",Value]
#define real(keyColor,r,g,b,a) [NSString stringWithFormat;@"<userDefinedRuntimeAttribute type=\"color\" keyPath=\"borderColor\"> <color key=\"value\" red=\"%f\" green=\"%f\" blue=\"%f\" alpha=\"%f\" colorSpace=\"sRGB\"/>",r,g,b,a]
#define _userDefinedRuntimeAttribute @"</userDefinedRuntimeAttribute>"

#endif /* IBDefine_h */
