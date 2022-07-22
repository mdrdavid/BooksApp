import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Books Listing"),
        ),
        body: BooksListing(),
      ),
    );
  }
}

class BooksListing extends StatelessWidget {
  final booksListing = bookData();
  BooksListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: booksListing == null ? 0 : booksListing.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${booksListing[index]["title"]}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            booksListing[index]["title"] != null
                                ? Text(
                                    'Author(s): ${booksListing[index]["authors"].json(",")}',
                                    style: const TextStyle(fontSize: 14),
                                  )
                                : const Text(""),
                            booksListing[index]["image"] != null
                                ? Image.asset(
                                    booksListing[index]["image"],
                                    fit: BoxFit.fill,
                                  )
                                : Container()
                          ]),
                    ),
                    Image.asset(
                      'assets/images/david.jpg',
                      fit: BoxFit.fill,
                    ),
                  ],
                )),
          );
        });
  }
}

List bookData() {
  return [
    {
      'title': 'Book Title',
      'authors': ['Author1', 'Author2'],
      'image': 'assets/book_cover.png'
    },
    {
      'title': 'Book Title 2',
      'authors': ['Author1'],
      'image': 'assets/book_cover.png'
    }
  ];
}
