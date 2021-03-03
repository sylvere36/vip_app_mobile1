import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText(
      String data, {
        color: Colors.white,
        scale: 1.0,
        textAlign: TextAlign.center,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      }) : super((data == null) ? "" : data,
      textAlign: textAlign,
      textScaleFactor: scale,
      style: new TextStyle(
          color: color,
          fontStyle: fontStyle,
          fontSize: 10.0,
          fontWeight: fontWeight));
}

class CustomTextMultipleLigne extends Text {
  CustomTextMultipleLigne(
      String data, {
        color: Colors.black,
        scale: 1.0,
        textAlign: TextAlign.center,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        maxLines: 3
      }) : super(data,
      textAlign: textAlign,
      textScaleFactor: scale,
      maxLines:maxLines,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: new TextStyle(
          color: color,
          fontStyle: fontStyle,
          fontSize: 10.0,
          fontWeight: fontWeight));
}


// Controlling a string variable prior to display
String controleString(String value,int substr, {String textAlternative}){
  if(value != null){
    if(substr==null || substr==0){
      return value;
    }else{
      return value.substring(0,substr);

    }
  }else{
    if(textAlternative != null){
      return textAlternative;
    }
    return "";
  }
}