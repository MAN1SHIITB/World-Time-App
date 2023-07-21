import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};


  @override
  Widget build(BuildContext context) {

  try {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;}
  catch(e){
    data=data;}

    print(data);
  String bgTime = data['isDaytime']?'day.jpg':'night.jpg';
Color bgColor = data['isDaytime']?Colors.blue : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgTime'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(onPressed: () async{
                 dynamic result = await Navigator.pushNamed(context,'/location');
                 setState(() {
                   data = {
                     'time': result['time'],
                     'location': result['location'],
                     'isDaytime': result['isDaytime'],
                     'flag':result['flag'],
                   };
                 });
                 },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.black,
                    ),
                    label: Text(
                        'Edit Location',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                    )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 020,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    // fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }

