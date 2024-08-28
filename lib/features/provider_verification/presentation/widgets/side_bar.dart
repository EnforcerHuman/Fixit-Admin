import 'package:fixit_admin/features/provider_verification/presentation/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Fixit Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) => ApplicationsScreen()),
                  (route) => false);
            },
            leading: const Icon(Icons.dashboard),
            title: const Text('Applications'),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
