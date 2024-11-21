import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget photoBox(
    {required String userImage,
    required String userName,
    required String photo}) {
  return Card(
    child: Container(
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            title: Text(
              userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
                height: 400,
                width: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(photo),
                  ),
                ),
              ),
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.heart_fill),
                color: Colors.red,
                iconSize: 20,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.chat_bubble_fill),
                color: Colors.blue,
                iconSize: 20,
                onPressed: () {},
              ),
        ],
  ),
        ],
      ),
    ),
  );
}
