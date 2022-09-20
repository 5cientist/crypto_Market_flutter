import 'package:crypto_market/controllers/coin_controller.dart';
import 'package:crypto_market/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crypto Market",
                style: textStyle(25, Colors.white, FontWeight.bold),
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[700],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[700]!,
                                                offset: const Offset(4, 4),
                                                blurRadius: 5,
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.network(controller
                                                .coinsList[index].image),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.coinsList[index].name,
                                              style: textStyle(18, Colors.white,
                                                  FontWeight.w600),
                                            ),
                                            Text(
                                              "${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2)}",
                                              style: textStyle(18, Colors.white,
                                                  FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$ ${controller.coinsList[index].currentPrice.round()}",
                                          style: textStyle(18, Colors.white,
                                              FontWeight.w600),
                                        ),
                                        Text(
                                          controller.coinsList[index].symbol
                                              .toUpperCase(),
                                          style: textStyle(18, Colors.white,
                                              FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
