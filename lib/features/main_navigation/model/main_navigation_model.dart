import 'package:instagram_clone/constant/url_assets.dart';
import 'package:instagram_clone/features/home/view/home_page.dart';
import 'package:instagram_clone/features/profile/view/profile_page.dart';
import 'package:instagram_clone/features/reals/view/reals_page.dart';
import 'package:instagram_clone/features/search/view/search_page.dart';

class MainNavigationModel {
  static final List<Map<String, dynamic>> _listBottomNavigation = [
    {
      'icon': UrlAssets.iconHome,
      'child': const HomePage(),
      'label': 'Home',
    },
    {
      'icon': UrlAssets.iconSearch,
      'child': const SearchPage(),
      'label': 'Search',
    },
    {
      'icon': UrlAssets.iconAdd,
      'child': const SearchPage(),
      'label': 'Add',
    },
    {
      'icon': UrlAssets.iconReals,
      'child': const RealsPage(),
      'label': 'Reals',
    },
    {
      'icon': UrlAssets.iconHome,
      'child': const ProfilePage(),
      'label': 'Profile',
    },
  ];

  static List<Map<String, dynamic>> get listBottomNavigation =>
      _listBottomNavigation;
}
