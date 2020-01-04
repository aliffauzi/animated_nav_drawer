import 'package:animated_nav_drawer/util/list_view_effecr.dart';
import 'package:animated_nav_drawer/util/background_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'circular_image.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.web, 'News'),
    MenuItem(Icons.people, 'Friends List'),
    MenuItem(Icons.note_add, 'Notes'),
    MenuItem(Icons.favorite, 'Favourites'),
    MenuItem(Icons.settings, 'Settings'),
    MenuItem(Icons.account_circle, 'Log Out'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62, bottom: 8, right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xffF2BC33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircularImage(
                NetworkImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Jaycee',
                style: TextStyle(
                  color: Color(0xff1E1535),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'github.com/jbankz',
                style: TextStyle(color: Color(0xff1E1535), fontSize: 12.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListViewEffect(
                duration: Duration(milliseconds: 300),
                children: options.map((item) {
                  return Container(
                    color: Color(0xffF2BC33),
                    child: ListTile(
                      leading: Icon(
                        item.icon,
                        color: Color(0xff1E1535),
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(color: Color(0xff1E1535)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
