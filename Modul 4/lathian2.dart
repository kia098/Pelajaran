//Latihan 2: Smart User Class (Sedang)

//Buat class `User` dengan:

//- Private: `_name`, `_email`, `_age`
//- Validasi email harus mengandung '@'
//- Validasi age harus antara 13 dan 120
//- Computed getter `isAdult` (age >= 18)
//- Computed getter `displayName` (name + kategori usia)

class User {
  String _name;
  String _email;
  int _age;

  User({
    required String name,
    required String email,
    required int age,
  })  : _name = name,
        _email = email,
        _age = age {
    _validateEmail(email);
    _validateAge(age);
  }

  // Helper validation
  static void _validateEmail(String email) {
    final regex = RegExp(r'.+@.+');
    if (!regex.hasMatch(email)) {
      throw ArgumentError('Email tidak valid');
    }
  }

  static void _validateAge(int age) {
    if (age < 13 || age > 120) {
      throw ArgumentError('Usia harus 13–120');
    }
  }

  // Getter
  String get name => _name;
  String get email => _email;
  int get age => _age;

  // Setter validasi
  set email(String value) {
    _validateEmail(value);
    _email = value;
  }

  set age(int value) {
    _validateAge(value);
    _age = value;
  }

  // Computed getter
  bool get isAdult => _age >= 18;

  String get displayName {
    final kategori = _age < 18
        ? 'Remaja'
        : (_age < 60 ? 'Dewasa' : 'Senior');

    return '$name - $kategori ($_age)';
  }

  void printInfo() {
    print('👤 $displayName');
    print('📧 $_email');
  }
}

void main() {
  final user = User(
    name: 'Ara',
    email: 'miraku087@mail.com',
    age: 19,
  );

  user.printInfo();

  try {
    user.email = 'salah_format';
  } catch (e) {
    print('❌ $e');
  }
}