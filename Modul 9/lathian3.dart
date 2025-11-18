//Latihan 3: Dukungan Multi-User (Sulit)

//Tambahkan akun pengguna sehingga banyak orang bisa melacak pengeluaran mereka secara terpisah.

//Requirement:

//- Sistem login user
//- Daftar pengeluaran terpisah per user
//- Profil user dengan pengaturan
//- Data tersimpan per user

class User {
  String username;
  String password;
  List<Map<String, dynamic>> expenses = [];

  User(this.username, this.password);

  void addExpense(String desc, double amount) {
    expenses.add({
      'desc': desc,
      'amount': amount,
    });
    print('➕ Pengeluaran ditambahkan untuk $username');
  }

  void showExpenses() {
    print('\n📘 Pengeluaran $username:');
    for (var e in expenses) {
      print('- ${e['desc']} : ${e['amount']}');
    }
  }
}

class UserManager {
  List<User> _users = [];
  User? currentUser;

  void register(String username, String password) {
    if (_users.any((u) => u.username == username)) {
      print('❌ Username sudah digunakan');
      return;
    }
    _users.add(User(username, password));
    print('🆕 User "$username" terdaftar');
  }

  bool login(String username, String password) {
    for (var u in _users) {
      if (u.username == username && u.password == password) {
        currentUser = u;
        print('🔓 Login berhasil sebagai $username');
        return true;
      }
    }
    print('❌ Login gagal');
    return false;
  }
}

void main() {
  var manager = UserManager();

  manager.register('andi', '1234');
  manager.register('budi', 'abcd');

  manager.login('andi', '1234');
  manager.currentUser!.addExpense('Makan siang', 30000);
  manager.currentUser!.addExpense('Pulsa', 50000);

  manager.login('budi', 'abcd');
  manager.currentUser!.addExpense('Bensin', 75000);

  // Tampilkan data masing-masing user
  for (var u in manager._users) {
    u.showExpenses();
  }
}