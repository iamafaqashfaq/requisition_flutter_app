import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/admin_home_screen.dart';
import 'package:requisition_app/Utils/app_theme.dart';
import 'package:requisition_app/Utils/tab_indicator_pain.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister>
    with SingleTickerProviderStateMixin {
  bool _passwordVisible = false;
  PageController? _pageController;
  late ThemeData themeData;
  int _selectedIndex = 0;
  Color left = Colors.black;
  Color right = Colors.white;
  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: themeData.backgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: themeData.backgroundColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    if (i == 0) {
                      setState(() {
                        _selectedIndex = 0;
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        _selectedIndex = 1;
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: _buildSignIn(context),
                      ),
                    ),
                    ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: _buildSignUp(context),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: themeData.colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(
            pageController: _pageController,
            selectedBackground: themeData.colorScheme.primary,
            indicatorWidth: 125,
            xPadding: 25,
            indicatorRadius: 20,
            yPadding: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: _onSignInButtonPress,
                child: Text(
                  "Login",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    fontWeight: _selectedIndex == 0 ? 700 : 600,
                    color: _selectedIndex == 0
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _onSignUpButtonPress,
                child: Text(
                  "Request Access",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    fontWeight: _selectedIndex == 1 ? 700 : 600,
                    color: _selectedIndex == 1
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5.0,
            color: themeData.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MySize.size8!),
            ),
            child: SizedBox(
              width: 340.0,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MySize.size24!,
                    left: MySize.size24!,
                    right: MySize.size24!,
                    bottom: MySize.size32!),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        prefixIcon: const Icon(MdiIcons.emailOutline),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.onBackground),
                          prefixIcon: const Icon(MdiIcons.lockOutline),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? MdiIcons.eyeOutline
                                : MdiIcons.eyeOffOutline),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: _passwordVisible,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password ?",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 500)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size16!),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
              boxShadow: [
                BoxShadow(
                  color: themeData.colorScheme.primary.withAlpha(28),
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminHomeScreen()));
                },
                child: Text("LOGIN",
                    style: AppTheme.getTextStyle(themeData.textTheme.button,
                        fontWeight: 600,
                        color: themeData.colorScheme.onPrimary,
                        letterSpacing: 0.5))),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5.0,
              color: themeData.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MySize.size8!),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MySize.size24!,
                    right: MySize.size24!,
                    top: MySize.size24!,
                    bottom: MySize.size36!),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: const Icon(MdiIcons.accountOutline),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          prefixIcon: const Icon(MdiIcons.emailOutline),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Number",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          prefixIcon: const Icon(MdiIcons.phoneOutline),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          prefixIcon: const Icon(MdiIcons.lockOutline),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? MdiIcons.eyeOutline
                                : MdiIcons.eyeOffOutline),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: _passwordVisible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                boxShadow: [
                  BoxShadow(
                    color: themeData.colorScheme.primary.withAlpha(28),
                    blurRadius: 3,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                  onPressed: () {},
                  child: Text("REQUEST ACCESS",
                      style: AppTheme.getTextStyle(themeData.textTheme.button,
                          fontWeight: 600,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0.5))),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
