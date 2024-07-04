import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class KeranjangScreen extends StatelessWidget {
  const KeranjangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
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
          margin: EdgeInsets.all(10),
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
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
                        id: 'ID123456',
                        title: 'Title',
                        price: 'Price',
                        status:
                            'menunggu', // Update this value to test different statuses
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartKeranjang extends StatelessWidget {
  final String id;
  final String title;
  final String price;
  final String status;

  const CartKeranjang({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // Determine status text color based on the status value
    Color statusColor;
    switch (status) {
      case 'menunggu':
        statusColor = AppColors.Warming500;
        break;
      case 'belum bayar':
        statusColor = AppColors.Red500;
        break;
      case 'sukses':
        statusColor = AppColors.Green500;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          id,
          style: bodySmallGrey,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: titleSmall,
        ),
        Text(
          price,
          style: titleSmallGreen,
        ),
        SizedBox(height: 8), // Add spacing between price and status
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: statusColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            status,
            style: labelSmall.copyWith(color: statusColor),
          ),
        ),
      ],
    );
  }
}
