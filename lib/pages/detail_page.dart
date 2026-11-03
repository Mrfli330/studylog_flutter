
import 'package:flutter/material.dart';
import '../models/catatan.dart';

class DetailPage extends StatelessWidget {
  final Catatan catatan;

  const DetailPage({
    super.key,
    required this.catatan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.menu_book,
              size: 55,
              color: Colors.indigo,
            ),
            const SizedBox(height: 20),

            Text(
              catatan.judul,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.school, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    catatan.mataKuliah,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              'Tanggal: ${catatan.tanggal.day}/'
                  '${catatan.tanggal.month}/'
                  '${catatan.tanggal.year}',
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(height: 32),

            const Text(
              'Isi Catatan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Text(
              catatan.isi,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
