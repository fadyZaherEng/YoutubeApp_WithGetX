import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_app/layout/controller/app_controller.dart';
import 'package:youtube_app/modules/allvideos_screen/home.dart';
import 'package:youtube_app/modules/cubit_screen/cubit_screen.dart';
import 'package:youtube_app/modules/designpatterns_screen/designpatterns.dart';
import 'package:youtube_app/modules/flutter_screen/flutter_screen.dart';
import 'package:youtube_app/shared/components/custom_appbar.dart';

class AppScreen extends StatelessWidget {
  final controller = AppController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(margin:EdgeInsets.only(top: 30),child: CustomAppBar()),
      ),
      body: Obx(
        () {
          switch (RouteName.values[controller.currentIndex.value]) {
            case RouteName.Home:
              return HomeVideosScreen();
            case RouteName.CubitVd:
              return CubitVideosScreen();
            case RouteName.DesignPatternsVid:
              return DesignPatternsVideosScreen();
            case RouteName.Flutter:
              return FlutterVideosScreen();
            default:
              break;
          }
          return Container();
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          //selectedItemColor: Colors.black,
          onTap: (idx) {
            controller.changePageIndex(idx);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/home_off.svg",
                color: Colors.white,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/home_on.svg",
                color: Colors.white,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/compass_off.svg",
                width: 22,
                color: Colors.white,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/compass_on.svg",
                width: 22,
                color: Colors.white,
              ),
              label: "Cubit",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/svg/icons/plus.svg",
                  width: 35,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/library_off.svg",
                color: Colors.white,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/library_on.svg",
                color: Colors.white,
              ),
              label: "Design Patterns",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/subs_off.svg",
                color: Colors.white,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/subs_on.svg",
                color: Colors.white,
              ),
              label: "Flutter",
            ),

          ],
        ),
      ),
    );
  }
}
