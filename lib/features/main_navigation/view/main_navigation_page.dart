import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';

import 'package:instagram_clone/features/main_navigation/model/main_navigation_model.dart';
import 'package:instagram_clone/widgets/avatar/default_avatar_widget.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final List<Widget> _listWidget = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < MainNavigationModel.listBottomNavigation.length; i++) {
      final data = MainNavigationModel.listBottomNavigation[i]['child'];
      _listWidget.add(data);
    }
  }

  void _onItemTapped(int index) async {
    final cameras = await availableCameras();
    if (index == 2) {
      Navigation.pushName(RoutesName.cameraPage, arguments: cameras);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        items: MainNavigationModel.listBottomNavigation.map((e) {
          return BottomNavigationBarItem(
            activeIcon: e['label'] == 'Profile'
                ? const DefaultAvatarWidget(
                    size: 20,
                    haveStatus: false,
                  )
                : Image.asset(
                    e['icon'],
                    scale: 4,
                    color: AppColors.whiteColor,
                  ),
            icon: e['label'] == 'Profile'
                ? const DefaultAvatarWidget(
                    size: 20,
                    haveStatus: false,
                  )
                : Image.asset(
                    e['icon'],
                    scale: 4,
                    color: AppColors.greyColor,
                  ),
            label: e['label'],
          );
        }).toList(),
      ),
    );
  }
}
