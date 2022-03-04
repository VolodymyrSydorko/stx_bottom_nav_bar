// part of stx_bottom_nav_bar;

// class BottomNavStyle1 extends StatelessWidget {
//   final NavBarEssentials navBarEssentials;

//   const BottomNavStyle1({
//     Key? key,
//     this.navBarEssentials = const NavBarEssentials(items: null),
//   }) : super(key: key);

//   Widget _buildItem(
//       StxBottomNavBarItem item, bool isSelected, double? height) {
//     return navBarHeight == 0
//         ? const SizedBox.shrink()
//         : AnimatedContainer(
//             width: isSelected ? 120 : 50,
//             height: height! / 1.6,
//             duration: itemAnimationProperties?.duration ??
//                 const Duration(milliseconds: 400),
//             curve:
//                 itemAnimationProperties?.curve ?? Curves.ease,
//             padding: EdgeInsets.all(item.contentPadding),
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? item.activeColorPrimary.withOpacity(0.2)
//                   : backgroundColor!.withOpacity(0.0),
//               borderRadius: const BorderRadius.all(Radius.circular(50)),
//             ),
//             child: Container(
//               alignment: Alignment.center,
//               height: height / 1.6,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Flexible(
//                     child: Padding(
//                       padding:
//                           EdgeInsets.only(right: item.title == null ? 0.0 : 8),
//                       child: IconTheme(
//                         data: IconThemeData(
//                             size: item.iconSize,
//                             color: isSelected
//                                 ? (item.activeColorSecondary ??
//                                     item.activeColorPrimary)
//                                 : item.inactiveColorPrimary ??
//                                     item.activeColorPrimary),
//                         child: isSelected
//                             ? item.icon
//                             : item.inactiveIcon ?? item.icon,
//                       ),
//                     ),
//                   ),
//                   item.title == null
//                       ? const SizedBox.shrink()
//                       : isSelected
//                           ? Flexible(
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
//                                           color: (item.activeColorSecondary ??
//                                               item.activeColorPrimary),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12.0),
//                                 )),
//                               ),
//                             )
//                           : const SizedBox.shrink()
//                 ],
//               ),
//             ),
//           );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         height: navBarHeight,
//         padding: padding == null
//             ? EdgeInsets.symmetric(
//                 horizontal: MediaQuery.of(context).size.width * 0.07,
//                 vertical: navBarHeight! * 0.15,
//               )
//             : EdgeInsets.only(
//                 top: padding?.top ??
//                     navBarHeight! * 0.15,
//                 left: padding?.left ??
//                     MediaQuery.of(context).size.width * 0.07,
//                 right: padding?.right ??
//                     MediaQuery.of(context).size.width * 0.07,
//                 bottom: padding?.bottom ??
//                     navBarHeight! * 0.15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: items!.map((item) {
//             int index = items!.indexOf(item);
//             return Flexible(
//               flex: selectedIndex == index ? 2 : 1,
//               child: GestureDetector(
//                 onTap: () {
//                   onItemSelected!(index);
//                 },
//                 child: _buildItem(item, selectedIndex == index,
//                     navBarHeight),
//               ),
//             );
//           }).toList(),
//         ));
//   }
// }
