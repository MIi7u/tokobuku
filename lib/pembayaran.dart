import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:toko_buku/home.dart';
import 'data.dart';

class pembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      title: Text('Toko Buku'),
    );
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}

enum metode {Gopay , Dana, Indomart, Alfamart, Dll}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  metode _character = metode.Gopay;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Buku ini bisa dibeli di : ' , style: TextStyle(fontSize: 24),) ,

        ),
        ListTile(
          title: const Text('Gramedia' , style: TextStyle(fontSize: 20)),
        ),
        ListTile(
          title: const Text('Shoppe', style: TextStyle(fontSize: 20)),
        ),
        ListTile(
          title: const Text('Tokopedia', style: TextStyle(fontSize: 20)),
        ),
        ListTile(
          title: const Text('Dll', style: TextStyle(fontSize: 20)),
        ),
        new Container(
          alignment: FractionalOffset.bottomRight,
          margin: const EdgeInsets.only(top: 200, right: 20),
          child: Material (
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
            elevation: 18.0,
            color: Colors.blue,
            clipBehavior: Clip.antiAlias,
            child: MaterialButton(
                minWidth: 150.0,
                height: 50,
                color: Colors.blue,
                child: new Text('Selesai',
                    style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home())
                  );
                }
                ),
          )
        )
      ],
    );
  }
}




