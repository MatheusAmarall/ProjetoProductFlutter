import 'package:flutter/material.dart';
import 'package:flutter_application_4/services/request_http.dart';

import 'detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Produtos"),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProduct(
                                    title: snapshot.data[index]['title'],
                                    price: snapshot.data[index]['price'],
                                    image: snapshot.data[index]['images'][0])));
                      },
                      child: Card(
                          elevation: 10,
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Image.network(snapshot.data[index]['images'][0],
                                  width: 300, height: 150, fit: BoxFit.cover),
                              SizedBox(
                                height: 12,
                              ),
                              Text('${snapshot.data[index]['title']}'),
                              Text('R\$ ${snapshot.data[index]['price']}')
                            ],
                          )),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
