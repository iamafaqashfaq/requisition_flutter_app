import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Forms/admin_form_details.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Forms/admin_forms_create.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminFormsHome extends StatefulWidget {
  const AdminFormsHome({super.key});

  @override
  State<AdminFormsHome> createState() => _AdminFormsHomeState();
}

class _AdminFormsHomeState extends State<AdminFormsHome> {
  late ThemeData themeData;
  List<String> formList = [
    'Form 1',
    'Form 2',
    'Form 3',
    'Form 4',
  ];
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminFormsCreate())),
        backgroundColor: themeData.colorScheme.primary,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: Spacing.top(100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...formList
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
                                    return AdminFormDetails(
                                      form: e,
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdminFormDetails(
                                  form: e,
                                );
                              }));
                            },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          color:
                                              themeData.colorScheme.onPrimary,
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
              color: Colors.grey.shade200,
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
                              hintText: "Search Forms",
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
