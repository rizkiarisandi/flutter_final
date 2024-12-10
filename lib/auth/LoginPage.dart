import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/auth/RegisterPage.dart'; // Pastikan file RegisterPage.dart berada di folder yang benar
import 'package:flutter_final/pages/HomePage.dart'; // Pastikan path HomePage.dart sudah benar

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false; // State untuk mengatur visibilitas password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Logo PMI
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_pmi.png', // Pastikan path gambar benar
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Palang Merah Indonesia',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Judul Login
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Login ke akun sobat damai',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),

              // Input Email atau Nomor Telepon
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan nomor telepon atau email Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
              const SizedBox(height: 15),

              // Input Password
              TextField(
                obscureText: !_isPasswordVisible, // Password tersembunyi jika _isPasswordVisible = false
                decoration: InputDecoration(
                  hintText: 'Masukkan kata sandi Anda',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility // Icon ketika password terlihat
                          : Icons.visibility_off, // Icon ketika password tersembunyi
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // Toggle visibilitas password
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Login
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi login: Navigasi ke halaman HomePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login Now',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Tombol Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Lupa Password"),
                        content: const Text("Fitur ini akan segera tersedia."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Link Register
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Kamu belum punya akun? ',
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Register now',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigasi ke halaman Register
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}