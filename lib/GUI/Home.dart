import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _firstnameController = new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _commentsController = new TextEditingController();


  int _radioValue = 0;
  String result = '';
  String userInfo = '';
  void handleRadioOnChanged(int value){
    setState(() {
      _radioValue = value;
    });

    switch(_radioValue){
      case 0:
        result = 'male';
        print(result);
        break;
      case 1:
        result = 'female';
        print(result);
        break;

    }
  }

  void onPressBtn(){
    setState(() {
      if(_firstnameController.text.trim().isNotEmpty &&
          _lastnameController.text.trim().isNotEmpty &&
          _ageController.text.trim().isNotEmpty){

        if(_radioValue == 0){
          result = 'male';
        }

        if(_commentsController.text.trim().isNotEmpty){
          userInfo = 'firstname:  ${_firstnameController.text} '
              ' lastname : ${_lastnameController.text} '
              ' age: ${_ageController.text} $result comments: ${_commentsController.text}';
        }else{
          userInfo = ' ${_firstnameController.text} '
              ' ${_lastnameController.text} '
              '${_ageController.text} $result ';
        }


      }else{
        userInfo = 'Please fill the requirments';
      }
    });

    print('pressed');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Muhammed App'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: new Container(

          child: new ListView(
            padding: EdgeInsets.all(32.0),
            children: <Widget>[

          new Center(

            child:  new Text('Hello Muhammed Essa'),
          ),

              new Container(
                padding: EdgeInsets.only(top: 22.0),
                child: new Column(

                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.all(22.0)),
                    new TextField(
                      controller: _firstnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'first name',
                        hintText: 'your first name please',
                        icon: new Icon(Icons.person),
                      ),
                    ),

                    new TextField(
                      controller: _lastnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'last name',
                        hintText: 'your last name please',
                        icon: new Icon(Icons.person),
                      ),
                    ),

                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'your age please',
                        icon: new Icon(Icons.person),
                      ),
                    ),


                    new Padding(padding: new EdgeInsets.all(22.0)),

                    new Container(

                      margin: EdgeInsets.only(left: 52.0),

                      child: new Row(
                        children: <Widget>[
                          new Text('Male'),
                          new Radio(value: 0,
                              groupValue: _radioValue,
                              onChanged: handleRadioOnChanged,
                            activeColor: Colors.blueAccent,
                          ),
                      new Container(
                        margin: EdgeInsets.only(left: 22.0),
                          child: new Text('Female'),
                      ),

                          new Radio(value: 1,
                              groupValue: _radioValue,
                              onChanged: handleRadioOnChanged,
                            activeColor: Colors.deepOrange,
                          ),



                        ],
                      ),


                    ),

                    new Padding(padding: new EdgeInsets.all(32.0)),
                    new TextField(
                      controller: _commentsController,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.justify,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Comments',
                        hintText: 'your comments please',
                        icon: new Icon(Icons.person),
                      ),
                    ),
                    new Padding(padding: new EdgeInsets.all(32.0)),
                    new RaisedButton(
                      padding: EdgeInsets.only(left:32.0, right:32.0 ),
                      onPressed: onPressBtn,
                      child: new Text('Submit',style: TextStyle(color: Colors.white),),
                      color: Colors.blueAccent,
                    ),

                    new Padding(padding: new EdgeInsets.all(32.0)),
                    new Text('$userInfo',style: TextStyle(color: Colors.blue,fontSize: 22.0),),
                  ],
                ),
              ),

            ],
          ),

        alignment: Alignment.center,

      ),
    );
  }

}