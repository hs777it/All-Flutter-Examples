import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RadioUi(),
    );
  }
}

class RadioUi extends StatefulWidget {
  const RadioUi({super.key});

  @override
  State<RadioUi> createState() => _RadioUiState();
}

class _RadioUiState extends State<RadioUi> {
  bool x = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio')),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: const TextSpan(
                                    text: '20 ',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: '/30',
                                          style: TextStyle(color: Colors.white, fontSize: 16)),
                                      TextSpan(
                                          text: '\n\nRadio 160',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 35)),
                                      TextSpan(
                                          text: '\n115K + Favourite',
                                          style: TextStyle(color: Colors.white, fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xff242526),
                            child: Icon(
                              Icons.tv,
                              size: 18,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 7,
                      right: 30,
                      child: Stack(
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            elevation: 5,
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          const Positioned(
                              left: 3,
                              top: 3,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.blue,
                                backgroundImage: AssetImage("assets/images/cdbg.jpg"),
                              )),
                          const Positioned(
                              left: 19,
                              top: 19,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.white,
                              )),
                        ],
                      ))
                ],
              )),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("My Favourite (24)",
                                style: TextStyle(color: Colors.black, fontSize: 16)),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  x = !x;
                                });
                              },
                              child: x == true
                                  ? const Text("View Less",
                                      style: TextStyle(color: Colors.black, fontSize: 14))
                                  : const Text("View All",
                                      style: TextStyle(color: Colors.black, fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: x,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/1.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                title: const Text("Let me Love you",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                subtitle: const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("DJ Snake",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("4.38",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/6.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                title: const Text("Love me like you do",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                subtitle: const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("DJ Snake",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("4.38",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/8.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                title: const Text("Don't Let me down",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                subtitle: const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("DJ Snake",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("4.38",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/9.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                title: const Text("Take me with you",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                subtitle: const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("DJ Snake",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("4.38",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/7.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                title: const Text("Feel Me",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                subtitle: const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("DJ Snake",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("4.38",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text("Similer Broadcast",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/2.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Jennifer Lopez",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/3.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Camila Cabello",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/4.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("La Isla Bonita",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/5.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("DHARIA",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/12.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Taylor Swift",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/14.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Axel Johansson",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/11.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Mia Martina",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/10.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Anne Marie",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/13.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Text("Bilionera",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
