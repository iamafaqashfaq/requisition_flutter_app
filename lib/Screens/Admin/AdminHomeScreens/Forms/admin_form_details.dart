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

  addFormFieldWidget() {
    formFieldWidgets.add(
      Container(
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
                Text(
                  "Projects",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyLarge,
                  ),
                ),
                IconButton(
                  onPressed: addFormFieldWidget,
                  icon: const Icon(
                    MdiIcons.plusCircle,
                  ),
                )
              ],
            ),
            Container(
              padding: Spacing.only(
                top: 36,
                bottom: 36,
                left: 8,
                right: 8,
              ),
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "This form is not attached to any project yet!",
                style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
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
            Container(
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
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
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
                      initialValue: "Where did you found about this project?",
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
                        fillColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.2),
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
                        fillColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.2),
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
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
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
            ),
            Container(
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
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
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
                      initialValue:
                          "Have you worked before on a similar project?",
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
                        fillColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.2),
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
                  TextFormField(
                    initialValue: "Yes/No",
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
                      fillColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      prefixIcon: const Icon(
                        MdiIcons.label,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.sentences,
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
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
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
            ),
            ...formFieldWidgets,
          ],
        ),
      ),
    );
  }
}