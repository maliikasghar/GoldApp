import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GoldAppScreen extends StatefulWidget {
  const GoldAppScreen({super.key});

  @override
  State<GoldAppScreen> createState() => _GoldAppScreenState();
}

class _GoldAppScreenState extends State<GoldAppScreen> {
  double totalPrice = 0.0;
  TextEditingController tolaPriceController = TextEditingController();
  TextEditingController tolaQuantityController = TextEditingController();
  TextEditingController mashaQuantityController = TextEditingController();
  TextEditingController rattiQuantityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Gold Calculation App', style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold, color: Colors.black),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        tolaQuantityController.clear();
        tolaPriceController.clear();
        mashaQuantityController.clear();
        rattiQuantityController.clear();
        totalPrice=0.0;
        setState(() {

        });
      } , backgroundColor: Colors.amber, child: Icon(Icons.refresh),) ,

      body: SingleChildScrollView(
        child: Column(children: [
          ///TODO: Tola Price Text Form Field
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: tolaPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Tola Price',
                      hintStyle: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///TODO: Tola Quantity Text Form Field
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 40, right: 40, top: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: tolaQuantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Tola Quantity',
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
          ),

          ///TODO: Masha Quantity Text Form Field
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 40, right: 40, top: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: mashaQuantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Masha Quantity',
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
          ),

          ///TODO: Ratti Quantity Text Form Field
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 40, right: 40, top: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: rattiQuantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Ratti Quantity',
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
          ),

          // Display Total Price
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Total Price: $totalPrice',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),

          ///TODO: Calculation Button
          GestureDetector(
            onTap: () {
              // Set default value to '0' for empty fields
              if (tolaPriceController.text.isEmpty) {
                Get.defaultDialog(
                    title: 'Error',
                    content: Text('Tola price must be filled'),
                    actions: [
                      TextButton(onPressed: () {
                        Get.back();
                      }, child: Text('Ok'))
                    ]
                );


                Get.snackbar(
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(Icons.error_outline),
                    'Error',
                    'Tola price must be filled',
                    backgroundColor: Colors.amber.withOpacity(0.5)
                );
                //tolaPriceController.text = '0';
              }
              if (tolaQuantityController.text.isEmpty) {
                tolaQuantityController.text = '0';
              }
              if (mashaQuantityController.text.isEmpty) {
                mashaQuantityController.text = '0';
              }
              if (rattiQuantityController.text.isEmpty) {
                rattiQuantityController.text = '0';
              }

              // Parse inputs
              double tolaPrice = double.parse(tolaPriceController.text);
              double tolaQuantity = double.parse(tolaQuantityController.text);
              double mashaQuantity = double.parse(mashaQuantityController.text);
              double rattiQuantity = double.parse(rattiQuantityController.text);

              // Masha formula: 1 tola = 12 masha
              double pricePerMasha = tolaPrice / 12;
              double totalPriceMasha = pricePerMasha * mashaQuantity;

              // Ratti formula: 1 masha = 8 ratti
              double pricePerRatti = pricePerMasha / 8;
              double totalPriceRatti = pricePerRatti * rattiQuantity;

              // Total Price calculation
              totalPrice = (tolaPrice * tolaQuantity) +
                  totalPriceMasha +
                  totalPriceRatti;

              // Update the UI
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(top: 0),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: Text('Calculate',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top:245),
            child: Container(
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'maliikasgharr@gmail.com',
                    style: TextStyle( fontSize: 15,
                      color: Colors.black26,
                      fontWeight: FontWeight.w200,),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
