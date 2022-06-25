// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  TextQuote({
    required this.id,
    required this.text,
    required this.category,
    required this.author,
    required this.likes,
  });

  factory TextQuote.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return TextQuote(
      id: doc.id,
      text: doc.data()!["text"],
      category: doc.data()!["category"],
      author: doc.data()!["author"],
      likes: doc.data()!["likes"],
    );
  }

  static String toSerializedData(TextQuote data) {
    return "${data.id}~${data.text}~${data.category}~${data.author}~${data.likes}";
  }

  static TextQuote toDeserializeData(String data) {
    List<String> newData = data.split("~");
    return TextQuote(
        id: newData[0],
        text: newData[1],
        category: newData[2],
        author: newData[3],
        likes: int.parse(newData[4]));
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'category': category,
      'author': author,
      'likes': likes,
    };
  }

  factory TextQuote.fromMap(Map<String, dynamic> map) {
    return TextQuote(
      id: map['id'] as String,
      text: map['text'] as String,
      category: map['category'] as String,
      author: map['author'] as String,
      likes: map['likes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextQuote.fromJson(String source) =>
      TextQuote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TextQuote(id: $id, text: $text, category: $category, author: $author, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextQuote &&
        other.id == id &&
        other.text == text &&
        other.category == category &&
        other.author == author &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        category.hashCode ^
        author.hashCode ^
        likes.hashCode;
  }
}
