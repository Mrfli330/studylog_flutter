
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/catatan.dart';
import '../providers/catatan_store.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _mataKuliahController = TextEditingController();
  final _judulController = TextEditingController();
  final _isiController = TextEditingController();

  @override
  void dispose() {
    _mataKuliahController.dispose();
    _judulController.dispose();
    _isiController.dispose();
    super.dispose();
  }

  void _simpanCatatan() {
    if (!_formKey.currentState!.validate()) return;

    final store = context.read<CatatanStore>();

    final catatan = Catatan(
      id: DateTime.now().millisecondsSinceEpoch,
      mataKuliah: _mataKuliahController.text.trim(),
      judul: _judulController.text.trim(),
      isi: _isiController.text.trim(),
      tanggal: DateTime.now(),
    );

    store.tambah(catatan);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Catatan berhasil ditambahkan!'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _mataKuliahController,
                decoration: const InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mata kuliah wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul Catatan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Judul wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _isiController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Isi Catatan',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.notes),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Isi catatan wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _simpanCatatan,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Catatan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
