import 'package:flutter/material.dart';

class TextInputWithController extends StatefulWidget {
  @override
  _TextInputWithControllerState createState() => _TextInputWithControllerState();
}

class _TextInputWithControllerState extends State<TextInputWithController> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input with Controller'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Text: ${_controller.text}');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: TextInputWithController(),
));