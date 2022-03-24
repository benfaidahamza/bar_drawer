import 'package:flutter/material.dart';
import 'package:bar_drawer/information.dart';
import 'package:bar_drawer/main.dart';

class Formulaire extends StatefulWidget {
  @override
  _State createState() => new _State();
}
enum Groups { male, female }
class _State extends State<Formulaire> {


bool isChecked1=false;
bool isChecked2=false;
String _value='';
String _Dat='';
String nom='';
String email='';
String phone='';
int age =0;
Future _selectDate() async{
DateTime ? picked= await showDatePicker(context: context,
initialDate: new DateTime.now(),
firstDate: new DateTime(2016),
lastDate: new DateTime(2099)
);
if (picked != null) setState(()=> _Dat=picked.toString());
}
void _add()
{
setState(() {
age++;
});
}
void _substract()
{
setState(() {
if(age>0)
{
age--;
}

});
}
void _onChange (String value )
{
setState(() => nom=' ${value}');
}
void _onChange1 (String value )
{
setState(() =>phone='${value}');
}
void _onChange2 (String value )
{
setState(() =>email='${value}');
}

void _onSubmit(String value )
{
setState(() => _value='Submit: ${value}');
}
void _onpressed()
{
setState(() {

_value='votre nom est ${nom} , votre email est ${email} et votre age est ${age} ';
});
}
@override
Groups? _character=Groups.male;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Main()));
      }
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Information()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Formulaire"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child:new Column(
          children :<Widget>[
            new Text(_value),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'Nom',
                  hintText:'Tapez votre nom',
                  icon:new Icon (Icons.people,color: Colors.blue)
              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _onChange,
              onSubmitted:_onSubmit,

            ),

            new TextField(
              decoration: new InputDecoration(
                  labelText: 'Email',
                  hintText:'Tapez votre email',
                  icon:new Icon (Icons.mail,color: Colors.blue,)
              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _onChange2,
              onSubmitted:_onSubmit,
            ),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'password',
                  hintText:'Tapez votre mot de passe',
                  icon:new Icon (Icons.lock,color: Colors.red,)
              ),
              keyboardType: TextInputType.text,
              obscureText: true,


            ),


            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                  child:ListTile(
                    title: const Text('male'),
                    leading: Radio<Groups>(
                        value:Groups.male,
                        groupValue:_character,
                        onChanged: (Groups? value){
                          setState(( )
                          {
                            _character=value;
                          });
                        }
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                new Flexible(
                  child: ListTile(
                    title: const Text('female'),
                    leading: Radio<Groups>(
                        value:Groups.female,
                        groupValue:_character,
                        onChanged: (Groups? value){
                          setState(( )
                          {
                            _character=value;
                          });
                        }
                    ),
                  ),
                ),

              ],
            ),
            new CheckboxListTile(value: isChecked1,onChanged:(bool? value)
            {
              setState(() {
                isChecked1=value!;

              });
            },
              title: new Text('Archive1'),
              controlAffinity:ListTileControlAffinity.leading,
              subtitle: new Text('substile'),
              secondary:new Icon(Icons.archive),
              activeColor:Colors.red,
            ),
            new CheckboxListTile(value: isChecked2,onChanged:(bool? value)
            {
              setState(() {
                isChecked2=value!;

              });
            },
              title: new Text('Archive2'),
              controlAffinity:ListTileControlAffinity.leading,
              subtitle: new Text('add'),
              secondary:new Icon(Icons.addchart),
              activeColor:Colors.red,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                    child:new IconButton(icon:new Icon(Icons.add) , onPressed: _add)
                ),
                SizedBox(width: 10.0,),
                new Flexible(
                  child: new Text('votre age : ${age}'),
                ),
                SizedBox(width: 10.0,),
                new Flexible(
                  child: new IconButton(icon:new Icon(Icons.remove), onPressed: _substract),
                ),

              ],
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[


                new Flexible(
                  child: new ElevatedButton(onPressed:_selectDate, child:new Text("Date d'inscription"),
                  ),
                ),
                SizedBox(width: 10.0,),
                new Flexible(
                  child: new Text(_Dat),
                ),
              ],
            ),

            new ElevatedButton(onPressed:_onpressed, child:new Text('submit'),),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'bar 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'bar 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'bar 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}