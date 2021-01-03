import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_fake_app/views/login/login_types/login_email_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  Widget buttonCustom(double width, String title) {
    return Container(
      width: width * 0.9,
      height: 60,
      decoration: BoxDecoration(
          color: title == "Google" ? Color(0xFF4285F4) : Color(0xFF3859A2),
          borderRadius: BorderRadius.circular(7)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: width * 0.02),
            width: width * 0.1,
            height: 45,
            decoration: BoxDecoration(
                color:  title == "Google" ? Theme.of(context).accentColor: null,
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: title == "Google" ? AssetImage("assets/img_3.png") : AssetImage("assets/img_4.png"),
                    scale: title == "Google" ? 50 : 15
                )
            ),
          ),
          SizedBox(width: width * 0.15,),
          Container(
            width: title == "Google"? width * 0.45 : width * 0.35,
            child: Text(title == "Google" ? "Continuar com o Google" : "Facebook", style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget buttonWithoutBorder(double width, double distance, String text){
    return Container(
      width: width * distance,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.black45,
          )
      ),
      child: Center(
        child: Text(text, style: TextStyle(
          fontSize: 16
        ),),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.only(top: _height * 0.3),
                height: _height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img_2.png"),
                  )
                ),
              ),
            SizedBox(height: _height * 0.1,),
            Container(
              width: _width * 0.6,
              child: Text("Falta pouco pra matar sua fome!", style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: _height * 0.03,),
            Container(
              width: _width * 0.6,
              child: Text("Como deseja continuar?", style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300
              ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: _height * 0.02,),
            buttonCustom(_width, "Google"),
            SizedBox(height: _height * 0.02,),
            GestureDetector(
              child: buttonWithoutBorder(_width, 0.9, "Outras opções"),
              onTap: (){
                return showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          color: Theme.of(context).accentColor
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: _height * 0.01),
                              width: _width * 0.12,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: _height * 0.06,),
                            Container(
                              child: Text("Como deseja continuar?", style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500
                              ),),
                            ),
                            SizedBox(height: _height * 0.08,),
                            buttonCustom(_width, "Facebook"),
                            SizedBox(height: _height * 0.02,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buttonWithoutBorder(_width, 0.43, "Celular"),
                                SizedBox(width: _width * 0.03,),
                                GestureDetector(
                                    child: buttonWithoutBorder(
                                        _width, 0.43, "E-mail"
                                    ),
                                  onTap: (){
                                      Navigator.pushNamedAndRemoveUntil(context, 'loginemailview', (route) => false);
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: _height * 0.05,),
                          ],
                        ),
                      );
                    }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
