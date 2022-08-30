

class Product {
  final int id;
  final String name;
  final String articl;
  final String fabricNumber;

  Product({
    required this.id,
    required this.articl,
    required this.name,
    required this.fabricNumber
  });

  Product.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    articl = json['articl'],
    fabricNumber = json['fabricNumber'];
}