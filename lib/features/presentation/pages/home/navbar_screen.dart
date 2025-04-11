import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:task_management/features/presentation/pages/home/calender_screen.dart';
import 'package:task_management/features/presentation/pages/home/home_screen.dart';
import 'package:task_management/features/presentation/pages/home/notification_screen.dart';
import 'package:task_management/features/presentation/pages/home/profile_screen.dart';
import 'package:task_management/features/presentation/provider/bottom_navbar_provider.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context);

    final pages = [
      const HomeScreen(),
      const NotificationScreen(),
      const ScreenCalender(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[bottomNavbarProvider.currentIndex],
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: const Color.fromARGB(255, 255, 94, 0),
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: bottomNavbarProvider.currentIndex,
        onTap: (index) {
          bottomNavbarProvider.setIndex(index);
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        selectedIconSize: 30,
        unselectedIconSize: 28,
        
        
        customBottomBarItems: [
          CustomBottomBarItems(
            
            label: 'Home',
            icon: Icons.home,
            
          ),
          CustomBottomBarItems(
            label: 'Notifications',
            icon: Icons.notifications,
          ),
          CustomBottomBarItems(
            label: 'Calendar',
            icon: Icons.calendar_month,
          ),
          CustomBottomBarItems(
            label: 'Profile',
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}
