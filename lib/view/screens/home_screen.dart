import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FF),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
            child: ListView.builder(
                itemCount: appRoutes.length,
                itemBuilder: (context, index) {
                  return ListViewTile(
                      name: appRoutes[index][0], route: appRoutes[index][1]);
                })
            // ListView(
            //   children: [
            //     TextButton(
            //         onPressed: () {
            //           Navigator.pushNamed(context, '/travel');
            //         },
            //         child: const Text('Flutter Travel Destination')),
            //     TextButton(
            //         onPressed: () {
            //           Navigator.pushNamed(context, '/todo');
            //         },
            //         child: const Text('Todo App')),
            //     TextButton(
            //         onPressed: () {
            //           Navigator.pushNamed(context, '/shoes_intro');
            //         },
            //         child: const Text('Shoes Ecommerce UI')),
            //   ],
            // ),
            ),
      ),
    );
  }
}

List appRoutes = [
  // [name, route]
  ['Travel Destination UI', '/travel'],
  ['Todo App', '/todo'],
  ['Shoes Ecommerce UI', '/shoes_intro'],
  ['AADHAR Form App', '/form_home']
];

class ListViewTile extends StatelessWidget {
  final String name;
  final String route;

  const ListViewTile({super.key, required this.name, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFBDD5EA),
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Color(0xFF577399),
          ),
        ),
      ),
    );
  }
}
