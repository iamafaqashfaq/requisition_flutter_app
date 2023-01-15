import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Account/register.dart';
import 'package:requisition_app/Screens/Admin/admin_home_screen.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? _passwordVisible = false, _check = false;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: _MyCustomClipper(context),
            child: Container(
              alignment: Alignment.center,
              color: themeData.colorScheme.primary,
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: MediaQuery.of(context).size.height * 0.2,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 24, top: 8),
                          child: Text(
                            "LOGIN",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,
                                fontWeight: 600),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      letterSpacing: 0.1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: const Icon(MdiIcons.emailOutline),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      letterSpacing: 0.1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        letterSpacing: 0.1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon:
                                        const Icon(MdiIcons.lockOutline),
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible!
                                          ? MdiIcons.eyeOutline
                                          : MdiIcons.eyeOffOutline),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible!;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: _passwordVisible!,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                alignment: Alignment.centerRight,
                                child: Text("Forgot Password?",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500)),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor:
                                          themeData.colorScheme.primary,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _check = value;
                                        });
                                      },
                                      value: _check,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    Text(
                                      "Remember me",
                                      style: themeData.textTheme.bodyText2!
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(18),
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
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
                                                  const AdminHomeScreen()));
                                    },
                                    child: Text("LOGIN",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.button,
                                            fontWeight: 600,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            letterSpacing: 0.5))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an Account? ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 500)),
                          TextSpan(
                              text: " Request Access",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary)),
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
