import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:training_and_diet/video.dart';
import '../calling/api.dart';
import '../calling/firebase_file.dart';
import '../user/profile.dart';

class TrainingAbdominal extends StatefulWidget {
  @override
  _TrainingAbdominalState createState() => _TrainingAbdominalState();
}

class _TrainingAbdominalState extends State<TrainingAbdominal> {
  Future<List<FirebaseFile>> futureFiles;
  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('videoAbdominal/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Abdominal'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_box_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
        body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final files = snapshot.data;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // buildHeader(files.length),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final file = files[index];
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Text(
                                    file.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Video(file.url),
                                ],
                              ),
                            );
                            // return ListTile(
                            //   // leading: ClipOval(
                            //   //   child: Image.network(
                            //   //     file.url,
                            //   //     width: 52,
                            //   //     height: 52,
                            //   //     fit: BoxFit.cover,
                            //   //   ),
                            //   // ),
                            //   title: Text(
                            //     file.name,
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       decoration: TextDecoration.underline,
                            //       color: Colors.blue,
                            //     ),
                            //   ),
                            //   onTap: () async {
                            //     // await file.ref.delete();
                            //     // files.removeAt(index);
                            //     // setState(() {});
                            //   },
                            // );
                          },
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.blue,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.file_copy,
            color: Colors.white,
          ),
        ),
        title: Text(
          '$length Files',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
}
