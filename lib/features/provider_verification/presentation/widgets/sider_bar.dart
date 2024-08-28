import 'package:fixit_admin/features/provider_verification/presentation/Screens/application_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class SiderBar extends StatefulWidget {
  @override
  _SiderBarState createState() => _SiderBarState();
}

class _SiderBarState extends State<SiderBar> {
  SideMenuController page = SideMenuController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.open, // Customize display mode
              hoverColor: Colors.blue[100],
              selectedColor: Colors.blue,
              selectedTitleTextStyle: TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              unselectedTitleTextStyle: TextStyle(color: Colors.black),
              unselectedIconColor: Colors.black,
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 100,
                    maxWidth: 100,
                  ),
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'MyApp',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('© 2024 MyApp'),
            ),
            items: [
              SideMenuItem(
                title: 'Dashboard',
                onTap: (index, side) {},
                icon: Icon(Icons.dashboard),
              ),
              SideMenuItem(
                title: 'Profile',
                onTap: (index, side) {},
                icon: Icon(Icons.person),
              ),
              SideMenuItem(
                title: 'Settings',
                onTap: (index, side) {},
                icon: Icon(Icons.settings),
              ),
              SideMenuItem(
                title: 'Notifications',
                onTap: (index, side) {},
                icon: Icon(Icons.notifications),
                badgeContent: Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                tooltipContent: 'You have 3 notifications',
              ),
              SideMenuItem(
                title: 'Logout',
                onTap: (index, side) {},
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              // controller: page,
              children: [
                ApplicationsView(),
                Container(
                    color: Colors.green,
                    child: Center(child: Text('Profile Page'))),
                Container(
                    color: Colors.blue,
                    child: Center(child: Text('Settings Page'))),
                Container(
                    color: Colors.yellow,
                    child: Center(child: Text('Notifications Page'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
