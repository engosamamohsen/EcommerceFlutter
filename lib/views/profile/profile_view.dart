import 'package:auth/component/image/image_circle.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/login/login_response.dart';
import 'package:auth/views/auth/login.view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserResponse? user;
  AppStorage appStorage = AppStorage();
  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      UserResponse fetchedUser = await appStorage.getUser();
      setState(() {
        user = fetchedUser;
      });
    } catch (e) {
      // Handle error appropriately
      print('Error loading user: $e');
    }
  }

  Future<void> _logout() async {
    try {
      appStorage.removeToken();
    } catch (e) {
      // Handle error appropriately
      print('Error loading user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            ImageCircle(
                width: 120,
                height: 120,
                image: user != null &&
                        user!.data != null &&
                        user!.data!.image != null
                    ? user!.data!.image.toString()
                    : ""),
            TextGlobal(
              text:
                  user != null && user!.data != null && user!.data!.name != null
                      ? user!.data!.name.toString()
                      : S.of(context).guest,
              fontSize: 18,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            ItemSetting(
              text: S.of(context).edit_profile,
              icon: Icons.person,
              submit: () {},
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: S.of(context).manage_address,
              icon: Icons.location_pin,
              submit: () {},
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: S.of(context).my_orders,
              icon: Icons.list_alt_outlined,
              submit: () {},
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: S.of(context).privacy_and_policy,
              icon: Icons.privacy_tip_outlined,
              submit: () {},
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: S.of(context).contact_us,
              icon: Icons.contact_support_outlined,
              submit: () {},
            ),
            SizedBox(
              height: 5,
            ),
            ItemSetting(
              text: S.of(context).logout,
              icon: Icons.logout,
              submit: () {
                _logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return LoginView();
                  }),
                  (Route<dynamic> route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ItemSetting extends StatelessWidget {
  const ItemSetting(
      {super.key,
      required this.text,
      required this.icon,
      required this.submit});
  final String text;
  final IconData icon;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: GlobalColors.mainColor,
        ),
        title: TextGlobal(
          text: text,
          color: Colors.black,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: GlobalColors.mainColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: GlobalColors.mainColor, width: 1),
        ),
        onTap: submit,
      ),
    );
  }
}
