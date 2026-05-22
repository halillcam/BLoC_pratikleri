import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_ogreniyorum/auth/cubit/auth_cubit.dart';
import 'package:bloc_ogreniyorum/auth/model/auth_model.dart';
import 'package:bloc_ogreniyorum/auth/view/profile_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Yap")),

      body: BlocListener<AuthCubit, AuthModel>(
        listener: (context, state) {
          if (state.isLoggedIn == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.email} başarıyla giriş yaptı!'),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "E-mail Adresiniz",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final girilenEmail = _emailController.text;
                  context.read<AuthCubit>().login(girilenEmail);
                },
                child: const Text("Giriş Yap ve Profil sayfasına git"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
