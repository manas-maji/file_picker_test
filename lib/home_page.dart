import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File file;

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
                child: file == null
                    ? Center(child: Text("No file picked yet!"))
                    : Image.file(file),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleFilePicked() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    // );
    // // String result = await FilePicker().pickFiles();
    //
    // if (result != null) {
    //   File file = File(result.files.single.path);
    //   print('File path => ${file.path}');
    //
    //   // print(result);
    // } else {
    //   print('No file selected');
    // }
  }
}
