//Latihan 2: Interface Refundable (Menengah)

//Buat interface `Refundable` dan implementasikan untuk metode pembayaran yang mendukung refund:

abstract class PaymentMethod {
  String get name;
  String get icon;

  void processPayment(double amount);

  void showReceipt(double amount) {
    print('🧾 Struk Pembayaran');
    print('   Metode : $name');
    print('   Jumlah : \$${amount.toStringAsFixed(2)}');
    print('   Status : Berhasil ✅');
  }
}

abstract class Refundable {
  bool canRefund();
  void processRefund(double amount);
}

class Expense {
  String description;
  double amount;

  Expense({this.description = '', this.amount = 0.0});

  void payWith(PaymentMethod method) {
    print('=== MEMBAYAR: $description ===');
    method.processPayment(amount);
  }
}



class CreditCard extends PaymentMethod implements Refundable {
  String cardNumber;
  String cardHolder;

  List<double> transactions = [];

  CreditCard({
    this.cardNumber = '',
    this.cardHolder = '',
  });

  @override
  String get name => 'Kartu Kredit';

  @override
  String get icon => '💳';

  @override
  void processPayment(double amount) {
    print('$icon Mendebet kartu...');
    String last4 = cardNumber.length >= 4 ? cardNumber.substring(cardNumber.length - 4) : cardNumber;
    print('   Nomor: **** **** **** $last4');

    transactions.add(amount);
    showReceipt(amount);
  }

  @override
  bool canRefund() {
    double refundable = transactions.fold(0.0, (sum, v) => sum + v);
    return refundable > 0.0;
  }

  @override
  void processRefund(double amount) {
    double refundable = transactions.fold(0.0, (sum, v) => sum + v);

    if (refundable <= 0.0) {
      print('❌ Tidak ada dana yang bisa direfund');
      return;
    }

    if (amount <= 0) {
      print('❌ Jumlah refund harus lebih besar dari 0');
      return;
    }

    if (amount > refundable) {
      print('❌ Permintaan refund \$${amount.toStringAsFixed(2)} melebihi saldo yang dapat direfund (tersedia: \$${refundable.toStringAsFixed(2)})');
      return;
    }

    print('🔄 Memproses refund \$${amount.toStringAsFixed(2)}...');
    print('   Dana akan kembali dalam 3–5 hari kerja');

    transactions.add(-amount);
  }
}



class Cash extends PaymentMethod {
  @override
  String get name => 'Tunai';

  @override
  String get icon => '💵';

  @override
  void processPayment(double amount) {
    print('$icon Pembayaran tunai: \$${amount.toStringAsFixed(2)}');
    showReceipt(amount);
  }
}



void main() {
  var card = CreditCard(
    cardNumber: '4532123456789012',
    cardHolder: 'John Doe',
  );

  var cash = Cash();

 
  card.processPayment(100.0);

  card.processRefund(50.0);

  print('\n----------------------\n');

  
  cash.processPayment(50.0);

  
  if (cash is Refundable) {
    (cash as Refundable).processRefund(25.0);
  } else {
    print('❌ Metode pembayaran "${cash.name}" tidak mendukung refund');
  }
}