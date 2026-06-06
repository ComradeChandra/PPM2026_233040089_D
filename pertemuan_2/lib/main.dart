import 'package:flutter/material.dart';

void main() {
  runApp(const PlaceholderPertemuan2());
}

class PlaceholderPertemuan2 extends StatelessWidget {
  const PlaceholderPertemuan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pertemuan 2')),
      body: const Center(
        child: Text('Tugas Pertemuan 2 akan ada di sini minggu depan!'),
      ),
    );
  }
}
