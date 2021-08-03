import 'package:flutter/material.dart';

import '../../../services/sheets_api.dart';
import '../../../models/article.dart';
import '../../../services/email_api.dart';
import './widgets/app_bar.dart' as appBar;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Article? _article;

  @override
  void initState() {
    SheetApi.getArticle().then((value) {
      _article = value;
      setState(() {});
    });

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  bool validate() {
    bool status = false;
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TextEditingController subjectController = TextEditingController();
    // TextEditingController emailController = TextEditingController();
    // TextEditingController nameController = TextEditingController();
    // TextEditingController messageController = TextEditingController();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: _article == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      appBar.AppBar(size: size),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                        alignment: Alignment.center,
                        width: size.width * 1 / 3,
                        height: 64,
                        child: TabBar(
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.green[400],
                            ),
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 30),
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(fontSize: 13),
                            unselectedLabelColor: Colors.black,
                            unselectedLabelStyle: const TextStyle(fontSize: 11),
                            tabs: const [
                              Tab(
                                text: 'Pengumuman',
                              ),
                              Tab(
                                text: 'Edukasi',
                              ),
                              Tab(text: 'Reportase')
                            ]),
                      ),
                      Container(
                        height: size.height * 0.6,
                        width: size.width,
                        child: TabBarView(children: [
                          Center(
                            child: Text('Pengumuman screen'),
                          ),
                          Center(
                            child: Text('Edukasi screen'),
                          ),
                          Center(
                            child: Text('Reportase screen'),
                          )
                        ]),
                      ),
                      /* Text(_article!.title),
                          Image.network(
                            "https://drive.google.com/uc?id=${_article!.imageUrl.split("=")[1]}",
                            height: size.height * 0.8,
                            cacheHeight: 120,
                          ),
                         Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  validator: (String? value) =>
                                      value == '' ? "Perihal harus diisi" : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: subjectController,
                                  decoration: const InputDecoration(
                                      labelText: "Perihal",
                                      hintText:
                                          "Saya ingin mengupload artikel tentang covid-19"),
                                ),
                                TextFormField(
                                  validator: (String? value) => !value!.contains('@')
                                      ? "Email salah, input email yang benar"
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                      labelText: "Email", hintText: "budi@mail.com"),
                                ),
                                TextFormField(
                                  validator: (String? value) =>
                                      value == '' ? "Nama harus diisi" : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                      labelText: "Nama", hintText: "Budi Lesmana"),
                                ),
                                TextFormField(
                                  validator: (String? value) =>
                                      value == '' ? "Pesan harus diisi" : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                      labelText: "Pesan",
                                      hintText:
                                          "Artikel ini membahas perkembangan covid terbaru dan akan sangat bermanfaat jika dijadikan bahan edukasi"),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (validate()) {
                                        EmailApi.sendEmail(
                                            name: nameController.text,
                                            email: emailController.text,
                                            subject: subjectController.text,
                                            message: messageController.text);
                                      }
                                    },
                                    child: const Text('Kirim'))
                              ],
                            ),
                          ) */
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
