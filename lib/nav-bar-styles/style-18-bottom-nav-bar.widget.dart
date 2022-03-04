// part of stx_bottom_nav_bar;

// class BottomNavStyle18 extends StatelessWidget {
//   final NavBarEssentials? navBarEssentials;
//   final NavBarDecoration? navBarDecoration;

//   const BottomNavStyle18({
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

//   Widget _buildMiddleItem(BuildContext context, StxBottomNavBarItem item,
//       bool isSelected, double? height) {
//     return navBarEssentials!.navBarHeight == 0
//         ? const SizedBox.shrink()
//         : Container(
//             width: MediaQuery.of(context).size.width / 5.0,
//             margin: EdgeInsets.only(
//                 top: navBarEssentials!.padding?.top ??
//                     navBarEssentials!.navBarHeight! * 0.1,
//                 bottom: navBarEssentials!.padding?.bottom ??
//                     navBarEssentials!.navBarHeight! * 0.1,
//                 left: 10.0,
//                 right: 10.0),
//             decoration: BoxDecoration(
//               color: item.activeColorPrimary,
//               borderRadius: BorderRadius.circular(10.0),
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
//                     return index != midIndex
//                         ? Flexible(
//                             child: GestureDetector(
//                               onTap: () {
//                                 navBarEssentials!.onItemSelected!(index);
//                               },
//                               child: index == midIndex
//                                   ? Opacity(
//                                       opacity: 0.0,
//                                       child: _buildMiddleItem(
//                                           context,
//                                           item,
//                                           navBarEssentials!.selectedIndex ==
//                                               index,
//                                           navBarEssentials!.navBarHeight))
//                                   : _buildItem(
//                                       item,
//                                       navBarEssentials!.selectedIndex == index,
//                                       navBarEssentials!.navBarHeight),
//                             ),
//                           )
//                         : GestureDetector(
//                             onTap: () {
//                               navBarEssentials!.onItemSelected!(index);
//                             },
//                             child: index == midIndex
//                                 ? Opacity(
//                                     opacity: 0.0,
//                                     child: _buildMiddleItem(
//                                         context,
//                                         item,
//                                         navBarEssentials!.selectedIndex ==
//                                             index,
//                                         navBarEssentials!.navBarHeight))
//                                 : _buildItem(
//                                     item,
//                                     navBarEssentials!.selectedIndex == index,
//                                     navBarEssentials!.navBarHeight),
//                           );
//                   }).toList(),
//                 ),
//                 Center(
//                   child: GestureDetector(
//                       onTap: () {
//                         navBarEssentials!.onItemSelected!(midIndex);
//                       },
//                       child: _buildMiddleItem(
//                           context,
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
