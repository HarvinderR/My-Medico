import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_medico/utils/utils.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String cartSize = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border(
        //   bottom: BorderSide(
        //     color: Colors.grey,
        //     width: 3,
        //   ),
        // ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 5.0, offset: Offset(0.0, 0.75))
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(children: [
              const Text(
                "My Medicos",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Badge(
                    badgeColor: Colors.red,
                    showBadge: true,
                    badgeContent: Text(
                      cartSize,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: Image.asset(
                      "$assetsIconPath/cart.png",
                      height: 25,
                      width: 25,
                    )),
              ),
              //Image.asset(""),
            ]),
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
              border: OutlineInputBorder(),
              //labelText: label,
              hintText: "Search for medicine",
              // helperText: 'help',
              // counterText: 'counter',
              //icon: Icon(Icons.star),
              prefixIcon: Icon(Icons.search, size: 20, color: Colors.black),
              //suffixIcon: Icon(Icons.park),
            ),
          )
        ],
      ),
    );
  }
}
