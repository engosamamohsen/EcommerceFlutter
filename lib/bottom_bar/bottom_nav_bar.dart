// import 'package:fathy/screens/home_screen.dart';
// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
// import 'package:flutter/material.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   var items = [
//     const HomeScreen(),
//     const Center(child: Text("Search")),
//     const Center(child: Text("Profile")),
//   ];

//   int selectedIndex = 0;
//   void onSelectedTab(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("title")),
//       body: items[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: selectedIndex,
//           onTap: onSelectedTab,
//           showSelectedLabels: true,
//           selectedItemColor: Colors.black,
//           unselectedItemColor: const Color.fromARGB(255, 66, 66, 66),
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(FluentIcons.home_16_regular),
//                 activeIcon: Icon(FluentIcons.home_16_filled),
//                 label: "home"),
//             BottomNavigationBarItem(
//                 icon: Icon(FluentIcons.search_16_regular),
//                 activeIcon: Icon(FluentIcons.search_16_filled),
//                 label: "Search"),
//             BottomNavigationBarItem(
//                 icon: Icon(FluentIcons.person_16_regular),
//                 activeIcon: Icon(FluentIcons.person_16_filled),
//                 label: "Profile")
//           ]),
//     );
//   }
// }
