import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}

class ItemSetting extends StatelessWidget {
  const ItemSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //ListTile
        ListTile(
          leading: Icon(
            Icons.person_outline,
            color: Colors.redAccent,
          ),
          title: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.redAccent,
          ),
          onTap: () {
            // Add your navigation or action here
          },
        ),
      ],
    );
  }
}
