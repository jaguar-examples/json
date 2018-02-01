import 'dart:async';
import 'package:jaguar/jaguar.dart';

final List<Book> books = <Book>[
  new Book(id: '1', name: 'Harry Potter 1', author: 'JK Rowling', price: 99.50),
  new Book(id: '1', name: 'LOTR', author: 'JRR Tolkien', price: 49.50),
];

@Api(path: '/api/book')
class LibraryApi {
  /// Returns all books
  @GetJson()
  List<Book> getAll(_) => books;

  /// Adds new book to library
  @PostJson()
  Future<List<Book>> add(Context ctx) async {
    Map map = await ctx.req.bodyAsJsonMap();
    books.add(new Book().fromMap(map));
    return books;
  }

  /// Delete book by id
  @DeleteJson(path: '/:id')
  List<Book> delete(Context ctx) =>
      books..removeWhere((b) => b.id == ctx.pathParams['id']);
}

class Book {
  String id;

  String name;

  String author;

  double price;

  Book({this.id, this.name, this.author, this.price});

  void fromMap(Map<String, dynamic> map) => this
    ..id = map['id']
    ..name = map['name']
    ..author = map['author']
    ..price = map['price'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'author': author, 'price': price};

  String toString() => toJson().toString();
}
