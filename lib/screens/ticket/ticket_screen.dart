import 'package:barcode_widgets/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/utils/app_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layout_builder_widget.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_position_circles.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            children: [
              const AppTicketTabs(
                firstTab: 'Upcoming',
                secondTab: 'Previous',
              ),
              const SizedBox(
                height: 20,
              ),
              //white and black ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketColor,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: 'Flutter DB',
                          bottomText: 'Passenger',
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: '5221 36869',
                          bottomText: 'Passport',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: '2465 65859537340',
                          bottomText: 'Number of E-ticket',
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: 'B46895',
                          bottomText: 'Booking Code',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visaCard,
                                  height: 50,
                                  width: 50,
                                ), //main scale to use with actual Visa Logo is #11
                                Text(
                                  ' *** 2462',
                                  style: AppStyles.headLineStyle3,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Payment Method',
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          topText: '\$249.99',
                          bottomText: 'Price',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              //bottom of the ticket detail section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(21),
                      bottomLeft: Radius.circular(21)),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarCodeImage(
                      codeType: BarCodeType.Code128,
                      data: "https://www.samuel.com",
                      hasText: false,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //colorful ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                ),
              ),
            ],
          ),
          const TicketPositionCircles(
            pos: true,
          ),
          const TicketPositionCircles(
            pos: false,
          )
        ],
      ),
    );
  }
}
