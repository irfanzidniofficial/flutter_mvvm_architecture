import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_architecture/bloc/user_bloc.dart';
import 'package:flutter_mvvm_architecture/ui/widgets/user_card.dart';
import 'dart:math';

import '../../model/user.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("DEMO MVVM"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              bloc.dispatch(random.nextInt(10) + 1);
            },
            child: const Text('Pick Random User'),
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) =>
                (user is UnintializedUser) ? Container() : UserCard(user),
          ),
        ],
      ),
    );
  }
}
