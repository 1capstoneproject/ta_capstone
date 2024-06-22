import 'package:flutter/material.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class KeranjangScreen extends StatelessWidget {
  const KeranjangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(
            10,
          ),
          elevation: 7,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    7,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(
                  7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(''),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: CartKeranjang(
                          title: 'title',
                          date: 'date',
                          price: ' price',
                          status: true),
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class CartKeranjang extends StatelessWidget {
  final String title;
  final String date;
  final String price;
  final bool status;
  const CartKeranjang({
    super.key,
    required this.title,
    required this.date,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleMedium,
        ),
        Text(
          date,
          style: titleMediumGrey,
        ),
        Text(
          price,
          style: titleMediumGreen,
        ),
      ],
    );
  }
}
