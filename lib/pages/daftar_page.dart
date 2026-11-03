
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/catatan_store.dart';
import 'form_page.dart';
import 'detail_page.dart';

class DaftarPage extends StatelessWidget {
  const DaftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final catatanStore = context.watch<CatatanStore>();
    final daftarCatatan = catatanStore.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Catatan'),
      ),
      body: daftarCatatan.isEmpty
          ? const Center(
        child: Text(
          'Belum ada catatan.\nSilakan tambahkan catatan baru.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarCatatan.length,
        itemBuilder: (context, index) {
          final catatan = daftarCatatan[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.book),
              ),
              title: Text(catatan.judul),
              subtitle: Text(catatan.mataKuliah),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(catatan: catatan),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
