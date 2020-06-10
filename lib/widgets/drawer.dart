import 'package:flutter/material.dart';
import '../utils/navigator_page.dart';
import '../pages/login_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqP85ZnOcRSCX3nlYdkCvSxhSuZs0bLt1He8EvGr5ne8c7mTqW';
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Jean Cabral'),
              accountEmail: Text('jeanpaulocabral@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  urlImage,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
              subtitle: Text('mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onclickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  //Method logout
  _onclickLogout(BuildContext context){
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
