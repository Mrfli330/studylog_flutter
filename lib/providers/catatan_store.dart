
import 'package:flutter/foundation.dart';
import '../models/catatan.dart';

class CatatanStore extends ChangeNotifier {
  final List<Catatan> _data = [];

  List<Catatan> get data => List.unmodifiable(_data);

  void tambah(Catatan catatan) {
    _data.add(catatan);
    notifyListeners();
  }
}
