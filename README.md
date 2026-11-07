# Kantin Kampus

Aplikasi mobile sederhana untuk melihat menu dan memesan makanan di kantin kampus.
Dibuat dengan Flutter untuk tugas UTS Praktikum Mobile Programming.

## Fitur
- Beranda dengan banner dan informasi kantin
- Daftar menu (makanan, minuman, cemilan) lengkap dengan gambar, harga, dan rating
- Detail menu, bisa memilih jumlah pesanan
- Keranjang: hapus item, isi nama pemesan, dan lihat total harga
- Struk pesanan dengan nomor antrian
- Halaman tentang aplikasi

## Halaman dan Alur Navigasi
```
HomePage -> MenuPage -> DetailPage
              |
              +-> CartPage -> ReceiptPage
HomePage -> AboutPage
```
Perpindahan halaman memakai `Navigator.push()`, kembali dengan `Navigator.pop()`.

Data yang dikirim antarhalaman:
- `MenuPage` ke `DetailPage`: data menu (lewat constructor)
- `DetailPage` ke `MenuPage`: jumlah pesanan (lewat `Navigator.pop(context, jumlah)`)
- `MenuPage` ke `CartPage`: list pesanan (lewat constructor)
- `CartPage` ke `ReceiptPage`: nama pemesan, pesanan, dan total (lewat constructor)
- `CartPage` ke `MenuPage`: `true` kalau pesanan selesai (lewat `Navigator.pop`)

## Materi yang dipakai
- Text, TextStyle, Icon, Color, Container
- Row, Column, dan gabungan keduanya
- margin, padding, SizedBox
- Image.asset dengan width, height, dan BoxFit
- Navigator.push() dan Navigator.pop() (6 halaman)
- Tambahan: StatefulWidget, ListView.builder, TextField, SnackBar

## Struktur Folder
```
   lib/
     main.dart         seluruh kode aplikasi (halaman, data menu, fungsi rupiah)
   assets/images/      gambar menu dan banner
```
## Cara Menjalankan
```
flutter create --platforms=android .
flutter pub get
flutter run
```
