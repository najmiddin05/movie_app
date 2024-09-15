import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:movie_app/core/theme/app_icons.dart";
import "package:movie_app/core/widgets/bottom_navigation/bottom_indicator_bar.dart";

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: navigationShell.currentIndex != 0,
        onPopInvoked: (bool v) => navigationShell.goBranch(0),
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomIndicatorBar(
            currentIndex: navigationShell.currentIndex,
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff242A32),
              selectedItemColor: Color(0xff0296E5),
              unselectedItemColor: Color(0xff67686D),
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) => changeTap(index, context),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: AppIcons.home.copyWith(
                    color: navigationShell.currentIndex == 0 ? Color(0xff0296E5) : Color(0xff67686D),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: AppIcons.search.copyWith(
                    color: navigationShell.currentIndex == 1 ? Color(0xff0296E5) : Color(0xff67686D),
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: AppIcons.save.copyWith(
                    color: navigationShell.currentIndex == 2 ? Color(0xff0296E5) : Color(0xff67686D),
                  ),
                  label: "Watch list",
                ),
              ],
            ),
          ),
        ),
      );

  void changeTap(int index, BuildContext context) {
    navigationShell.goBranch(index, initialLocation: false);
  }
}
