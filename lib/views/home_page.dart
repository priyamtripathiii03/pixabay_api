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
        backgroundColor: Colors.black,
        elevation: 10,
        shadowColor: Colors.black,
        title: const Text(
          'Pixabay',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        if (provider.pixabay != null) {
          return ListView.builder(
            itemCount: provider.pixabay!.hits.length,
            itemBuilder: (context, index) => photoBox(
              photo: provider.pixabay!.hits[index].largeImageUrl,
                userImage: provider.pixabay!.hits[index].userImageUrl,
                userName: provider.pixabay!.hits[index].user,
              likes: provider.pixabay!.hits[index].likes,
              comments: provider.pixabay!.hits[index].comments,
            ),
          );
        }
        return const Center(
          child: Text("Data not found !"),
        );
      }),
    );
  }
}
