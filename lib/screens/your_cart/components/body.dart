import 'package:ecommerce_ui/models/Cart.dart';
import 'package:ecommerce_ui/screens/your_cart/components/cart_item_card.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: List.generate(
              demoCarts.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Slidable(
                        key: Key(demoCarts[index].product.id.toString()),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.16,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffffe6e6)),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      demoCarts.removeAt(index);
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  child: Align(
                                      child: SvgPicture.asset(
                                          "assets/icons/Trash.svg")),
                                ),
                              ),
                            )
                          ],
                        ),
                        child: CartItemCard(card: demoCarts[index])),
                  )),
        ),
      ),
    );
  }
}
