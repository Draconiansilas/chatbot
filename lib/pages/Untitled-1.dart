import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class header extends StatefulWidget {
  @override
  _headerState createState() => _headerState();
}

class _headerState extends State<header> {
  bool ehlel = true;
  bool asuult0 = false;
  bool asuult1 = false;
  bool asuult2 = false;
  bool asuult3 = false;
  bool asuult4 = false;
  bool asuult5 = false;
  bool asuult6 = false;
  bool asuult7 = false;
  int asuultNum = 0;

  void dasuult0() {
    setState(() {
      ehlel = !ehlel;
      asuult0 = !asuult0;
      asuultNum += 1;
    });
  }

  void dasuult1() {
    setState(() {
      asuult0 = !asuult0;
      asuult1 = !asuult1;
      asuultNum += 1;
    });
  }

  void dasuult2() {
    setState(
      () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime(2030))
            .then((date) => {
                  setState(() {
                    asuultNum += 1;
                  })
                });
        asuult1 = !asuult1;
        asuult2 = !asuult2;
      },
    );
  }

  void dasuult3() {
    setState(() {
      asuult2 = !asuult2;
      asuult3 = !asuult3;
      asuultNum += 1;
    });
  }

  void dasuult4() {
    setState(() {
      asuult3 = !asuult3;
      asuult4 = !asuult4;
      asuultNum += 1;
    });
  }

  void dasuult5() {
    setState(() {
      asuult4 = !asuult4;
      asuult5 = !asuult5;
      asuultNum += 1;
    });
  }

  void dasuult6() {
    setState(() {
      asuult5 = !asuult5;
      asuult6 = !asuult6;
      asuultNum += 1;
    });
  }

  void dasuult7() {
    setState(() {
      asuult6 = !asuult6;
      asuult7 = !asuult7;
      asuultNum += 1;
    });
  }

  List asuultuud = [
    {'asuult': 'Сайн байна уу?'},
    {'asuult': 'Таны хүйс?'},
    {'asuult': 'Таны төрсөн он сар?'},
    {'asuult': 'Утасны дугаар?'},
    {'asuult': 'Имейл хаяг?'},
    {'asuult': 'Таны Хобби?'},
    {'asuult': 'Амьтан тэжээдэг үү?,'},
    {'asuult': 'Баярлалаа, баяртай'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //logo text
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      //logo
                      children: [
                        Image(
                          width: 100,
                          image: AssetImage("assets/gerege.png"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      //asuult text
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  asuultuud[asuultNum]['asuult'],
                                  style: TextStyle(fontSize: 30),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //buttonss
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        //ehlel sn bnu0
                        Visibility(
                          //ehlel
                          visible: ehlel,
                          child: Container(
                            child: OutlinedButton(
                              onPressed: () => dasuult0(),
                              child: Text(
                                "Сайн",
                                style: TextStyle(fontSize: 20),
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                side: BorderSide(width: 1, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        //0 huis1
                        Visibility(
                          visible: asuult0,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  child: OutlinedButton(
                                    onPressed: () => dasuult1(),
                                    child: Text(
                                      "Эр",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      side: BorderSide(
                                          width: 1, color: Colors.blue),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: OutlinedButton(
                                    onPressed: () => dasuult1(),
                                    child: Text(
                                      "Эм",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      side: BorderSide(
                                          width: 1, color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //1 on sar2
                        Visibility(
                          //1
                          visible: asuult1,
                          child: Container(
                            child: OutlinedButton(
                              onPressed: () => dasuult2(),
                              child: Text(
                                "Он сар оруулах",
                                style: TextStyle(fontSize: 20),
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                side: BorderSide(width: 1, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),

                        Visibility(
                          //2
                          visible: asuult2,
                          child: Container(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                hintText: "First name",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue, width: 1.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue, width: 1.0),
                                ),
                              ),
                            ),
                            // child: OutlinedButton(
                            //   onPressed: () => dasuult3(),
                            //   child: Text("Илгээх"),
                            // ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ), //hariult
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CoreColor {
//   get oceanSurface => null;
// }
