import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

import '../authenticate/authenticate.dart';
import 'home.dart';
import 'order.dart';

class Maps extends StatefulWidget{
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps>{

  late GoogleMapController mapController; //controller for Google map
  final Set<Marker> markers = {}; //markers for google map
  static const LatLng showLocation = LatLng(45.5971677, 9.1512077);

  Set<Marker> getMarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //my marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        icon: BitmapDescriptor.defaultMarkerWithHue(240.0), //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(45.5970616, 9.1469939), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Ristorante Claudio\'s',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(45.5970935, 9.1495366), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'L\'Aragosta Ristorante Pizzeria Bar',
          snippet: 'Di Nestico\' Caterina&C',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(45.6001648, 9.14265), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Arigatò',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(45.6000447, 9.1415342), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Trattoria Bar Rondinella Snc',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(45.5975497, 9.1473397), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Monkey Di Baseggio Cristiano',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(45.5974774, 9.1423496), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Pizzeria Punto Italia osteria della pizza',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });
    return markers;
  }

   @override
  Widget build(BuildContext context) {
     return  Scaffold(
       body: GoogleMap( //Map widget from google_maps_flutter package
         zoomGesturesEnabled: true, //enable Zoom in, out on map
         initialCameraPosition: const CameraPosition( //inital position in map
           target: showLocation, //initial position
           zoom: 15.0, //initial zoom level
         ),
         markers: getMarkers(), //markers to show on map
         mapType: MapType.normal, //map type
         onMapCreated: (controller) { //method called when map is created
           setState(() {
             mapController = controller;
           });
         },
       ),
         bottomNavigationBar: BottomNavigationBar(
           selectedItemColor: Colors.orange,
           unselectedItemColor: Colors.grey,
           currentIndex: 2,
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
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
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