import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Forms/admin_forms_home.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Projects/admin_projects_home.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Reports/admin_reports_home.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Users/admin_users_home.dart';
import 'package:requisition_app/Utils/single_grid_item.dart';

class AdminDashboardGrid extends StatelessWidget {
  const AdminDashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 2,
        padding: Spacing.fromLTRB(4, 16, 4, 0),
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        children: <Widget>[
          SinglePageItem(
            iconData: MdiIcons.account,
            navigation: const AdminUsersHome(),
            title: "Users",
            iconColor: themeData.colorScheme.onPrimary,
            textColor: themeData.colorScheme.onPrimary,
            borderColor: Colors.transparent,
            backgroundColor: themeData.colorScheme.primary,
          ),
          SinglePageItem(
            iconData: MdiIcons.chartBarStacked,
            navigation: const AdminReportsHome(),
            title: "Reports",
            iconColor: themeData.colorScheme.onPrimary,
            textColor: themeData.colorScheme.onPrimary,
            borderColor: Colors.transparent,
            backgroundColor: themeData.colorScheme.primary,
          ),
          SinglePageItem(
            iconData: MdiIcons.briefcase,
            navigation: const AdminProjectsHome(),
            title: "Projects",
            iconColor: themeData.colorScheme.onPrimary,
            textColor: themeData.colorScheme.onPrimary,
            borderColor: Colors.transparent,
            backgroundColor: themeData.colorScheme.primary,
          ),
          SinglePageItem(
            iconData: MdiIcons.fileDocumentEdit,
            navigation: const AdminFormsHome(),
            title: "Forms",
            iconColor: themeData.colorScheme.onPrimary,
            textColor: themeData.colorScheme.onPrimary,
            borderColor: Colors.transparent,
            backgroundColor: themeData.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
