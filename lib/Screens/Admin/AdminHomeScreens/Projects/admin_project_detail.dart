import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
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
  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < formList.length; i++) {
      list.add(
        Container(
          padding: Spacing.all(2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(
              12,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.formTextbox,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                formList[i],
                style: AppTheme.getTextStyle(
                  Theme.of(context).textTheme.subtitle1,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: "priyabajaj@gmail.com",
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
                ],
              ),
            ),
            const Center(child: Icon(MdiIcons.arrowDown)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: "vinay@gmail.com",
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
                ],
              ),
            ),
            const Center(child: Icon(MdiIcons.arrowDown)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: "afaq@gmail.com",
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: Text(
                "Attached Forms",
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyLarge,
                ),
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
                children: _generateGridItems(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
