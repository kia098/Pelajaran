//Latihan 1: Method Berbasis Waktu (Mudah)

//Tambahkan method ini ke class Expense:

//1. `getWeekNumber()` - mengembalikan nomor minggu dalam tahun
//2. `getQuarter()` - mengembalikan kuartal (1-4) dari pengeluaran
//3. `isWeekend()` - mengembalikan true jika pengeluaran di hari Sabtu atau Minggu

class ExpenseTime {
  String description;
  double amount;
  String category;
  DateTime date;

  ExpenseTime({
    this.description = "",
    this.amount = 0,
    this.category = "",
    DateTime? date,
  }) : date = date ?? DateTime.now();

  // Nomor minggu dalam tahun
  int getWeekNumber() {
    final startOfYear = DateTime(date.year, 1, 1);
    final diffDays = date.difference(startOfYear).inDays + 1;
    return ((diffDays + (startOfYear.weekday - 1)) / 7).ceil();
  }

  // Kuartal ke berapa (1–4)
  int getQuarter() {
    if (date.month <= 3) return 1;
    if (date.month <= 6) return 2;
    if (date.month <= 9) return 3;
    return 4;
  }

  // Apakah weekend?
  bool isWeekend() {
    const weekend = {DateTime.saturday, DateTime.sunday};
    return weekend.contains(date.weekday);
  }
}

void main() {
  var e = ExpenseTime(
    description: "Brunch akhir pekan",
    amount: 45,
    category: "Makanan",
    date: DateTime(2025, 10, 11), // Sabtu
  );

  print("Minggu ke: ${e.getWeekNumber()}");
  print("Kuartal: ${e.getQuarter()}");
  print("Weekend? ${e.isWeekend()}");
}