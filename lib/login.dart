import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController inputControllerEmail = TextEditingController();
  TextEditingController inputControllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isLoading = false;

  void clearInputs() {
    inputControllerEmail.clear();
    inputControllerPassword.clear();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      performAction();
    });
  }

  void performAction() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    if (isLoading) {
      isLoading = false;
    }
    super.dispose();
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('data')));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mark_unread_chat_alt_rounded,
                        color: Colors.blueAccent,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Seja Bem Vindo :)',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 30),
                              child: TextFormField(
                                controller: inputControllerEmail,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ops, insira seu email. :)';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.grey.shade300,
                                    filled: true),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 30),
                              child: TextFormField(
                                controller: inputControllerPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ops, insira sua senha. :)';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  labelText: 'Senha',
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }),
                            Text(
                              'Continuar conectado',
                              style: GoogleFonts.roboto(),
                            ),
                          ],
                        ),
                      ),
                      if (isLoading)
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: CircularProgressIndicator()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  _showSnackBar(context)
                                  // isLoading ? null : performAction(),
                                  // if (_formKey.currentState!.validate())
                                  //   {
                                  //     clearInputs(),
                                  //     Future.delayed(
                                  //         const Duration(milliseconds: 1500), () {
                                  //       Navigator.pushNamed(context, '/chatpage');
                                  //     })
                                  //   }
                                },
                            style: const ButtonStyle(),
                            child: const Text('Entrar')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextButton(
                            onPressed: () =>
                                {Navigator.pushNamed(context, '/signuppage')},
                            child: Text(
                              'Não possui conta? Cadastre-se aqui',
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(fontSize: 12)),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
