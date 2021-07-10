import 'dart:io';
import 'dart:async';

import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forum/ui/uni_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  QuillController? _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadFromDB();
  }

  Future<void> _loadFromDB() async {
      final doc = Document()..insert(0, 'Empty asset');
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
    // try {
    //   final result = await rootBundle.loadString('assets/sample_data.json');
    //   final doc = Document.fromJson(jsonDecode(result));
    //   setState(() {
    //     _controller = QuillController(
    //         document: doc, selection: const TextSelection.collapsed(offset: 0));
    //   });
    // } catch (error) {
    //   final doc = Document()..insert(0, 'Empty asset');
    //   setState(() {
    //     _controller = QuillController(
    //         document: doc, selection: const TextSelection.collapsed(offset: 0));
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Text('Loading...');
    }

    var quillEditor;
    if (kIsWeb) {
      quillEditor = QuillEditor(
        controller: _controller!,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: _focusNode,
        autoFocus: false,
        readOnly: false,
        placeholder: 'Add content',
        expands: false,
        padding: EdgeInsets.zero,
        customStyles: DefaultStyles(
          h1: DefaultTextBlockStyle(
              const TextStyle(
                fontSize: 32,
                color: Colors.black,
                height: 1.15,
                fontWeight: FontWeight.w300,
              ),
              const Tuple2(16, 0),
              const Tuple2(0, 0),
              null),
          sizeSmall: const TextStyle(fontSize: 9),
        ),

        embedBuilder: defaultEmbedBuilderWeb,
      );
    }
    else {
      quillEditor = QuillEditor(
        controller: _controller!,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: _focusNode,
        autoFocus: false,
        readOnly: false,
        placeholder: 'Add content',
        expands: false,
        padding: EdgeInsets.zero,
        customStyles: DefaultStyles(
          h1: DefaultTextBlockStyle(
              const TextStyle(
                fontSize: 32,
                color: Colors.black,
                height: 1.15,
                fontWeight: FontWeight.w300,
              ),
              const Tuple2(16, 0),
              const Tuple2(0, 0),
              null),
          sizeSmall: const TextStyle(fontSize: 9),
        ),
      );
    }
    var toolbar;
    if (kIsWeb) {
      toolbar = QuillToolbar.basic(
          controller: _controller!,
          onImagePickCallback: _onImagePickCallback,
          webImagePickImpl: _webImagePickImpl);
    }
    else {
      toolbar = QuillToolbar.basic(
          controller: _controller!,
          onImagePickCallback: _onImagePickCallback);
    }

    return RawKeyboardListener(
      focusNode: FocusNode(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            kIsWeb
                ? Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: toolbar,
                ))
                : Container(child: toolbar),
            Expanded(
              flex: 15,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: quillEditor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _onImagePickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    // final appDocDir = await getApplicationDocumentsDirectory();
    // print('PATH: ' + appDocDir.path);
    //
    // final copiedFile = await file.copy('${appDocDir.path}/${basename(file.path)}');
    // print('GET PATH: ' + copiedFile.path.toString());
    // return copiedFile.path.toString();
    return 'https://d3hk6w1rfu80ox.cloudfront.net/media/uploads/listings/UUem6skV0Cgo.png';
  }

  Future<String?> _webImagePickImpl(OnImagePickCallback onImagePickCallback) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
    if (result == null) {
      return null;
    }
    // Take first, because we don't allow picking multiple files.
    final fileName = result.files.single.name;
    final file = File(fileName);
    return onImagePickCallback(file);
  }
}