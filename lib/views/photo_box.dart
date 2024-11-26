
import 'package:flutter/material.dart';

Widget photoBox(
    {required String userImage,
    required String userName,
    required String photo,required int likes,required int comments,required String tags}) {
  return Card(
    child: Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            subtitle: Text(tags,style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),),
            trailing: const Icon(Icons.more_vert,color: Colors.white,),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(photo),
                    ),
                  ),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.only(left :17.0,top: 8.0),
            child: Row(
              children: [
                       const Icon(
                      Icons.favorite_border_rounded,
                         size: 20,
                         color: Colors.white,
            ),
                const SizedBox(width: 8,),
                Text(likes.toString(),style: TextStyle(color: Colors.white),),
                const SizedBox(width: 15,),
                const Icon(Icons.comment,size: 20,color: Colors.white,),
                const SizedBox(width: 8,),
                Text(comments.toString(),style: TextStyle(color: Colors.white),),
                const SizedBox(width: 15,),
                const Icon(Icons.download,size: 20,color: Colors.white,),
                    ],
              ),
          ),
        ],
      ),
    ),
  );
}
