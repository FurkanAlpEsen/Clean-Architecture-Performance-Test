import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/album.dart';

class DenemeScreen extends StatefulWidget {
  const DenemeScreen({super.key});

  @override
  State<DenemeScreen> createState() => _DenemeScreenState();
}

class _DenemeScreenState extends State<DenemeScreen> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = _getData();
  }

  Future<List<Album>> _getData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);

      print('-----list :${list}');

      var albums = list.map((e) => Album.fromJson(e)).toList();

      print('----albums: ${albums.first.id}');
      return albums;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data'),
      ),
      body: FutureBuilder(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text('${snapshot.data![index].userId}'),
                    Text(snapshot.data![index].title),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print(futureAlbum);
          _getData();
        },
      ),
    );
  }
}
