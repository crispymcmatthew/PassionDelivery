import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/auth.dart';
import '../home/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? const Home() : Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/login_background.jpg'),
                  fit: BoxFit.fill
                //fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 180.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                color: Colors.black87,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .8),
                            fontSize: 26,
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 40.0),
                          TextFormField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: const TextStyle(color: Colors.white),
                                fillColor: Colors.black87,
                                filled: true,
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red[400]!)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red[400]!))
                            ),
                            validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                            onChanged: (val){
                              setState(() => email = val);
                            },
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                              obscureText: true,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(color: Colors.white),
                                  fillColor: Colors.black87,
                                  filled: true,
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red[400]!)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red[400]!))
                              ),
                              validator: (val) => val!.length < 6 ? 'Enter a password 6+ char long' : null,
                              onChanged: (val){
                                setState(() => password = val);
                              }
                          ),
                          const SizedBox(height: 60.0),
                          SizedBox(
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                  setState(() => loading = true);
                                  dynamic result = await Future.value(_auth.registerWithEmailAnsPsw(email, password));
                                  if(result == null){
                                    setState(()  {
                                      error = 'please apply a valid email';
                                      loading = false;
                                    });
                                  }
                                }
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
                                    'Register',
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
                          const SizedBox(height: 20.0),
                          Text(
                            'Already have an account?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                widget.toggleView();
                              },
                              child: Text(
                                'Signin',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.red[400], letterSpacing: .5),
                                  fontSize: 18,
                                ),
                              )
                          ),
                          const SizedBox(height: 20.0,),
                          Text(
                            error,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ]
      )
    );
  }
}
