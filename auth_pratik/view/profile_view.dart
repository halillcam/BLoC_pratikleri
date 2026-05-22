import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_ogreniyorum/auth/cubit/auth_cubit.dart';
import 'package:bloc_ogreniyorum/auth/model/auth_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Sayfası")),

      body: BlocListener<AuthCubit, AuthModel>(
        listener: (context, state) {},

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Geri dönmek istiyor musunuz?"),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Evet"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Geri"),
              ),
              const SizedBox(height: 20),

              BlocBuilder<AuthCubit, AuthModel>(
                builder: (context, state) {
                  return Text(
                    "Hoş geldin \n ${state.email}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
