import 'package:flutter/material.dart';
import 'package:pertemuan_1/profile_card.dart';
import 'package:pertemuan_1/latihan1_text.dart';
import 'package:pertemuan_1/latihan2_container.dart';
import 'package:pertemuan_1/latihan3_row_column.dart';
import 'package:pertemuan_1/latihan4_icons.dart';

import 'p2_main.dart' as p2;
import 'p3_main.dart' as p3;
import 'p4_main.dart' as p4;
import 'p5_main.dart' as p5;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const MainMenu());
          
          case '/p1_profil':
            return MaterialPageRoute(builder: (context) => const ProfileCardScreen());
          case '/p1_lat1':
            return MaterialPageRoute(builder: (context) => const Latihan1Screen());
          case '/p1_lat2':
            return MaterialPageRoute(builder: (context) => const Latihan2Screen());
          case '/p1_lat3':
            return MaterialPageRoute(builder: (context) => const Latihan3Screen());
          case '/p1_lat4':
            return MaterialPageRoute(builder: (context) => const Latihan4Screen());
          
          case '/p2_home':
            return MaterialPageRoute(builder: (context) => const p2.ProfilePage());
          
          case '/p3_home':
            return MaterialPageRoute(builder: (context) => const p3.HomePage());
          case '/p3_tambah':
            return MaterialPageRoute(builder: (context) => const p3.TambahCatatanPage());
          case '/p3_detail':
            final arg = settings.arguments as p3.Catatan;
            return MaterialPageRoute(builder: (context) => p3.DetailCatatanPage(catatan: arg));

          case '/p4_home':
            return MaterialPageRoute(builder: (context) => const p4.HomePage());
          case '/p4_form':
            final arg = settings.arguments;
            return MaterialPageRoute(builder: (context) => p4.CatatanFormPage(initial: arg as p4.Catatan?));
          case '/p4_detail':
            final arg = settings.arguments as p4.Catatan;
            return MaterialPageRoute(builder: (context) => p4.DetailCatatanPage(catatan: arg));

          case '/p5_home':
            return MaterialPageRoute(builder: (context) => const p5.HomePage());
          case '/p5_form':
            final arg = settings.arguments;
            return MaterialPageRoute(builder: (context) => p5.CatatanFormPage(initial: arg as p5.Catatan?));
          case '/p5_detail':
            final arg = settings.arguments as p5.Catatan;
            return MaterialPageRoute(builder: (context) => p5.DetailCatatanPage(catatan: arg));
        }
        return null;
      },
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
          _buildMenuTile(context, 'Pertemuan 1', 'Profile & Widget Dasar', '/p1_menu', Icons.folder),
          _buildMenuTile(context, 'Pertemuan 2', 'Scaffold & Gallery', '/p2_home', Icons.folder_shared),
          _buildMenuTile(context, 'Pertemuan 3', 'Stateful & Navigation', '/p3_home', Icons.note_add),
          _buildMenuTile(context, 'Pertemuan 4', 'SQLite Persistence', '/p4_home', Icons.storage),
          _buildMenuTile(context, 'Pertemuan 5', 'REST API (HTTP)', '/p5_home', Icons.cloud_sync),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, String title, String subtitle, String route, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          if (route == '/p1_menu') {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan1Menu()));
          } else {
             Navigator.pushNamed(context, route);
          }
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
          _tile(context, 'Kartu Profil', '/p1_profil'),
          _tile(context, 'Latihan 1: Text', '/p1_lat1'),
          _tile(context, 'Latihan 2: Container', '/p1_lat2'),
          _tile(context, 'Latihan 3: Row & Column', '/p1_lat3'),
          _tile(context, 'Latihan 4: Icon & Bottom Bar', '/p1_lat4'),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}
