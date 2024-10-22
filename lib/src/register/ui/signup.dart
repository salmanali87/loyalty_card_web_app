import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _phoneNoController.dispose();
    _phoneNoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.3,
              height: size.height * 0.6,
              color: Colors.orange,
            ),
            Container(
              width: size.width * 0.3,
              height: size.height * 0.6,
              color: Colors.amber,
              child: Column(
                children: [
                  Text("Sig Up"),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: 'Name',
                        labelText: 'Name',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        suffixStyle: TextStyle(color: Colors.green)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: 'Email',
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        suffixStyle: TextStyle(color: Colors.green)),
                  ),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.green,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colors.green,
                          ))),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.green,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colors.green,
                          ))),
                  TextButton(onPressed: () {}, child: const Text("Register"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
