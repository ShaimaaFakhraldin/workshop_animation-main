import 'package:flutter/material.dart';

class ValidationSamplesScreen extends StatefulWidget {
  const ValidationSamplesScreen({super.key});

  @override
  State<ValidationSamplesScreen> createState() =>
      _ValidationSamplesScreenState();
}

class _ValidationSamplesScreenState extends State<ValidationSamplesScreen> {
  Offset offsetEmail = Offset(0, 0);
  Offset offsetPassword = Offset(0, 0);

  var _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validaation Example"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              AnimatedSlide(
                offset: offsetEmail,
                duration: const Duration(milliseconds: 200),
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "email of phone cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email or Phone",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSlide(
                offset: offsetPassword,
                duration: const Duration(seconds: 1),
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "password cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  if (!_key.currentState!.validate()) {
                    for (var i = 0; i < 5; i++) {
                      setState(() {
                        offsetEmail = const Offset(0.025, 0);
                      });
                    }
                  }
                },
                textColor: Colors.white,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
