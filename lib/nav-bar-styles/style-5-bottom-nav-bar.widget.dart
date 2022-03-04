// part of stx_bottom_nav_bar;

// class BottomNavStyle5 extends StatelessWidget {
//   final NavBarEssentials? navBarEssentials;

//   const BottomNavStyle5({
//     Key? key,
//     this.navBarEssentials = const NavBarEssentials(items: null),
//   }) : super(key: key);

//   Widget _buildItem(
//       StxBottomNavBarItem item, bool isSelected, double? height) {
//     return navBarEssentials!.navBarHeight == 0
//         ? const SizedBox.shrink()
//         : SizedBox(
//             width: 150.0,
//             height: height! / 1,
//             child: Container(
//               alignment: Alignment.center,
//               height: height / 1,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: IconTheme(
//                       data: IconThemeData(
//                           size: item.iconSize,
//                           color: isSelected
//                               ? (item.activeColorSecondary ??
//                                   item.activeColorPrimary)
//                               : item.inactiveColorPrimary ??
//                                   item.activeColorPrimary),
//                       child: isSelected
//                           ? item.icon
//                           : item.inactiveIcon ?? item.icon,
//                     ),
//                   ),
//                   Container(
//                     height: 5.0,
//                     width: 5.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100.0),
//                         color: isSelected
//                             ? (item.activeColorSecondary ??
//                                 item.activeColorPrimary)
//                             : Colors.transparent),
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: navBarEssentials!.navBarHeight,
//       padding: EdgeInsets.only(
//           left: navBarEssentials!.padding?.left ??
//               MediaQuery.of(context).size.width * 0.05,
//           right: navBarEssentials!.padding?.right ??
//               MediaQuery.of(context).size.width * 0.05,
//           top: navBarEssentials!.padding?.top ??
//               navBarEssentials!.navBarHeight! * 0.06,
//           bottom: navBarEssentials!.padding?.bottom ??
//               navBarEssentials!.navBarHeight! * 0.16),
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
//               child: Container(
//                 color: Colors.transparent,
//                 child: _buildItem(
//                     item,
//                     navBarEssentials!.selectedIndex == index,
//                     navBarEssentials!.navBarHeight),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
