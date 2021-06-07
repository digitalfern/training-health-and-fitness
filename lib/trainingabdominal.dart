import 'package:flutter/material.dart';
import 'api.dart';
import 'firebase_file.dart';
import 'display_video.dart';
import 'profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class TrainingAbdominal extends StatefulWidget {
  @override
  _TrainingAbdominalState createState() => _TrainingAbdominalState();
}

class _TrainingAbdominalState extends State<TrainingAbdominal> {
   Future<List<FirebaseFile>> futureFiles;  
   @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('videoArm/');
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
                  return Center(child: Text('Some error occurred!'));
                } else {
                  final files = snapshot.data;
                  


                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(files.length),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];
                            
                            return buildFile(context, file);
                                
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
  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        leading: ClipOval(
          child: Image.network(
            file.url,
            width: 52,
            height: 52,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
        onTap: (){
          firebase_storage.FirebaseStorage.instance.refFromURL(file.url).delete();
           setState(() {});
        } ,
  );

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