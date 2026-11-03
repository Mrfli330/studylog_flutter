
import 'package:flutter/material.dart';
import 'daftar_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudyLog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Text(
              'Selamat Datang di StudyLog!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Catat dan kelola aktivitas perkuliahanmu '
                  'dengan lebih mudah.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DaftarPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.book),
                label: const Text('Lihat Daftar Catatan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
