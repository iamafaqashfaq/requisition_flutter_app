import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminFormDetails extends StatefulWidget {
  final dynamic form;
  const AdminFormDetails({super.key, this.form});

  @override
  State<AdminFormDetails> createState() => _AdminFormDetailsState();
}

class _AdminFormDetailsState extends State<AdminFormDetails> {
  late ThemeData themeData;

  List<String> dataTypes = ["Number", "Date", "File", "Text", "Checkbox"];

  List<Widget> formFieldWidgets = [];

  addFormFieldWidget(type) {
    formFieldWidgets.add(
      Card(
        elevation: 12,
        child: Container(
          padding: Spacing.only(
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
                tag: widget.form,
                child: CircleAvatar(
                  radius: MySize.size60,
                  child: Text(
                    widget.form[0],
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.headline2,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              widget.form,
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
              child: TextFormField(
                initialValue:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
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
            Card(
              elevation: 12,
              child: Container(
                padding: Spacing.only(
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
                    Text(
                      "Question:",
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        initialValue: "Where did you found about this project?",
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: "Enter Question Here",
                          border: Theme.of(context).inputDecorationTheme.border,
                          enabledBorder:
                              Theme.of(context).inputDecorationTheme.border,
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder,
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
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder,
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
            ...formFieldWidgets,
          ],
        ),
      ),
    );
  }
}
