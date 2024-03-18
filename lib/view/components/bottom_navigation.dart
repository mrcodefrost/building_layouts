import 'package:flutter/material.dart';

class BottomNavTutorial extends StatefulWidget {
  const BottomNavTutorial({super.key});

  @override
  State<BottomNavTutorial> createState() => _BottomNavTutorialState();
}

class _BottomNavTutorialState extends State<BottomNavTutorial> {
  final List _pages = [
    const Center(
      child: Text('Page 1'),
    ),
    const Center(
      child: Text('Page 2'),
    ),
    const Center(
      child: Text('Page 3'),
    ),
    const Center(
      child: Text('Page 4'),
    ),
  ];

  // tracking the current index
  int currentIndex = 0;

  // to update the current index
  void updateCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: updateCurrentIndex,
        fixedColor: Colors.red,
        unselectedItemColor: Colors.pinkAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '1'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '2'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: '3'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '4'),
        ],
      ),
    );
  }
}
