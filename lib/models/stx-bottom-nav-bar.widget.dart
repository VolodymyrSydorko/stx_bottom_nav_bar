part of stx_bottom_nav_bar;

class StxBottomNavBar extends StatelessWidget {
  const StxBottomNavBar({
    Key? key,
    required this.items,
    this.activeIndex = 0,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.navBarHeight = 80.0,
    this.navBarPadding = const EdgeInsets.all(0),
    this.navBarItemsPadding = const EdgeInsets.all(0),
    this.navBarDecoration,
    this.navBarStyle = NavBarStyle.style6,
    this.hideNavigationBar = false,
    this.confineToSafeArea = true,
    this.itemAnimationProperties,
    this.onAnimationComplete,
    this.neumorphicProperties = const NeumorphicProperties(),
  }) : super(key: key);

  final List<StxBottomNavBarItem> items;
  final int activeIndex;
  final ValueChanged<int>? onTap;

  final Color backgroundColor;
  final double navBarHeight;
  final EdgeInsets navBarPadding;
  final EdgeInsets navBarItemsPadding;
  final NavBarDecoration? navBarDecoration;

  final NavBarStyle navBarStyle;

  final bool hideNavigationBar;

  final bool confineToSafeArea;

  final ItemAnimationProperties? itemAnimationProperties;
  final Function(bool, bool)? onAnimationComplete;

  final NeumorphicProperties? neumorphicProperties;

  Widget _navBarWidget() => Padding(
        padding: navBarPadding,
        child: navBarStyle == NavBarStyle.style15 ||
                navBarStyle == NavBarStyle.style16
            ? navBarPadding.bottom > 0
                ? SafeArea(
                    top: false,
                    right: false,
                    left: false,
                    bottom: navBarHeight == 0.0 || hideNavigationBar
                        ? false
                        : confineToSafeArea,
                    child: Container(
                      decoration: getNavBarDecoration(
                        decoration: navBarDecoration,
                        color: backgroundColor,
                        opacity: items[activeIndex].opacity,
                      ),
                      child: getNavBarStyle(),
                    ),
                  )
                : Container(
                    decoration: getNavBarDecoration(
                      decoration: navBarDecoration,
                      color: backgroundColor,
                      opacity: items[activeIndex].opacity,
                    ),
                    child: SafeArea(
                      top: false,
                      right: false,
                      left: false,
                      bottom: navBarHeight == 0.0 || hideNavigationBar
                          ? false
                          : confineToSafeArea,
                      child: getNavBarStyle(),
                    ),
                  )
            : Container(
                decoration: getNavBarDecoration(
                  decoration: navBarDecoration,
                  showBorder: false,
                  color: backgroundColor,
                  opacity: items[activeIndex].opacity,
                ),
                child: ClipRRect(
                  borderRadius:
                      navBarDecoration!.borderRadius ?? BorderRadius.zero,
                  child: BackdropFilter(
                    filter: items[activeIndex].filter ??
                        ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      decoration: getNavBarDecoration(
                        showOpacity: false,
                        decoration: navBarDecoration,
                        color: backgroundColor,
                        opacity: items[activeIndex].opacity,
                      ),
                      child: SafeArea(
                        top: false,
                        right: false,
                        left: false,
                        bottom: navBarHeight == 0.0 || hideNavigationBar
                            ? false
                            : confineToSafeArea,
                        child: getNavBarStyle(),
                      ),
                    ),
                  ),
                ),
              ),
      );

  @override
  Widget build(BuildContext context) {
    return OffsetAnimation(
      hideNavigationBar: hideNavigationBar,
      navBarHeight: navBarHeight,
      onAnimationComplete: (isAnimating, isComplete) {
        onAnimationComplete!(isAnimating, isComplete);
      },
      child: _navBarWidget(),
    );
  }

  bool opaque(int? index) {
    return !(items[index!].opacity < 1.0);
  }

  Widget getNavBarStyle() {
    switch (navBarStyle) {
      // case NavBarStyle.style1:
      //   return BottomNavStyle1(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style2:
      //   return BottomNavStyle2(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style3:
      //   return BottomNavStyle3(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style4:
      //   return BottomNavStyle4(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style5:
      //   return BottomNavStyle5(
      //     navBarEssentials: navBarEssentials,
      //   );
      case NavBarStyle.style6:
        return BottomNavStyle6(
          items: items,
          activeIndex: activeIndex,
          onTap: onTap,
          navBarHeight: navBarHeight,
          navBarItemsPadding: navBarItemsPadding,
          itemAnimationProperties: itemAnimationProperties,
        );
      default:
        return BottomNavStyle6(
          items: items,
          activeIndex: activeIndex,
          onTap: onTap,
          navBarHeight: navBarHeight,
          navBarItemsPadding: navBarItemsPadding,
          itemAnimationProperties: itemAnimationProperties,
        );
      // case NavBarStyle.style7:
      //   return BottomNavStyle7(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style8:
      //   return BottomNavStyle8(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style9:
      //   return BottomNavStyle9(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style10:
      //   return BottomNavStyle10(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style11:
      //   return BottomNavStyle11(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style12:
      //   return BottomNavStyle12(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style13:
      //   return BottomNavStyle13(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style14:
      //   return BottomNavStyle14(
      //     navBarEssentials: navBarEssentials,
      //   );
      // case NavBarStyle.style15:
      //   return BottomNavStyle15(
      //     navBarEssentials: navBarEssentials,
      //     navBarDecoration: navBarDecoration,
      //   );
      // case NavBarStyle.style16:
      //   return BottomNavStyle16(
      //     navBarEssentials: navBarEssentials,
      //     navBarDecoration: navBarDecoration,
      //   );
      // case NavBarStyle.style17:
      //   return BottomNavStyle17(
      //     navBarEssentials: navBarEssentials,
      //     navBarDecoration: navBarDecoration,
      //   );
      // case NavBarStyle.style18:
      //   return BottomNavStyle18(
      //     navBarEssentials: navBarEssentials,
      //     navBarDecoration: navBarDecoration,
      //   );
      // case NavBarStyle.neumorphic:
      //   return NeumorphicBottomNavBar(
      //     navBarEssentials: navBarEssentials,
      //     neumorphicProperties: neumorphicProperties,
      //   );
      // default:
      //   return BottomNavSimple(
      //     navBarEssentials: navBarEssentials,
      //   );
    }
  }
}
