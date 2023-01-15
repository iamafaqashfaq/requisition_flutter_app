import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Account/login.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminProfileHome extends StatefulWidget {
  const AdminProfileHome({super.key});

  @override
  State<AdminProfileHome> createState() => _AdminProfileHomeState();
}

class _AdminProfileHomeState extends State<AdminProfileHome> {
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(MySize.size24!),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MySize.size16!),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: MySize.size16!),
                  width: MySize.getScaledSizeHeight(140),
                  height: MySize.getScaledSizeHeight(140),
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  // ),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text("A",
                        style: AppTheme.getTextStyle(
                            Theme.of(context).textTheme.headline1,
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: 700)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size8!),
                  child: Text("Administrator",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 600,
                          letterSpacing: 0)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size24!),
            child: Column(
              children: <Widget>[
                singleOption(
                    iconData: MdiIcons.information, option: "Information"),
                const Divider(),
                singleOption(
                    iconData: MdiIcons.creditCardOutline,
                    option: "Subscriptions",
                    navigation: null),
                const Divider(),
                singleOption(
                    iconData: MdiIcons.bellRing,
                    option: "Notification",
                    navigation: null),
                const Divider(),
                singleOption(
                    iconData: MdiIcons.eye,
                    option: "Appearance",
                    navigation: null),
                const Divider(),
                singleOption(
                    iconData: MdiIcons.lock,
                    option: "Privacy & Security",
                    navigation: null),
                const Divider(),
                singleOption(
                    iconData: MdiIcons.faceAgent,
                    option: "Help & Support",
                    navigation: null),
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          MdiIcons.logoutVariant,
                          color: themeData.colorScheme.onPrimary,
                          size: MySize.size18,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size16!),
                          child: Text(
                            "LOGOUT",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                letterSpacing: 0.3,
                                fontWeight: 600,
                                color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
      child: InkWell(
        onTap: () {
          if (navigation != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => navigation));
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: MySize.size22,
              color: themeData.colorScheme.onBackground,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: MySize.size16!),
                child: Text(option,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600)),
              ),
            ),
            Icon(MdiIcons.chevronRight,
                size: MySize.size22, color: themeData.colorScheme.onBackground),
          ],
        ),
      ),
    );
  }
}
