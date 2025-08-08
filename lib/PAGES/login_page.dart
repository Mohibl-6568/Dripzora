import 'package:flutter/material.dart';
import 'package:dripzora/PAGES/explore_page.dart';
import '../AESTHETICS/imagebg.dart';
import '../DATA_STRUCTURE/user_structure.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  UserStructure? user;

  Future<void> _onButtonPressed(
    BuildContext context, {
    required String buttonType,
  }) async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (buttonType == 'login' ||
        buttonType == 'guest' ||
        buttonType == 'signup') {
      user = UserStructure();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ExplorePage(user: user!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SharedImageBackground(
            showLeftHalf: false,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "DRIPZORA",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Redefining Fashion",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    buildTextField(
                      hint: "Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                    ),
                    const SizedBox(height: 25),
                    buildTextField(
                      hint: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => _onButtonPressed(
                          context,
                          buttonType: 'forgot_password',
                        ),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Colors.white, Color(0xFFE0E0E0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () =>
                            _onButtonPressed(context, buttonType: 'login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () =>
                          _onButtonPressed(context, buttonType: 'guest'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(
                          color: Colors.white70,
                          width: 1.5,
                        ),
                      ),
                      child: const Text(
                        "CONTINUE AS GUEST",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () =>
                          _onButtonPressed(context, buttonType: 'signup'),
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String hint,
    required IconData icon,
    required bool isPassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: Icon(icon, color: Colors.white70),
          filled: true,
          fillColor: Colors.white12,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }
}
