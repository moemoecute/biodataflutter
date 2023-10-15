import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final appbiodata = <String, String>{};

  MainApp({super.key}) {
    appbiodata['name'] = 'Furina (Focalors)';
    appbiodata['email'] = 'furinawangy@genshinimpact.com';
    appbiodata['phone'] = '+628123456789';
    appbiodata['image'] = 'furina_luv.png';
    appbiodata['hobby'] = 'Menonton drama pengadilan rakyat';
    appbiodata['address'] = 'Jl. Court of Fontaine, Fontaine City';
    appbiodata['describe'] =
        '''Satu kebohongan selalu mengikuti kebohongan yang lain, sehingga "keadilan" menunggu di ujungnya. Orang yang tidak tahu melihat ini sebagai semacam lelucon. Tetapi jika mereka menelusuri kembali ke sumbernya, mereka pasti akan menyadari bahwa mereka memulai dengan menipu diri mereka sendiri.''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              teksKotak(Colors.black, appbiodata['name'] ?? ''),
              Image(image: AssetImage('assets/${appbiodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.blue[900],
                      "mailto:${appbiodata['email']}"),
                  btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                      "https://wa.me/${appbiodata['phone']}"),
                  btnContact(
                      Icons.phone, Colors.green, "tel:${appbiodata['phone']}")
                ],
              ),
              SizedBox(height: 10),
              textAttributte("Hobby", appbiodata['hobby'] ?? ''),
              textAttributte("Alamat", appbiodata['address'] ?? ''),
              SizedBox(height: 10),
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(height: 10),
              Text(
                appbiodata['describe'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ])),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttributte(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 90,
          child: Text("- $judul",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(
          ": ",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
