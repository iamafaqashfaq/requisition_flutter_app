import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Projects/admin_project_detail.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Projects/admin_projects_create.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminProjectsHome extends StatefulWidget {
  const AdminProjectsHome({super.key});

  @override
  State<AdminProjectsHome> createState() => _AdminProjectsHomeState();
}

class _AdminProjectsHomeState extends State<AdminProjectsHome> {
  late ThemeData themeData;
  List<String> projects = [
    "Project A",
    "Project B",
    "Project C",
    "Project D",
    "Project E",
    "Project F"
  ];
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Projects",
      //     style: AppTheme.getTextStyle(
      //       Theme.of(context).textTheme.titleLarge,
      //       color: Theme.of(context).colorScheme.onPrimary,
      //     ),
      //   ),
      //   backgroundColor: themeData.colorScheme.primary,
      //   actions: [
      //     IconButton(
      //       onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const AdminProjectsCreate())),
      //       icon: const Icon(MdiIcons.plusCircle),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Padding(
            padding: Spacing.top(100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...projects
                      .map(
                        (e) => Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dragDismissible: false,
                            children: [
                              SlidableAction(
                                onPressed: null,
                                foregroundColor:
                                    themeData.colorScheme.onPrimary,
                                backgroundColor: themeData.colorScheme.primary,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              SlidableAction(
                                onPressed: null,
                                foregroundColor: themeData.colorScheme.onError,
                                backgroundColor: themeData.colorScheme.error,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dragDismissible: false,
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AdminProjectDetail(
                                      project: e,
                                    );
                                  }));
                                },
                                foregroundColor:
                                    themeData.colorScheme.onPrimary,
                                backgroundColor: themeData.colorScheme.primary,
                                icon: Icons.visibility,
                                label: 'View',
                              ),
                            ],
                          ),
                          child: Container(
                            padding: Spacing.left(16),
                            height: MySize.size76,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(12),
                              color: themeData.colorScheme.background,
                              // boxShadow: const [
                              //   BoxShadow(
                              //     blurRadius: 6,
                              //     offset: Offset(2, 3),
                              //   ),
                              // ],
                              border: Border(
                                bottom: BorderSide(
                                  color: themeData.colorScheme.onBackground
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Hero(
                                  tag: e,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        themeData.colorScheme.primary,
                                    radius: MySize.size30,
                                    child: Text(
                                      e[0],
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.titleLarge,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MySize.size16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          e,
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.headline6,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            "lorem ipsum",
                                            style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyMedium,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
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
                              hintText: "Search Projects",
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
                              builder: (context) =>
                                  const AdminProjectsCreate())),
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
