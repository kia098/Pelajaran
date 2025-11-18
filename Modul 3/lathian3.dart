//Latihan 3: Class User yang Fleksibel (Sulit)

//Buat class `User` untuk aplikasi expense kamu dengan:

//- Properties: `name`, `email`, `currency`, `monthlyBudget`, `notifications`
//- Constructor utama dengan named parameter (semua required kecuali `notifications` default = true)
//- `User.quick(name, email)` - menggunakan currency USD, budget $2000
//- `User.premium(name, email, monthlyBudget)` - currency USD, notifications on

class User {
  String name;
  String email;
  String currency;
  double monthlyBudget;
  bool notifications;

  
  User({
    required this.name,
    required this.email,
    required this.currency,
    required this.monthlyBudget,
    this.notifications = true, 
  });

  User.quick(String name, String email)
      : name = name,
        email = email,
        currency = 'USD',
        monthlyBudget = 2000,
        notifications = true;

  User.premium(String name, String email, double monthlyBudget)
      : name = name,
        email = email,
        currency = 'USD',
        monthlyBudget = monthlyBudget,
        notifications = true;

  String getInfo() {
    return '👤 Nama: $name | Email: $email | Mata Uang: $currency | Budget: \$${monthlyBudget.toStringAsFixed(2)} | Notif: ${notifications ? "ON" : "OFF"}';
  }
}

void main() {
  var user1 = User(
    name: 'Alice',
    email: 'alice@example.com',
    currency: 'IDR',
    monthlyBudget: 5000000,
    notifications: false,
  );

  var user2 = User.quick('Bob', 'bob@example.com');
  var user3 = User.premium('Charlie', 'charlie@example.com', 10000);

  print(user1.getInfo());
  print(user2.getInfo());
  print(user3.getInfo());
}