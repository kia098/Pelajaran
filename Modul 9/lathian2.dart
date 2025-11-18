//Latihan 2: Implementasi Sistem Budget (Sedang)

//Buat sistem manajemen budget dengan alert ketika pengeluaran melebihi limit.

//Requirement:

//- Set budget bulanan per kategori
//- Lacak pengeluaran vs budget
//- Tampilkan warning saat mendekati limit
//- Generate laporan budget

class BudgetManager {
  Map<String, double> _budgetLimit = {};
  Map<String, double> _spent = {};

  void setBudget(String category, double limit) {
    _budgetLimit[category] = limit;
    _spent[category] = 0;
    print('💰 Budget kategori "$category" diset: $limit');
  }

  void addExpense(String category, double amount) {
    if (!_spent.containsKey(category)) {
      print('❌ Kategori "$category" belum punya budget');
      return;
    }

    _spent[category] = (_spent[category] ?? 0) + amount;
    print('➕ Tambah pengeluaran $amount ke kategori "$category"');

    double used = _spent[category]!;
    double limit = _budgetLimit[category]!;

    if (used >= limit) {
      print('🚨 Peringatan: Budget kategori "$category" terlampaui!');
    } else if (used >= limit * 0.8) {
      print('⚠ Hampir mencapai limit (>=80%)');
    }
  }

  void report() {
    print('\n📊 LAPORAN BUDGET');
    _budgetLimit.forEach((category, limit) {
      double used = _spent[category] ?? 0;
      double percent = (used / limit) * 100;

      print('\nKategori: $category');
      print('Limit: $limit');
      print('Terpakai: $used');
      print('Status: ${percent.toStringAsFixed(1)}%');
    });
  }
}

void main() {
  var budget = BudgetManager();

  budget.setBudget('Makanan', 1000000);
  budget.setBudget('Transportasi', 500000);

  budget.addExpense('Makanan', 200000);
  budget.addExpense('Makanan', 650000);
  budget.addExpense('Makanan', 300000); // lewat

  budget.addExpense('Transportasi', 350000);

  budget.report();
}