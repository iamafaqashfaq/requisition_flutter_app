import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Account/login.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AuthCompanyCode extends StatefulWidget {
  const AuthCompanyCode({super.key});

  @override
  State<AuthCompanyCode> createState() => _AuthCompanyCodeState();
}

class _AuthCompanyCodeState extends State<AuthCompanyCode> {
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        color: themeData.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 3 / 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.background,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(MySize.size48!))),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Enter Company Code",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline5,
                          fontWeight: 600),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MySize.size16!, bottom: MySize.size16!),
                  color: themeData.backgroundColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: MySize.size16!,
                          right: MySize.size16!,
                        ),
                        child: Card(
                          elevation: 20,
                          child: Padding(
                            padding: EdgeInsets.all(MySize.size16!),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      letterSpacing: 0.1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintText: "Code",
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        letterSpacing: 0.1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon: const Icon(
                                        MdiIcons.formTextboxPassword),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size24!)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(28),
                                        blurRadius: 3,
                                        offset: const Offset(
                                            1, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              Spacing.xy(16, 0))),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                      },
                                      child: Text("Next",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.button,
                                              fontWeight: 600,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              letterSpacing: 0.5))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
