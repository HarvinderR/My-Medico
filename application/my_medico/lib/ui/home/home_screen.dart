import 'package:flutter/material.dart';
import 'package:my_medico/model/home_item.dart';
import 'package:my_medico/ui/home/home_header.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_medico/ui/home/home_items.dart';

class HomeScreen extends StatelessWidget {
  static const String rnLoginScreen = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  Products? _products;

  Future<Products> getProducts() async {
    String res = await rootBundle.loadString('json/products.json');
    return welcomeFromJson(res);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts().then((value) {
      _products = value;
      setState(() {});
    });
  }

  Widget listItems() => ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Container(
              //padding: EdgeInsets.all(10),
              child: (index % 5) == 0
                  ? Container(
                      padding: EdgeInsets.zero,
                      height: 50,
                      color: Colors.blue,
                      child: Image.network(
                          fit: BoxFit.contain,
                          "https://assets.pharmeasy.in/apothecary/images/medicine_ff.webp?dim=256x0"),
                    )
                  : Text("Item value is $index"));
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HomeHeader(),
      Expanded(
          child: _products == null
              ? listItems()
              : HomeItemContainer(products: _products!))
    ]);
  }
}
