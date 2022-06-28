// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_flutter/utils/gradient_colors.dart';

class TextQuoteModel {
  static var items = [];

  static var ArrayOfDocumentSnapshots = [];
}

class TextQuote {
  final String id;
  final String text;
  final String category;
  final String author;
  final int likes;
  final String colors;

  TextQuote({
    required this.id,
    required this.text,
    required this.category,
    required this.author,
    required this.likes,
    required this.colors,
  });

  factory TextQuote.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return TextQuote(
      id: doc.id,
      text: doc.data()!["text"],
      category: doc.data()!["category"],
      author: doc.data()!["author"],
      likes: doc.data()!["likes"],
      colors: GColors.getRandomColorAsString(),
    );
  }

  static String toSerializedData(TextQuote data) {
    return "${data.id}~${data.text}~${data.category}~${data.author}~${data.likes}~${data.colors}";
  }

  static TextQuote toDeserializeData(String data) {
    List<String> newData = data.split("~");
    return TextQuote(
        id: newData[0],
        text: newData[1],
        category: newData[2],
        author: newData[3],
        likes: int.parse(newData[4]),
        colors: newData[5]);
  }

  TextQuote copyWith({
    String? id,
    String? text,
    String? category,
    String? author,
    int? likes,
  }) {
    return TextQuote(
        id: id ?? this.id,
        text: text ?? this.text,
        category: category ?? this.category,
        author: author ?? this.author,
        likes: likes ?? this.likes,
        colors: GColors.getRandomColorAsString());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'category': category,
      'author': author,
      'likes': likes,
      'colors': colors,
    };
  }

  factory TextQuote.fromMap(Map<String, dynamic> map) {
    return TextQuote(
      id: map['id'] as String,
      text: map['text'] as String,
      category: map['category'] as String,
      author: map['author'] as String,
      likes: map['likes'] as int,
      colors: GColors.getRandomColorAsString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TextQuote.fromJson(String source) =>
      TextQuote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TextQuote(id: $id, text: $text, category: $category, author: $author, likes: $likes, colors: $colors)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextQuote &&
        other.id == id &&
        other.text == text &&
        other.category == category &&
        other.author == author &&
        other.likes == likes &&
        other.colors == colors;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        category.hashCode ^
        author.hashCode ^
        likes.hashCode ^
        colors.hashCode;
  }
}
