import 'package:flutter/material.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Flutter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('\u{1F44B}', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            const Text(
              'Halo, Chandra Harkat Raharja!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selamat datang di dunia Flutter.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIM: 233040089', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Prodi: Teknik Informatika',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Semester: 5', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Belum dipakai — akan dipelajari di praktikum berikutnya
              },
              child: const Text('Tap Saya'),
            ),
          ],
        ),
      ),
    );
  }
}
