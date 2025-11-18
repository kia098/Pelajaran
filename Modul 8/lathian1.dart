//Latihan 1: Buat Pembayaran Cryptocurrency (Mudah)

//Buat metode pembayaran `Cryptocurrency` dengan:

//- Properti: `walletAddress`, `coinType` (misal "Bitcoin", "Ethereum")
//- Validasi wallet address tidak kosong
//- Override semua method yang diperlukan

abstract class PaymentMethod {
  String get name;
  String get icon;

  bool validate() => true;

  void processPayment(double amount);

  void showReceipt(double amount) {
    print('🧾 Struk Pembayaran: $name');
    print('   Jumlah: \$${amount.toStringAsFixed(2)}');
    print('   Status: Berhasil ✅');
  }
}

class Expense {
  String description;
  double amount;
  String category;

  Expense({
    this.description = '',
    this.amount = 0.0,
    this.category = '',
  });

  void payWith(PaymentMethod method) {
    print('=== Membayar Expense: $description ===');
    method.processPayment(amount);
  }
}


class Cryptocurrency extends PaymentMethod {
  final String walletAddress;
  final String coinType;

  Cryptocurrency({
    this.walletAddress = '',
    this.coinType = '',
  });

  @override
  String get name => 'Dompet $coinType';

  @override
  String get icon => '₿';

  @override
  bool validate() {
    return walletAddress.isNotEmpty && walletAddress.length > 20;
  }

  @override
  void processPayment(double amount) {
    if (!validate()) {
      print('❌ Alamat wallet tidak valid');
      return;
    }

    print('$icon Memproses pembayaran $coinType...');
    print('Wallet: ${walletAddress.substring(0, 6)}...${walletAddress.substring(walletAddress.length - 4)}');
    print('⏳ Menunggu konfirmasi blockchain...');
    showReceipt(amount);
  }
}

void main() {
  var btc = Cryptocurrency(
    walletAddress: '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa',
    coinType: 'Bitcoin',
  );

  var expense = Expense(
    description: 'Pembelian online',
    amount: 250.0,
    category: 'Belanja',
  );

  expense.payWith(btc);
}