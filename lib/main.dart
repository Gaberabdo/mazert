import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozart_flutter_app/mozart_app.dart';
import 'package:mozart_flutter_app/provider/provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
        child:   MozartApp(),
        create:(BuildContext context){
          return AppProvider();
        }
    )
  );
}

