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

  TabController? _tabController;

  late ThemeData themeData;
  late AnimationController _controller;
  double _contentOpacity = 1;
  static List<IconData> icons = [
    MdiIcons.account,
    MdiIcons.briefcase,
    MdiIcons.fileDocumentEdit,
  ];

  static List<String> iconsText = ["Users", "Projects", "Forms"];

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
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
    _tabController!.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.none,
        color: themeData.colorScheme.onSecondary.withOpacity(0.2),
        notchMargin: 0,
        elevation: 4,
        child: Container(
          height: 50,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 12,
      //   currentIndex: _currentIndex,
      //   backgroundColor: themeData.colorScheme.surface,
      //   selectedIconTheme: IconThemeData(color: themeData.primaryColor),
      //   selectedItemColor: themeData.primaryColor,
      //   unselectedIconTheme:
      //       IconThemeData(color: themeData.colorScheme.onBackground),
      //   unselectedItemColor: themeData.colorScheme.onBackground,
      //   onTap: onTapped,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'CHAT'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.call),
      //       label: 'CALL',
      //     )
      //   ],
      // ),
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
            child:
                _currentIndex == 0 ? AdminDashboardGrid() : AdminProfileHome()),
        // child: Stack(
        // children: [
        // TabBarView(
        //   controller: _tabController,
        //   children: const <Widget>[

        //   ],
        // ),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: Container(
        //     padding: Spacing.all(16),
        //     child: PhysicalModel(
        //       color: themeData.backgroundColor,
        //       elevation: 12,
        //       borderRadius: Shape.circular(16),
        //       shadowColor: themeData.colorScheme.primary.withOpacity(0.6),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: themeData.backgroundColor,
        //           borderRadius: Shape.circular(16),
        //         ),
        //         padding: Spacing.vertical(12),
        //         child: TabBar(
        //           controller: _tabController,
        //           indicator: const BoxDecoration(),
        //           indicatorSize: TabBarIndicatorSize.tab,
        //           // indicatorColor: AppTheme.customTheme.groceryPrimary,
        //           tabs: <Widget>[
        //             Container(
        //               child: (_currentIndex == 0)
        //                   ? Column(
        //                       mainAxisSize: MainAxisSize.min,
        //                       children: <Widget>[
        //                         Text(
        //                           "Home",
        //                           style: AppTheme.getTextStyle(
        //                               themeData.textTheme.titleMedium,
        //                               fontWeight: 600,
        //                               color: themeData.colorScheme.primary),
        //                         ),
        //                         Container(
        //                           margin: Spacing.top(6),
        //                           decoration: BoxDecoration(
        //                             color: themeData.colorScheme.primary,
        //                             borderRadius: const BorderRadius.all(
        //                               Radius.circular(2.5),
        //                             ),
        //                           ),
        //                           height: 5,
        //                           width: 5,
        //                         )
        //                       ],
        //                     )
        //                   : Icon(
        //                       MdiIcons.home,
        //                       size: 20,
        //                       color: Theme.of(context).colorScheme.primary,
        //                     ),
        //             ),
        //             Container(
        //                 child: (_currentIndex == 1)
        //                     ? Column(
        //                         mainAxisSize: MainAxisSize.min,
        //                         children: <Widget>[
        //                           Text(
        //                             "Profile",
        //                             style: AppTheme.getTextStyle(
        //                               themeData.textTheme.titleMedium,
        //                               fontWeight: 600,
        //                               color: themeData.colorScheme.primary,
        //                             ),
        //                           ),
        //                           Container(
        //                             margin: Spacing.top(6),
        //                             decoration: BoxDecoration(
        //                               color: themeData.primaryColor,
        //                               borderRadius: const BorderRadius.all(
        //                                 Radius.circular(2.5),
        //                               ),
        //                             ),
        //                             height: 5,
        //                             width: 5,
        //                           )
        //                         ],
        //                       )
        //                     : Icon(
        //                         MdiIcons.account,
        //                         size: 20,
        //                         color: themeData.primaryColor,
        //                       )),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // )
        // ],
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          icons.length,
          (int index) {
            Widget child = SizedBox(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOutQuint),
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
                      backgroundColor: themeData.colorScheme.secondary,
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
                    transform: Matrix4.rotationZ(_controller.value * 0.5 * pi),
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
    );
  }
}
