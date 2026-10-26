class LocalAccount {
  const LocalAccount({
    required this.name,
    required this.email,
    required this.password,
    this.role = AccountRole.student,
  });

  final String name;
  final String email;
  final String password;
  final AccountRole role;
}

enum AccountRole { student, admin }

const demoAccounts = <LocalAccount>[
  LocalAccount(name: 'Adeel', email: 'adeel@gmail.com', password: '12345678'),
  LocalAccount(name: 'Ali', email: 'ali@gmail.com', password: 'qwerty123'),
  LocalAccount(
    name: 'Admin',
    email: 'admin@gmail.com',
    role: AccountRole.admin,
    password: 'admin123',
  ),
];
