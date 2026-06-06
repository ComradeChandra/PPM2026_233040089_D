import 'package:flutter/material.dart';
import 'package:pertemuan_1/profile_card.dart';
import 'package:pertemuan_1/latihan1_text.dart';
import 'package:pertemuan_1/latihan2_container.dart';
import 'package:pertemuan_1/latihan3_row_column.dart';
import 'package:pertemuan_1/latihan4_icons.dart';
import 'package:pertemuan_2/main.dart' as p2; // Alias buat Pertemuan 2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Chandra',
      debugShowCheckedModeBanner: false,
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
        title: const Text('Dashboard Praktikum'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuTile(
            context,
            'Pertemuan 1',
            'Hello World, Profile Card, & Widget Dasar',
            const Pertemuan1Menu(),
            Icons.folder,
          ),
          _buildMenuTile(
            context,
            'Pertemuan 2',
            'Anatomi Scaffold & Widget Gallery',
            const p2.ProfilePage(),
            Icons.folder_shared,
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

class Pertemuan1Menu extends StatelessWidget {
  const Pertemuan1Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pertemuan 1')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Kartu Profil'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileCardScreen())),
          ),
          ListTile(
            title: const Text('Latihan 1: Text'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Latihan1Screen())),
          ),
          ListTile(
            title: const Text('Latihan 2: Container'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Latihan2Screen())),
          ),
          ListTile(
            title: const Text('Latihan 3: Row & Column'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Latihan3Screen())),
          ),
          ListTile(
            title: const Text('Latihan 4: Icon & Bottom Bar'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Latihan4Screen())),
          ),
        ],
      ),
    );
  }
}
