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
    formFieldWidgets.add(Container(
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
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
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
              style: AppTheme.getTextStyle(
                  Theme.of(context).textTheme.bodyText1,
                  letterSpacing: 0.1,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: 500),
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.all(0),
                isDense: true,
                hintText: "Enter Question Here",
                hintStyle: AppTheme.getTextStyle(
                    Theme.of(context).textTheme.subtitle2,
                    letterSpacing: 0.1,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: 500),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                prefixIcon: Icon(
                  Icons.question_mark,
                  size: MySize.size30,
                ),
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
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
              style: AppTheme.getTextStyle(
                  Theme.of(context).textTheme.bodyText1,
                  letterSpacing: 0.1,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: 500),
              decoration: InputDecoration(
                hintText: "Answer Label",
                hintStyle: AppTheme.getTextStyle(
                    Theme.of(context).textTheme.subtitle2,
                    letterSpacing: 0.1,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: 500),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                prefixIcon: const Icon(
                  MdiIcons.label,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
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
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                12,
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
                style: AppTheme.getTextStyle(
                    Theme.of(context).textTheme.bodyText1,
                    letterSpacing: 0.1,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: "Form",
                  hintStyle: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: 500),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  prefixIcon: const Icon(
                    MdiIcons.fileDocumentEdit,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
                onChanged: (value) => setState(() {}),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: TextFormField(
                style: AppTheme.getTextStyle(
                    Theme.of(context).textTheme.bodyText1,
                    letterSpacing: 0.1,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: "Type",
                  hintStyle: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: 500),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  prefixIcon: const Icon(
                    MdiIcons.formatQuoteClose,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: TextFormField(
                maxLines: 4,
                style: AppTheme.getTextStyle(
                    Theme.of(context).textTheme.bodyText1,
                    letterSpacing: 0.1,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.all(0),
                  isDense: true,
                  hintText: "Description",
                  hintStyle: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: 500),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  prefixIcon: const Icon(
                    MdiIcons.formatBold,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
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
