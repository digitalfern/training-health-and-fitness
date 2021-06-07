import 'package:flutter/material.dart';
import 'profile.dart';

class Healthyfood1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFECEFF1),
      appBar: AppBar(
        title: Text('Healthyfood1'),
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
        body: CustomScrollView(
          slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                backgroundColor:const Color(0xFFECEFF1),
                expandedHeight: 300,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),     
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
                    child: Image.asset('./lib/picture/healthyfood1.jpg', fit: BoxFit.cover,),
                ),
                ),
              ),

              SliverList(delegate: SliverChildListDelegate([
                    SizedBox(height: 20,),
                    ListTile(
                      title: Text(
                        'DINNER',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color : Colors.blueGrey,
                        ),
                      ),

                      subtitle: Text(
                        'Mediterranean Chopped Salad',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          color : Colors.black,
                        ),
                      ),

                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[                       
                              SizedBox(width: 30,),
                          Text(
                            '217 kcal',
                            style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color : Colors.grey,
                          ),                                
                          ),

                        SizedBox(height: 4,),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.grey,
                            ),

                            SizedBox(height: 4,),

                            Text(
                            '15 mins',
                            style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color : Colors.grey,
                          ),       
                          ),
                          ],
                          ),
                        ],
                      
                      ),
                    ),
              
              SizedBox(height: 20,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                        'INGREDIENTS',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color : Colors.blueGrey,
                        ),
                      ),
              ),

              SizedBox(height: 10,),

            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    '-naan bread or 3-4 small ones, or toasted pita bread\n-ripe tomatoes\n-English cucumber\n-green onions\n-flat-leaf parsley\n-plain yougurt\n-fresh mint\n-garlic cloves\n-lemon\-white wine vinegar or apple cider\n-olive oil\n-salt and pepper\n-sumac',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                  ),
                ),
                ),
              ],
              ),
              ),

              SizedBox(height: 20,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                        'PREPARATION',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color : Colors.blueGrey,
                        ),
                      ),
              ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '1. Heat a grill pan over medium heat. Drizzle the naan bread with a bit of water, then place it onto the hot grill.\n\n2. Grill for about 2 minutes per side, or until nicely charred and toasted.\n\n3. Meanwhile, in a small bowl add all dressing ingredients and mix to combine.\n\n4. In a large bowl combine prepped veggies. Pour the dressing over and mix to combine. Allow the flavors to meld for at least 15 minutes.\n\n5.Just before serving, break the naan into bite sized pieces and toss it into the salad.\n\nServe immediately and enjoy!\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          
                  ),
                ),
                ),
              ],
              ),
              ),
              ],
              ),
        

        
      ),
    );
  }
}