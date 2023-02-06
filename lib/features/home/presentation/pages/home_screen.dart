import 'package:assessment_app/features/buddies/presentation/pages/buddies_screen.dart';
import 'package:assessment_app/features/discover/presentation/pages/discover_screen.dart';
import 'package:assessment_app/features/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:assessment_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:assessment_app/features/setting_and_privacy/presentation/pages/settings_and_privacy_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  List screens = const [ProfileScreen(), BuddiesScreen(), DiscoverScreen(), SettingsScreen()];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: selectedIndex,
          onClicked: onClicked,
        )
    );
  }
}
