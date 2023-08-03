import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormInput(),
    );
  }
}

class FormInput extends StatefulWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetpasswordController =
      TextEditingController();

  void _submitForm() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username == "your_username" && password == "your_password") {
      _showDialog("Login Successful!");
    } else {
      _showDialog("Invalid credentials. Please try again.");
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login Result"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPasswordPage(),
      ),
    );
  }

  // Inside the build method of _FormInputState widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UNIVERSITAS TEKNOKRAT INDONESIA"),
        backgroundColor: const Color.fromARGB(255, 158, 2, 2),
      ),
      backgroundColor: Color.fromARGB(255, 229, 255, 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/UNIVERSITASTEKNOKRAT.png',
                height: 250,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username...",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 9, 73, 0),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Lupa Password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var name = "mR.Pandi";
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password ?"),
        backgroundColor: const Color.fromARGB(255, 148, 10, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Masukan Nomor Telepon Kamu Untuk Men-reset Password:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: "Nomor Telepon"),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Enter"),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 148, 10, 0),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Kembali ke Halaman Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    String _phoneNumber = _phoneNumberController.text;
  }
}
