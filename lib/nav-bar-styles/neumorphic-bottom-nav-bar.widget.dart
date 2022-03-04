// part of stx_bottom_nav_bar;

// class NeumorphicBottomNavBar extends StatelessWidget {
//   final NavBarEssentials? navBarEssentials;
//   final NeumorphicProperties? neumorphicProperties;

//   const NeumorphicBottomNavBar(
//       {Key? key,
//       this.navBarEssentials,
//       this.neumorphicProperties = const NeumorphicProperties()})
//       : super(key: key);

//   Widget _getNavItem(
//           StxBottomNavBarItem item, bool isSelected, double? height) =>
//       neumorphicProperties != null && neumorphicProperties!.showSubtitleText
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: IconTheme(
//                     data: IconThemeData(
//                         size: item.iconSize,
//                         color: isSelected
//                             ? (item.activeColorSecondary ??
//                                 item.activeColorPrimary)
//                             : item.inactiveColorPrimary ??
//                                 item.activeColorPrimary),
//                     child:
//                         isSelected ? item.icon : item.inactiveIcon ?? item.icon,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15.0),
//                   child: Material(
//                     type: MaterialType.transparency,
//                     child: FittedBox(
//                         child: Text(
//                       item.title!,
//                       style: item.textStyle != null
//                           ? (item.textStyle!.apply(
//                               color: isSelected
//                                   ? (item.activeColorSecondary ??
//                                       item.activeColorPrimary)
//                                   : item.inactiveColorPrimary))
//                           : TextStyle(
//                               color: isSelected
//                                   ? (item.activeColorSecondary ??
//                                       item.activeColorPrimary)
//                                   : item.inactiveColorPrimary ??
//                                       item.activeColorPrimary,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12.0),
//                     )),
//                   ),
//                 )
//               ],
//             )
//           : IconTheme(
//               data: IconThemeData(
//                   size: item.iconSize,
//                   color: isSelected
//                       ? (item.activeColorSecondary ?? item.activeColorPrimary)
//                       : item.inactiveColorPrimary ?? item.activeColorPrimary),
//               child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
//             );

//   Widget _buildItem(BuildContext context, StxBottomNavBarItem item,
//       bool isSelected, double? height) {
//     return navBarEssentials!.navBarHeight == 0
//         ? const SizedBox.shrink()
//         : opaque(navBarEssentials!.items!, navBarEssentials!.selectedIndex)
//             ? NeumorphicContainer(
//                 decoration: NeumorphicDecoration(
//                   borderRadius: BorderRadius.circular(
//                       neumorphicProperties == null
//                           ? 15.0
//                           : neumorphicProperties!.borderRadius),
//                   color: navBarEssentials!.backgroundColor,
//                   border: neumorphicProperties == null
//                       ? null
//                       : neumorphicProperties!.border,
//                   shape: neumorphicProperties == null
//                       ? BoxShape.rectangle
//                       : neumorphicProperties!.shape,
//                 ),
//                 bevel: neumorphicProperties == null
//                     ? 12.0
//                     : neumorphicProperties!.bevel,
//                 curveType: isSelected
//                     ? CurveType.emboss
//                     : neumorphicProperties == null
//                         ? CurveType.concave
//                         : neumorphicProperties!.curveType,
//                 height: height! + 20,
//                 width: 60.0,
//                 padding: const EdgeInsets.all(6.0),
//                 child: _getNavItem(item, isSelected, height),
//               )
//             : Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   color: getBackgroundColor(
//                       context,
//                       navBarEssentials!.items,
//                       navBarEssentials!.backgroundColor,
//                       navBarEssentials!.selectedIndex),
//                 ),
//                 height: height! + 20,
//                 width: 60.0,
//                 padding: const EdgeInsets.all(6.0),
//                 child: _getNavItem(item, isSelected, height),
//               );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: navBarEssentials!.navBarHeight,
//       padding: EdgeInsets.only(
//           left: navBarEssentials!.padding?.left ??
//               MediaQuery.of(context).size.width * 0.04,
//           right: navBarEssentials!.padding?.right ??
//               MediaQuery.of(context).size.width * 0.04,
//           top: navBarEssentials!.padding?.top ??
//               navBarEssentials!.navBarHeight! * 0.15,
//           bottom: navBarEssentials!.padding?.bottom ??
//               navBarEssentials!.navBarHeight! * 0.12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: navBarEssentials!.items!.map((item) {
//           int index = navBarEssentials!.items!.indexOf(item);
//           return Flexible(
//             child: GestureDetector(
//               onTap: () {
//                 navBarEssentials!.onItemSelected!(index);
//               },
//               child: _buildItem(
//                   context,
//                   item,
//                   navBarEssentials!.selectedIndex == index,
//                   navBarEssentials!.navBarHeight),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
