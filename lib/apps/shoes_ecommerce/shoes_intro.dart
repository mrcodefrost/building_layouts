import 'package:flutter/material.dart';

import '../../constants.dart';

class ShoesIntroScreen extends StatelessWidget {
  const ShoesIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                ShoesImages.nikeLogo,
                height: 240,
              ),
            ),

            const SizedBox(
              height: 48,
            ),

            //title
            const Text(
              'Just Do It',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            // subtitle
            const Text(
              'The Sneakers with style',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 48,
            ),
            // start now button

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/shoes_Home'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(25),
                child: const Center(
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
