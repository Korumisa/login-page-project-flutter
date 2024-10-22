import 'package:flutter/material.dart';
import 'history.dart';
import 'forgot_password.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String email;
  String password;

  User({required this.email, required this.password});

  User copyWith({String? password}) {
    return User(email: email, password: password ?? this.password);
  }
}


class LoginService {
  final List<User> _users = [
    User(email: 'user@example.com', password: '123456'),
    // Add more users here
  ];

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
    return _users.any((user) => user.email == email && user.password == password);
  }

  Future<bool> resetPassword(String email, String newPassword) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
    for (var user in _users) {
      if (user.email == email) {
        user.password = newPassword; // Update the password
        return true;
      }
    }
    return false; // Email not found
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korumisa App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to Korumisa App',
                style: TextStyle(fontSize: 24, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 400, // Set the maximum width to 400 pixels
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@email.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 400, // Set the maximum width to 400 pixels
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '••••••••',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 1) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final isLoggedIn = await _loginService.login(email, password);
                    if (isLoggedIn) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid email or password')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                  );
                },
                style: TextButton.styleFrom(
                ),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Korumisa App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home ),
              title: const Text('Home'),
              onTap: () {
                // Navigate to Home
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Navigate to About
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Korumisa Page!',
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            const Text('This application is used to make it easier for you to manage your daily schedule. Want to know how cool it is? Please click the button below',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
                ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const History()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255) ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('About Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'About Korumisa App',
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            const Text(
              'This application is used to make it easier for you to manage your daily schedule. It is developed by Korumisa Inc. and is available for free on the App Store and Google Play.',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255) ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Settings Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Settings for Korumisa App',
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Notification Settings'),
              subtitle: const Text('Configure notification settings'),
              trailing: Switch(
                value: true, // Replace with actual value
                onChanged: (value) {
                  // Handle switch change
                },
              ),
            ),
            ListTile(
              title: const Text('Theme Settings'),
              subtitle: const Text('Choose between light and dark themes'),
              trailing: DropdownButton(
                value: 'Light', // Replace with actual value
                onChanged: (value) {
                  // Handle dropdown change
                },
                items: const [
                  DropdownMenuItem(
                    child: Text('Light'),
                    value: 'Light',
                  ),
                  DropdownMenuItem(
                    child: Text('Dark'),
                    value: 'Dark',
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Language Settings'),
              subtitle: const Text('Choose your preferred language'),
              trailing: DropdownButton(
                value: 'English', // Replace with actual value
                onChanged: (value) {
                  // Handle dropdown change
                },
                items: const [
                  DropdownMenuItem(
                    child: Text('English'),
                    value: 'English',
                  ),
                  DropdownMenuItem(
                    child: Text('Spanish'),
                    value: 'Spanish',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255) ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}