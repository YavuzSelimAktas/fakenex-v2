import 'package:flutter/material.dart';

class NavigationService {
  
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic>? push(Widget page) {
   
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  
  static Future<dynamic>? pushReplacement(Widget page) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  
  static void pop() {
    return navigatorKey.currentState?.pop();
  }
}