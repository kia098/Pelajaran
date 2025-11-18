//Latihan 3: Sistem Manajemen Subscription (Sulit)

//Buat class `SubscriptionExpense` yang meng-extend `RecurringExpense` dengan:

//- Properti: `provider`, `plan`, `startDate`, `endDate`
//- Method: `isActive()` - cek apakah subscription masih aktif
//- Method: `getRemainingMonths()` - bulan sampai expired
//- Method: `getTotalCost()` - total biaya dari start sampai end date
//- Override `printDetails()`

class Expense {
  String description;
  double amount;
  String category;
  DateTime date;

  Expense({
    this.description = "",
    this.amount = 0,
    this.category = "",
    DateTime? date,
  }) : date = date ?? DateTime.now();

  void printDetails() {
    print("🔹 PENGELUARAN");
    print("   Deskripsi: $description");
    print("   Kategori: $category");
    print("   Jumlah: Rp $amount");
    print("   Tanggal: $date");
  }
}

class RecurringExpense extends Expense {
  int intervalMonths;

  RecurringExpense({
    String description = "",
    double amount = 0,
    String category = "",
    this.intervalMonths = 1,
    DateTime? date,
  }) : super(
          description: description,
          amount: amount,
          category: category,
          date: date,
        );

  @override
  void printDetails() {
    super.printDetails();
    print("   Interval: $intervalMonths bulan");
  }
}

class SubscriptionExpense extends RecurringExpense {
  String provider;
  String plan;
  DateTime startDate;
  DateTime endDate;

  SubscriptionExpense({
    String description = "",
    double amount = 0,
    this.provider = "",
    this.plan = "",
    DateTime? startDate,
    DateTime? endDate,
    int intervalMonths = 1,
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ??
            DateTime(DateTime.now().year, DateTime.now().month + intervalMonths),
        super(
          description: description,
          amount: amount,
          category: "Subscription",
          intervalMonths: intervalMonths,
        );

  bool isActive() {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  int getRemainingMonths() {
    int months = (endDate.year - DateTime.now().year) * 12 +
        (endDate.month - DateTime.now().month);
    return months < 0 ? 0 : months;
  }

  double getTotalCost() {
    int months =
        (endDate.year - startDate.year) * 12 + (endDate.month - startDate.month);
    if (months <= 0) months = 1;
    return amount * months;
  }

  @override
  void printDetails() {
    print("📺 SUBSCRIPTION");
    super.printDetails();
    print("   Provider: $provider");
    print("   Paket: $plan");
    print("   Mulai: $startDate");
    print("   Berakhir: $endDate");
    print("   Aktif: ${isActive() ? "Ya" : "Tidak"}");
    print("   Sisa bulan: ${getRemainingMonths()}");
    print("   Total biaya: Rp ${getTotalCost()}");
  }
}

void main() {
  var sub = SubscriptionExpense(
    description: "Spotify Premium",
    amount: 49000,
    provider: "Spotify",
    plan: "Individual",
    startDate: DateTime(2025, 1, 1),
    endDate: DateTime(2025, 12, 1),
    intervalMonths: 1,
  );

  sub.printDetails();
}