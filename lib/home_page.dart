import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File file;
  String text = "No file selected yet!";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("Pick File"),
                color: Colors.blue,
                onPressed: () => _handleFilePicked(),
              ),
              Container(
                height: 250,
                width: 250,
                child: file == null ? Center(child: Text(text)) : Image.file(file),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleFilePicked() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );
    // // String result = await FilePicker().pickFiles();
    //
    if (result != null) {
      PlatformFile platformFile = result.files.first;
      // if (platformFile.extension == "png" ||
      //     platformFile.extension == "jpg" ||
      //     platformFile.extension == "jpeg") {
      //   setState(() {
      //     file = File(platformFile.path);
      //   });
      // } else if (platformFile.extension == "pdf") {
      //   setState(() {
      //     text = "PDF file selected";
      //   });
      // }
      print('File path => ${platformFile.path}');
      print('File extension => ${platformFile.extension}');
    } else {
      print('Result null');
    }
  }
}
