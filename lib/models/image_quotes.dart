// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImgQuoteModel {
  static var items = [];
  static var ArrayOfDocumentSnapshots = [];
}

class ImgQuote {
  final String id;
  final String image;
  final String category;
  final int likes;

  ImgQuote({
    required this.id,
    required this.image,
    required this.category,
    required this.likes,
  });

  factory ImgQuote.fromMap(Map<String, dynamic> map) {
    return ImgQuote(
        id: map['id'] as String,
        image: map['image'] as String,
        category: map['category'] as String,
        likes: map['likes'] as int);
  }

  static String toSerializedData(ImgQuote data) {
    return "${data.id}~${data.image}~${data.category}~${data.likes}";
  }

  static ImgQuote toDeserializeData(String data) {
    List<String> newData = data.split("~");
    return ImgQuote(
        id: newData[0],
        image: newData[1],
        category: newData[2],
        likes: int.parse(newData[3]));
  }

  ImgQuote copyWith({
    String? id,
    String? image,
    String? category,
    int? likes,
  }) {
    return ImgQuote(
      id: id ?? this.id,
      image: image ?? this.image,
      category: category ?? this.category,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'category': category,
      'likes': likes
    };
  }

  factory ImgQuote.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ImgQuote(
      id: doc.id,
      image: doc.data()!["image"],
      category: doc.data()!["category"],
      likes: doc.data()!["likes"],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImgQuote.fromJson(String source) =>
      ImgQuote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ImgQuote(image: $image, category: $category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImgQuote &&
        other.id == id &&
        other.image == image &&
        other.likes == likes &&
        other.category == category;
  }

  @override
  int get hashCode => image.hashCode ^ category.hashCode;
}
