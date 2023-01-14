import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminProjectFormApprovalAddNew extends StatefulWidget {
  const AdminProjectFormApprovalAddNew({super.key});

  @override
  State<AdminProjectFormApprovalAddNew> createState() =>
      _AdminProjectFormApprovalAddNewState();
}

class _AdminProjectFormApprovalAddNewState
    extends State<AdminProjectFormApprovalAddNew> {
  TextEditingController email = TextEditingController();
  TextEditingController position = TextEditingController();
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Approver",
          style: AppTheme.getTextStyle(
            themeData.textTheme.titleLarge,
            color: themeData.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, String> data = {
            "email": email.text,
            "position": position.text
          };
          Navigator.pop(context, data);
        },
        backgroundColor: themeData.colorScheme.primary,
        child: const Icon(
          Icons.done,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: Theme.of(context).inputDecorationTheme.border,
                    enabledBorder:
                        Theme.of(context).inputDecorationTheme.border,
                    focusedBorder:
                        Theme.of(context).inputDecorationTheme.focusedBorder,
                    prefixIcon: const Icon(
                      MdiIcons.email,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: TextFormField(
                  controller: position,
                  decoration: InputDecoration(
                    labelText: "Position",
                    border: Theme.of(context).inputDecorationTheme.border,
                    enabledBorder:
                        Theme.of(context).inputDecorationTheme.border,
                    focusedBorder:
                        Theme.of(context).inputDecorationTheme.focusedBorder,
                    prefixIcon: const Icon(
                      MdiIcons.stairs,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
