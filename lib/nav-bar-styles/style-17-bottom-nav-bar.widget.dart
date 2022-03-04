// part of stx_bottom_nav_bar;

// class BottomNavStyle17 extends StatelessWidget {
//   final NavBarEssentials? navBarEssentials;
//   final NavBarDecoration? navBarDecoration;

//   const BottomNavStyle17({
//     Key? key,
//     this.navBarEssentials = const NavBarEssentials(items: null),
//     this.navBarDecoration = const NavBarDecoration(),
//   }) : super(key: key);

//   Widget _buildItem(
//       StxBottomNavBarItem item, bool isSelected, double? height) {
//     return navBarEssentials!.navBarHeight == 0
//         ? const SizedBox.shrink()
//         : Container(
//             width: 150.0,
//             height: height,
//             padding: EdgeInsets.only(
//                 top: navBarEssentials!.padding?.top ??
//                     navBarEssentials!.navBarHeight! * 0.15,
//                 bottom: navBarEssentials!.padding?.bottom ??
//                     navBarEssentials!.navBarHeight! * 0.12),
//             child: Container(
//               alignment: Alignment.center,
//               height: height,
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Expanded(
//                         child: IconTheme(
//                           data: IconThemeData(
//                               size: item.iconSize,
//                               color: isSelected
//                                   ? (item.activeColorSecondary ??
//                                       item.activeColorPrimary)
//                                   : item.inactiveColorPrimary ??
//                                       item.activeColorPrimary),
//                           child: isSelected
//                               ? item.icon
//                               : item.inactiveIcon ?? item.icon,
//                         ),
//                       ),
//                       item.title == null
//                           ? const SizedBox.shrink()
//                           : Padding(
//                               padding: const EdgeInsets.only(top: 15.0),
//                               child: Material(
//                                 type: MaterialType.transparency,
//                                 child: FittedBox(
//                                     child: Text(
//                                   item.title!,
//                                   style: item.textStyle != null
//                                       ? (item.textStyle!.apply(
//                                           color: isSelected
//                                               ? (item.activeColorSecondary ??
//                                                   item.activeColorPrimary)
//                                               : item.inactiveColorPrimary))
//                                       : TextStyle(
//                                           color: isSelected
//                                               ? (item.activeColorSecondary ??
//                                                   item.activeColorPrimary)
//                                               : item.inactiveColorPrimary,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12.0),
//                                 )),
//                               ),
//                             )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//   }

//   Widget _buildMiddleItem(
//       StxBottomNavBarItem item, bool isSelected, double? height) {
//     return navBarEssentials!.navBarHeight == 0
//         ? const SizedBox.shrink()
//         : Container(
//             width: 150.0,
//             height: height,
//             margin: EdgeInsets.only(
//                 top: navBarEssentials!.padding?.top ??
//                     navBarEssentials!.navBarHeight! * 0.06,
//                 bottom: navBarEssentials!.padding?.bottom ??
//                     navBarEssentials!.navBarHeight! * 0.06),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: item.activeColorPrimary,
//               border: Border.all(color: Colors.transparent, width: 5.0),
//             ),
//             child: Container(
//               alignment: Alignment.center,
//               height: height,
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Expanded(
//                         child: IconTheme(
//                           data: IconThemeData(
//                               size: item.iconSize,
//                               color: isSelected
//                                   ? (item.activeColorSecondary ??
//                                       item.activeColorPrimary)
//                                   : item.inactiveColorPrimary ??
//                                       item.activeColorPrimary),
//                           child: isSelected
//                               ? item.icon
//                               : item.inactiveIcon ?? item.icon,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final midIndex = (navBarEssentials!.items!.length / 2).floor();
//     return ClipRRect(
//       borderRadius: navBarDecoration!.borderRadius ?? BorderRadius.zero,
//       child: Stack(
//         children: <Widget>[
//           SizedBox(
//             width: double.infinity,
//             height: navBarEssentials!.navBarHeight,
//             child: Stack(
//               fit: StackFit.expand,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: navBarEssentials!.items!.map((item) {
//                     int index = navBarEssentials!.items!.indexOf(item);
//                     return Flexible(
//                       child: GestureDetector(
//                         onTap: () {
//                           navBarEssentials!.onItemSelected!(index);
//                         },
//                         child: index == midIndex
//                             ? Opacity(
//                                 opacity: 0.0,
//                                 child: _buildMiddleItem(
//                                     item,
//                                     navBarEssentials!.selectedIndex == index,
//                                     navBarEssentials!.navBarHeight))
//                             : _buildItem(
//                                 item,
//                                 navBarEssentials!.selectedIndex == index,
//                                 navBarEssentials!.navBarHeight),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 Center(
//                   child: GestureDetector(
//                       onTap: () {
//                         navBarEssentials!.onItemSelected!(midIndex);
//                       },
//                       child: _buildMiddleItem(
//                           navBarEssentials!.items![midIndex],
//                           navBarEssentials!.selectedIndex == midIndex,
//                           navBarEssentials!.navBarHeight)),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
