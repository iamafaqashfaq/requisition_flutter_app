import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Profile/admin_profile_home.dart';
import 'package:requisition_app/Screens/Admin/Dashboard/admin_dashboard_grid.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController? _tabController;

  late ThemeData themeData;

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
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
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
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: const <Widget>[
              AdminDashboardGrid(),
              AdminProfileHome(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: Spacing.all(16),
              child: PhysicalModel(
                color: themeData.backgroundColor,
                elevation: 12,
                borderRadius: Shape.circular(16),
                shadowColor: themeData.colorScheme.primary.withOpacity(0.6),
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.backgroundColor,
                    borderRadius: Shape.circular(16),
                  ),
                  padding: Spacing.vertical(12),
                  child: TabBar(
                    controller: _tabController,
                    indicator: const BoxDecoration(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    // indicatorColor: AppTheme.customTheme.groceryPrimary,
                    tabs: <Widget>[
                      Container(
                        child: (_currentIndex == 0)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Home",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.titleMedium,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.primary),
                                  ),
                                  Container(
                                    margin: Spacing.top(6),
                                    decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2.5),
                                      ),
                                    ),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.home,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      ),
                      Container(
                          child: (_currentIndex == 2)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "Profile",
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.titleMedium,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.primary,
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.top(6),
                                      decoration: BoxDecoration(
                                        color: themeData.primaryColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(2.5),
                                        ),
                                      ),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.account,
                                  size: 20,
                                  color: themeData.primaryColor,
                                )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
