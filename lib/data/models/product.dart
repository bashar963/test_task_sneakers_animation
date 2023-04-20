import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_task/generated/assets.dart';

class Product extends Equatable {
  final String id;
  final String brand;
  final String name;
  final String image;
  final Color productColor;
  final num price;

  const Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.image,
    required this.productColor,
    required this.price,
  });
  @override
  List<Object?> get props => [id];
}

final mockProducts = [
  const Product(
    id: '1',
    brand: 'Nike',
    name: 'AIR-MAX',
    image: Assets.imagesSneaker01,
    price: 130.0,
    productColor: Color(0xFF44CDE8),
  ),
  const Product(
    id: '2',
    brand: 'Nike',
    name: 'EPIC-REACT',
    image: Assets.imagesSneaker02,
    price: 130.0,
    productColor: Color(0xFF543E92),
  ),
  const Product(
    id: '3',
    brand: 'Nike',
    name: 'AIR-270',
    image: Assets.imagesSneaker03,
    price: 150.0,
    productColor: Color(0xFF38474F),
  ),
  const Product(
    id: '4',
    brand: 'Nike',
    name: 'AIR-MAX',
    image: Assets.imagesSneaker04,
    price: 130.0,
    productColor: Color(0xFF3A57B1),
  ),
];
