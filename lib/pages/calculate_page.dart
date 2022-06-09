import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  // ຕຳແໜ່ງສຳລັບເກັບຂໍ້ມູນຂອງຄ່າທີ່ User ພິມໃສ່
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  // double price = 15000;
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    super.initState();
    result.text =
        'Phenomenal Logistic ຂົນສົ່ງຈີນ - ລາວ\nຄ່າຂົນສົ່ງກິໂລ 15,000 ກີບ\nຈຳນວນ x ກິໂລ\nລວມທັງໝົດທີ່ລູກຄ້າຕ້ອງຈ່າຍ x LAK';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Center(
            child: Column(
              children: [
                buildImage(),
                const SizedBox(height: 20),
                buildText(),
                const SizedBox(height: 20),
                buildPriceField(),
                const SizedBox(height: 20),
                buildQuantityField(),
                const SizedBox(height: 20),
                buildButton(),
                const SizedBox(height: 20),
                buildTextRusult(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text buildTextRusult() {
    return Text(
      result.text,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    );
  }

  TextButton buildButton() {
    return TextButton(
      onPressed: () {
        var calculate = double.parse(quantity.text) * double.parse(price.text);
        print('Product quantity ${quantity.text} Total : $calculate LAK');
        setState(
          () {
            result.text =
                'Phenomenal Logistic ຂົນສົ່ງຈີນ - ລາວ\nຄ່າຂົນສົ່ງກິໂລ 15,000 ກີບ\nຈຳນວນ ${quantity.text} ກິໂລ\nລວມທັງໝົດທີ່ລູກຄ້າຕ້ອງຈ່າຍ ${calculate.toStringAsFixed(2)} LAK';
          },
        );
      },
      child: const Text(
        'ຄິດໄລ່',
        style: TextStyle(
          color: Colors.red,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container buildPriceField() {
    // return TextField(
    //   controller: price,
    //   decoration: InputDecoration(
    //     hintText: 'ລາຄາຂົນສົ່ງ : ',
    //     hintStyle: const TextStyle(
    //       color: Colors.red,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.red.shade300,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    // );
     return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: price,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'ລາຄາຂົນສົ່ງ :',
          icon: Icon(Icons.price_change),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }


  Widget buildQuantityField() {
    // return TextField(
    //   controller: quantity,
    //   decoration: InputDecoration(
    //     hintText: 'ຈຳນວນກິໂລ : ',
    //     hintStyle: const TextStyle(
    //       color: Colors.red,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.red.shade300,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    // );
     return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: quantity,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'ຈຳນວນກິໂລ :',
          icon: Icon(Icons.calculate),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
    
  }

  Widget buildText() {
    return const Text(
      'calculate',
      style: TextStyle(fontSize: 30, color: Colors.red),
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/phenomenal_logistic2.jpg',
    );
  }
}
