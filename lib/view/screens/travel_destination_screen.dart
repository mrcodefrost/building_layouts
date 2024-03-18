import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelDestinationScreen extends StatelessWidget {
  const TravelDestinationScreen({super.key});
  final String _imageURL =
      'https://images.unsplash.com/photo-1471115853179-bb1d604434e0?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  _imageURL,
                ),

                // Row 1 - Location name
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oeschinen Lake Campground',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Kandersteg, Switzerland',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrangeAccent,
                            size: 30,
                          ),
                          Text(
                            '41',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Row 2 - Location Contacts
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ButtonSection(icon: Icons.call, label: 'CALL'),
                    _ButtonSection(icon: Icons.route, label: 'ROUTE'),
                    _ButtonSection(icon: Icons.share, label: 'SHARE'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: Text(
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.deepPurpleAccent,
          size: 36,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ],
    );
  }
}
