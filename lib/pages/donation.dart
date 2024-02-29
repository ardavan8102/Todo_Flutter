import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.family_restroom,
                    color: Colors.red[300],
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      'مایه دلگرمی ما هستید',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),

                  Icon(
                    Icons.family_restroom,
                    color: Colors.red[300],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'اینکه این برنامه را نصب کردید بزرگترین حمایت از تیم ماست. ضمن عرض تشکر از شما عزیزان، بسیار خرسند میشویم تا در صورت رضایت، این برنامه را به دیگر دوستان خود نیز معرفی کنید و یک برنامه ریزی و روتین درست به آنها هدیه دهید',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.right,
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'دانلود برنامه',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(top: 20),
                  iconColor: Colors.green[500],
                  leading: Icon(
                    Icons.downloading_outlined,
                    size: 30,
                  ),
                  title: const Text(
                    'دانلود از بازار',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://zil.ink/ardavan81'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),

                ListTile(
                  contentPadding: EdgeInsets.only(top: 20),
                  iconColor: Colors.lightBlue[300],
                  leading: Icon(
                    Icons.downloading_outlined,
                    size: 30,
                  ),
                  title: const Text(
                    'دانلود از مایکت',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://zil.ink/ardavan81'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}