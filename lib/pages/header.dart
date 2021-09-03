// import 'dart:io';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';

class header extends StatefulWidget {
  @override
  _headerState createState() => _headerState();
}

class _headerState extends State<header> {
  DateTime onsar = DateTime.now();
  var myFormat = DateFormat('yyyy-MM-dd');
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final _controller = new TextEditingController();
  final _controllerOnSar = new TextEditingController();
  final mycontroller = new TextEditingController();

  String inf = "";
  int asuultNum = 0;
  String ons = '';
  bool selected = false;
  bool dpkd = false;
  List info = [];
  List butthariu = ['Сайн', 'Эр', 'Эм'];
  bool hariultHarah = false;
  List asuultuud = [
    {'asuult': 'Сайн байна уу?'},
    {'asuult': 'Таны хүйс?'},
    {'asuult': 'Таны төрсөн он сар?'},
    {'asuult': 'Утасны дугаар?'},
    {'asuult': 'Имейл хаяг?'},
    {'asuult': 'Таны Хобби?'},
    {'asuult': 'Амьтан тэжээдэг үү?'},
    {'asuult': 'Баярлалаа '},
    {'asuult': 'Баяртай'}
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // textListener() {
  //   print('hi');
  // }
  // textListener() {
  //   return '$onsar';
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   mycontroller.addListener(textListener());
  // }
  // String onsar = " ";

  var _formKey = GlobalKey<FormState>();
  @override
  // late DateTime onsar;

  Widget build(BuildContext context) {
    final iskey = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //header logo asuult
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedAlign(
                      alignment:
                          selected ? Alignment.topRight : Alignment.centerLeft,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      child: Image(
                        width: 100,
                        image: AssetImage("assets/gerege.png"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        asuultuud[asuultNum]['asuult'],
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              hariultHarah == true ? Text('${info}') : Text(''),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    hariults(),
                    (iskey) ? changeButton() : SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  next() {
    setState(() {
      asuultNum += 1;
    });
  }

  nexter() {
    setState(() {
      info.add('Эр');
      asuultNum += 1;
    });
  }

  nextem() {
    setState(() {
      info.add('Эм');
      asuultNum += 1;
    });
  }

  changeButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)))),
      onPressed: () {
        setState(() {
          inf = _controller.text;
          info.add(inf);
          print(info);

          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          if (!_formKey.currentState!.validate()) {
            return null;
            // return null;
          }
          ;
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(const SnackBar(content: Text('done')));
          _controller.text = "";
          asuultNum += 1;
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
        });
      },
      child: Text('Илгээх'),
    );
  }

  // pikedDate() {
  //   if (onsar != null) {
  //     return null;
  //   } else {
  //     info.add(onsar);
  //     next();
  //   }
  // }

// datepik(){
//   setState(() {
//     Future<DateTime> showDatePicker({
//   @required BuildContext context,
//   @required DateTime initialDate,
//   @required DateTime firstDate,
//   @required DateTime lastDate,
//   DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,

//     });
//   });
// }

  datepik() {
    setState(() {
      () {};
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1800),
              lastDate: DateTime(2030))
          .then((date) {
        if (date != null) {
          () {};
          onsar = date;
          ons = date.toString();
          setState(() {
            _controllerOnSar.text = myFormat.format(date);
          });
          // info.add(onsar);
          // now = onsar.toString();
        }
      });
    });

    // onsar = date.toString()    (date) => onsar = date,
    // if (onsar != null) {
    //   info.add(onsar);
    //   // next();
    // } else
    //   'Огноо оруулна уу';

    //
    //
    //
    //
    // info.add(onsar);
  }

  datebutton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)))),
      onPressed: () {
        setState(() {
          info.add('${myFormat.format(onsar)}');
          next();
        });
      },
      child: Text('Илгээх'),
    );
  }

  // pikedDate(value) {
  //   onsar = value.toString();
  //   if (onsar == value) {
  //     info.add(value);
  //     asuultNum += 1;
  //   } else
  //     return;
  // }

  last() {
    setState(() {
      selected = !selected;
      // hariults();
      asuultNum += 1;
      hariultHarah = true;
    });
  }

  hariults() {
    switch (asuultNum) {
      case 0:
        return OutlinedButton(
          onPressed: () => next(),
          child: Text(
            'Сайн',
            style: TextStyle(fontSize: 20),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            side: BorderSide(width: 1, color: Colors.blue),
          ),
        );
      case 1:
        return Container(
          child: Column(
            children: [
              Container(
                child: OutlinedButton(
                  onPressed: () => nexter(),
                  child: Text(
                    'Эр',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
              Container(
                child: OutlinedButton(
                  onPressed: () => nextem(),
                  child: Text(
                    'Эм',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // txthariult('${myFormat.format(onsar)}'),
            TextField(
              controller: _controllerOnSar,
              textAlign: TextAlign.right,
              readOnly: true,
              decoration: new InputDecoration(
                hintText: '',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
            // TextField(
            //   // onChanged: (onsar.t),
            //   controller: mycontroller,
            //   textAlign: TextAlign.right,
            //   readOnly: true,
            //   decoration: new InputDecoration(
            //       border: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //       enabledBorder: InputBorder.none,
            //       errorBorder: InputBorder.none,
            //       disabledBorder: InputBorder.none,
            //       hintText: "Hint here"),
            // ),
            // Text('${myFormat.format(onsar)}'),
            // Text(onsar.toString()),
            OutlinedButton(
              onPressed: () => datepik(),
              child: Text(
                "Он сар оруулах",
                style: TextStyle(fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(width: 1, color: Colors.blue),
              ),
            ),
            datebutton()
          ],
        ));
      case 3:
        return Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty)
                return 'Enter your email';
              else if (value.length < 8 || value.length > 8)
                return 'Enter your correct email';
              else
                return null;
            },
            autofocus: false,
            controller: _controller,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintStyle: Theme.of(context).textTheme.bodyText1,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
            ),
          ),
        );
      case 4:
        return Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value))
                return 'Имейл ээ зөв оруулна уу';
              else
                return null;
            },
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            controller: _controller,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintStyle: Theme.of(context).textTheme.bodyText1,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
            ),
          ),
        );
      case 5:
        return Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty || value.length < 5)
                return 'Мэдээлэлээ оруулна уу';
              else
                return null;
            },
            controller: _controller,
            autofocus: false,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintStyle: Theme.of(context).textTheme.bodyText1,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
            ),
          ),
        );
      case 6:
        return Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            autofocus: false,
            validator: (value) {
              if (value!.isEmpty || value.length < 2)
                return 'Мэдээлэлээ оруулна уу';
              else
                return null;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintStyle: Theme.of(context).textTheme.bodyText1,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
              ),
            ),
          ),
        );
      case 7:
        return Container(
          child: OutlinedButton(
            onPressed: () => last(),
            child: Text(
              "Дуусгах",
              style: TextStyle(fontSize: 20),
            ),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 1, color: Colors.blue),
            ),
          ),
        );
      case 8:
        return Container(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                // last();
                if (selected) exit(0);
              });
            },
            child: Text(
              "Гарах",
              style: TextStyle(fontSize: 20),
            ),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 1, color: Colors.blue),
            ),
          ),
        );
    }
  }
}
