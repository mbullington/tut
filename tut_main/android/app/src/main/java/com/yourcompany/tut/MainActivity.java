package com.yourcompany.tut;

import android.os.Bundle;
import android.os.Build;  

import android.view.View;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    getWindow().setStatusBarColor(0x00000000);

    GeneratedPluginRegistrant.registerWith(this);
  }
}
