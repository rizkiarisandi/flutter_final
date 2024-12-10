import 'package:flutter/material.dart';

class RiwayatDonor extends StatelessWidget {
  const RiwayatDonor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Donor'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Informasi Utama
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset(
                      'assets/images/bg profile.png', // Ubah sesuai lokasi file Anda
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Donasi Anda.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Jumlah Sebanyak: 10x',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Tambah Donasi Baru Action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Tambah Donasi Baru'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Daftar Riwayat Donor
              const Text(
                'Daftar Riwayat Donor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ..._buildDonationCards(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDonationCards() {
    final List<Map<String, String>> donationData = [
      {
        'date': '12 November 2024',
        'location': 'RS. Mitra Keluarga Tegal',
        'volume': '350 ml',
        'status': 'Berhasil',
        'image': 'assets/images/RS Mitra Keluarga.png',
      },
      {
        'date': '20 November 2024',
        'location': 'RS. Mitra Siaga Tegal',
        'volume': '100 ml',
        'status': 'Berhasil',
        'image': 'assets/images/bg donor.jpeg',
      },
      {
        'date': '28 November 2024',
        'location': 'RS. Muhammadiyah Tegal',
        'volume': '350 ml',
        'status': 'Gagal',
        'image': 'assets/images/bg donor.jpeg',
      },
      {
        'date': '12 November 2024',
        'location': 'RS. Harapan Anda Tegal',
        'volume': '350 ml',
        'status': 'Berhasil',
        'image': 'assets/images/RSI Harapan Anda Tegal.png',
      },
    ];

    return donationData.map((data) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Image.asset(
            data['image']!,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          title: Text(data['location']!),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tanggal: ${data['date']}'),
              Text('Volume: ${data['volume']}'),
              Text(
                'Status Donasi: ${data['status']}',
                style: TextStyle(
                  color: data['status'] == 'Berhasil' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}

