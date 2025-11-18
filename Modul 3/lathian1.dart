//Latihan 1: Buat Class Budget (Mudah)

//Buat class `Budget` dengan:

//- Properties: `category`, `limit`, `month`, `year`
//- Constructor biasa
//- Named constructor `Budget.monthly(category, limit)` yang menggunakan bulan/tahun saat ini

class Budget {
  String category;
  double limit;
  int month;
  int year;

  Budget({
    required this.category,
    required this.limit,
    required this.month,
    required this.year,
  });
  Budget.monthly(this.category, this.limit)
      : month = DateTime.now().month,
        year = DateTime.now().year;

  String getSummary() {
    return 'Kategori: $category, Limit: \$${limit.toStringAsFixed(2)}, Bulan: $month, Tahun: $year';
  }
}

void main() {
  var makanan = Budget(category: 'Makanan', limit: 500, month: 9, year: 2025);
  var tran = Budget.monthly('Transport', 300);

  print(makanan.getSummary());
  print(tran.getSummary());
}