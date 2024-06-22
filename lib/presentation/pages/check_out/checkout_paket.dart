import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ta_capstone/presentation/pages/check_out/data_diri.dart';
import 'package:ta_capstone/share/app_style/style.dart';

import '../../widget/button.dart';

class DaftarTiket extends StatelessWidget {
  const DaftarTiket({super.key});

  @override
  Widget build(BuildContext context) {
    bool _homeStay = false;

    bool _fotoGrafer = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beli Paket',
          style: titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 2,
              height: 150,
              child: CartWidget(),
            ),
            SizedBox(height: 8),
            SelectTanggal(),
            JumlahOrang(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponent(
            title: 'Beli Sekarang',
            onPressed: () {
              Get.to(
                () => DataDiri(),
              );
            },
          ),
        ),
      ],
    );
  }
}

//akhir - page---------

//CartWidget---------------
class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://c4.wallpaperflare.com/wallpaper/210/493/172/landscape-photography-of-green-mountains-during-day-time-wallpaper-preview.jpg',
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
                  child: CartCheckout(
                    title: 'longlivia',
                    date: '1 hari',
                    price: 'Rp. 450.000',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// akhir page-------------

//Selct-Tanggal-----------
class SelectTanggal extends StatefulWidget {
  const SelectTanggal({super.key});

  @override
  State<SelectTanggal> createState() => _SelectTanggalState();
}

class _SelectTanggalState extends State<SelectTanggal> {
  late TextEditingController dateController;

  @override
  void initState() {
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Tanggal',
              style: titleMediumGrey,
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: '19/02/2024',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.date_range),
                ),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dateController.text = pickedDate.toString();
                    });
                  }
                },
              ),
            ),
          ],
        ));
  }
}
//akhir page-------------

//jumlah - orang-------------
class JumlahOrang extends StatefulWidget {
  const JumlahOrang({super.key});

  @override
  State<JumlahOrang> createState() => _JumlahOrangState();
}

class _JumlahOrangState extends State<JumlahOrang> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Orang',
              style: titleMediumGrey,
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String?>(
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  underline: SizedBox(),
                  isExpanded: true,
                  hint: Text('0'),
                  items: [
                    '1',
                    '2',
                    '3',
                  ]
                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ))
                      .toList()),
            ),
          ],
        ));
  }
}
//akhir page----

//page Cart - check - out -------
class CartCheckout extends StatelessWidget {
  final String title;
  final String date;
  final String price;
  const CartCheckout({
    super.key,
    required this.title,
    required this.date,
    required this.price,
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
//akhir - page-----

