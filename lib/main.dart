import 'package:flutter/material.dart';

import 'UI/app_theme.dart';
import 'UI/views/product_list_view.dart';

void main() {
  // TODO 8: Setup Dependency Injection
  runApp(const ShopNBuyApp());
}

class ShopNBuyApp extends StatelessWidget {
  const ShopNBuyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: const ProductListView(),
    );
  }
}
