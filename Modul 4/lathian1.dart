//Latihan 1: Protected Category Class (Mudah)

//Buat class `Category` dengan:

//- Private properties: `_name`, `_icon`, `_budget`
//- Getter untuk semua properti
//- Setter untuk `budget` yang hanya izinkan nilai positif
//- Computed getter `isOverBudget(double spent)` yang return true jika spent > budget

class Category {
  String _name;
  String _icon;
  double _budget;

  Category({
    required String name,
    required String icon,
    required double budget,
  })  : _name = name,
        _icon = icon,
        _budget = budget {
    if (budget < 0) {
      throw ArgumentError('Budget harus bernilai positif');
    }
  }

  // Getter
  String get name => _name;
  String get icon => _icon;
  double get budget => _budget;

  // Setter budget (validasi nilai positif)
  set budget(double value) {
    if (value <= 0) {
      throw ArgumentError('Budget harus lebih dari 0');
    }
    _budget = value;
  }

  // Computed method
  bool isOverBudget(double spent) => spent > _budget;

  void info(double spent) {
    final status = isOverBudget(spent) ? '🚨 Over Budget' : '👍 Aman';
    print('$icon $name → Spent: $spent | Budget: $_budget → $status');
  }
}

void main() {
  final c = Category(name: 'Transport', icon: '🚌', budget: 300);

  c.info(120);
  c.info(450);

  try {
    c.budget = -20;
  } catch (e) {
    print('Error: $e');
  }
}