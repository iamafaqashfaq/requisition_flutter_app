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
                    enabled: false,
                    style: AppTheme.getTextStyle(
                        Theme.of(context).textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Name",
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
                        MdiIcons.accountOutline,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    controller: TextEditingController(text: data.name),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: TextFormField(
                    enabled: false,
                    style: AppTheme.getTextStyle(
                        Theme.of(context).textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Email",
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
                        MdiIcons.emailOutline,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(
                        text:
                            "${data.name.toString().replaceAll(" ", "").toLowerCase()}@gmail.com"),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: TextFormField(
                    enabled: false,
                    style: AppTheme.getTextStyle(
                        Theme.of(context).textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Phone",
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
                        MdiIcons.phoneOutline,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.sentences,
                    controller: TextEditingController(text: data.number),
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
