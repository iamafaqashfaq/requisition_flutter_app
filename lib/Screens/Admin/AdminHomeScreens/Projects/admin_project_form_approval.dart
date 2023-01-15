import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Projects/admin_project_form_approval_addnew.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminProjectFormApproval extends StatefulWidget {
  const AdminProjectFormApproval({super.key});

  @override
  State<AdminProjectFormApproval> createState() =>
      _AdminProjectFormApprovalState();
}

class _AdminProjectFormApprovalState extends State<AdminProjectFormApproval> {
  late ThemeData themeData;
  List<Map<String, String>> alphabetList = [
    {'email': 'vinay@gmail.com', 'position': 'Manager'},
    {'email': 'priya@gmail.com', 'position': 'writer'},
    {'email': 'afaq@live.com', 'position': 'screenwriter'},
  ];
  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Approval Flow",
          style: AppTheme.getTextStyle(
            themeData.textTheme.titleLarge,
            color: themeData.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const AdminProjectFormApprovalAddNew();
          }));
          if (result != null) {
            alphabetList.add(result);
            setState(() {});
          }
        },
        backgroundColor: themeData.colorScheme.primary,
        child: const Icon(
          MdiIcons.plus,
        ),
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        scrollDirection: Axis.vertical,
        padding: Spacing.y(8),
        children: List.generate(
          alphabetList.length,
          (index) {
            return Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dragDismissible: false,
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      alphabetList.removeAt(index);
                      setState(() {});
                    },
                    foregroundColor: themeData.colorScheme.onError,
                    backgroundColor: themeData.colorScheme.error,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListViewCard(
                alphabetList,
                index,
                Key('$index'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final List<Map<String, String>> listItems;
  // ignore: annotate_overrides, overridden_fields
  final Key key;

  // ignore: use_key_in_widget_constructors
  const ListViewCard(this.listItems, this.index, this.key);

  @override
  State<ListViewCard> createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      margin: Spacing.all(8),
      color: theme.cardColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: Spacing.left(4),
            child: Text(
              "${widget.index + 1}",
              style: AppTheme.getTextStyle(
                theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: Spacing.fromLTRB(8, 8, 0, 0),
                  child: Text(
                    widget.listItems[widget.index]["email"]!,
                    style: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Container(
                  padding: Spacing.all(8),
                  child: Text(
                    widget.listItems[widget.index]["position"]!,
                    style: AppTheme.getTextStyle(
                      Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacing.width(16),
          Icon(
            Icons.drag_indicator,
            color: theme.colorScheme.onBackground.withAlpha(200),
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
