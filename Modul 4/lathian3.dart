//Latihan 3: Bank Account Class (Sulit)

//Buat class `BankAccount` dengan:

//- Private: `_accountHolder`, `_balance`, `_pin`
//- Method: `deposit(amount)`, `withdraw(amount, pin)`
//- Tidak bisa withdraw tanpa PIN yang benar
//- Tidak bisa withdraw lebih dari saldo
//- Tidak bisa deposit jumlah negatif
//- Getter untuk balance (tapi tidak ada setter!)
//- Method `changePin(oldPin, newPin)`

class BankAccount {
  String _accountHolder;
  double _balance;
  int _pin;

  BankAccount({
    required String accountHolder,
    required double balance,
    required int pin,
  })  : _accountHolder = accountHolder,
        _balance = balance,
        _pin = pin {
    if (balance < 0) {
      throw ArgumentError('Saldo awal tidak bolceh negatif');
    }
  }

  // Getter balance
  double get balance => _balance;

  // Private PIN checker
  bool _checkPin(int pin) => pin == _pin;

  // Deposit
  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Jumlah deposit harus positif');
    }
    _balance += amount;
  }

  // Withdraw
  void withdraw(double amount, int pin) {
    if (!_checkPin(pin)) {
      throw Exception('PIN salah');
    }
    if (amount <= 0) {
      throw ArgumentError('Jumlah tidak valid');
    }
    if (amount > _balance) {
      throw Exception('Saldo tidak mencukupi');
    }

    _balance -= amount;
  }

  // Change PIN
  void changePin(int oldPin, int newPin) {
    if (!_checkPin(oldPin)) {
      throw Exception('PIN lama salah');
    }
    if (newPin < 1000 || newPin > 9999) {
      throw Exception('PIN baru harus 4 digit');
    }

    _pin = newPin;
  }

  void info() {
    print('👤 Pemilik: $_accountHolder');
    print('💰 Saldo: $_balance');
  }
}

void main() {
  final acc = BankAccount(accountHolder: 'Salsa', balance: 2000, pin: 1111);

  acc.deposit(300);
  acc.info();

  try {
    acc.withdraw(100, 9999);
  } catch (e) {
    print(e);
  }

  acc.changePin(1111, 4444);
  acc.withdraw(150, 4444);

  acc.info();
}