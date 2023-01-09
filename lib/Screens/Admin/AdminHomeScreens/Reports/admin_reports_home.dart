import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Reports/admin_reports_chartbar.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminReportsHome extends StatefulWidget {
  const AdminReportsHome({super.key});

  @override
  State<AdminReportsHome> createState() => _AdminReportsHomeState();
}

class _AdminReportsHomeState extends State<AdminReportsHome> {
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
      appBar: AppBar(
        title: Text(
          "Reports",
          style: AppTheme.getTextStyle(
            Theme.of(context).textTheme.titleLarge,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: GroupedBarChart.withSampleData(),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...projects
                      .map(
                        (e) => Container(
                          margin: Spacing.all(8),
                          padding: Spacing.left(16),
                          height: MySize.size76,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: themeData.colorScheme.primary,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e,
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Lorem Ipsum",
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyMedium,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  MdiIcons.downloadCircle,
                                  size: MySize.size40,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  SizedBox(
                    height: MySize.size80,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
