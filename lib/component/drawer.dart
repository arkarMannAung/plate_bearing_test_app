import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/plate.jpg'),
                  // child: Icon(Icons.person,color: Colors.white,size: 50,),
                ),
              ),
              accountName: Text('By Arkar Mann Aung'),
              accountEmail: Text('mr.arkarmannaung@gmail.com'),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('https://arkarmannaung.me'),
              leading: Icon(Icons.home_outlined,color: Colors.redAccent,),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Testing Version'),
              leading: Icon(Icons.app_blocking,color: Colors.redAccent,),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('09780132792'),
              leading: Icon(Icons.phone,color: Colors.redAccent,),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('can you tell me when error occur!'),
              leading: Icon(Icons.settings,color: Colors.blue,),
            ),
          ),
        ],
      ),
    );
  }
}
