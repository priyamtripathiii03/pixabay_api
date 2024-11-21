import 'package:flutter/material.dart';
import 'package:pixabay_api/provider/home_provider.dart';
import 'package:pixabay_api/views/home_page.dart';
import 'package:provider/provider.dart';

import 'helper/api_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
      );
  }
}
