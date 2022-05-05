import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class home_of_app extends StatefulWidget {
  const home_of_app({Key? key}) : super(key: key);


  @override
  State<home_of_app> createState() => _home_of_appState();
}

class _home_of_appState extends State<home_of_app> with SingleTickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController animationController;
  bool isForward = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeOutExpo);
    animation = Tween<double>(begin: 0, end: 150).animate(curvedAnimation)
      ..addListener(() {
        setState(() {
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.7,
            image: AssetImage("graphics/city.jpg"))
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Color.fromARGB(255, 147, 251, 255),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: animation.value,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 2,
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            cursorColor: Colors.white12,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: animation.value > 1 ? BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50)
                          ) : BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.search), color: Colors.white,
                          onPressed: (){
                            if (!isForward){
                              animationController.forward();
                              isForward = true;
                            } else {
                              animationController.reverse();
                              isForward = false;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  Icon(Icons.supervised_user_circle_outlined)
                ],),
              ),
          ],
      ))
    );
  }
}

