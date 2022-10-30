





import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

printStatement({required String data}){
  log(data);
}

popScreen({required BuildContext context})
{
  Navigator.pop(context);
}
push(BuildContext context, String screenName,{Map? map}){
  Navigator.pushNamed(context, screenName,arguments: map??{});
}

replacement({required BuildContext context,required String screenName}){
  Navigator.pushReplacementNamed(context, screenName);
}

removeUntil({required BuildContext context,required String screenName}){
  Navigator.pushNamedAndRemoveUntil(context, screenName,(r)=>false);
}
