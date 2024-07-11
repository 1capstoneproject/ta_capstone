import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_capstone/presentation/controller/transaction_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ta_capstone/presentation/pages/check_out/checkout_paket.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ta_capstone/share/app_style/style.dart';

class KeranjangScreen extends GetView<KeranjangController> {

  const KeranjangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KeranjangController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: titleLarge,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: controller.fetchAllTransaction,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: 1.sh,
              minWidth: 1.sw,
            ),
            child: Obx(() => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.transaction.length,
              itemBuilder: (context, index){
                var transaction = controller.transaction[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          await controller.actionDeleteTransaction(transaction["id"]);
                        },
                        label: "Hapus",
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await Get.to(() => DaftarTiket(
                        data: transaction,
                      ), arguments: transaction);
                      await controller.fetchAllTransaction();
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: .8.sp,
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
                                    image: NetworkImage(
                                      transaction["product"]["images_ids"].length == 0 ? "" : "${controller.api.endpoint}/storage/${transaction['product']['images_ids'][0]['path']}",
                                    ),
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
                                    id: transaction["code"],
                                    title: transaction["product"]["name"].toString(),
                                    price: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((transaction['total']as int)),
                                    status: transaction["status"]??"", // Update this value to test different statuses
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
              },
            )),
          )
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
      case 'inprogress':
        statusColor = AppColors.Warming500;
        break;
      case 'cancel':
        statusColor = AppColors.Red500;
        break;
      case 'refund':
        statusColor = AppColors.Red500;
        break;
      case 'paid':
        statusColor = AppColors.Green500;
        break;
      case 'done':
        statusColor = AppColors.Green500;
        break;
      default:
        statusColor = Colors.grey;
    }
    String statusText  = "";
    switch (status) {
      case 'inprogress':
        statusText = "Menunggu Pembayaran";
        break;
      case 'cancel':
        statusText = "Batal";
        break;
      case 'refund':
        statusText = "Refund";
        break;
      case 'paid':
        statusText = "Sudah Di bayar";
        break;
      case 'done':
        statusText = "Selesai";
        break;
      case 'draft':
        statusText = "Whistlist";
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
            statusText,
            style: labelSmall.copyWith(color: statusColor),
          ),
        ),
      ],
    );
  }
}
