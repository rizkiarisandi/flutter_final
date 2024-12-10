import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String time;
  final String description;
  final Icon? icon; // Parameter tambahan untuk ikon

  const InfoCardWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.location,
    required this.time,
    required this.description,
    this.icon, // Parameter opsional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 300, // Sesuaikan lebar gambar
            height: 100, // Sesuaikan tinggi gambar
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                if (icon != null) ...[
                  icon!, // Tampilkan ikon jika tidak null
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}