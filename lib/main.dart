import 'package:flutter/material.dart';

// Variabel global
bool isKodeMemberAktif = false;

// List global untuk menyimpan riwayat transaksi/pembelian
List<Map<String, dynamic>> riwayatPembelian = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechExpress',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainNavigationPage(),
      },
    );
  }
}

// -----------------------------------------------------------------------------
// 1. HALAMAN LOGIN 
// -----------------------------------------------------------------------------
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Farell Dorea'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.devices,
                size: 80,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 16),
              const Text(
                'Selamat Datang di TechExpress',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Masuk Aplikasi', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 2. TAB KATALOG GADGET (BARANG BARU & TEMA ORANGE)
// -----------------------------------------------------------------------------
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  final List<Map<String, dynamic>> gadgets = const [
    {
      'nama': 'Kamera Mirrorless 4K',
      'kategori': 'Kamera',
      'hargaAsli': 7500000,
      'hargaTeks': 'Rp7.500.000',
      'deskripsi': 'Kamera mirrorless canggih dengan perekaman video 4K jernih dan lensa kit universal.',
      'gambar': 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=500',
    },
    {
      'nama': 'Drone Quadcopter Mini',
      'kategori': 'Hobi & Gadget',
      'hargaAsli': 7800000,
      'hargaTeks': 'Rp7.800.000',
      'deskripsi': 'Drone berukuran ringkas dengan stabilitas udara tinggi dan kamera HD.',
      'gambar': 'https://images.unsplash.com/photo-1527977966376-1c8408f9f108?w=500',
    },
    {
      'nama': 'Tablet Grafis Digital',
      'kategori': 'Aksesoris PC',
      'hargaAsli': 1200000,
      'hargaTeks': 'Rp1.200.000',
      'deskripsi': 'Pen tablet presisi tinggi cocok untuk desainer grafis dan ilustrator.',
      'gambar': 'https://images.unsplash.com/photo-1626785774573-4b799315345d?w=500',
    },
    {
      'nama': 'Konsol Game Handheld',
      'kategori': 'Gaming',
      'hargaAsli': 3200000,
      'hargaTeks': 'Rp3.200.000',
      'deskripsi': 'Konsol portabel untuk memainkan game-game favorit di mana saja secara nyaman.',
      'gambar': 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=500',
    },
    {
      'nama': 'Proyektor Portabel HD',
      'kategori': 'Elektronik',
      'hargaAsli': 2800000,
      'hargaTeks': 'Rp2.400.000',
      'deskripsi': 'Proyektor mini dengan koneksi nirkabel cocok untuk bioskop pribadi di rumah.',
      'gambar': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500',
    },
    {
      'nama': 'Powerbank Fast Charge 20k',
      'kategori': 'Aksesoris',
      'hargaAsli': 450000,
      'hargaTeks': 'Rp450.000',
      'deskripsi': 'Powerbank kapasitas 20.000 mAh dengan pengisian cepat untuk semua gadget Anda.',
      'gambar': 'https://picsum.photos/id/367/500/500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text(
          'Katalog Produk',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: gadgets.length,
        itemBuilder: (context, index) {
          final gadget = gadgets[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailGadgetPage(
                    nama: gadget['nama']!,
                    kategori: gadget['kategori']!,
                    hargaAsli: gadget['hargaAsli']!,
                    hargaTeks: gadget['hargaTeks']!,
                    deskripsi: gadget['deskripsi']!,
                    gambarUrl: gadget['gambar']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        gadget['gambar']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.devices, size: 50, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gadget['kategori']!,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          gadget['nama']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          gadget['hargaTeks']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 3. TAB RIWAYAT PEMBELIAN (HistoryPage)
// -----------------------------------------------------------------------------
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pembelian'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: riwayatPembelian.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'Belum ada riwayat pembelian',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: riwayatPembelian.length,
              itemBuilder: (context, index) {
                final item = riwayatPembelian[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item['gambar'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 50,
                          height: 50,
                          color: Colors.deepOrange,
                          child: const Icon(Icons.devices, color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(
                      item['nama'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total: ${item['hargaBayar']}'),
                        Text(
                          'Voucher: ${item['voucher']}',
                          style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                        ),
                        Text(
                          'Waktu: ${item['tanggal']}',
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// -----------------------------------------------------------------------------
// 4. TAB TECHEXPRES PROFIL (ProfilePage)
// -----------------------------------------------------------------------------
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.orange.shade100,
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/300?img=12',
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Farell Dorea',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('farelldorea@techexpress.com'),
                  ],
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              'Kode Member:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            Card(
              child: ListTile(
                leading: const Icon(Icons.card_membership, color: Colors.deepOrange),
                title: Text(
                  isKodeMemberAktif ? 'MEMBER-TECH-9988' : '***-***-***',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  isKodeMemberAktif
                      ? 'Kode aktif! Voucher diskon bisa digunakan.'
                      : 'Klik untuk mengaktifkan voucher diskon',
                ),
                trailing: Icon(
                  isKodeMemberAktif ? Icons.visibility : Icons.visibility_off,
                  color: Colors.deepOrange,
                ),
                onTap: () {
                  setState(() {
                    isKodeMemberAktif = !isKodeMemberAktif;
                  });
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Logout / Keluar'),
                onPressed: () {
                  isKodeMemberAktif = false;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 5. HALAMAN UTAMA / NAVIGATION BAR
// -----------------------------------------------------------------------------
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CatalogPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Katalog'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 6. HALAMAN DETAIL GADGET
// -----------------------------------------------------------------------------
class DetailGadgetPage extends StatefulWidget {
  final String nama;
  final String kategori;
  final int hargaAsli;
  final String hargaTeks;
  final String deskripsi;
  final String gambarUrl;

  const DetailGadgetPage({
    super.key,
    required this.nama,
    required this.kategori,
    required this.hargaAsli,
    required this.hargaTeks,
    required this.deskripsi,
    required this.gambarUrl,
  });

  @override
  State<DetailGadgetPage> createState() => _DetailGadgetState();
}

class _DetailGadgetState extends State<DetailGadgetPage> {
  String statusVoucher = 'Belum diklaim';
  late int hargaSekarang;
  bool isDiskonAktif = false;

  @override
  void initState() {
    super.initState();
    hargaSekarang = widget.hargaAsli;
  }

  String formatRupiah(int angka) {
    return 'Rp${angka.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.gambarUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.devices, size: 90, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.nama,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(widget.kategori),
              backgroundColor: Colors.orange.shade50,
            ),
            const SizedBox(height: 8),
            isDiskonAktif
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hargaTeks,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        formatRupiah(hargaSekarang),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  )
                : Text(
                    widget.hargaTeks,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
            const SizedBox(height: 16),
            const Text(
              'Voucher Diskon:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              statusVoucher,
              style: TextStyle(
                fontSize: 15,
                color: statusVoucher == 'Belum diklaim' ? Colors.grey : Colors.deepOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (!isKodeMemberAktif) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Voucher tidak tersedia! Silakan klik/buka Kode Member di menu Profil terlebih dahulu.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final hasilVoucher = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PilihVoucherPage(),
                    ),
                  );

                  if (hasilVoucher != null) {
                    setState(() {
                      statusVoucher = 'Berhasil diklaim: $hasilVoucher';
                      isDiskonAktif = true;

                      if (hasilVoucher == 'Diskon 10%') {
                        hargaSekarang = (widget.hargaAsli * (100 - 10) ~/ 100);
                      } else if (hasilVoucher == 'Diskon 20%') {
                        hargaSekarang = (widget.hargaAsli * (100 - 20) ~/ 100);
                      } else if (hasilVoucher == 'Diskon 30%') {
                        hargaSekarang = (widget.hargaAsli * (100 - 30) ~/ 100);
                      }
                    });
                  }
                },
                child: const Text('Klaim Voucher Diskon'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  riwayatPembelian.add({
                    'nama': widget.nama,
                    'kategori': widget.kategori,
                    'hargaBayar': formatRupiah(hargaSekarang),
                    'voucher': isDiskonAktif ? statusVoucher : 'Tanpa Voucher',
                    'tanggal': DateTime.now().toString().substring(0, 16),
                    'gambar': widget.gambarUrl,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pembelian berhasil! Cek di menu Riwayat.'),
                      backgroundColor: Colors.deepOrange,
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text('Beli Sekarang', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(widget.deskripsi, style: const TextStyle(fontSize: 14, height: 1.4)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 7. HALAMAN PILIH VOUCHER 
// -----------------------------------------------------------------------------
class PilihVoucherPage extends StatelessWidget {
  const PilihVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> daftarVoucher = ['Diskon 10%', 'Diskon 20%', 'Diskon 30%'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Voucher'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: daftarVoucher.length,
        itemBuilder: (context, index) {
          final voucher = daftarVoucher[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.local_offer, color: Colors.deepOrange),
              title: Text(voucher, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context, voucher);
              },
            ),
          );
        },
      ),
    );
  }
}