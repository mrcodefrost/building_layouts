import 'package:building_layouts/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'shoes_cart_screen.dart';
import 'shoes_demo_screen.dart';
import 'shoes_shop_screen.dart';

class ShoesHomeScreen extends StatefulWidget {
  const ShoesHomeScreen({super.key});

  @override
  State<ShoesHomeScreen> createState() => _ShoesHomeScreenState();
}

class _ShoesHomeScreenState extends State<ShoesHomeScreen> {
  // selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // method to update selected index when user taps
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    const ShoesShopScreen(),
    // cart page
    const ShoesCartScreen(),
    // const DemoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // logo
                Container(
                  height: 200,
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset(
                        ShoesImages.nikeLogo,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                // Other pages
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ShoesCustomBottomBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class ShoesCustomBottomBar extends StatelessWidget {
  final void Function(int) onTabChange;
  const ShoesCustomBottomBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
          // GButton(icon: Icons.abc_sharp, text: 'Demo'),
        ]);
  }
}
