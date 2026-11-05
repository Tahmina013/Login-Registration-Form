import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  void register() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration successful!")));

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: const Color(0xFF71866A),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: formKey,

            child: Column(
              children: [
                const Icon(
                  Icons.person_add_alt_1,
                  size: 65,
                  color: Color(0xFF71866A),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Join RecipeNest!",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                // Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }

                    if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(value.trim())) {
                      return "Enter a valid name";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }

                    if (!RegExp(r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    }

                    final passwordRegex = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
                    );

                    if (!passwordRegex.hasMatch(value)) {
                      return "Use 8+ characters, uppercase, lowercase, number and special character";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Confirm Password
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock_reset),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hideConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword = !hideConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }

                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF71866A),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Create Account"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
