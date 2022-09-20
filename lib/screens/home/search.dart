import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/recipe.api.dart';
import '../../models/recipe.dart';
import '../authenticate/authenticate.dart';
import '../widgets/recipe_card.dart';
import 'home.dart';
import 'maps.dart';
import 'order.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 350,
                  child: Text(
                    'What would you like to search?',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: TextFormField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.orange),
                      hintText: 'Find what you want',
                      hintStyle: const TextStyle(color: Colors.white),
                      fillColor: Colors.blueGrey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    )
                  ),
                )
              ),
              const SizedBox(height: 15.0),
              //Popularity
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      'Popularity',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )
              ),
              const SizedBox(height: 15.0),
              //First row of popularity section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Vegan',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                        shadowColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                          )
                        )
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Nut free',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Tofu',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Calcium',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              //Second row of popularity section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Vitamin',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '0 fats',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Low carb',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Protein',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(30, 40, 46, 1.0)),
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              )
                          )
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              //Favorite
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      'Favorite',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )
              ),
              //Horizontal list view of foods
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
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
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
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
