import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg')),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 200, left: 110),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.blue[400],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Fachrul Huda Pratama'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.blue[400],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Teknik Informatik'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.align_vertical_bottom_outlined,
                        color: Colors.blue[400],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('43A87006190270'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
