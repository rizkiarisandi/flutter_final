import 'package:flutter/material.dart';

class LokasiDonor extends StatefulWidget {
  @override
  _LokasiDonorState createState() => _LokasiDonorState();
}

class _LokasiDonorState extends State<LokasiDonor> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> lokasiList = [
    {
      'title': 'RS.Mitra Keluarga Tegal',
      'details': 'Jl. Sipelem No.4,Kemandungan,Kraton,\nKota Tegal,Jawa Tengah 52114\nWhatsApp: +62283340999',
      'image': 'assets/images/RS Mitra Keluarga.png',
    },
    {
      'title': 'RS.Muhammadiyah Tegal',
      'details': 'Jl. Singkil Km.0,5 Adiwerna-Tegal 52194,Tegal\nWhatsApp: (0283)3448131',
      'image': 'assets/images/bg donor.jpeg',
    },
    {
      'title': 'RSI.Harapan Anda Tegal',
      'details': 'Jl. Ababil No.42 Kota Tegal\nWhatsApp: (0283)358244',
      'image': 'assets/images/RSI Harapan Anda Tegal.png',
    },
    {
      'title': 'RS.Soesilo Slawi',
      'details': 'Jl. Dokter Wahidin 52419 Slawi Wetan,\nKabupaten Tegal,Tegal,Jawa Tengah\nWhatsApp: +62283491016',
      'image': 'assets/images/bg donor.jpeg',
    },
  ];

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = lokasiList;
  }

  void _filterLokasi(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = lokasiList;
      } else {
        filteredList = lokasiList.where((lokasi) {
          return lokasi['title']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari lokasi donor...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.filter_list, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: _filterLokasi,
            ),
          ),
          // List of Locations
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                var lokasi = filteredList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                  child: Stack(
                    children: [
                      // Gambar memenuhi card
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          lokasi['image']!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 150,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Informasi di atas gambar
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lokasi['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              lokasi['details']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Tombol di pojok kanan atas
                      Positioned(
                        right: 16,
                        top: 16,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Aksi tombol
                          },
                          child: const Text(
                            'Lokasi Saya',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
