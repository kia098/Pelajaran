//Latihan 1: Tambah Manajemen Kategori (Mudah)

//Izinkan pengguna membuat kategori custom daripada menggunakan yang sudah ditentukan.

class CategoryManager {
  List<String> _categories = ['Makanan', 'Transportasi', 'Tagihan'];

  void addCategory(String category) {
    if (category.isEmpty) {
      print('❌ Nama kategori tidak boleh kosong');
      return;
    }
    if (_categories.contains(category)) {
      print('⚠ Kategori sudah ada');
      return;
    }
    _categories.add(category);
    print('✅ Kategori "$category" ditambahkan');
  }

  void removeCategory(String category) {
    if (_categories.contains(category)) {
      _categories.remove(category);
      print('🗑 Kategori "$category" dihapus');
    } else {
      print('❌ Kategori tidak ditemukan');
    }
  }

  List<String> get allCategories => List.unmodifiable(_categories);
}

void main() {
  var manager = CategoryManager();

  manager.addCategory('Hiburan');
  manager.addCategory('Investasi');
  manager.removeCategory('Tagihan');

  print('\n📌 Semua kategori sekarang:');
  for (var c in manager.allCategories) {
    print('- $c');
  }
}