import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Users/admin_users_create.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Users/admin_users_home_list.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Users/admin_users_request_list.dart';

class AdminUsersHome extends StatefulWidget {
  const AdminUsersHome({super.key});

  @override
  State<AdminUsersHome> createState() => _AdminUsersHomeState();
}

class _AdminUsersHomeState extends State<AdminUsersHome>
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: themeData.colorScheme.primary,
      //     ),
      //   ),
      //   // title: Text(
      //   //   "Users",
      //   //   style: AppTheme.getTextStyle(
      //   //     Theme.of(context).textTheme.titleLarge,
      //   //     color: Theme.of(context).colorScheme.onPrimary,
      //   //   ),
      //   // ),
      //   title: Card(
      //     elevation: 3,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Container(
      //       padding: Spacing.xy(12, 8),
      //       child: Padding(
      //         padding: Spacing.fromLTRB(16, 0, 8, 0),
      //         child: const TextField(
      //           decoration: InputDecoration(
      //             hintText: "Search here",
      //             fillColor: Colors.transparent,
      //             border: InputBorder.none,
      //             focusedBorder: InputBorder.none,
      //             enabledBorder: InputBorder.none,
      //             disabledBorder: InputBorder.none,
      //             errorBorder: InputBorder.none,
      //             focusedErrorBorder: InputBorder.none,
      //             isDense: true,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(
      //       onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const AdminUsersCreate())),
      //       icon: Icon(
      //         MdiIcons.plusCircle,
      //         color: themeData.colorScheme.primary,
      //       ),
      //     ),
      //   ],
      // ),
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
            icon: Icon(MdiIcons.account),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountClock),
            label: 'Requests',
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: Spacing.top(100),
            child: _currentIndex == 0
                ? const AdminUsersHomeList()
                : const AdminUsersRequestList(),
          ),
          Positioned(
            top: 40,
            right: 16,
            left: 16,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: Spacing.xy(12, 8),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color:
                            themeData.colorScheme.onBackground.withAlpha(240),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: Spacing.fromLTRB(16, 0, 8, 0),
                        child: const TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              hintText: "Search Users",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              isDense: true),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminUsersCreate())),
                      child: Icon(
                        MdiIcons.plusCircle,
                        size: 24,
                        color:
                            themeData.colorScheme.onBackground.withAlpha(240),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
