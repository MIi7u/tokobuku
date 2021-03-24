import 'package:flutter/cupertino.dart';
import 'package:toko_buku/home.dart';
import 'package:toko_buku/pembayaran.dart';
import 'data.dart';
import 'address.dart';
import 'detail.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  final _cName = TextEditingController();
  final _cPhoneNumber = TextEditingController();
  final _cFlatNumber = TextEditingController();
  final _cArea = TextEditingController();
  final _clandmark = TextEditingController();
  final _cCity = TextEditingController();
  final _cState = TextEditingController();
  final _cPincode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      title: Text('Toko Buku'),
    );
    return SafeArea(
        child: Scaffold(
          appBar: appBar,
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (formKey.currentState.validate()) {
                final lib = address(
                    name: _cName.text,
                    state: _cState.text,
                    pincode: _cPincode.text,
                    phoneNumber: _cPincode.text,
                    landmark: _clandmark.text,
                    flatNumber: _cFlatNumber.text,
                    city: _cCity.text,
                    area: _cArea.text)
                    .toJson();
                final snackbar = SnackBar(content: Text('Address added successfully'));
                scaffoldKey.currentState.showSnackBar(snackbar);
                FocusScope.of(context).requestFocus(FocusNode());
                formKey.currentState.reset();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pembayaran())
                );
              }
            },
            label: Text('Selesai'),
            backgroundColor: Colors.purpleAccent.shade50,
            icon: Icon(Icons.check),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        MyTextField(
                          hint: 'Nama Anda',
                          controller: _cName,
                        ),
                        MyTextField(
                          hint: 'No HP Anda',
                          controller: _cPhoneNumber,
                        ),
                        MyTextField(
                          hint: 'Kota',
                          controller: _cFlatNumber,
                        ),
                        MyTextField(
                          hint: 'Provinsi',
                          controller: _cArea,
                        ),
                        MyTextField(
                          hint: 'Alamat',
                          controller: _clandmark,
                        ),
                        MyTextField(
                          hint: 'Kode Pos',
                          controller: _cCity,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const MyTextField({Key key, this.hint, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(height: 2.0 , fontSize: 20),
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: hint),
        validator: (value) => value.isEmpty ? 'Field can\'t be blank' : null,
      ),
    );
  }
}
