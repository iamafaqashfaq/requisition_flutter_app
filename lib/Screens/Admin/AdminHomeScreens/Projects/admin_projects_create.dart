import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminProjectsCreate extends StatefulWidget {
  const AdminProjectsCreate({super.key});

  @override
  State<AdminProjectsCreate> createState() => _AdminProjectsCreateState();
}

class _AdminProjectsCreateState extends State<AdminProjectsCreate> {
  late ThemeData themeData;

  List<Widget> approvers = [];

  @override
  void initState() {
    super.initState();
  }

  addApprovers() {
    approvers.add(
      const Center(child: Icon(MdiIcons.arrowDown)),
    );

    approvers.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          style: AppTheme.getTextStyle(Theme.of(context).textTheme.bodyText1,
              letterSpacing: 0.1,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: 500),
          decoration: InputDecoration(
            hintText: "Approver Email",
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
            fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            prefixIcon: const Icon(
              MdiIcons.email,
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.sentences,
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
          "Create Project",
          style: AppTheme.getTextStyle(
            Theme.of(context).textTheme.titleLarge,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: MySize.size24!, left: MySize.size24!, right: MySize.size24!),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: TextFormField(
                  style: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.bodyText1,
                      letterSpacing: 0.1,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: 500),
                  decoration: InputDecoration(
                    hintText: "Project",
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
                      MdiIcons.briefcase,
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
                    fillColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
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
                    fillColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                    prefixIcon: const Icon(
                      MdiIcons.formatBold,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: Text(
                  "Approver Flow",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  style: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.bodyText1,
                      letterSpacing: 0.1,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: 500),
                  decoration: InputDecoration(
                    hintText: "Approver Email",
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
                      MdiIcons.email,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              ...approvers,
              Center(
                child: IconButton(
                  icon: const Icon(MdiIcons.plusCircle),
                  onPressed: addApprovers,
                ),
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
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(20),
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
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(20),
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
      ),
    );
  }
}
