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

  addFormFieldWidget() {
    formFieldWidgets.add(Card(
      child: Container(
        margin: Spacing.only(
          top: 8,
          bottom: 8,
        ),
        padding: Spacing.only(
          top: 16,
          bottom: 16,
          left: 8,
          right: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question:",
              style: AppTheme.getTextStyle(
                themeData.textTheme.titleMedium,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Enter Question Here",
                  border: Theme.of(context).inputDecorationTheme.border,
                  enabledBorder: Theme.of(context).inputDecorationTheme.border,
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
                  enabledBorder: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  prefixIcon: const Icon(
                    MdiIcons.label,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Answer Type:",
                style: AppTheme.getTextStyle(
                  themeData.textTheme.titleMedium,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black87,
                  ),
                ),
              ),
              child: DropdownButton(
                  isExpanded: true,
                  items: dataTypes
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {}),
            )
          ],
        ),
      ),
    ));
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              MdiIcons.contentSave,
            ),
          )
        ],
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
                Padding(
                  padding: Spacing.only(top: 8),
                  child: IconButton(
                    onPressed: addFormFieldWidget,
                    icon: const Icon(
                      MdiIcons.plusCircle,
                    ),
                  ),
                )
              ],
            ),
            ...formFieldWidgets,
          ],
        ),
      ),
    );
  }
}
