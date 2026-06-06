import 'package:flutter/material.dart';

class Latihan1Screen extends StatelessWidget {
  const Latihan1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan 1: Text & Styling')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 2, // Eksperimen dari modul
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ini teks biasa dengan ukuran kecil',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Eksperimen: FontWeight.w300',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
            const Text(
              'Eksperimen: Colors.deepPurple',
              style: TextStyle(color: Colors.deepPurple, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
