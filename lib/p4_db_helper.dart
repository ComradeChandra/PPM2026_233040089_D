import 'p4_main.dart' show Catatan;

// Mock DbHelper untuk Web (karena sqflite gak support Chrome)
class DbHelper {
  DbHelper._();
  static final DbHelper instance = DbHelper._();

  // Simpan di memori aja kalau di Web biar bisa di-run di Chrome
  static final List<Catatan> _mockDb = [];
  static int _nextId = 1;

  Future<void> get database async {}

  Future<int> insert(Catatan c) async {
    final baru = Catatan(
      id: _nextId++,
      judul: c.judul,
      isi: c.isi,
      kategori: c.kategori,
      dibuatPada: c.dibuatPada,
    );
    _mockDb.add(baru);
    return baru.id!;
  }

  Future<List<Catatan>> getAll() async {
    // Balikin list yang diurutin berdasarkan tanggal terbaru
    final list = List<Catatan>.from(_mockDb);
    list.sort((a, b) => b.dibuatPada.compareTo(a.dibuatPada));
    return list;
  }

  Future<int> update(Catatan c) async {
    final index = _mockDb.indexWhere((item) => item.id == c.id);
    if (index != -1) {
      _mockDb[index] = c;
      return 1;
    }
    return 0;
  }

  Future<int> delete(int id) async {
    _mockDb.removeWhere((item) => item.id == id);
    return 1;
  }
}
