import 'package:flutter/material.dart';
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
      title: 'Latihan Widget',
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
        title: const Text('Latihan Widget Dasar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuTile(context, 'Latihan 1: Text', const Latihan1Screen(), Icons.text_fields),
          _buildMenuTile(context, 'Latihan 2: Container', const Latihan2Screen(), Icons.check_box_outline_blank),
          _buildMenuTile(context, 'Latihan 3: Row & Column', const Latihan3Screen(), Icons.view_quilt),
          _buildMenuTile(context, 'Latihan 4: Icon & Bottom Bar', const Latihan4Screen(), Icons.navigation),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, String title, Widget screen, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      ),
    );
  }
}
