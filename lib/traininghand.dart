import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrainingHand extends StatefulWidget {
  

  @override
  _TrainingHandState createState() => _TrainingHandState();
}

class _TrainingHandState extends State<TrainingHand> {
  

YoutubePlayerController _controller = YoutubePlayerController(
  
  initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=V89BOZhJFlI',),
 
  flags: YoutubePlayerFlags(
    autoPlay: true,
    mute: false,
    loop: false,
    isLive: false,
    forceHD: false,
    
    )
  );

  YoutubePlayerController _controller2 = YoutubePlayerController(
  
  initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=V89BOZhJFlI',),
 
  flags: YoutubePlayerFlags(
    autoPlay: false,
    mute: false,
    loop: false,
    isLive: false,
    forceHD: false,
    )
  );


@override
Widget build(BuildContext context){
  return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        title: Text('Hand'),
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

    body: Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
              Padding(
                padding: EdgeInsets.only(left:0.0,right:0.0,top:30.0,bottom:5.0),
              child: Text('Training Arm Tutorial'),
              ),
              
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,                 
            
              ),

               Padding(
                padding: EdgeInsets.only(left:0.0,right:0.0,top:30.0,bottom:5.0),
              child: Text('Training Arm Tutorial'),
              ),
             
               YoutubePlayer(
                  controller: _controller2,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,

              ),
              
             
          ],
          
      ),
      ),
      ),
      );
}
}