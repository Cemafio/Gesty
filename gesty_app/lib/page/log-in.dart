import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/user_model.dart';
import 'package:gesty_app/page/base.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';
import 'package:gesty_app/utils/navigation.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/txt-field.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _keyform = GlobalKey<FormState>();
  String _email = '';
  String _pass = '';
  bool _isLoading = false;
  String _errorMess = '';
  bool _isPassObscured = true;

  void logInAction(BuildContext context, String url) async {
    setState(() {
      _isLoading = true;
    });
    
    _keyform.currentState!.validate();
    _keyform.currentState!.save();

    if(_email.isNotEmpty && _pass.isNotEmpty){
      try {
        final response = await login (url, _email, _pass);
        if(response['success'] == true){  
          ref.read(accessTokenProvider.notifier).state = response['token'];
          final dataUser = response['user_data'];
          ref.read(user_data.notifier).state = UserModel(id: dataUser['id'], email: dataUser['email'], name: dataUser['name']);
          _keyform.currentState!.reset();
          setState(() {
            _errorMess = '';
          });
          AppNavigator.navigate(context, BaseApp());
        }
        if(response['mess'] != null){
          // print('Error message : ${response['mess']}');
          setState(() {
            _errorMess = response['mess'];
          });
        }

      }catch (e) {
        throw Exception("Api error: $e");        

      }finally{
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _savedValue(String newValue, String label) {
    print("$newValue, $label");
    setState(() {
      switch(label){
        case('Name'):
          break;
        case('Email'):
          _email = newValue;

          break;
        default:
          _pass = newValue;

      }
    });
  }

  void changeObscuredText(){
    setState(() {
      _isPassObscured = !_isPassObscured;
    });
  } 
  @override
  Widget build(BuildContext context) {
    final _baseUrl = ref.watch(baseUrl);
    final colorApp = ref.watch(color_theme);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255)
        ),
          backgroundColor:  Color.fromRGBO(30, 30, 30, 1.0),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconGesty(),
            Text(
              "Gesty",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'Jersey15',
              )
            ),
            const SizedBox(height: 30),

            Form(
              key: _keyform,
              child: Column(
                children:[
                  TxtField(label: 'Email',actionSaved: _savedValue,),
                  TxtField(label: 'Password',actionSaved: _savedValue,obscuredText: _isPassObscured, changeObscureText: () => changeObscuredText()),
                ]
              ),
            ),
            const SizedBox(height: 10),
            Text('$_errorMess',
            textAlign: .center,
              style: TextStyle(
                color: colorApp.last,
                fontSize: 11,
                
              ),),
            const SizedBox(height: 10),
            SimpelBtn(t: "log in", w: 270,h:45, c: Color.fromRGBO(139, 18, 177, 1.0), bold: true,isLoaded: _isLoading,
              action: () => logInAction(context, _baseUrl),), 

          ],
        ),
      )
    );
  }
}