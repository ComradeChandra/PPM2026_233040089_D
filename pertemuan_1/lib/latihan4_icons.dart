import 'package:flutter/material.dart';

class Latihan4Screen extends StatelessWidget {
  const Latihan4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan 4: Icon & Bottom Bar')),
      body: const Center(
        child: Text('Halaman Utama Latihan 4'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.red, size: 32),
              onPressed: () {},
            ),
            IconButton(
              icon:
                  const Icon(Icons.receipt_long, color: Colors.green, size: 32),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications,
                  color: Colors.purple, size: 32),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.blue, size: 32),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
