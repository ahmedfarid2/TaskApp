class MProducts {
  List<MProduct>? products;
  int? total;
  int? skip;
  int? limit;

  MProducts({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory MProducts.fromJson(Map<String, dynamic>? json) {
    return MProducts(
      products: json?['products'].map<MProduct>((productJson) => MProduct.fromJson(productJson)).toList() ?? [],
      total: json?['total'] ?? 0,
      skip: json?['skip'] ?? 0,
      limit: json?['limit'] ?? 0,
    );
  }
}

class MProduct {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  MProduct({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory MProduct.fromJson(Map<String, dynamic>? json) {
    return MProduct(
      id: json?['id'] ?? 0,
      title: json?['title'] ?? "",
      description: json?['description'] ?? "",
      price: json?['price'] ?? 0,
      discountPercentage: double.tryParse(json?['discountPercentage'].toString() ?? "") ?? 0.0,
      rating: double.tryParse(json?['rating'].toString() ?? "") ?? 0.0,
      stock: json?['stock'] ?? 0,
      brand: json?['brand'] ?? "",
      category: json?['category'] ?? "",
      thumbnail: json?['thumbnail'] ?? "",
      images: List<String>.from((json?['images'] ?? [])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}
