import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passion_delivery2/screens/home/search.dart';
import '../authenticate/authenticate.dart';
import 'home.dart';
import 'maps.dart';

class Order extends StatefulWidget {
  const Order({Key? key, required this.price, required this.countItem}) : super(key: key);

  final int price;
  final int countItem;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order>{
  int price = 20;
  int countItem = 1;
  int delivery = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(30, 40, 46, 1),
            ),
          ),
          const SizedBox(height: 30.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              Center(
                child: SizedBox(
                  width: 350,
                  child: Text(
                    'My Order',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                      fontSize: 26,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 45.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(0.0)
                            )
                        ),
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [Color(0xFFFFC107), Color(0xFFEF5350)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight
                              ),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Wallet',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '€ 62.00',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              const Divider(height: 5.0, color: Colors.white),
              const SizedBox(height: 15.0),
              SizedBox(
                height: 30.0,
                child: Center(
                  child: SizedBox(
                    width: 350.0,
                    child: Text(
                      'Item to Order',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ),
              //Info food&restaurant + add/substract button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('lib/assets/carbonara.jpg'), fit: BoxFit.fill)
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
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
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(width: 350.0, height: 80.0),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Container(
                  alignment: Alignment.bottomRight,
                  height: 45.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(0.0)
                      )
                    ),
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFC107), Color(0xFFEF5350)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Pay',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              const Divider(height: 5.0, color: Colors.white),
              const SizedBox(height: 15.0),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text(
                        'Order',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        '€ ' + (price * countItem).toString(),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text(
                        'Delivery',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        '€ ' + delivery.toString(),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              const Divider(height: 5.0, color: Colors.white),
              const SizedBox(height: 15.0),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text(
                        'Total',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        countItem == 0 ? '€ 0' : '€ ' + ((price * countItem) + delivery).toString(),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: 3,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromRGBO(30, 40, 46, 1)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Color.fromRGBO(30, 40, 46, 1)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
              backgroundColor: Color.fromRGBO(30, 40, 46, 1)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              label: 'Store',
              backgroundColor: Color.fromRGBO(30, 40, 46, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromRGBO(30, 40, 46, 1)
            ),
          ],
          onTap: (value) {
            if(value == 0) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
            }
            if(value == 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Search()));
            }
            if(value == 2) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Maps()));
            }
            if(value == 3) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const Order(countItem: 1, price: 20)));
            }
            if(value == 4) {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(20)
                    )
                ),
                builder: (context) => Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.exit_to_app, color: Colors.grey),
                      title: const Text(
                          'Log out',
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('AlertDialog'),
                          content: const Text('Are you sure to Log Out?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => {
                                Navigator.pop(context, 'Cancel'),
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Authenticate())),
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ListTile(
                        leading: Icon(Icons.link, color: Colors.grey),
                        title: Text(
                            'Get link',
                            style: TextStyle(
                                color: Colors.grey
                            )
                        )
                    ),
                    const ListTile(
                      leading: Icon(Icons.edit, color: Colors.grey),
                      title: Text(
                          'Edit name',
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.delete, color: Colors.grey),
                      title: Text(
                          'Delete collection',
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ],
                ),
                backgroundColor: const Color.fromRGBO(30, 40, 46, 1)
              );
            }
          },
        )
    );
  }
}