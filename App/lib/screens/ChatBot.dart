import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:library_management/screens/Messages.dart';


class ChatBot extends StatefulWidget{
  @override
  State<ChatBot> createState() => _ChatBotState();
}
class _ChatBotState extends State<ChatBot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Row(
         children: [
           FaIcon(FontAwesomeIcons.bots,size: 30,),
           SizedBox(width: 15,),
           Text("AskMe!")
         ],
       ),
       backgroundColor: Colors.black,
      // title: Text("AskMe!",style: TextStyle(color: Colors.white),),
     ),
     body: Column(
       children: [
         Expanded(child: MessagesScreen(messages: messages)),
         Container(
           padding: const EdgeInsets.symmetric(
             horizontal: 10,
             vertical: 5,
           ),
           color: Colors.transparent,
           child: Row(
             children: [
               Expanded(
                 child: TextField(
                   decoration: InputDecoration(
                     labelText: 'AskMe!',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     )
                   ),
                   controller: _controller,
                   style: TextStyle(color: Colors.white),
                 ),
               ),
               IconButton(
                 color: Colors.white,
                 icon: Icon(Icons.send,color: Colors.white ,size: 40),
                 onPressed: () {
                   sendMessage(_controller.text);
                   _controller.clear();
                 },
               ),
             ],
           ),
         ),
       ],
     ),
   );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

}



