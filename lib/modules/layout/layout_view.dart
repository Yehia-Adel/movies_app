import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/modules/layout/pages/account/profile_view.dart';
import 'package:movies_app/modules/layout/pages/browse/browse_view.dart';
import 'package:movies_app/modules/layout/pages/home/home_view.dart';
import 'package:movies_app/modules/layout/pages/search/search_view.dart';

class LayoutView extends StatefulWidget {
  LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  List<Widget> pages = [HomeView(), SearchView(), BrowseView(), ProfileView()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: BottomNavigationBar(
            onTap: _onBottomNavBarTapped,
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorPalette.generalGreyColor,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Vector.svg"),
                activeIcon: SvgPicture.asset(
                  "assets/icons/Vector.svg",
                  colorFilter: ColorFilter.mode(
                      ColorPalette.primaryColor, BlendMode.srcIn),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/search.svg.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/search.svg.svg",
                    colorFilter: ColorFilter.mode(
                        ColorPalette.primaryColor, BlendMode.srcIn),
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/explore.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/explore.svg",
                    colorFilter: ColorFilter.mode(
                        ColorPalette.primaryColor, BlendMode.srcIn),
                  ),
                  label: "Browse"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Profiel.svg"),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Profiel.svg",
                    colorFilter: ColorFilter.mode(
                        ColorPalette.primaryColor, BlendMode.srcIn),
                  ),
                  label: "Profile")
            ]),
      ),
      body: pages[_selectedIndex],
    );
  }

  _onBottomNavBarTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
