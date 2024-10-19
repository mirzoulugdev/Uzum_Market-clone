import 'package:flutter/material.dart';
import 'package:uzum_market/components/constants.dart';
import 'package:uzum_market/components/media_queries.dart';
import 'package:uzum_market/data/repository/app_repository.dart';
import 'package:uzum_market/pages/home/tab/tabs/widgets/page_view_widget.dart';
import 'package:uzum_market/pages/home/tab/tabs/widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: m_h(context) * 0.3,
            child: PageView(
              controller: PageController(
                initialPage: 1,
                viewportFraction: 0.9,
              ),
              children: [
                PageViewWidget(image: AppImage.pv_1),
                PageViewWidget(image: AppImage.pv_2),
                PageViewWidget(image: AppImage.pv_3),
                PageViewWidget(image: AppImage.pv_4),
              ],
            ),
          ),
          const SizedBox(height: 10),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(child: Text("Barakali JUMA")),
                    Tab(child: Text("Mashhur")),
                    Tab(child: Text("Yangi")),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: m_w(context).toDouble(),
                  height: m_w(context) * 0.89.toDouble(),
                  child: TabBarView(
                    children: [
                      FutureBuilder(
                        future: AppRepository.getProductByCategoryFromApi(
                            "women's clothing"),
                        builder: (context, snapshot) {
                          List? products = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                              ),
                              itemCount: products!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ProductWidget(
                                    product: products[index],
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                      FutureBuilder(
                        future: AppRepository.getProductByCategoryFromApi(
                            "men's clothing"),
                        builder: (context, snapshot) {
                          List? products = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                              ),
                              itemCount: products!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ProductWidget(
                                    product: products[index],
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                      FutureBuilder(
                        future: AppRepository.getProductByCategoryFromApi(
                            "jewelery"),
                        builder: (context, snapshot) {
                          List? products = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                              ),
                              itemCount: products!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ProductWidget(
                                    product: products[index],
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
