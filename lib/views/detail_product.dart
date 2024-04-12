import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  String title;
  int price;
  String image;
  DetailProduct(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Center(
        child: SizedBox(
          height: 350,
          child: Card(
              elevation: 10,
              color: Colors.grey,
              child: Column(
                children: [
                  Image.network(widget.image,
                      width: 300, height: 250, fit: BoxFit.cover),
                  SizedBox(
                    height: 12,
                  ),
                  Text('${widget.title}'),
                  Text('R\$ ${widget.price}')
                ],
              )),
        ),
      ),
    );
  }
}
