import 'package:bloc_ogreniyorum/quit/quit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuitView extends StatelessWidget {
  const QuitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<QuitCubit, String>(
        listener: (contex, state) {
          if (state == "Çıkış yaptınız ") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Başarıyla Çıkış Yapıldı"), backgroundColor: Colors.orange),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<QuitCubit, String>(
                builder: (context, state) {
                  return Text(
                    state,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContent) => AlertDialog(
                      title: Text("Çıkış yap"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContent);
                            context.read<QuitCubit>().logout();
                          },
                          child: Text("Evet"),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Çıkış yap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
