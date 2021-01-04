import 'package:flutter/material.dart';
import 'package:ifood_fake_app/controllers/mobx/login/loginEmail/login_email_controller.dart';
import 'package:ifood_fake_app/repositories/Api/api.dart';
import 'package:pinput/pin_put/pin_put.dart';


class VerifyCodeView extends StatefulWidget {
  @override
  _VerifyCodeViewState createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {

  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  final Api api = Api();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(15.0),

    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        leading: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: _width * 0.6,
              margin: EdgeInsets.only(left: _width * 0.035, top: _height * 0.04),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Digite o código de 5 dígitos que enviamos para ', style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300
                    )),
                    TextSpan(
                        text: LoginEmailSingletonController.fieldEmail,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19
                        )
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: _height * 0.04,),
            Container(
             //width: _width,
             //margin: EdgeInsets.symmetric(horizontal: _width * 0.2),
              child: PinPut(
                fieldsCount: 5,
                //focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                onChanged: (code){
                  LoginEmailSingletonController.setCode(code);
                },
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                selectedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                eachFieldHeight: 60.0,
                eachFieldWidth: 60.0,
                eachFieldMargin: EdgeInsets.symmetric(horizontal: _width * 0.027),
                mainAxisSize: MainAxisSize.min,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                )
              ),
            )
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        child: Container(
          //width: _width,
          height: 50,
          child: Center(child: Text("Continuar",style: TextStyle(
              color: Theme.of(context).accentColor
          ),)),
          color: Theme.of(context).primaryColor,
        ),
        onTap: () async {
          await api.loginWithCode().then((value){
            if(value){
              Navigator.pushNamedAndRemoveUntil(context, "homeview", (route) => false);
            }else{ // codicoes caso aconteca algum erro - faltando
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Modificar esse campo"),
                      content: Text("deu algum erro ai mano, verifica esse codigo"),
                      actions: [
                        FlatButton(
                          child: Text("ok"),
                          onPressed: (){
                            LoginEmailSingletonController.clearCode(_pinPutController);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  }
                );
            }

          });
        },
      ),
    );
  }
}

