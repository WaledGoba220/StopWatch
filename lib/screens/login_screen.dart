import 'package:flutter/material.dart';
import 'package:stop_watch/screens/stop_watch_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const route = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: const Icon(Icons.watch),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: "Runner",
                    hintText: "Enter Name",
                    border: OutlineInputBorder()),
                validator: (data) {
                  if (data!.isEmpty) {
                    return "This Field Is Required";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Email",
                    border: OutlineInputBorder()),
                validator: (data) {
                  if (data!.isEmpty) {
                    return "This Field Is Required";
                  }
                  final regEx = RegExp(r'[^@]+@[^\.]+\..+');
                  if (!regEx.hasMatch(data)) {
                    return "Enter A Valid Email";
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("CONTINUE, ${nameController.text}");
                    print("CONTINUE, ${emailController.text}");
                    Navigator.pushReplacementNamed(context, StopwatchScreen.route);
                  }
                },
                child: const Text("CONTINUE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
