//Latihan 1: Buat Class BusinessExpense (Mudah)

//Buat class `BusinessExpense` yang meng-extend `Expense` dengan:

//- Properti: `client` (String)
//- Properti: `isReimbursable` (bool)
//- Override `printDetails()` untuk menampilkan client dan status reimbursable

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

class BusinessExpense extends Expense {
  String client;
  bool isReimbursable;

  BusinessExpense({
    String description = "",
    double amount = 0,
    String category = "Bisnis",
    this.client = "",
    this.isReimbursable = false,
    DateTime? date,
  }) : super(
          description: description,
          amount: amount,
          category: category,
          date: date,
        );

  @override
  void printDetails() {
    print("💼 PENGELUARAN BISNIS");
    super.printDetails();
    print("   Klien: $client");
    print("   Reimbursable: ${isReimbursable ? "Ya" : "Tidak"}");
  }
}

void main() {
  var expense = BusinessExpense(
    description: "Jamuan makan klien",
    amount: 150000,
    client: "PT Nusantara",
    isReimbursable: true,
  );

  expense.printDetails();
}