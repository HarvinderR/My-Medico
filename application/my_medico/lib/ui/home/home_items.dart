import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_medico/model/home_item.dart';
import 'package:my_medico/utils/utils.dart';

//https://raw.githubusercontent.com/HarvinderR/My-Medico/Day-2/application/my_medico/assets/json/products.json
class HomeItemContainer extends StatelessWidget {
  final Products products;
  const HomeItemContainer({Key? key, required this.products}) : super(key: key);

  Widget getItem1() {
    List<Widget> data = List<Widget>.from(products.item1.map((e) => SizedBox(
          width: 150,
          height: 150,
          child: HomeItem3(
            url: e.url,
            text: e.title,
            color: Color(int.parse("0xff${e.color}")),
          ),
        )));
    data.insert(
        0,
        const SizedBox(
          width: 8,
        ));

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: data,
        ),
      ),
    );
  }

  Widget getItem2(BuildContext context) {
    List<Widget> data =
        List<Widget>.from(products.categories.map((e) => HomeItem1(
              url: e.url,
              text: e.title,
              height: 120,
              //color: Color(int.parse("0xff${e.color}")),
            )));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.03),
        ),
        children: data,
      ),
    );
  }

  Widget getItem3(BuildContext context) {
    List<Widget> data =
        List<Widget>.from(products.product1.map((e) => HomeItem4(
              url: e.url,
              heading: e.title,
              actualText: e.actualPrice,
              offerText: e.offerPrice,
              height: 120,
              //color: Color(int.parse("0xff${e.color}")),
            )));
    data.insert(
        0,
        SizedBox(
          width: 8,
        ));

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: data,
          ),
        )

        // GridView(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     childAspectRatio: MediaQuery.of(context).size.width /
        //         (MediaQuery.of(context).size.height / 1.03),
        //   ),
        //   children: data,
        // ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        // color: Colors.blue,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Discover Our Offering",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              getItem1(),
              Container(
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 18),
                color: Color(int.parse("0xFFECF0FF")),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Shop by Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              getItem2(context),
              Container(
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 18),
                color: Color(int.parse("0xFFECF0FF")),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Top trending products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              getItem3(context),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Top discount",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              getItem3(context),
              Container(
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 18),
                color: Color(int.parse("0xFFECF0FF")),
              ),
              Row(
                children: [],
              )
            ]),
      ),
    );
  }
}

class HomeItem1 extends StatelessWidget {
  final String url;
  final String text;
  final double? height;
  const HomeItem1(
      {Key? key, required this.url, required this.text, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Image.network(
          url,
          height: height,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        text,
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16),
      ),
    ]);
  }
}

class HomeItem2 extends StatelessWidget {
  final String url;
  final String text;
  const HomeItem2({Key? key, required this.url, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.network(url),
          Text(text),
        ]),
      ),
    );
  }
}

class HomeItem3 extends StatelessWidget {
  final String url;
  final String text;
  final Color color;
  const HomeItem3(
      {Key? key,
      required this.url,
      required this.text,
      this.color = const Color.fromARGB(255, 255, 255, 238)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Card(
          elevation: 3,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.network(
              url,
            ),
          )),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ]);
  }
}

class HomeItem4 extends StatelessWidget {
  final String url;
  final String heading;
  final String actualText;
  final String offerText;
  final double? height;
  const HomeItem4(
      {Key? key,
      required this.url,
      required this.heading,
      required this.actualText,
      required this.offerText,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 140,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Image.network(
            url,
            height: height,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            heading,
            maxLines: 2,
            // textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          actualText,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
              color: Colors.grey),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          offerText,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
