import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart'; // Sesuaikan path OnboardingPage
import '../auth/LoginPage.dart'; // Sesuaikan path LoginPage

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(); // Inisialisasi PageController
  int _currentIndex = 0; // Indeks halaman aktif

  // Daftar halaman onboarding
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/logo_pmi.png", // Path gambar logo PMI
      "title": "Donor Darah",
      "description": "Ayoo Donor Sekarang Juga!",
    },
    {
      "image": "assets/images/logo_pmi.png",
      "title": "Layanan Lengkap",
      "description": "Jaga kesehatan mentalmu dengan berbagai fitur yang tersedia",
    },
  ];

  // Widget halaman onboarding
  List<Widget> _buildPages() {
    return onboardingData.map((data) {
      return OnboardingPage(
        image: data['image']!,
        title: data['title']!,
        description: data['description']!,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Widget PageView untuk menampilkan halaman onboarding
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index; // Update indeks aktif
              });
            },
            children: _buildPages(),
          ),

          // Tombol Skip di pojok kanan atas
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                _pageController.jumpToPage(onboardingData.length - 1); // Loncat ke halaman terakhir
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Indikator halaman dan tombol "Lanjut" di bagian bawah
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Indikator titik untuk halaman
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => buildDot(index),
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol "Lanjut"
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex < onboardingData.length - 1) {
                      // Pindah ke halaman berikutnya
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Navigasi ke halaman LoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Lanjut"),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk indikator titik halaman
  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: _currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}