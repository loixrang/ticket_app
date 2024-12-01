import 'package:flutter/material.dart';

class HotelDetail extends StatelessWidget {
  const HotelDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                title: const Text('Hotel Title'),
                background:
                    Image.network('https://via.placeholder.com/600x400')),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      'In one of London\'s business districts, 2 miles from the World Trade Center, this hotel offers a free shuttle to the beach and shopping malls.Holiday Inn Express Dubai’s rooms are decorated in sandy brown tones and fitted with deluxe bedding. The living area features a loose-back sofa and TV with access to multilingual channels.At Holiday Inn Dubai, the front desk is open throughout the day, and the attentive staff can organize outdoor excursions, including desert safaris.Guests can order light snacks and sandwiches at the Lobby bar. It offers music entertainment and a range of wines and draft beers. Warm drinks, smoothies and fruit drinks made from fresh ingredients are available. A hot buffet breakfast is served daily.Holiday Inn Express Dubai is a 20 minute drive from Dubai Airport.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "More Images",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Image.network(
                          "https://via.placeholder.com/200x200",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
