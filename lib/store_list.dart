import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'api.dart';
import 'model.dart';
import 'store_detail.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  late Future<List<Store>> futureStores;

  @override
  void initState() {
    super.initState();
    futureStores = ApiService().fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Row(
          children: [
            Icon(Icons.local_offer, color: Colors.white),
            Center(
              child: Text(
                ' Offer List',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25),
              ),
            ),
          ],
        ),
        shadowColor: Colors.grey,
        elevation: 8,
      ),
      body: FutureBuilder<List<Store>>(
        future: futureStores,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ));
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Failed to load stores: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No stores available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var store = snapshot.data![index];
              return Card(
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: store.image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: CupertinoColors.destructiveRed,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(
                    store.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    store.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreDetail(store: store),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
