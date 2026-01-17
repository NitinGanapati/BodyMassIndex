import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Body Mass Index',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Body Mass Index Calculation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtEditingController = TextEditingController();
  var inController = TextEditingController();
  var ftController = TextEditingController();
  var result ="";
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 11,),
                TextField(
                  controller: wtEditingController,
                  decoration: InputDecoration(
                    label: Text("Enter you weight in kgs"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label:Text("Enter your height in ft"),
                    prefixIcon: Icon(Icons.king_bed)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label:Text("Enter your height in inches"),
                    prefixIcon: Icon(Icons.fifteen_mp)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: (){
                  var wt = int.tryParse(wtEditingController.text.toString());
                  var inches = int.tryParse(inController.text.toString());
                  var feet = int.tryParse(ftController.text.toString());


                  if(wt!=null && feet!=null && inches!=null){
                    //bmi calculation
                    var tinch = (feet*12) + inches;
                    //1 inch = 2.54 cm

                    var centimeters = tinch*2.54;

                    var totalmeters = centimeters/100;

                    var bmi = wt/(totalmeters*totalmeters);

                    var message = "";
                    if(bmi>25){
                      message = "You are Overweighted";
                      bgColor= Colors.orange.shade200;
                    }
                    else if(bmi<18){
                      message = "You are Underweighted";
                      bgColor = Colors.red.shade200;
                    }
                    else{
                      message = "You are Healthy";
                      bgColor = Colors.green.shade300;
                    }



                    setState(() {
                      result= "$message \n Your BMI is ${bmi.toStringAsFixed(2)}";
                    });



                  }
                  else{
                    setState(() {
                      result = "Please fill all the details";
                    });

                  }
                }, child: Text("Calculate")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Result is $result",style: TextStyle(fontSize: 16),),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
