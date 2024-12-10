import 'package:flutter/material.dart';

class DetailProfile extends StatelessWidget {
  // Data pengguna yang akan ditampilkan
  final String nama;
  final String email;
  final String password;

  const DetailProfile({
    Key? key,
    required this.nama,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red.shade100,
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow(Icons.person, 'Nama', nama),
            const Divider(),
            _buildDetailRow(Icons.email, 'Email', email),
            const Divider(),
            _buildDetailRow(Icons.lock, 'Password', password),
            const Divider(),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan detail setiap atribut
  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.red),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
