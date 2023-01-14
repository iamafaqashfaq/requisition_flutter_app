import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Forms/admin_forms_home.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Profile/admin_profile_home.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Projects/admin_projects_home.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Users/admin_users_home.dart';
import 'package:requisition_app/Screens/Admin/Dashboard/admin_dashboard_grid.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;

  late ThemeData themeData;
  late AnimationController _controller;
  double _contentOpacity = 1;
  static List<IconData> icons = [
    MdiIcons.account,
    MdiIcons.briefcase,
    MdiIcons.fileDocumentEdit,
  ];

  static List<String> iconsText = ["Users", "Projects", "Forms"];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        currentIndex: _currentIndex,
        backgroundColor: themeData.colorScheme.surface,
        selectedIconTheme: IconThemeData(color: themeData.primaryColor),
        selectedItemColor: themeData.primaryColor,
        unselectedIconTheme:
            IconThemeData(color: themeData.colorScheme.onBackground),
        unselectedItemColor: themeData.colorScheme.onBackground,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          )
        ],
      ),
      appBar: AppBar(
        leading: Icon(
          MdiIcons.menu,
          color: themeData.primaryColor,
        ),
        title: Text(
          _currentIndex == 0 ? "Home" : "Profile",
          style: AppTheme.getTextStyle(
            themeData.textTheme.titleLarge,
            color: themeData.primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: Spacing.right(16),
            child: Icon(
              MdiIcons.bell,
              color: themeData.primaryColor,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Opacity(
        opacity: _contentOpacity,
        child: Container(
          child: _currentIndex == 0
              ? const AdminDashboardGrid()
              : const AdminProfileHome(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: Spacing.bottom(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(
            icons.length,
            (int index) {
              Widget child = SizedBox(
                // height: 70.0,
                width: MediaQuery.of(context).size.width,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      0.0,
                      1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOutQuint,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: Spacing.xy(8, 4),
                        margin: const EdgeInsets.only(right: 4),
                        // color: themeData.colorScheme.secondary,
                        child: Text(
                          iconsText[index],
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.titleMedium,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2),
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: themeData.colorScheme.primary,
                        mini: true,
                        child: Icon(icons[index],
                            color: themeData.colorScheme.onSecondary),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            if (index == 0) {
                              return const AdminUsersHome();
                            } else if (index == 1) {
                              return const AdminProjectsHome();
                            } else {
                              return const AdminFormsHome();
                            }
                          }));
                        },
                      ),
                    ],
                  ),
                ),
              );
              return child;
            },
          ).toList()
            ..add(
              FloatingActionButton(
                heroTag: null,
                backgroundColor: themeData.colorScheme.primary,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      transform:
                          Matrix4.rotationZ(_controller.value * 0.5 * pi),
                      alignment: FractionalOffset.center,
                      child: Icon(
                        _controller.isDismissed ? Icons.add : Icons.close,
                        color: themeData.colorScheme.onPrimary,
                      ),
                    );
                  },
                ),
                onPressed: () {
                  if (_controller.isDismissed) {
                    setState(() {
                      _contentOpacity = 0.6;
                    });
                    _controller.forward();
                  } else {
                    setState(() {
                      _contentOpacity = 1;
                    });
                    _controller.reverse();
                  }
                },
              ),
            ),
        ),
      ),
    );
  }
}
