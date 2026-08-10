import 'package:bloc_practice/login/bloc/login_event.dart';
import 'package:bloc_practice/login/bloc/login_state.dart';
import 'package:bloc_practice/login/bloc/user_bloc.dart';
import 'package:bloc_practice/login/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Center(
        child: BlocConsumer<UserBloc, LoginState>(
          listener: (context, state) {
            if (state == LoginState.loading) {
            } else if (state == LoginState.success) {
              Future.delayed(Duration(seconds: 2));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Giris Basarili")));

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(userName: userNameController.text),
                ),
              );
            } else if (state == LoginState.notFound) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Kullanici Bulunamadi")));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _inputField("Username", userNameController),
                SizedBox(height: 20),
                _inputField("Password", passwordController),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<UserBloc>().add(
                      UserLogin(
                        username: userNameController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                  child: Text("Giriş yap"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  TextField _inputField(String hintext, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hintext,
      ),
    );
  }
}
