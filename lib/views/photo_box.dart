import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget photoBox(
    {required String userImage,
    required String userName,
    required String photo,required int likes,required int comments}) {
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
            trailing: Icon(Icons.more_vert),
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
                     Icon(
                    Icons.favorite_border_rounded,
                       size: 20,

),
              SizedBox(width: 5,),
              Text(likes.toString()),
              SizedBox(width: 5,),
              Icon(Icons.comment,size: 20,),
              SizedBox(width: 5,),
              Text(comments.toString()),
              SizedBox(width: 5,),
              Icon(Icons.share,size: 20,),
        ],
  ),
        ],
      ),
    ),
  );
}
