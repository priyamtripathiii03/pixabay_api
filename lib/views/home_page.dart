import 'package:flutter/material.dart';
import 'package:pixabay_api/provider/home_provider.dart';
import 'package:pixabay_api/views/photo_box.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.black,
        title: const Text(
          'Home Page',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        if (provider.pixabay != null) {
          return ListView.builder(
            itemCount: provider.pixabay!.hits.length,
            itemBuilder: (context, index) => photoBox(
              photo: provider.pixabay!.hits[index].largeImageUrl,
                userImage: provider.pixabay!.hits[index].userImageUrl,
                userName: provider.pixabay!.hits[index].user),
          );
        }
        return const Center(
          child: Text("Data not found !"),
        );
      }),
    );
  }
}
