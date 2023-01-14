import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminUsersDetails extends StatelessWidget {
  final dynamic data;
  const AdminUsersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                MdiIcons.chevronLeft,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size24!),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: MySize.size16!),
                      width: MySize.getScaledSizeHeight(140),
                      height: MySize.getScaledSizeHeight(140),
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.circle,
                      // ),
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text(data.name[0],
                            style: AppTheme.getTextStyle(
                                Theme.of(context).textTheme.headline1,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontWeight: 700)),
                      ),
                    ),
                  ],
                ),
                Text(data.name,
                    style: AppTheme.getTextStyle(
                        Theme.of(context).textTheme.headline6,
                        fontWeight: 600,
                        letterSpacing: 0)),
                Text(
                  "Actor",
                  style: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.subtitle2,
                      fontWeight: 500),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MySize.size36!,
                left: MySize.size24!,
                right: MySize.size24!),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: TextFormField(
                    controller: TextEditingController(text: data.name),
                    decoration: InputDecoration(
                      labelText: "Name",
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
                    controller: TextEditingController(
                        text:
                            "${data.name.toString().replaceAll(" ", "").toLowerCase()}@gmail.com"),
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
                    initialValue: "39459343545",
                    decoration: InputDecoration(
                      labelText: "Phone",
                      border: Theme.of(context).inputDecorationTheme.border,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.border,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      prefixIcon: const Icon(
                        MdiIcons.phone,
                        size: 24,
                      ),
                    ),
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
                          child: Text("Reject",
                              style: AppTheme.getTextStyle(
                                  Theme.of(context).textTheme.button,
                                  fontWeight: 600,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                          child: Text("Approve",
                              style: AppTheme.getTextStyle(
                                  Theme.of(context).textTheme.button,
                                  fontWeight: 600,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  letterSpacing: 0.3))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
