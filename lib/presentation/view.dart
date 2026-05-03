// // import 'dart:isolate';

// // import 'package:flutter/material.dart';



// // class LoginUser extends StatefulWidget {

// //   const LoginUser({super.key});

// //   @override
// //   State<LoginUser> createState() => _LoginUserState();
// // }

// // class _LoginUserState extends State<LoginUser> {

// //   @override
// //   Widget build(BuildContext context) {
// //     final _formkey = GlobalKey<FormState>();
// //     return Scaffold(

// //     );
// //   }
// // }


// // sendItem(SendPort sendport){
// //   sendport.send("send completed");
// // }


// // void main () async {
// //   ReceivePort receivePort = ReceivePort();

// //   await Isolate.spawn(sendItem, receivePort.sendPort);


// //   receivePort.listen((message) { 
// //     print("receive port $message");
// //     receivePort.close();

// //   });

// // }


// //Single Responsible
// import 'dart:isolate';

// class User{
//   final String? name;
//   final int? age;

//   User(this.age, this.name);
// }

// class SaveUserToDb {
//   void saveToDb(User user){

//   }
// }

// class ShowWlcomeMessage {
//   void welcomeMessage(User user){
//     print("welcome User ${user.name}");
//   }
// }

// //open-close
// abstract class Shape {
//   double calculation();
// }


// class Circle extends Shape {
//   double? radius;
//   Circle(this.radius);

//   @override
//   double calculation() {
//     return 3.3 * radius!;
//   }
// }

// class Rectangle extends Shape {
//   double? radius;

//   Rectangle(this.radius);

//   @override
//   double calculation() {
//     return 4.9 * radius!;
//   }
// }


// //liskov substituion

// abstract class Vehicle {
//   void moving();
// }

// abstract class ElectricVehicle extends Vehicle {
//   void charging();
// }

// abstract class FuelVehicle extends Vehicle {
//   void fillFuel();
// }

// class BatteryCar extends ElectricVehicle {
//   @override
//   void charging() {
//     // TODO: implement charging
//   }

//   @override
//   void moving() {
//     // TODO: implement moving
//   }
  
// }

// class FuelCar extends FuelVehicle {
//   @override
//   void fillFuel() {
//     // TODO: implement fillFuel
//   }

//   @override
//   void moving() {
//     // TODO: implement moving
//   }
  
// }

// //Interface segrigation

// abstract class VoiceCall {

//   void callingFunction();
// }

// abstract class VideoCall {
//   void videoCall();

// }

// class SmartWatch extends VoiceCall {
//   @override
//   void callingFunction() {
//     // TODO: implement callingFunction
//   }
  
// }

// class Phone implements VideoCall, VoiceCall {
//   @override
//   void videoCall() {
//     // TODO: implement videoCall
//   }
  
//   @override
//   void callingFunction() {
//     // TODO: implement callingFunction
//   }
  
// }


// // dependency inversion 

// abstract class ConnectDb {
//   void connect();
// }

// class SqlDb extends ConnectDb {
//   @override
//   void connect() {
//     // TODO: implement connect
//   }
  
// }

// class Postgresql extends ConnectDb {
//   @override
//   void connect() {
//     // TODO: implement connect
//   }
  
// }

// void sendReference(SendPort seend) {
//   seend.send("message");
// }


// void main () async {
//   ReceivePort recieve = ReceivePort();

//   await Isolate.spawn(sendReference, recieve.sendPort);


//   recieve.listen((message){
//     print("lister ${message}");
//     recieve.close();
//   });


// }