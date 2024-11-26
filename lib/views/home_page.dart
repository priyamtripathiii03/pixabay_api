import 'package:flutter/material.dart';
import 'package:pixabay_api/provider/home_provider.dart';
import 'package:pixabay_api/views/photo_box.dart';
import 'package:provider/provider.dart';

TextEditingController txtSearch = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,
        title: TextField(
          controller: txtSearch,
          decoration: InputDecoration(
            hintText: "Search",fillColor: Colors.white,
            suffixIcon: IconButton(
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false).fetchSearchPhotos(txtSearch.text);
              },
              icon: const Icon(Icons.search,color: Colors.white,),
            ),
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.pixabay != null && provider.searchResults == null) {
            return ListView.builder(
              itemCount: provider.pixabay!.hits.length,
              itemBuilder: (context, index) => photoBox(
                photo: provider.pixabay!.hits[index].largeImageUrl,
                userImage: provider.pixabay!.hits[index].userImageUrl,
                userName: provider.pixabay!.hits[index].user,
                likes: provider.pixabay!.hits[index].likes,
                comments: provider.pixabay!.hits[index].comments,
                tags: provider.pixabay!.hits[index].tags,
              ),
            );
          }
          else if (provider.searchResults != null) {
            return ListView.builder(
              itemCount: provider.searchResults!.hits.length,
              itemBuilder: (context, index) => photoBox(
                photo: provider.searchResults!.hits[index].largeImageUrl,
                userImage: provider.searchResults!.hits[index].userImageUrl,
                userName: provider.searchResults!.hits[index].user,
                likes: provider.searchResults!.hits[index].likes,
                comments: provider.searchResults!.hits[index].comments,
                tags: provider.searchResults!.hits[index].tags,
              ),
            );

          }
          return const Center(
            child: Center(
              child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}
