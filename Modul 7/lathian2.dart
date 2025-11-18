//Latihan 2: Buat Class TravelExpense (Sedang)

//Buat class `TravelExpense` dengan:

//- Properti: `destination`, `tripDuration` (hari)
//- Method: `getDailyCost()` - return amount per hari
//- Method: `isInternational()` - return true jika destinasi luar negeri
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

class TravelExpense extends Expense {
  String destination;
  int tripDuration;

  TravelExpense({
    String description = "",
    double amount = 0,
    this.destination = "",
    this.tripDuration = 1,
    DateTime? date,
  }) : super(
          description: description,
          amount: amount,
          category: "Perjalanan",
          date: date,
        );

  double getDailyCost() {
    if (tripDuration <= 0) return amount;
    return amount / tripDuration;
  }

  bool isInternational() {
    return destination.contains(",");
  }

  @override
  void printDetails() {
    print("✈️ PENGELUARAN PERJALANAN");
    super.printDetails();
    print("   Destinasi: $destination");
    print("   Durasi: $tripDuration hari");
    print("   Biaya per hari: Rp ${getDailyCost()}");
    print("   Internasional: ${isInternational() ? "Ya" : "Tidak"}");
  }
}

void main() {
  var trip = TravelExpense(
    description: "Trip ke Bangkok",
    amount: 12000000,
    destination: "Bangkok, Thailand",
    tripDuration: 4,
  );

  trip.printDetails();
}