import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Items extends StatefulWidget {
  const Items({Key? key, required this.price, required this.countItem}) : super(key: key);

  final int price;
  final int countItem;

  @override
  State<Items> createState() => _ItemState();
}

class _ItemState extends State<Items> {
  int price = 20;
  int countItem = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Spaghetti Carbonara',
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'Ristorante Claudio\'s',
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            '€ ' + price.toString(),
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (countItem > 0) {
                      countItem--;
                    }
                  });
                },
                color: Colors.orange,
              ),
              Text(
                countItem.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  )
              ),
              IconButton(
                icon: const Icon(Icons.add),
                color: Colors.orange,
                onPressed: () {
                  setState(() {
                    countItem++;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
