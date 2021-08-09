import 'package:flutter/material.dart';

import '../../../services/sheets_api.dart';
import '../../../models/article.dart';
import '../../../services/email_api.dart';
import './widgets/app_bar.dart' as appBar;
import './widgets/edukasi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<Article>? _article;

  @override
  void initState() {
    SheetApi.getAllRow().then((value) {
      _article = value;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: _article == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
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
                      width: size.width * 2 / 5,
                      height: 64,
                      child: TabBar(
                          controller: _tabController,
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
                    Expanded(
                      child: Container(
                        height: size.height * 0.85,
                        width: size.width,
                        color: Colors.grey.shade200,
                        child:
                            TabBarView(controller: _tabController, children: [
                          Center(
                            child: Text('Pengumuman screen'),
                          ),
                          Edukasi(
                            listArticle: _article,
                          ),
                          Center(
                            child: Text('Reportase screen'),
                          )
                        ]),
                      ),
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
    );
  }
}
