import 'package:flutter/material.dart';

import '../../model/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.amber,
            offset: Offset(1, 1),
            blurRadius: 7,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(user.avatar!),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${user.id}"),
              Text("Nama: ${user.firstName} ${user.lastName}"),
              Text("Email: ${user.email}"),
            ],
          )
        ],
      ),
    );
  }
}
