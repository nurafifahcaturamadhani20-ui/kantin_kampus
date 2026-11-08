import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

final List<Map<String, dynamic>> daftarMenu = [
  {
    'nama': 'Nasi Goreng',
    'kategori': 'Makanan',
    'harga': 13000,
    'gambar': 'assets/images/nasi_goreng.jpg',
    'rating': 4.7,
    'deskripsi':
        'Nasi goreng bumbu kampung dengan telur mata sapi dan irisan timun. '
            'Porsinya cukup banyak, pas buat yang habis kuliah pagi.',
  },
  {
    'nama': 'Mie Ayam',
    'kategori': 'Makanan',
    'harga': 12000,
    'gambar': 'assets/images/mie_ayam.jpg',
    'rating': 4.6,
    'deskripsi':
        'Mie kenyal dengan topping ayam kecap dan daun bawang. '
            'Bisa minta tambah sambal kalau suka pedas.',
  },
  {
    'nama': 'Soto Ayam',
    'kategori': 'Makanan',
    'harga': 14000,
    'gambar': 'assets/images/soto_ayam.jpg',
    'rating': 4.5,
    'deskripsi':
        'Soto ayam kuah kuning hangat, isinya suwiran ayam, telur rebus, '
            'dan taburan bawang goreng.',
  },
  {
    'nama': 'Ayam Geprek',
    'kategori': 'Makanan',
    'harga': 15000,
    'gambar': 'assets/images/ayam_geprek.jpg',
    'rating': 4.8,
    'deskripsi':
        'Ayam crispy yang digeprek bareng sambal bawang, disajikan dengan '
            'nasi putih dan lalapan. Menu paling laris di kantin.',
  },
  {
    'nama': 'Es Teh Manis',
    'kategori': 'Minuman',
    'harga': 4000,
    'gambar': 'assets/images/es_teh.png',
    'rating': 4.4,
    'deskripsi':
        'Teh manis dingin yang segar, cocok diminum siang-siang '
            'waktu cuaca lagi panas.',
  },
  {
    'nama': 'Es Jeruk',
    'kategori': 'Minuman',
    'harga': 5000,
    'gambar': 'assets/images/es_jeruk.jpg',
    'rating': 4.5,
    'deskripsi':
        'Perasan jeruk asli dengan es batu. Rasanya asam-manis dan segar.',
  },
  {
    'nama': 'Kopi Susu',
    'kategori': 'Minuman',
    'harga': 8000,
    'gambar': 'assets/images/kopi_susu.png',
    'rating': 4.6,
    'deskripsi':
        'Kopi susu gula aren, teman begadang ngerjain tugas dan laporan praktikum.',
  },
  {
    'nama': 'Pisang Goreng',
    'kategori': 'Cemilan',
    'harga': 5000,
    'gambar': 'assets/images/pisang_goreng.jpg',
    'rating': 4.3,
    'deskripsi':
        'Pisang goreng tepung renyah, satu porsi isi tiga potong. '
            'Enak dimakan selagi masih hangat.',
  },
];

String rupiah(int angka) {
  String teks = angka.toString();
  String hasil = '';
  int hitung = 0;
  for (int i = teks.length - 1; i >= 0; i--) {
    hasil = teks[i] + hasil;
    hitung++;
    if (hitung % 3 == 0 && i != 0) {
      hasil = '.$hasil';
    }
  }
  return 'Rp $hasil';
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget kotakInfo(IconData ikon, String judul, String isi) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(ikon, color: Colors.deepOrange, size: 28),
            const SizedBox(height: 6),
            Text(
              judul,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            Text(
              isi,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Kampus'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/banner.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lapar di sela kuliah?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lihat menu kantin dan pesan langsung dari HP, '
                    'jadi nggak perlu antre lama.',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  kotakInfo(Icons.restaurant_menu, '8 Menu', 'makanan, minuman, cemilan'),
                  kotakInfo(Icons.access_time, 'Jam Buka', '07.00 - 16.00'),
                  kotakInfo(Icons.savings, 'Harga Murah', 'mulai Rp 4.000'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.fastfood),
                      label: const Text('Lihat Menu', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MenuPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.info_outline),
                      label: const Text('Tentang Aplikasi'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AboutPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Map<String, dynamic>> pesanan = [];

  void bukaDetail(Map<String, dynamic> menu) async {
    final jumlah = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(menu: menu)),
    );

    if (!mounted) return;
    if (jumlah != null && jumlah > 0) {
      setState(() {
        bool sudahAda = false;
        for (var p in pesanan) {
          if (p['nama'] == menu['nama']) {
            p['jumlah'] = p['jumlah'] + jumlah;
            sudahAda = true;
          }
        }
        if (!sudahAda) {
          pesanan.add({
            'nama': menu['nama'],
            'harga': menu['harga'],
            'jumlah': jumlah,
          });
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${menu['nama']} x$jumlah masuk keranjang')),
      );
    }
  }

  void bukaKeranjang() async {
    final selesai = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (context) => CartPage(pesanan: pesanan)),
    );

    if (!mounted) return;
    setState(() {
      if (selesai == true) {
        pesanan.clear();
      }
    });
  }

  int hitungItem() {
    int total = 0;
    for (var p in pesanan) {
      total += p['jumlah'] as int;
    }
    return total;
  }

  Widget kartuMenu(Map<String, dynamic> menu) {
    return GestureDetector(
      onTap: () => bukaDetail(menu),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                menu['gambar'],
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu['nama'],
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menu['kategori'],
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        rupiah(menu['harga']),
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' ${menu['rating']}', style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Daftar Menu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Text('${hitungItem()}', style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: bukaKeranjang,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarMenu.length,
        itemBuilder: (context, index) {
          return kartuMenu(daftarMenu[index]);
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> menu;

  const DetailPage({super.key, required this.menu});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    final menu = widget.menu;
    int subtotal = menu['harga'] * jumlah;

    return Scaffold(
      appBar: AppBar(
        title: Text(menu['nama']),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              menu['gambar'],
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          menu['nama'],
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        rupiah(menu['harga']),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(menu['kategori']),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(' ${menu['rating']}'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    menu['deskripsi'],
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Jumlah', style: TextStyle(fontSize: 16)),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (jumlah > 1) {
                                  setState(() {
                                    jumlah--;
                                  });
                                }
                              },
                            ),
                            Text(
                              '$jumlah',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setState(() {
                                  jumlah++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Subtotal: ${rupiah(subtotal)}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Tambah ke Keranjang', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.pop(context, jumlah);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> pesanan;

  const CartPage({super.key, required this.pesanan});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController namaController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }

  int hitungTotal() {
    int total = 0;
    for (var p in widget.pesanan) {
      total += (p['harga'] as int) * (p['jumlah'] as int);
    }
    return total;
  }

  void pesanSekarang() async {
    if (namaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Isi nama pemesan dulu ya')),
      );
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptPage(
          nama: namaController.text.trim(),
          pesanan: widget.pesanan,
          total: hitungTotal(),
        ),
      ),
    );

    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final pesanan = widget.pesanan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: pesanan.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.remove_shopping_cart, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('Keranjang masih kosong', style: TextStyle(fontSize: 16)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: pesanan.length,
                    itemBuilder: (context, index) {
                      final p = pesanan[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p['nama'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text('${rupiah(p['harga'])} x ${p['jumlah']}'),
                                ],
                              ),
                            ),
                            Text(
                              rupiah(p['harga'] * p['jumlah']),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  pesanan.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: namaController,
                        decoration: const InputDecoration(
                          labelText: 'Nama pemesan',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total', style: TextStyle(fontSize: 16)),
                          Text(
                            rupiah(hitungTotal()),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: pesanSekarang,
                          child: const Text('Pesan Sekarang', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class ReceiptPage extends StatelessWidget {
  final String nama;
  final List<Map<String, dynamic>> pesanan;
  final int total;

  const ReceiptPage({
    super.key,
    required this.nama,
    required this.pesanan,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    int nomorAntrian = Random().nextInt(50) + 1;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Pesanan Berhasil'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 72),
            const SizedBox(height: 8),
            const Text(
              'Terima kasih!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nama pemesan'),
                      Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nomor antrian'),
                      Text(
                        '#$nomorAntrian',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  for (var p in pesanan)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${p['nama']} x${p['jumlah']}'),
                          Text(rupiah(p['harga'] * p['jumlah'])),
                        ],
                      ),
                    ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total bayar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        rupiah(total),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Selesai', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.restaurant, color: Colors.white, size: 48),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Kantin Kampus',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(child: Text('Versi 1.0')),
            const SizedBox(height: 24),

            const Text(
              'Tujuan Aplikasi',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Aplikasi ini dibuat untuk memudahkan mahasiswa melihat menu kantin '
              'dan memesan makanan tanpa harus antre lama.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),

            const Text(
              'Dibuat oleh',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama : Nur Afifah Catur Ramadhani'),
                  SizedBox(height: 4),
                  Text('NPM  : 25670085'),
                  SizedBox(height: 4),
                  Text('UTS Mobile Programming'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

