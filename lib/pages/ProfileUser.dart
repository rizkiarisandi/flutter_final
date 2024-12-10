import 'package:flutter/material.dart';
import 'package:flutter_final/pages/RiwayatDonor.dart';
import 'package:flutter_final/pages/detail/DetailKatasandi.dart';
import 'package:flutter_final/pages/detail/DetailProfile.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Avatar dan informasi pengguna
            Center(
              child: Column(
                children: [
                  // Avatar
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
                  const SizedBox(height: 10),
                  // Nama pengguna
                  const Text(
                    'ARISANDI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // List menu
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ListTile(
                    leading: const Icon(Icons.face, color: Colors.red),
                    title: const Text('Profile'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Aksi ketika opsi ini ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProfile(
                            nama: 'Rizki',
                            email: 'rizki@example.com',
                            password: '123456'
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.history, color: Colors.orange),
                    title: const Text('Riwayat'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Aksi ketika opsi ini ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RiwayatDonor())
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.key, color: Colors.blue),
                    title: const Text('Ubah Kata Sandi'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Aksi ketika opsi ini ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailKatasandi(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.green),
                    title: const Text('Bantuan & Dukungan'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Aksi ketika opsi ini ditekan
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            // Tombol Sign Out dan versi aplikasi
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Aksi tombol sign out
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Version 1.1',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}