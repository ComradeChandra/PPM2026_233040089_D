import 'package:flutter/material.dart';

class Latihan3Screen extends StatelessWidget {
  const Latihan3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan 3: Row & Column')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('MainAxisAlignment.spaceEvenly',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              Container(width: 50, height: 50, color: Colors.green),
              Container(width: 50, height: 50, color: Colors.blue),
            ],
          ),
          const Divider(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('MainAxisAlignment.spaceBetween',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              Container(width: 50, height: 50, color: Colors.green),
              Container(width: 50, height: 50, color: Colors.blue),
            ],
          ),
          const Divider(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('MainAxisAlignment.center',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              const SizedBox(width: 10),
              Container(width: 50, height: 50, color: Colors.green),
              const SizedBox(width: 10),
              Container(width: 50, height: 50, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
