import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class SinglePageItem extends StatelessWidget {
  final String? title, icon;
  final Widget navigation;
  final IconData? iconData;
  final Color? iconColor, backgroundColor, textColor, borderColor;

  const SinglePageItem(
      {Key? key,
      required this.title,
      required this.navigation,
      this.icon,
      this.iconData,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    Widget iconWidget;
    if (icon == null) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          color: iconColor ?? themeData.colorScheme.primary,
          size: 36,
        );
      } else {
        iconWidget = Image.asset(
          'assets/icons/rocket-outline.png',
          color: iconColor ?? themeData.colorScheme.primary,
          width: 36,
          height: 36,
        );
      }
    } else {
      iconWidget = Image.asset(
        icon!,
        color: iconColor ?? themeData.colorScheme.primary,
        width: 36,
        height: 36,
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
      },
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? themeData.colorScheme.background,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
                width: 1.2,
                color: borderColor ?? themeData.colorScheme.secondary),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: themeData.colorScheme.onBackground.withOpacity(0.6),
                offset: const Offset(2, 1),
              )
            ]),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              iconWidget,
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  title!,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      fontWeight: 600, color: textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SinglePageHome extends StatefulWidget {
  final List<SinglePageItem> items;
  final String title;
  final bool isComingSoon;
  final String comingSoonText;

  const SinglePageHome(
      {Key? key,
      required this.items,
      required this.title,
      this.isComingSoon = true,
      this.comingSoonText = ""})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SinglePageHomeState createState() => _SinglePageHomeState();
}

class _SinglePageHomeState extends State<SinglePageHome> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.appBarTheme.backgroundColor,
        title: Text(widget.title,
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                fontWeight: 600)),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            MdiIcons.chevronLeft,
            color: themeData.colorScheme.onBackground,
          ),
        ),
      ),
      body: Container(
        color: themeData.colorScheme.background,
        height: MySize.safeHeight,
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            GridView.count(
              crossAxisCount: 2,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  top: 16, left: 12, right: 12, bottom: 16),
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16.0,
              children: widget.items,
            ),
            widget.isComingSoon
                ? Container(
                    margin: Spacing.top(8),
                    child: Center(
                      child: Text(
                        widget.comingSoonText,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                      ),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
