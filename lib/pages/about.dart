import 'package:flutter/material.dart';
import 'package:flutter_1/pages/about_developer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                child: Image.asset('assets/nav_icon.png'),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Wrap(
          runSpacing: 25,
          children: [
            ListTile(
              leading: Icon(
                Icons.laptop_outlined,
              ),
              title: const Text(
                'درباره توسعه دهنده',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const developerInformation()));
              },
            ),

            // ListTile(
            //   leading: Icon(
            //     Icons.update_outlined,
            //   ),
            //   title: const Text(
            //     'آخرین بروزرسانی ها',
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //     textAlign: TextAlign.right,
            //   ),
            //   onTap: () {},
            // ),

            // ListTile(
            //   leading: Icon(
            //     Icons.people_outline,
            //   ),
            //   title: const Text(
            //     'انتقادات و پیشنهادات',
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //     textAlign: TextAlign.right,
            //   ),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}