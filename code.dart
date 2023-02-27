import 'package:flutter/material.dart';
void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({Key? key}) : super(key:key);
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: "FLUTTER WIDGET",
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(),
    );


  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super (key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String time= "00 : 00";
  var date = "1/1/2023";
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("FLUTTER CALENDER"),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              
              Text("select date"),
              ElevatedButton(
                  onPressed: () async {

                DateTime? datepicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2023),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2023)
                );

              if (datepicked!=null){
                  print("today's date ${datepicked.day} / ${datepicked.month} / ${datepicked.year} ");
                  setState(() {
                    date = "${datepicked.day} / ${datepicked.month} / ${datepicked.year}";

                  });
              }
              },
                  child: Text("show date")),
              Text("select time"),
              ElevatedButton(
                  onPressed: () async {

                    TimeOfDay? timepicker= await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial
                    );
                    if (timepicker!= null){
                      print("time ${timepicker.hour}:${timepicker.minute}}");
                      setState(() {
                        time = "${timepicker.hour}:${timepicker.minute}";

                      });
                    }


                    },

                  child: Text("show time "),),
               
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("CURRENT DATE :     $date"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("CURRENT TIME :      $time"),
              )


            ],

          ),
        )
        
    );
  }
}
