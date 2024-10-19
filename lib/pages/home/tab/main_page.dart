import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/components/media_queries.dart';

import './/pages/home/tab/tabs/account_page.dart';
import './/pages/home/tab/tabs/favorite_page.dart';
import './/pages/home/tab/tabs/home_page.dart';
import './/pages/home/tab/tabs/search_page.dart';
import './/pages/home/tab/tabs/shopping_basket_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const SearchPage(),
      const ShoppingBasketPage(),
      const FavoritePage(),
      const AccountPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                width: m_w(context) * 0.9,
                height: m_h(context) * 0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 23,
                      ),
                      hintText: "Mahsulot va toifalarni qidirish",
                      isDense: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(AppImage.logo, width: 30),
              label: "Bosh Sahifa"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Qidiruv"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Savat"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Istaklar"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Kabinet"),
        ],
      ),
    );
  }
}
