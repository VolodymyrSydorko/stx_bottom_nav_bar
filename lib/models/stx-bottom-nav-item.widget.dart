part of stx_bottom_nav_bar;

///An item widget for the `StxTabView`.
class StxBottomNavBarItem {
  ///Icon for the bar item.
  final Widget icon;

  ///In-Active icon for the bar item.
  final Widget? inactiveIcon;

  ///Title for the bar item. Might not appear is some `styles`.
  final String? title;

  ///Color for the current selected item in the navigation bar. If `activeColorSecondary` property is empty, this will act in its place (recommended). `cupertino activeBlue` by default.
  final Color activeColor;

  ///Color for the unselected item(s) in the navigation bar.
  final Color? inactiveColor;

  ///Padding of the navigation bar item. Applies on all sides. `5.0` by default.
  ///
  ///`USE WITH CAUTION, MAY BREAK THE NAV BAR`.
  final double contentPadding;

  ///Enables and controls the transparency effect of the entire NavBar when this tab is selected.
  ///
  ///`Warning: Screen will cover the entire extent of the display`
  final double opacity;

  ///Filter used when `opacity < 1.0`. Can be used to create 'frosted glass' effect.
  ///
  ///By default -> `ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0)`.
  final ImageFilter? filter;

  ///`TextStyle` of the title's text.
  final TextStyle? textStyle;

  final double iconSize;

  StxBottomNavBarItem({
    required this.icon,
    this.inactiveIcon,
    this.title,
    this.contentPadding = 5.0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.opacity = 1.0,
    this.filter,
    this.textStyle,
    this.iconSize = 26.0,
  }) {
    assert(opacity >= 0 && opacity <= 1.0);
  }
}
