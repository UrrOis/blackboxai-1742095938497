import 'package:flutter/material.dart';
import 'about_page.dart';
import 'order_page.dart';
import 'listmenu.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Text('Selamat Datang, $username!'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            child: Text('About'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(menuList[index].name),
                  subtitle: Text('Rp ${menuList[index].price}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderPage(menu: menuList[index])),
                      );
                    },
                    child: Text('Pesan'),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle logout logic
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
