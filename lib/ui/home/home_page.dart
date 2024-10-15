import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xung_xinh_app/ui/home/calendar.dart';
import 'package:xung_xinh_app/ui/home/camera_page.dart';
import 'package:xung_xinh_app/ui/home/try_on_page.dart';
import 'package:xung_xinh_app/ui/home/wardrobe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This keeps track of the current page to display
  int _selectedIndex = 0;

  // The pages we have in our app
  final List<Widget> _pages = [
    CameraPage(),
    TryOnPage(),
    CalendarPage(),
    WardorbePage(), // Reference to the WardrobePage
  ];

  // Helper function to get the AppBar for each page
  AppBar? _getAppBar(int index) {
    switch (index) {
      case 0:
        return AppBar(
          backgroundColor: const Color(0xFFF1D9D4),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ],
        );
      case 1:
        return null;
      case 2:
        return AppBar(
          backgroundColor: const Color(0xFFF1D9D4),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ],
        );
      // case 3:
      //   return AppBar(
      //     backgroundColor: const Color(0xFFF1D9D4),
      //     actions: [
      //       IconButton(
      //           onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
      //     ],
      //   );
      default:
        return AppBar(
          backgroundColor: const Color(0xFFF1D9D4),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ],
        );
    }
  }

  // This function handles navigation and sets the selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1D9D4),
      appBar: _getAppBar(_selectedIndex), // Custom AppBar for each page
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF3A4054),
        unselectedItemColor: Color(0xFF3A4054),
        selectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        backgroundColor: Color(0xFFFEFBEF),
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Xtars.png"),
              color: Color(0xFF3A4054),
            ),
            label: "Xtars",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/TryOn.png"),
              color: Color(0xFF3A4054),
            ),
            label: "Try-On",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFFEFBEF),
            icon: ImageIcon(
              AssetImage("assets/images/Calendar.png"),
              color: Color(0xFF3A4054),
            ),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Wardrobe.png"),
              color: Color(0xFF3A4054),
            ),
            label: "Wardrobe",
          ),
        ],
      ),
    );
  }
}
