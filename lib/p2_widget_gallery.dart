import 'package:flutter/material.dart';

class GalleryHome extends StatelessWidget {
  const GalleryHome({super.key});
  @override
  Widget build(BuildContext context) {
    final categories = [
      ('Display', Icons.image, Colors.blue),
      ('Input', Icons.edit, Colors.green),
      ('Button', Icons.smart_button, Colors.orange),
      ('Feedback', Icons.notifications, Colors.purple),
      ('Layout', Icons.dashboard, Colors.teal),
      ('Animation', Icons.animation, Colors.pink),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Gallery')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final (name, icon, color) = categories[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.white),
              ),
              title: Text(name),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CategoryPage(name: name))),
            ),
          );
        },
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String name;
  const CategoryPage({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    final body = switch (name) {
      'Display' => const _DisplayDemo(),
      'Input' => const _InputDemo(),
      'Button' => const _ButtonDemo(),
      'Feedback' => const _FeedbackDemo(),
      'Layout' => const _LayoutDemo(),
      'Animation' => const _AnimationDemo(),
      _ => const Center(child: Text('?')),
    };
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}

// ... (Display, Input, Button, Feedback, Layout Demo) ...
class _DisplayDemo extends StatelessWidget {
  const _DisplayDemo();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Card', style: TextStyle(fontWeight: FontWeight.bold)),
      const Card(child: ListTile(leading: Icon(Icons.album), title: Text('Judul Item'), subtitle: Text('Sub-judul'))),
      const SizedBox(height: 16),
      const Text('Chip', style: TextStyle(fontWeight: FontWeight.bold)),
      const Wrap(spacing: 8, children: [Chip(label: Text('Flutter')), Chip(label: Text('Dart')), Chip(label: Text('Mobile'))]),
      const SizedBox(height: 16),
      const Text('Divider', style: TextStyle(fontWeight: FontWeight.bold)),
      const Divider(thickness: 2),
      const SizedBox(height: 16),
      const Text('CircleAvatar & Icon', style: TextStyle(fontWeight: FontWeight.bold)),
      const Row(children: [CircleAvatar(child: Text('A')), SizedBox(width: 12), CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.check)), SizedBox(width: 12), Icon(Icons.star, color: Colors.amber, size: 40)]),
    ]);
  }
}

class _InputDemo extends StatefulWidget {
  const _InputDemo();
  @override
  State<_InputDemo> createState() => _InputDemoState();
}
class _InputDemoState extends State<_InputDemo> {
  bool _checked = false; bool _switched = true; double _slider = 0.5; String? _dropdown = 'Apel';
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('TextField'), const SizedBox(height: 4), const TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Nama', hintText: 'Ketik nama Anda')),
      const SizedBox(height: 16),
      CheckboxListTile(title: const Text('Checkbox'), value: _checked, onChanged: (v) => setState(() => _checked = v ?? false)),
      SwitchListTile(title: const Text('Switch'), value: _switched, onChanged: (v) => setState(() => _switched = v)),
      const Text('Slider'), Slider(value: _slider, onChanged: (v) => setState(() => _slider = v)),
      const SizedBox(height: 8),
      const Text('Dropdown'), DropdownButton<String>(value: _dropdown, items: ['Apel', 'Jeruk', 'Mangga'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(() => _dropdown = v)),
    ]);
  }
}

class _ButtonDemo extends StatelessWidget {
  const _ButtonDemo();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ElevatedButton(onPressed: () {}, child: const Text('Elevated')), const SizedBox(height: 8),
      FilledButton(onPressed: () {}, child: const Text('Filled')), const SizedBox(height: 8),
      OutlinedButton(onPressed: () {}, child: const Text('Outlined')), const SizedBox(height: 8),
      TextButton(onPressed: () {}, child: const Text('Text Button')), const SizedBox(height: 8),
      ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.send), label: const Text('Dengan Icon')), const SizedBox(height: 8),
      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.red)),
    ]);
  }
}

class _FeedbackDemo extends StatelessWidget {
  const _FeedbackDemo();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Halo dari SnackBar!'))), child: const Text('Tampilkan SnackBar')),
      const SizedBox(height: 8),
      ElevatedButton(onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Konfirmasi'), content: const Text('Yakin ingin lanjut?'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')), ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Ya'))])), child: const Text('Tampilkan Dialog')),
      const SizedBox(height: 16), const Text('Progress Indicator:'), const SizedBox(height: 8), const LinearProgressIndicator(value: 0.6), const SizedBox(height: 12), const Center(child: CircularProgressIndicator()),
    ]);
  }
}

class _LayoutDemo extends StatelessWidget {
  const _LayoutDemo();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Stack — widget bertumpuk'), const SizedBox(height: 8),
      SizedBox(height: 120, child: Stack(children: [Container(width: double.infinity, color: Colors.blue.shade100), Positioned(top: 12, left: 12, child: Container(width: 50, height: 50, color: Colors.red)), const Positioned(bottom: 12, right: 12, child: Icon(Icons.star, size: 40, color: Colors.amber))])),
      const SizedBox(height: 16), const Text('Wrap — auto-pindah baris saat penuh'), const SizedBox(height: 8),
      Wrap(spacing: 8, runSpacing: 8, children: List.generate(8, (i) => Container(padding: const EdgeInsets.all(12), color: Colors.teal.shade100, child: Text('Item ${i + 1}')))),
      const SizedBox(height: 16), const Text('GridView (count: 3)'), const SizedBox(height: 8),
      SizedBox(height: 200, child: GridView.count(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, children: List.generate(6, (i) => Container(color: Colors.purple.shade100, alignment: Alignment.center, child: Text('${i + 1}'))))),
    ]);
  }
}

// === TOP 10 ANIMATION DEMO: SENANG-SENANG MAXIMAL ===
class _AnimationDemo extends StatefulWidget {
  const _AnimationDemo();
  @override
  State<_AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<_AnimationDemo> with TickerProviderStateMixin {
  // States for interactive animations
  bool _toggle1 = false;
  double _opacity = 1.0;
  bool _toggle2 = false;
  bool _toggle3 = false;
  int _counter = 0;

  // Controllers for continuous animations
  late final AnimationController _rotateCtrl = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();
  late final AnimationController _pulseCtrl = AnimationController(duration: const Duration(milliseconds: 800), vsync: this)..repeat(reverse: true);
  late final AnimationController _iconCtrl = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

  @override
  void dispose() {
    _rotateCtrl.dispose();
    _pulseCtrl.dispose();
    _iconCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('⭐ TOP 10 ANIMASI FLUTTER ⭐', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink)),
        const SizedBox(height: 20),

        // 1. Rotation (Continuous)
        _item('1. Muter Terus (Rotation)', RotationTransition(turns: _rotateCtrl, child: const Icon(Icons.settings, size: 50, color: Colors.blue))),

        // 2. Pulse/Scale (Continuous)
        _item('2. Detak Jantung (Scale)', ScaleTransition(scale: Tween(begin: 0.8, end: 1.2).animate(_pulseCtrl), child: const Icon(Icons.favorite, size: 50, color: Colors.red))),

        // 3. AnimatedContainer (Interactive)
        _item('3. Kotak Ajaib (Tap me!)', GestureDetector(
          onTap: () => setState(() => _toggle1 = !_toggle1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            width: _toggle1 ? 100 : 60, height: _toggle1 ? 60 : 100,
            decoration: BoxDecoration(color: _toggle1 ? Colors.pink : Colors.orange, borderRadius: BorderRadius.circular(_toggle1 ? 10 : 30)),
            child: const Icon(Icons.star, color: Colors.white),
          ),
        )),

        // 4. AnimatedOpacity
        _item('4. Hantu Ngilang (Opacity)', Column(children: [
          AnimatedOpacity(opacity: _opacity, duration: const Duration(milliseconds: 500), child: const Text('👻 BAA!', style: TextStyle(fontSize: 24))),
          TextButton(onPressed: () => setState(() => _opacity = _opacity == 0 ? 1.0 : 0.0), child: const Text('Toggle Opacity')),
        ])),

        // 5. AnimatedIcon
        _item('5. Ikon Berubah (Play/Pause)', GestureDetector(
          onTap: () => _toggle2 ? _iconCtrl.reverse() : _iconCtrl.forward(),
          child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _iconCtrl, size: 50, color: Colors.green),
        ).also(() => _toggle2 = !_toggle2)),

        // 6. AnimatedAlign
        _item('6. Bola Lari (Align)', Container(
          width: double.infinity, height: 60, color: Colors.grey.shade200,
          child: AnimatedAlign(
            alignment: _toggle3 ? Alignment.centerRight : Alignment.centerLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            child: GestureDetector(onTap: () => setState(() => _toggle3 = !_toggle3), child: const CircleAvatar(backgroundColor: Colors.red, radius: 15)),
          ),
        )),

        // 7. AnimatedPadding
        _item('7. Nafas (Padding)', GestureDetector(
          onTap: () => setState(() => _toggle1 = !_toggle1),
          child: AnimatedPadding(
            padding: EdgeInsets.all(_toggle1 ? 20 : 0),
            duration: const Duration(milliseconds: 500),
            child: Container(color: Colors.teal, height: 50, alignment: Alignment.center, child: const Text('TAP BINTANG DI ATAS', style: TextStyle(color: Colors.white))),
          ),
        )),

        // 8. AnimatedPhysicalModel
        _item('8. Lompat (Shadow)', GestureDetector(
          onTap: () => setState(() => _toggle2 = !_toggle2),
          child: AnimatedPhysicalModel(
            duration: const Duration(milliseconds: 300),
            shape: BoxShape.rectangle,
            elevation: _toggle2 ? 20 : 0,
            color: Colors.white,
            shadowColor: Colors.black,
            child: const Padding(padding: EdgeInsets.all(16), child: Text('Efek Bayangan')),
          ),
        )),

        // 9. AnimatedDefaultTextStyle
        _item('9. Teks Tumbuh', AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(fontSize: _toggle1 ? 25 : 14, color: _toggle1 ? Colors.purple : Colors.black, fontWeight: _toggle1 ? FontWeight.bold : FontWeight.normal),
          child: const Text('Keren Kan?'),
        )),

        // 10. AnimatedSwitcher
        _item('10. Ganti Konten (Switcher)', Column(children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text('$_counter', key: ValueKey<int>(_counter), style: const TextStyle(fontSize: 40)),
          ),
          ElevatedButton(onPressed: () => setState(() => _counter++), child: const Text('Tambah Angka')),
        ])),
      ],
    );
  }

  Widget _item(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 10),
          Center(child: child),
          const Divider(),
        ],
      ),
    );
  }
}

extension on Widget {
  Widget also(void Function() block) {
    block();
    return this;
  }
}
