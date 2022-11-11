// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: "Soft Drinks",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.hotelwelkinresidency.com%2Fwp-content%2Fuploads%2F2018%2F01%2Fsoftdrinks.jpg&f=1&nofb=1&ipt=ece947cf35c16946119a00a59d712a38a1d7f76cadbaea90c114f1267000dc6c&ipo=images",
    ),
    const Category(
      name: "Smoothies",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.morganmanagesmommyhood.com%2Fwp-content%2Fuploads%2F2018%2F04%2FDepositphotos_98413322_original.jpg&f=1&nofb=1&ipt=892e8e32faa6d30895670b30d84d84ac12db70a30d6058e6f5176a06533d01ed&ipo=images",
    ),
    const Category(
      name: "Water",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.comunicaffe.com%2Fwp-content%2Fuploads%2F2020%2F05%2FBottled-Water.jpg&f=1&nofb=1&ipt=c62d40901919b7b07dd8522cd1559f907c2a5d8be6943f58d11cea47cfbfcd89&ipo=images",
    ),
  ];
}
