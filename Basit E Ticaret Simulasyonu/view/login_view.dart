import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/auth_cubit.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/auth_state.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/view/items_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.transparent,
          child: SizedBox(
            width: 400,
            height: 200,

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStatus.isLoggedIn) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Giriş Başarılı"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ItemsView()),
                                );
                              },
                              child: Text("Diğer Sayfaya git"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  if (state.status == AuthStatus.failed) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Hata Tekrar Deneyin")));
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      inputField(controller: _userNameController, hintText: "Enter your Username"),
                      inputField(
                        controller: _passwordController,
                        hintText: "Enter your password",
                        obsecure: true,
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().login(
                            _userNameController.text,
                            _passwordController.text,
                          );
                        },
                        child: Text("Login"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField inputField({
    required TextEditingController controller,
    required String hintText,
    bool obsecure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
      ),
    );
  }
}
