import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_2/models/models.dart';
import 'package:ecommerce_app_2/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Talha Solutions"),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: Category.categories
                .map((e) => HeroCarouselCard(category: e))
                .toList(),
          ),
          const SectionTitle(title: "RECOMMENDED"),
          ProductCarousel(
            products: Product.products
                .where((element) => element.isRecommended)
                .toList(),
          ),
          const SectionTitle(title: "MOST POPULAR"),
          ProductCarousel(
            products:
                Product.products.where((element) => element.isPopular).toList(),
          ),
        ],
      ),
    );
  }
}
