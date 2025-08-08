

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fakenex/viewModel/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Container(
            
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                 
                  const Spacer(),
                  const Text(
                    'fakenex',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 48.0), 
                  
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline, color: Colors.white70),
                      labelText: 'Kullanıcı Adı',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 41, 32, 53),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  
                  Obx(() => TextFormField(
                    obscureText: !controller.isPasswordVisible.value,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                      labelText: 'Şifre',
                      labelStyle: const TextStyle(color: Colors.white70),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 41, 32, 53),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),
                  const SizedBox(height: 10.0),

                  Row(
                    children: <Widget>[
                      Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.toggleRememberMe(value);
                        },
                        checkColor: Colors.black,
                        fillColor: const MaterialStatePropertyAll(Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      )),
                      const Text('Beni hatırla', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {
                      controller.loginAndNavigate();
                    },
                    child: const Text('Giriş yap', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  const Spacer(flex: 2), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: const Icon(Icons.settings, color: Colors.white, size: 30), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30), onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
