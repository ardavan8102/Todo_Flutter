import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class developerInformation extends StatelessWidget {
  const developerInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(bottom: 30),
              leading: Icon(Icons.web_outlined),
              iconColor: Colors.purple[300],
              title: const Text(
                'گیت هاب',
                textAlign: TextAlign.right,
              ),
              onTap: () {
                launchUrl(
                  Uri.parse('https://github.com/ardavan8102'),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.only(bottom: 30),
              leading: Icon(Icons.school_outlined),
              iconColor: Colors.purple[300],
              title: const Text(
                'تدریس خصوصی',
                textAlign: TextAlign.right,
              ),
              onTap: () {
                launchUrl(
                  Uri.parse('https://ostadsalam.ir/teachers/t-%D8%A7%D8%B1%D8%AF%D9%88%D8%A7%D9%86-%D8%A7%D8%B3%DA%A9%D9%86%D8%AF%D8%B1%DB%8C-180700'),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.only(bottom: 30),
              leading: Icon(Icons.call_to_action_outlined),
              iconColor: Colors.purple[300],
              title: const Text(
                'ارتباط با توسعه دهنده',
                textAlign: TextAlign.right,
              ),
              onTap: () {
                launchUrl(
                  Uri.parse('mailto:ardavaneskandari007@gmail.com?subject=پشتیبانی'),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }
}