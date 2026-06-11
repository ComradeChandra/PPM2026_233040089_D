# Laporan Praktikum Pemrograman Mobile - Pertemuan 2

**Nama:** Chandra Harkat Raharja  
**NPM:** 233040089  
**Kelas:** Praktikum Pemograman Mobile (D)  
**Link Github:** [https://github.com/ComradeChandra/PPM2026_233040089_D](https://github.com/ComradeChandra/PPM2026_233040089_D)

---

## Hasil Praktikum (Goal Checklist, Screenshot & Penjelasan)

### 1. Scaffold Slot
- [x] Punya 5 slot Scaffold terisi (appBar, drawer, body, FAB, bottomNav)
> **Screenshot:** (Halaman Profile utama yang menunjukkan AppBar, Drawer, Body, FAB, dan BottomNav)
**Penjelasan:** Menggunakan widget `Scaffold` sebagai kerangka dasar halaman untuk menempatkan komponen navigasi dan aksi secara terstruktur sesuai standar Material Design.

### 2. Scrollable Body
- [x] Body Profile Page bisa di-scroll sampai bawah tanpa overflow
> **Screenshot:** (Saat melakukan scroll pada halaman Profile sampai ke bagian paling bawah)
**Penjelasan:** Membungkus konten utama dengan `SingleChildScrollView` untuk memastikan halaman tetap bisa diakses meskipun jumlah konten melebihi tinggi layar.

### 3. Widget Gallery Access
- [x] Halaman Widget Gallery (diakses via Drawer) jalan dengan 6 kategori
> **Screenshot:** (Drawer terbuka yang menampilkan menu pilihan ke Widget Gallery)
**Penjelasan:** Memanfaatkan `Drawer` untuk menyimpan navigasi sekunder, sehingga layar utama tetap bersih dan fokus pada informasi profil.

### 4. Interaksi Feedback
- [x] Sudah pernah menampilkan SnackBar dan AlertDialog sendiri
> **Screenshot:** (SnackBar muncul setelah klik FAB atau AlertDialog muncul setelah klik Pengaturan)
**Penjelasan:** Mengimplementasikan `ScaffoldMessenger` untuk notifikasi cepat dan `showDialog` untuk interaksi konfirmasi yang bersifat interuptif.

### 5. Layouting dengan Wrap & Chip
- [x] Tambahkan Section Card ke-5 berjudul "Skills" dengan isi Wrap berisi Chip
> **Screenshot:** (Bagian section Skills yang berisi daftar Chip keahlian)
**Penjelasan:** Widget `Wrap` digunakan agar susunan `Chip` bersifat adaptif (pindah baris otomatis) tergantung pada lebar layar yang tersedia.

### 6. Animation Gallery (Top 10)
- [x] Menampilkan demo 10 animasi berbeda pada Widget Gallery
> **Screenshot:** (Kategori 'Animation' di Widget Gallery yang menampilkan berbagai demo animasi)
**Penjelasan:** Mengimplementasikan berbagai kelas animasi seperti `RotationTransition` (muter terus) dan `AnimatedContainer` (interaktif) untuk mempercantik pengalaman pengguna.

---

## Kesimpulan Kode
Pada pertemuan ini, saya berhasil membangun struktur aplikasi yang lebih kompleks dengan memanfaatkan fitur-fitur `Scaffold`. Pemisahan logika ke dalam kategori-kategori widget di Gallery sangat membantu dalam memahami peran masing-masing komponen Flutter.
