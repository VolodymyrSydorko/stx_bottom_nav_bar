part of stx_bottom_nav_bar;

class BottomNavStyle6 extends StatefulWidget {
  final List<StxBottomNavBarItem> items;
  final int activeIndex;
  final ValueChanged<int>? onTap;

  final double navBarHeight;
  final EdgeInsets navBarItemsPadding;

  final ItemAnimationProperties? itemAnimationProperties;

  const BottomNavStyle6({
    Key? key,
    required this.items,
    required this.activeIndex,
    required this.onTap,
    required this.navBarHeight,
    required this.navBarItemsPadding,
    required this.itemAnimationProperties,
  }) : super(key: key);

  @override
  _BottomNavStyle6State createState() => _BottomNavStyle6State();
}

class _BottomNavStyle6State extends State<BottomNavStyle6>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllerList;
  late List<Animation<double>> _animationList;

  int? _lastSelectedIndex;
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _lastSelectedIndex = 0;
    _selectedIndex = 0;
    _animationControllerList = List<AnimationController>.empty(growable: true);
    _animationList = List<Animation<double>>.empty(growable: true);

    for (int i = 0; i < widget.items.length; ++i) {
      _animationControllerList.add(AnimationController(
          duration: widget.itemAnimationProperties?.duration ??
              const Duration(milliseconds: 400),
          vsync: this));
      _animationList.add(Tween(begin: 0.95, end: 1.18)
          .chain(CurveTween(
              curve: widget.itemAnimationProperties?.curve ?? Curves.ease))
          .animate(_animationControllerList[i]));
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _animationControllerList[_selectedIndex!].forward();
    });
  }

  Widget _buildItem(StxBottomNavBarItem item, bool isSelected, double? height,
      int itemIndex) {
    return widget.navBarHeight == 0
        ? const SizedBox.shrink()
        : AnimatedBuilder(
            animation: _animationList[itemIndex],
            builder: (context, child) => Transform.scale(
              scale: _animationList[itemIndex].value,
              child: SizedBox(
                width: 150.0,
                height: height,
                child: Container(
                  alignment: Alignment.center,
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: IconTheme(
                          data: IconThemeData(
                            size: item.iconSize,
                            color: isSelected
                                ? item.activeColor
                                : item.inactiveColor,
                          ),
                          child: isSelected
                              ? item.icon
                              : item.inactiveIcon ?? item.icon,
                        ),
                      ),
                      item.title == null
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: FittedBox(
                                  child: Text(
                                    item.title!,
                                    style: item.textStyle != null
                                        ? item.textStyle!.apply(
                                            color: isSelected
                                                ? item.activeColor
                                                : item.inactiveColor,
                                          )
                                        : TextStyle(
                                            color: isSelected
                                                ? item.activeColor
                                                : item.inactiveColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.items.length; ++i) {
      _animationControllerList[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.length != _animationControllerList.length) {
      _animationControllerList =
          List<AnimationController>.empty(growable: true);
      _animationList = List<Animation<double>>.empty(growable: true);

      for (int i = 0; i < widget.items.length; ++i) {
        _animationControllerList.add(AnimationController(
            duration: widget.itemAnimationProperties?.duration ??
                const Duration(milliseconds: 400),
            vsync: this));
        _animationList.add(Tween(begin: 0.95, end: 1.18)
            .chain(CurveTween(
                curve: widget.itemAnimationProperties?.curve ?? Curves.ease))
            .animate(_animationControllerList[i]));
      }
    }
    if (widget.activeIndex != _selectedIndex) {
      _lastSelectedIndex = _selectedIndex;
      _selectedIndex = widget.activeIndex;
      _animationControllerList[_selectedIndex!].forward();
      _animationControllerList[_lastSelectedIndex!].reverse();
    }
    return Container(
      width: double.infinity,
      height: widget.navBarHeight,
      padding: widget.navBarItemsPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (index != _selectedIndex) {
                  _lastSelectedIndex = _selectedIndex;
                  _selectedIndex = index;
                  _animationControllerList[_selectedIndex!].forward();
                  _animationControllerList[_lastSelectedIndex!].reverse();
                }
                if (widget.onTap != null) {
                  widget.onTap!(index);
                }
              },
              child: Container(
                color: Colors.transparent,
                child: _buildItem(item, widget.activeIndex == index,
                    widget.navBarHeight, index),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
