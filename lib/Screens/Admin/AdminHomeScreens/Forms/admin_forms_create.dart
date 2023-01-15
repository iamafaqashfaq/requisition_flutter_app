import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminFormsCreate extends StatefulWidget {
  const AdminFormsCreate({super.key});

  @override
  State<AdminFormsCreate> createState() => _AdminFormsCreateState();
}

class _AdminFormsCreateState extends State<AdminFormsCreate> {
  late ThemeData themeData;

  List<String> dataTypes = ["Number", "Date", "File", "Text", "Checkbox"];

  List<Widget> formFieldWidgets = [];

  addFormFieldWidget(type) {
    formFieldWidgets.add(
      Card(
        elevation: 12,
        child: Container(
          padding: Spacing.only(
            top: 16,
            bottom: 16,
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: themeData.colorScheme.primary,
                width: MySize.size8!,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Spacing.top(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Question Type: $type",
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.titleMedium,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formFieldWidgets.isNotEmpty) {
                          formFieldWidgets.removeLast();
                          setState(() {});
                        }
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Enter Question Here",
                    border: Theme.of(context).inputDecorationTheme.border,
                    enabledBorder:
                        Theme.of(context).inputDecorationTheme.border,
                    focusedBorder:
                        Theme.of(context).inputDecorationTheme.focusedBorder,
                    prefixIcon: const Icon(
                      Icons.question_mark,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Answer Label (Optional):",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.titleMedium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Answer Label",
                    border: Theme.of(context).inputDecorationTheme.border,
                    enabledBorder:
                        Theme.of(context).inputDecorationTheme.border,
                    focusedBorder:
                        Theme.of(context).inputDecorationTheme.focusedBorder,
                    prefixIcon: const Icon(
                      MdiIcons.label,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create",
          style: AppTheme.getTextStyle(
            Theme.of(context).textTheme.titleLarge,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Padding(
        padding: Spacing.horizontal(
          24,
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Form",
                  border: Theme.of(context).inputDecorationTheme.border,
                  enabledBorder: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  prefixIcon: const Icon(
                    MdiIcons.fileDocumentEdit,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Type",
                  border: Theme.of(context).inputDecorationTheme.border,
                  enabledBorder: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  prefixIcon: const Icon(
                    MdiIcons.formatQuoteClose,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: Theme.of(context).inputDecorationTheme.border,
                  enabledBorder: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  prefixIcon: const Icon(
                    MdiIcons.formTextarea,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: Text(
                    "Form Details",
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyLarge,
                    ),
                  ),
                ),
                PopupMenuButton(
                  child: const Icon(
                    MdiIcons.plusCircle,
                  ),
                  onSelected: (value) {
                    addFormFieldWidget(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return dataTypes.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
            ...formFieldWidgets,
            SizedBox(
              height: MySize.size50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size8!)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Theme.of(context).colorScheme.primary.withAlpha(20),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          Spacing.xy(16, 0),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.error,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",
                          style: AppTheme.getTextStyle(
                              Theme.of(context).textTheme.button,
                              fontWeight: 600,
                              color: Theme.of(context).colorScheme.onPrimary,
                              letterSpacing: 0.3))),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size8!)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Theme.of(context).colorScheme.primary.withAlpha(20),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(Spacing.xy(16, 0))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Create",
                          style: AppTheme.getTextStyle(
                              Theme.of(context).textTheme.button,
                              fontWeight: 600,
                              color: Theme.of(context).colorScheme.onPrimary,
                              letterSpacing: 0.3))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
