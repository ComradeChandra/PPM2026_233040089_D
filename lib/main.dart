import 'package:flutter/material.dart';
import 'profile_card.dart';
import 'latihan1_text.dart';
import 'latihan2_container.dart';
import 'latihan3_row_column.dart';
import 'latihan4_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Pertemuan 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Praktikum 1'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuTile(
            context,
            'Kartu Profil (Langkah 7)',
            'Profil Mahasiswa & Hello World',
            const ProfileCardScreen(),
            Icons.person,
          ),
          _buildMenuTile(
            context,
            'Latihan 1: Text',
            'Eksperimen Text & Styling',
            const Latihan1Screen(),
            Icons.text_fields,
          ),
          _buildMenuTile(
            context,
            'Latihan 2: Container',
            'Eksperimen Container & Decoration',
            const Latihan2Screen(),
            Icons.check_box_outline_blank,
          ),
          _buildMenuTile(
            context,
            'Latihan 3: Row & Column',
            'Eksperimen Alignment & Layout',
            const Latihan3Screen(),
            Icons.view_quilt,
          ),
          _buildMenuTile(
            context,
            'Latihan 4: Icon & Bottom Bar',
            'Eksperimen Icon & Mock-up Bottom Bar',
            const Latihan4Screen(),
            Icons.navigation,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, String title, String subtitle,
      Widget screen, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
