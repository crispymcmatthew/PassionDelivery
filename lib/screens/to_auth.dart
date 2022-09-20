import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passion_delivery2/screens/home/home.dart';

class ToAuth extends StatefulWidget {
  const ToAuth({Key? key}) : super(key: key);

  @override
  State<ToAuth> createState() => _ToAuthState();
}

class _ToAuthState extends State<ToAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/toAuth_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 700.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: const [
                        0.0,
                        1.0
                      ])),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 180.0),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'DELIVERED                      '
                        'FAST FOOD                  '
                        'TO YOUR                    '
                        'DOOR',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                        fontSize: 36,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 80.0),
                  child: Text(
                    'Set exact location to find the right restaurant near you.',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                        fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()))
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(0.0)
                      )
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFC107), Color(0xFFEF5350)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Start',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
