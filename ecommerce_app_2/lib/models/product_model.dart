// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    const Product(
      name: "Soft Drink #1",
      category: "Soft Drinks",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.indulgexpress.com%2Fuploads%2Fuser%2Fckeditor_images%2Farticle%2F2019%2F5%2F22%2FAP19141479844928.jpg&f=1&nofb=1&ipt=5e8d7d5841d6b8a7a5d3f56b3950c121b60cd490c0f7be98862f2cda866c5276&ipo=images",
      price: 20.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: "Soft Drink #2",
      category: "Soft Drinks",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Famericanfizz.co.uk%2Fimage%2Fcache%2Fcatalog%2Famerican-soda%2Ffanta%2Ffanta-orange-12oz-355ml-800x800.png&f=1&nofb=1&ipt=07a55c96c2815d40554d9f9784a88c69e7eedb904745bafc36aec19a243bd388&ipo=images",
      price: 20.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: "Soft Drink #3",
      category: "Soft Drinks",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fsprite%2Fsprite_PNG98773.png&f=1&nofb=1&ipt=7489ef551b18a94325344f2b16db7a66cbcedcecd228de38f323fd26d873cbfb&ipo=images",
      price: 20.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: "Smoothies #1",
      category: "Smoothies",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Floseweightbyeating.com%2Fwp-content%2Fuploads%2F2021%2F07%2FAdobeStock_195824095-1365x2048.jpeg&f=1&nofb=1&ipt=17603ac533e3ff79b54c997d65243d9c375f19e3c57ee5aeaecc7739e82c6a96&ipo=images",
      price: 20.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: "Smoothies #2",
      category: "Smoothies",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.sanity.io%2Fimages%2F02sbe50v%2Fcontent%2F7bca754f8ae8ff2b37dc3969a2e8084e084c14f2-1080x1080.png&f=1&nofb=1&ipt=fc589ac1a8d7177814bb8b93104c17d487c0f0997650970820f15f10ca180f08&ipo=images",
      price: 20.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
