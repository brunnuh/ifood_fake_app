import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/login/loginEmail/login_email_controller.dart';
import 'package:ifood_fake_app/models/user.dart';
import 'package:ifood_fake_app/repositories/Api/api.dart';


class LoginEmailView extends StatefulWidget {
  @override
  _LoginEmailViewState createState() => _LoginEmailViewState();
}

class _LoginEmailViewState extends State<LoginEmailView> {

  TextEditingController _emailController = TextEditingController();
  Api _api = Api();


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
              LoginEmailSingletonController.resetState();
              Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
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
                  margin: EdgeInsets.only(left: _width * 0.035, top: _height * 0.02),
                  child: Text("Qual o seu e-mail?", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                  ),),
                ),
              SizedBox(height: _height * 0.05,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: _height * 0.02),
                child: Observer(
                  builder: (_){
                    return TextFormField(
                      controller: _emailController,
                      onChanged: (field){
                        LoginEmailSingletonController.setEmail(field);
                      },
                      decoration: InputDecoration(
                          hintText: "E-mail",
                          labelText: 'E-mail',
                          suffixIcon: LoginEmailSingletonController.fieldEmail.isNotEmpty ? IconButton(
                            icon: Icon(Icons.clear, color: Colors.black, size: 17,),
                            onPressed: (){
                              LoginEmailSingletonController.clearEmail(_emailController); // limpar o campo
                            },
                          ) : null,
                          labelStyle: TextStyle(color: Colors.black),
                          //helperText: "Informacões sobre seus pedidos serão enviadas para este e-mail",
                          errorText: LoginEmailSingletonController.errorEmail ? "Insira um e-mail válido." : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              )
                          )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      bottomSheet:  Observer(
        builder: (_){
          return GestureDetector(
            child: Container(
              height: 50,
              color: !LoginEmailSingletonController.verifyFields ? Theme.of(context).primaryColor : Colors.grey,
              child: Center(
                child: Text("Continuar", style: TextStyle(
                    color: Theme.of(context).accentColor
                ),),
              ),
            ),
            onTap:  () async {
              //validar campos
              LoginEmailSingletonController.validEmail(); // modificar para chamar um metodo que verifica todos os campos
              LoginEmailSingletonController.verifyFields;

              // se campos estiverem ok prossiga
              if(!LoginEmailSingletonController.errorEmail){
                User user  = User(email: LoginEmailSingletonController.fieldEmail); //jogar isso pro controler
                _api.verifyCode(user);
                Navigator.pushNamed(context, "verifycodeview");
              }else{
                print("partiuc");
              }
            },
          );
        },
      ),
    );
  }
}
