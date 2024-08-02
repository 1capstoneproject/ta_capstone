import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_capstone/presentation/pages/dashboard/home_screen.dart';
import 'package:ta_capstone/service/services.dart';

import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CetakTiket extends StatelessWidget {
  
  final Map<String, dynamic> data;

  const CetakTiket({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: HomeClipper(),
            child: Container(
              height: 250.sp,
              color: AppColors.LightGreen500,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: 70.sp,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/white.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 35,
                      ),
                      child: Center(
                        child: Material(
                          elevation: .8.sp,
                          borderRadius: BorderRadius.circular(16),
                          child: TicketWidget(
                            width: 300.sp,
                            height: 500.sp,
                            isCornerRounded: true,
                            padding: EdgeInsets.all(20),
                            child: TicketData(data: data),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // persistentFooterButtons: [
      //   Align(
      //     alignment: Alignment.bottomCenter,
      //     child: ButtonComponent(
      //       title: 'Download E - Ticket',
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               content: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: [
      //                   Image.asset(
      //                       'assets/images/ticketpopup.png'), // Replace with your image path
      //                   SizedBox(height: 10.sp),
      //                   Text(
      //                     'Ticket Berhasil Disimpan',
      //                     style: titleMedium,
      //                   ),
      //                   SizedBox(height: 10.sp),
      //                   Text(
      //                     'E-ticket anda berhasil Disimpan di perangkat anda',
      //                     style: bodyMedium,
      //                     textAlign: TextAlign.center,
      //                   ),
      //                 ],
      //               ),
      //               actions: [
      //                 TextButton(
      //                   child: Text('Batal'),
      //                   onPressed: () {
      //                     Get.back();
      //                   },
      //                 ),
      //                 TextButton(
      //                   child: Text('Unduh'),
      //                   onPressed: () {
      //                     Get.back();
      //                     
      //                     // Add your download logic here
      //                   },
      //                 ),
      //               ],
      //             );
      //           },
      //         );
      //       },
      //     ),
      //   )
      // ],
    );
  }
}

class TicketData extends StatelessWidget {

  final Map<String, dynamic> data;
  final ApiServices api = Get.find<ApiServices>();

  TicketData({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? dateOrder = DateTime.tryParse(data['date']);
    DateTime? eventDate = DateTime.tryParse(data['product']['event_date']);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['product']['name'],
                  style: titleLarge,
                ),
                SizedBox(height: 4.sp),
                Text(
                  data['code'],
                  style: bodySmallGrey,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: Container(
                width: 60.0.sp,
                height: 60.0.sp,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: (data['product']['images_ids'] as List).length == 0 ? 
                  Image.asset("assets/images/no-image.png") :
                  Image.network("${api.endpoint}/storage/${data['product']['images_ids'][0]['path']}"),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(
          color: AppColors.LightGreen200,
        ),
        SizedBox(height: 20.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Data Pesanan',
              style: titleLarge,
            ),
          ],
        ),
        SizedBox(height: 10.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nama Pesanan',
              style: bodySmallGrey,
            ),
            Text(
              data["contact_name"],
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'Kategori',
        //       style: bodySmallGrey,
        //     ),
        //     Text(
        //       'Liburan',
        //       style: bodyMedium,
        //     ),
        //   ],
        // ),
        SizedBox(height: 8.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanggal Keberangkatan',
              style: bodySmallGrey,
            ),
            Text(
              dateOrder != null ? DateFormat("yyyy-MM-dd").format(dateOrder) : "",
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jumlah Kelompok',
              style: bodySmallGrey,
            ),
            Text(
              data['quantity'].toString(),
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Status',
              style: bodySmallGrey,
            ),
            Text(
              getStatus(data['status']),
              style: bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 15.sp),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Text(
        //       'Metode pembayaran QRIS',
        //       style: titleLarge,
        //     ),
        //   ],
        // ),
        Divider(
          color: AppColors.LightGreen200,
        ),
        SizedBox(height: 10.sp),
        Visibility(
          visible: eventDate != null,
          child: Text(
            'Tanggal',
            style: bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        Visibility(
          visible: eventDate != null,
          child: Text(
            eventDate != null ? DateFormat("yyyy-MM-dd hh:mm aa").format(eventDate) : "",
            style: titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          'Datang sesuai jadwal dan tunjukan tiket ini ke petugas.',
          style: bodySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8.sp,
        ),
        //Text(
          //'Rp. 0.000.000',
          //style: titleMediumGreen,
          //textAlign: TextAlign.center,
        //),
      ],
    );
  }


  String getStatus(String value){
    switch (value) {
      case 'inprogress':
        return "Menunggu Pembayaran";
      case 'cancel':
        return "Batal";
      case 'refund':
        return "Refund";
      case 'paid':
        return "Sudah Di bayar";
      case 'done':
        return "Selesai";
      case 'draft':
        return "Whistlist";
      case 'checkin':
        return "Checkin";
      case 'onprogress':
        return "Sedang Berlibur";
      default:
        return "Tidak di ketahui";
    }
  }
}
