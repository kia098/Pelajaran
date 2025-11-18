//Latihan 2: Method Statistik (Sedang)

//Tambahkan method ini:

//1. `getAmountRounded()` - mengembalikan jumlah yang dibulatkan ke rupiah terdekat
//2. `getDailyAverage(int days)` - mengembalikan rata-rata per hari selama periode tertentu
//3. `projectedYearly()` - jika ini pengeluaran bulanan, berapa total tahunannya?

class ExpenseStats {
  String description;
  double amount;
  String category;

  ExpenseStats({
    this.description = "",
    this.amount = 0,
    this.category = "",
  });

  // Pembulatan ke rupiah terdekat
  double getAmountRounded() {
    return amount.roundToDouble();
  }

  // Rata-rata per hari
  double getDailyAverage(int days) {
    if (days <= 0) return 0;
    return amount / days;
  }

  // Proyeksi tahunan (anggap pengeluaran bulanan)
  double projectedYearly() {
    return amount * 12;
  }
}

void main() {
  var s = ExpenseStats(
    description: "Belanja bulanan",
    amount: 350000,
    category: "Rumah Tangga",
  );

  print("Rounded: ${s.getAmountRounded()}");
  print("Rata-rata 7 hari: ${s.getDailyAverage(7)}");
  print("Proyeksi tahunan: ${s.projectedYearly()}");
}