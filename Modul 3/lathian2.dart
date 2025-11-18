//Latihan 2: Pembuatan Expense yang Ditingkatkan (Sedang)

//Tambahkan named constructor ini ke class Expense kamu:

//1. `Expense.splitBill(description, totalAmount, numberOfPeople)` - membagi jumlah dengan jumlah orang
//2. `Expense.tip(description, baseAmount, tipPercent)` - menghitung total dengan tip
//3. `Expense.recurring(description, amount, frequency)` - di mana frequency adalah 'weekly', 'monthly', atau 'yearly'

class Expense {
  String description;
  double amount;
  String category;
  DateTime date;
  String? frequency; 
  Expense({
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
    this.frequency,
  });

  Expense.splitBill(String description, double totalAmount, int numberOfPeople)
      : description = description,
        amount = totalAmount / numberOfPeople,
        category = 'Split Bill',
        date = DateTime.now();

  Expense.tip(String description, double baseAmount, double tipPercent)
      : description = description,
        amount = baseAmount + (baseAmount * tipPercent / 100),
        category = 'Tip',
        date = DateTime.now();

  Expense.recurring(String description, double amount, String frequency)
      : description = description,
        amount = amount,
        category = 'Recurring',
        date = DateTime.now(),
        frequency = frequency;
  String getSummary() {
    return 'Deskripsi: $description | Jumlah: \$${amount.toStringAsFixed(2)} | Kategori: $category | Tanggal: ${date.toLocal()} | Freq: ${frequency ?? "-"}';
  }
}

void main() {
  var e1 = Expense.splitBill('Makan bareng', 200.0, 4);
  var e2 = Expense.tip('Makan malam', 50.0, 10);
  var e3 = Expense.recurring('Netflix', 13.99, 'monthly');

  print(e1.getSummary());
  print(e2.getSummary());
  print(e3.getSummary());
}