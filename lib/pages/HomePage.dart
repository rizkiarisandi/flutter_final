import 'package:flutter/material.dart';
import 'package:flutter_final/pages/LokasiDonor.dart';
import 'package:flutter_final/pages/RiwayatDonor.dart';
import 'package:flutter_final/pages/detail/VirtualAssistantPage.dart';
import 'package:flutter_final/widgets/info_card_widget.dart';
import 'package:flutter_final/widgets/address_card_widget.dart';
import 'package:flutter_final/widgets/banner_widget.dart';
import 'package:flutter_final/pages/ProfileUser.dart';
import 'package:flutter_final/pages/detail/DetailInformasi.dart';
import 'package:flutter_final/pages/detail/DetailStokdarah.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Palang Merah Indonesia',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Hai, Arisandi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
            const Icon(Icons.notifications, color: Colors.white),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari topik, atau yang lainnya',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Cek Kondisi Kesehatan Banner
            BannerWidget(
              color: Colors.white,
              text: 'Cek kondisi kesehatan yuk!',
              buttonText: 'CEK',
              buttonColor: Colors.redAccent,
              onPressed: () {
                //Aksi tombol
              },
              imageUrl: 'assets/images/cek_kondisi.png', // Tambahkan gambar
            ),
            const SizedBox(height: 20),

            //Virtual assistent
            BannerWidget(
             color: Colors.white,
             text: 'Ayo Tanya Kami!\nVirtual Assistant',
             buttonText: 'KLIK DISINI',
             buttonColor: Colors.redAccent,
             onPressed: () {
              // Aksi tombol
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => const VirtualAssistantPage()
                ),
              );
              },
              imageUrl: 'assets/images/virtual_assistant.png', // Tambahkan gambar
            ),
            const SizedBox(height: 20),

            // Informasi Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Informasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lihat semua',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<Map<String, String>> infoData = [
                    {
                      'image': 'assets/images/location1.png',
                      'title': 'DONOR DARAH DI SMA NEGERI 2',
                      'location': 'Kota Tegal',
                      'time': '09:00 - 12:00',
                      'description': 'Deskripsi singkat tentang acara donor darah di SMA Negeri 2.',
                    },
                    {
                      'image': 'assets/images/location2.png',
                      'title': 'DONOR DARAH DI KANTOR PMI',
                      'location': 'Kabupaten Brebes',
                      'time': '10:00 - 14:00',
                      'description': 'Deskripsi singkat tentang acara donor darah di Kantor PMI.',
                    },
                    {
                      'image': 'assets/images/location2.png',
                      'title': 'DONOR DARAH DI RSUD KOTA TEGAL',
                      'location': 'Kota Tegal',
                      'time': '08:00 - 13:00',
                      'description': 'Deskripsi singkat tentang acara donor darah di RSUD Kota Tegal.',
                    },
                    {
                      'image': 'assets/images/location2.png',
                      'title': 'DONOR DARAH DI UNIVERSITAS PANCASAKTI',
                      'location': 'Kota Tegal',
                      'time': '07:00 - 12:00',
                      'description': 'Deskripsi singkat tentang acara donor darah di Universitas Pancasakti.',
                    },
                    {
                      'image': 'assets/images/location2.png',
                      'title': 'DONOR DARAH DI UNIVERSITAS BAHMADA',
                      'location': 'Kabupaten Tegal',
                      'time': '09:00 - 15:00',
                      'description': 'Deskripsi singkat tentang acara donor darah di Universitas Bahmada.',
                    },
                  ];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailInformasi(
                            image: infoData[index]['image']!,
                            title: infoData[index]['title']!,
                            location: infoData[index]['location']!,
                            time: infoData[index]['time']!,
                            description: infoData[index]['description']!,
                          ),
                        ),
                      );
                    },
                    child: InfoCardWidget(
                      image: infoData[index]['image']!,
                      title: infoData[index]['title']!,
                      location: infoData[index]['location']!,
                      time: infoData[index]['time']!,
                      description: infoData[index]['description']!, icon: null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Stok Donor Darah Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Stok Darah Di Wilayah Anda',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lihat semua',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> donorData = [
                    {
                      'image': 'assets/images/bg donor.jpeg',
                      'title': 'RSI HARAPAN ANDA TEGAL',
                      'details': 'Total Stok Darah: 100\nReady Stok Darah: Golongan A, Golongan O',
                      'bloodGroups': ['A', 'O'], // Golongan darah
                    },
                    {
                      'image': 'assets/images/RS Mitra Keluarga.png',
                      'title': 'RS MITRA KELUARGA',
                      'details': 'Total Stok Darah: 150\nReady Stok Darah: Golongan B, Golongan AB',
                      'bloodGroups': ['B', 'AB'],
                    },
                    {
                      'image': 'assets/images/pmi-tegal.png',
                      'title': 'Kantor PMI Kab.Tegal',
                      'details': 'Total Stok Darah: 80\nReady Stok Darah: Golongan A, Golongan O',
                      'bloodGroups': ['A', 'O'],
                    },
                    {
                      'image': 'assets/images/bg donor3.jpeg',
                      'title': 'RS SANTOSA BANDUNG',
                      'details': 'Total Stok Darah: 200\nReady Stok Darah: Golongan B, Golongan AB, Golongan O',
                      'bloodGroups': ['B', 'AB', 'O'],
                    },
                    {
                      'image': 'assets/images/bg donor4.jpeg',
                      'title': 'RSU PELITA KASIH YOGYAKARTA',
                      'details': 'Total Stok Darah: 120\nReady Stok Darah: Golongan A, Golongan B',
                      'bloodGroups': ['A', 'B'],
                    },
                  ];

                  // Ambil data berdasarkan index
                  final item = donorData[index];

                  return GestureDetector(
                    onTap: () {
                     // Navigasi ke halaman DetailStokDarah
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailStokdarah(
                            image: item['image']!,
                            title: item['title']!,
                            details: item['details']!,
                              stokDarahList: [
                              // Menciptakan list stok darah di sini, bisa diubah sesuai kebutuhan
                              {'golongan': 'A', 'stok': '50', 'statusColor': Colors.green},
                              {'golongan': 'O', 'stok': '30', 'statusColor': Colors.yellow},
                              {'golongan': 'B', 'stok': '70', 'statusColor': Colors.green},
                              {'golongan': 'AB', 'stok': '40', 'statusColor': Colors.red},
                            ],
                          ),
                        ),
                      );
                    },
                    child: AddressCardWidget(
                      image: item['image']!,
                      title: item['title']!,
                      details: item['details']!,
                  ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Langkah Untuk Donor Darah
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerWidget(
                  color: Colors.white,
                  text: 'Panduan Umum!\nPermohonan Darah!',
                  buttonText: 'CEK',
                  buttonColor: Colors.redAccent,
                  onPressed: () {
                    //Aksi tombol
                  },
                  imageUrl: 'assets/images/bg manfaat.png', // Tambahkan gambar
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.redAccent),
              onPressed: () {
                // Navigasi ke halaman Home jika diperlukan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.location_on, color: Colors.redAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LokasiDonor()),
                ); // Navigasi ke halaman Lokasi jika diperlukan
              },
            ),
            IconButton(
              icon: Icon(Icons.article, color: Colors.redAccent),
              onPressed: () {
                // Navigasi ke halaman RiwayatDonor
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RiwayatDonor())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.redAccent),
              onPressed: () {
                // Navigasi ke halaman ProfileUser
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUser()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}