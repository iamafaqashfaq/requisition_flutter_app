import 'package:flutter/material.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/Screens/Admin/AdminHomeScreens/Users/admin_users_details.dart';
import 'package:requisition_app/Utils/app_theme.dart';

class AdminUsersRequestList extends StatelessWidget {
  const AdminUsersRequestList({super.key});
  static final List<Contact> _contactList = [
    Contact("Zahra Tate", "Actor"),
    Contact("Willard Palmer", "Director"),
    Contact("Charlotte Small", "Producer"),
    Contact("Stanley Lindsey", "Staff"),
    Contact("Ebony Bowman", "+4 987456321"),
    Contact("Rosa Lloyd", "+91 789456321"),
    Contact("Shane Roman", "+1 147852369"),
    Contact("Ashley Cruz", "+14 159632147"),
    Contact("Elle Mendoza", "+78 697412369"),
    Contact("Kieron Lucero", "+178 52314569"),
    Contact("Mitchell Brady", "0291 215496"),
    Contact("Casey Calderon", "+1 125893478"),
    Contact("Jodie Caldwell", "+1 147852369"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Spacing.bottom(80),
      color: Theme.of(context).backgroundColor,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: _contactList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(_contactList[index].name[0],
                      style: AppTheme.getTextStyle(
                          Theme.of(context).textTheme.subtitle1,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: 700)),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminUsersDetails(
                                  data: _contactList[index],
                                ))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _contactList[index].name,
                            style: AppTheme.getTextStyle(
                              Theme.of(context).textTheme.subtitle1,
                              fontWeight: 600,
                            ),
                          ),
                          Text(
                            _contactList[index].number,
                            style: AppTheme.getTextStyle(
                              Theme.of(context).textTheme.bodyText2,
                              fontWeight: 500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}
