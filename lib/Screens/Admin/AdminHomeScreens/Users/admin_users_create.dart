import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminUsersCreate extends StatefulWidget {
  const AdminUsersCreate({super.key});

  @override
  State<AdminUsersCreate> createState() => _AdminUsersCreateState();
}

class _AdminUsersCreateState extends State<AdminUsersCreate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                            nameController.text.isEmpty
                                ? ""
                                : nameController.text[0],
                            style: AppTheme.getTextStyle(
                                Theme.of(context).textTheme.headline1,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontWeight: 700)),
                      ),
                    ),
                  ],
                ),
                Text(
                  nameController.text,
                  style: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.headline6,
                      fontWeight: 600,
                      letterSpacing: 0),
                ),
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
                    onChanged: (value) => setState(() {}),
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: Theme.of(context).inputDecorationTheme.border,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.border,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      prefixIcon: const Icon(
                        MdiIcons.at,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: TextFormField(
                    onChanged: (value) => setState(() {}),
                    controller: emailController,
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
                    onChanged: (value) => setState(() {}),
                    controller: phoneNumController,
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
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: TextFormField(
                    onChanged: (value) => setState(() {}),
                    controller: phoneNumController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: Theme.of(context).inputDecorationTheme.border,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.border,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      prefixIcon: const Icon(
                        MdiIcons.lock,
                        size: 24,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: _passwordVisible,
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
                          child: Text("Create",
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
