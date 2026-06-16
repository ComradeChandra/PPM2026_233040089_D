import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class QuizProfilePage extends StatefulWidget {
  const QuizProfilePage({super.key});

  @override
  State<QuizProfilePage> createState() => _QuizProfilePageState();
}

class _QuizProfilePageState extends State<QuizProfilePage> {
  // === PROFILE STATES ===
  String _name = 'Chandra Harkat Raharja';
  String _prodi = 'Mahasiswa Teknik Informatika';
  String _bio = 'Saya Chandra, mahasiswa Teknik Informatika yang suka belajar hal baru, terutama pengembangan aplikasi mobile.';
  String _pendidikan = 'Universitas Pasundan — Semester 5\nNIM: 233040089';
  String _lokasi = 'Bandung, Jawa Barat';
  String _kontak = '233040089@mail.unpas.ac.id';
  String _skills = 'Flutter • Dart • Java • Git • UI/UX Design';
  XFile? _imageFile;

  // === BONUS EXPERIENCE STATES ===
  String _expTitle = 'Pengalaman Magang';
  String _expDesc = 'Pernah magang sebagai Mobile Developer di PT. Teknologi Indonesia selama 6 bulan.';
  XFile? _expImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text('Quiz Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profil Utama'),
              onTap: () {
                Navigator.pop(context);
                _goToEditProfile();
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Edit Pengalaman (Bonus)'),
              onTap: () {
                Navigator.pop(context);
                _goToEditExp();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Kembali ke Dashboard', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: _imageFile != null 
                        ? (kIsWeb ? NetworkImage(_imageFile!.path) : FileImage(File(_imageFile!.path)) as ImageProvider)
                        : null,
                    child: _imageFile == null ? const Icon(Icons.person, size: 60, color: Colors.white) : null,
                  ),
                  const SizedBox(height: 12),
                  Text(_name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(_prodi, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _SectionCard(icon: Icons.info_outline, title: 'Tentang Saya', content: _bio),
            _SectionCard(icon: Icons.school, title: 'Pendidikan', content: _pendidikan),
            _SectionCard(icon: Icons.location_on, title: 'Lokasi', content: _lokasi),
            _SectionCard(icon: Icons.email, title: 'Kontak', content: _kontak),
            _SectionCard(icon: Icons.star, title: 'Skills', content: _skills),
            
            // === BONUS EXPERIENCE SECTION ===
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Pengalaman', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                    onPressed: _goToEditExp,
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_expImageFile != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: kIsWeb 
                              ? Image.network(_expImageFile!.path, height: 150, width: double.infinity, fit: BoxFit.cover)
                              : Image.file(File(_expImageFile!.path), height: 150, width: double.infinity, fit: BoxFit.cover),
                        ),
                      ),
                    Text(_expTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(_expDesc, style: const TextStyle(color: Colors.black87)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToEditProfile,
        label: const Text('Edit Profil'),
        icon: const Icon(Icons.edit),
      ),
    );
  }

  void _goToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          initialName: _name,
          initialBio: _bio,
          initialPendidikan: _pendidikan,
          initialLokasi: _lokasi,
          initialKontak: _kontak,
          initialSkills: _skills,
          initialImage: _imageFile,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _name = result['name'];
        _bio = result['bio'];
        _pendidikan = result['pendidikan'];
        _lokasi = result['lokasi'];
        _kontak = result['kontak'];
        _skills = result['skills'];
        _imageFile = result['image'];
      });
    }
  }

  void _goToEditExp() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditExperiencePage(
          initialTitle: _expTitle,
          initialDesc: _expDesc,
          initialImage: _expImageFile,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _expTitle = result['title'];
        _expDesc = result['desc'];
        _expImageFile = result['image'];
      });
    }
  }
}

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialBio;
  final String initialPendidikan;
  final String initialLokasi;
  final String initialKontak;
  final String initialSkills;
  final XFile? initialImage;

  const EditProfilePage({
    super.key,
    required this.initialName,
    required this.initialBio,
    required this.initialPendidikan,
    required this.initialLokasi,
    required this.initialKontak,
    required this.initialSkills,
    this.initialImage,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameCtrl;
  late TextEditingController _bioCtrl;
  late TextEditingController _pendidikanCtrl;
  late TextEditingController _lokasiCtrl;
  late TextEditingController _kontakCtrl;
  late TextEditingController _skillsCtrl;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName);
    _bioCtrl = TextEditingController(text: widget.initialBio);
    _pendidikanCtrl = TextEditingController(text: widget.initialPendidikan);
    _lokasiCtrl = TextEditingController(text: widget.initialLokasi);
    _kontakCtrl = TextEditingController(text: widget.initialKontak);
    _skillsCtrl = TextEditingController(text: widget.initialSkills);
    _selectedImage = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _selectedImage != null 
                      ? (kIsWeb ? NetworkImage(_selectedImage!.path) : FileImage(File(_selectedImage!.path)) as ImageProvider)
                      : null,
                  child: _selectedImage == null ? const Icon(Icons.person, size: 60) : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      if (_selectedImage != null)
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.red,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white, size: 18),
                            onPressed: () => setState(() => _selectedImage = null),
                          ),
                        ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                          onPressed: () async {
                            final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (image != null) setState(() => _selectedImage = image);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _field(_nameCtrl, 'Nama Lengkap'),
          _field(_bioCtrl, 'Tentang Saya', maxLines: 3),
          _field(_pendidikanCtrl, 'Pendidikan', maxLines: 2),
          _field(_lokasiCtrl, 'Lokasi'),
          _field(_kontakCtrl, 'Kontak (Email)'),
          _field(_skillsCtrl, 'Skills'),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            onPressed: () {
              Navigator.pop(context, {
                'name': _nameCtrl.text,
                'bio': _bioCtrl.text,
                'pendidikan': _pendidikanCtrl.text,
                'lokasi': _lokasiCtrl.text,
                'kontak': _kontakCtrl.text,
                'skills': _skillsCtrl.text,
                'image': _selectedImage,
              });
            },
            child: const Text('Simpan Perubahan'),
          ),
        ],
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: ctrl,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }
}

class EditExperiencePage extends StatefulWidget {
  final String initialTitle;
  final String initialDesc;
  final XFile? initialImage;

  const EditExperiencePage({super.key, required this.initialTitle, required this.initialDesc, this.initialImage});

  @override
  State<EditExperiencePage> createState() => _EditExperiencePageState();
}

class _EditExperiencePageState extends State<EditExperiencePage> {
  late TextEditingController _titleCtrl;
  late TextEditingController _descCtrl;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.initialTitle);
    _descCtrl = TextEditingController(text: widget.initialDesc);
    _selectedImage = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Pengalaman')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Gambar Pengalaman:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (_selectedImage != null)
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: kIsWeb ? NetworkImage(_selectedImage!.path) : FileImage(File(_selectedImage!.path)) as ImageProvider,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.red, size: 30),
                  onPressed: () => setState(() => _selectedImage = null),
                ),
              ],
            ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () async {
              final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) setState(() => _selectedImage = image);
            },
            icon: const Icon(Icons.image),
            label: Text(_selectedImage == null ? 'Pilih Gambar' : 'Ganti Gambar'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _titleCtrl,
            decoration: const InputDecoration(labelText: 'Judul Pengalaman', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descCtrl,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Deskripsi Singkat', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            onPressed: () {
              Navigator.pop(context, {
                'title': _titleCtrl.text,
                'desc': _descCtrl.text,
                'image': _selectedImage,
              });
            },
            child: const Text('Simpan Pengalaman'),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  const _SectionCard({required this.icon, required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(content, style: const TextStyle(height: 1.4, color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
