import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  List<String> message = [];
  bool newMessage = false;
  final _formKey = GlobalKey<FormState>();

  void clearTextField() {
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();
    String hours = dateTime.hour.toString();
    String minutes = dateTime.minute.toString();
    final myDateTime = '$hours:$minutes';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    onPressed: () => {Navigator.pop(context)},
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Icon(Icons.person),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Usuário',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 22)))),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: message.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height: 30,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                message[index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(
                                        Icons.check_rounded,
                                        size: 15,
                                      ),
                                    ),
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: const BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Icon(Icons.person),
                                    ),
                                  ],
                                ),
                                Text(
                                  myDateTime,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ops, digite algo :)';
                  }
                  return null;
                },
                controller: messageController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          setState(() => {
                                newMessage = true,
                                message.add(messageController.text)
                              }),
                          clearTextField()
                        }
                    },
                    icon: const Icon(Icons.send),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: 'Mensagem',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
