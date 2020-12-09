import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

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
                onPressed: () => _handleDocPicked(),
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

  // uses file_picker package
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
      print('File name => ${platformFile.name}');
      print('File bytes => ${platformFile.bytes}');
      print('File size => ${platformFile.size}');
    } else {
      print('Result null');
    }
  }

  // uses flutter_document_picker package
  Future<void> _handleDocPicked() async {
    String path;
    try {
      path = await FlutterDocumentPicker.openDocument(
          params: FlutterDocumentPickerParams(
              allowedFileExtensions: ['jpg', 'png', 'pdf', 'jpeg']));
    } catch (e) {
      print('Error: ${e.toString()}');
      print('Only jpg, jpeg, png and pdf files are allowed to upload');
      return;
    }

    if (path.endsWith('.pdf')) {
      print("PDF file selected");
      setState(() {
        text = 'Pdf file selected';
      });
    } else if (path.endsWith('.png') || path.endsWith('.jpg') || path.endsWith('.jpeg')) {
      print("Image selected");
      File imgFile = File(path);
      setState(() {
        file = imgFile;
      });
    }
  }
}
