import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Projects/admin_project_form_approval.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminProjectDetail extends StatefulWidget {
  final dynamic project;
  const AdminProjectDetail({super.key, this.project});

  @override
  State<AdminProjectDetail> createState() => _AdminProjectDetailState();
}

class _AdminProjectDetailState extends State<AdminProjectDetail> {
  late ThemeData themeData;
  List<String> formList = [
    'Form 1',
    'Form 2',
    'Form 3',
    'Form 4',
  ];
  _generateGridItems(context) {
    List<Widget> list = [];
    for (int i = 0; i < formList.length; i++) {
      list.add(
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AdminProjectFormApproval();
            }));
          },
          child: Container(
            padding: Spacing.all(2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(
                6,
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  offset: Offset(0.9, 0.9),
                  color: Colors.black87,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.formTextbox,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                Text(
                  formList[i],
                  style: AppTheme.getTextStyle(
                    Theme.of(context).textTheme.subtitle1,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail",
          style: AppTheme.getTextStyle(
            Theme.of(context).textTheme.titleLarge,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Padding(
        padding: Spacing.only(left: 24, right: 24),
        child: ListView(
          children: [
            SizedBox(
              height: MySize.size24,
            ),
            Center(
              child: Hero(
                tag: widget.project,
                child: CircleAvatar(
                  radius: MySize.size60,
                  child: Text(
                    widget.project[0],
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.headline2,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              widget.project,
              style: AppTheme.getTextStyle(
                themeData.textTheme.headline4,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "lorem ipsum",
              style: AppTheme.getTextStyle(
                themeData.textTheme.titleLarge,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: TextFormField(
                  maxLines: 4,
                  initialValue:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                  decoration: InputDecoration(
                    labelText: "Description",
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Attached Forms",
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyLarge,
                    ),
                  ),
                  const Icon(MdiIcons.plusCircle)
                ],
              ),
            ),
            Container(
              padding: Spacing.all(4),
              height: MySize.size180! * 2,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: _generateGridItems(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
