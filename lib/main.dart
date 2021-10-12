import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(appTitle),
        // ),
        body: FormValidation(),
      ),
    );
  }
}

class FormValidation extends StatefulWidget {
  FormValidation({Key? key}) : super(key: key);

  @override
  _FormValidationState createState() => _FormValidationState();
}

// VALIDATION & FOCUS
// class _FormValidationState extends State<FormValidation> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               } else {
//                 return null;
//               }
//             },
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Enter Something',
//             ),
//             autofocus: true,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('In Progress')),
//                   );
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// FOCUSNODE EXAMPLE
class _FormValidationState extends State<FormValidation> {
  late FocusNode myFocusNode;
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learn To Focus Text Field')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField(
            //   autofocus: true,
            //   onChanged: (text) {
            //     print('First text field: $text');
            //   },
            // ),
            TextField(
              focusNode: myFocusNode,
              controller: myController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text(myController.text));
            },
          );
        },
        tooltip: 'Show The Value',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
