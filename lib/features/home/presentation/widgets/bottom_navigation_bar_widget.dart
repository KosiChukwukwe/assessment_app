import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final selectedIndex;
  final ValueChanged<int> onClicked;
  const BottomNavigationBarWidget({super.key, this.selectedIndex, required this.onClicked});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: AppColors.plainWhite,
        selectedItemColor: AppColors.lightGreen,
        backgroundColor: AppColors.navyBlue,
        elevation: 10,
        iconSize: 32,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Buddies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: widget.onClicked,
      );
  }
}
