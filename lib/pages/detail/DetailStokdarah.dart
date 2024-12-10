import 'package:flutter/material.dart';

class DetailStokdarah extends StatelessWidget {
  final String image;
  final String title;
  final String details;
  final List<Map<String, dynamic>> stokDarahList;

  const DetailStokdarah({
    Key? key,
    required this.image,
    required this.title,
    required this.details,
    required this.stokDarahList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gambar
          SizedBox.expand(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          // Konten di atas gambar
          SingleChildScrollView(
            child: Column(
              children: [
                // Bagian Header dengan Gambar dan Overlay
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          details,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Card Golongan Darah
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: stokDarahList.length,
                        itemBuilder: (context, index) {
                          final item = stokDarahList[index];
                          return _stokDarahCard(
                            item['golongan'],
                            item['stok'],
                            item['statusColor'],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tombol Back
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan Card Stok Darah
  Widget _stokDarahCard(String golongan, String stok, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/loogo bd.png', // Path icon golongan darah
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            'Golongan Darah $golongan',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Total Tersedia: $stok stok darah'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _statusIndicator(Colors.green, active: statusColor == Colors.green),
              _statusIndicator(Colors.yellow, active: statusColor == Colors.yellow),
              _statusIndicator(Colors.red, active: statusColor == Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan indikator status
  Widget _statusIndicator(Color color, {bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: CircleAvatar(
        radius: 8,
        backgroundColor: active ? color : Colors.grey[300],
      ),
    );
  }
}
