import 'package:equatable/equatable.dart';

class StockModel extends Equatable {
  final String id;
  final String name;
  final double price;
  final double changePercent;

  const StockModel({
    required this.id,
    required this.name,
    required this.price,
    required this.changePercent,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'changePercent': changePercent,
    };
  }

  StockModel copyWith({
    String? id,
    String? name,
    double? price,
    double? changePercent,
  }) {
    return StockModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      changePercent: changePercent ?? this.changePercent,
    );
  }

  @override
  List<Object?> get props => [id, name, price, changePercent];
}
