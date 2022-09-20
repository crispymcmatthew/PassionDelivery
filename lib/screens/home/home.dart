import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:passion_delivery2/screens/home/order.dart';
import 'package:passion_delivery2/screens/home/search.dart';
import '../../models/recipe.api.dart';
import '../../models/recipe.dart';
import '../authenticate/authenticate.dart';
import '../widgets/recipe_card.dart';
import 'maps.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: Text(
                      'Hello Matteo',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                        fontSize: 26,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: ImageSlideshow(
                      width: 350,
                      height: 200,
                      initialPage: 0,
                      indicatorColor: Colors.orange,
                      indicatorBackgroundColor: Colors.grey,
                      children: [
                        Image.asset(
                          'lib/assets/promo1.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'lib/assets/promo2.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'lib/assets/promo3.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'lib/assets/promo4.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'lib/assets/promo5.jpg',
                          fit: BoxFit.cover,
                        )
                      ],
                      autoPlayInterval: 3000,
                      isLoop: true
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          'Categories',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          'See all',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //ListView breakfast, ecc...
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 25.0),
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 40, 46, 1),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Dinner',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 40, 46, 1),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Lunch',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 40, 46, 1),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Breakfast',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 40, 46, 1),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Cafe',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 40, 46, 1),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Healtyfood',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 40, 46, 1),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Fastfood',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                //Near you
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          'Near you',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          'See all',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Load API
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: _isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        title: _recipes[index].name,
                        thumbnailUrl: _recipes[index].images,
                        rating: _recipes[index].rating.toString(),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 30.0),
                //Popular
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          'Popular',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          'See all',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white54, letterSpacing: .8),
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Load API
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: _isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        title: _recipes[index].name,
                        thumbnailUrl: _recipes[index].images,
                        rating: _recipes[index].rating.toString(),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
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
            backgroundColor: Color.fromRGBO(30, 40, 46, 1)
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Order(price: 20, countItem: 1)));
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
      ),
    );
  }
}
