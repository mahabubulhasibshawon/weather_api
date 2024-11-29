import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1D2647),Color(0xFF8B4BAC)])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/weather.png'),
              Text('Weather', style: GoogleFonts.poppins(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),),
              Text('ForeCasts', style: GoogleFonts.poppins(fontSize: 48, color: Color(0xFFDDB130), fontWeight: FontWeight.w500)),
              ElevatedButton(onPressed: (){}, child: Text('Get Start', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFDDB130),)),)
            ],
          ),
        ),
      ),
    );
  }
}
