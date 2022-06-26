import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String nume,
      String prenume, String telefon, bool isLogin) submitFn;
  final bool isLoading;

  // ignore: use_key_in_widget_constructors
  const AuthForm(this.submitFn, this.isLoading);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  String _userPhoneNumber = '';
  String _userNume = '';
  String _userPrenume = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid!) {
      _formKey.currentState?.save();
    }

    widget.submitFn(_userEmail, _userPassword, _userNume, _userPrenume,
        _userPhoneNumber, _isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //TODO: de adaugat mai multe campuri la inregistrare
                  TextFormField(
                    key: const ValueKey('email'),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Adresa de e-mail'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Vă rugăm introduceți o adresă de e-mail!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    key: const ValueKey('password'),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    decoration: const InputDecoration(labelText: 'Parola'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Parola trebuie să aibă o lungime de cel puțin 4 litere';
                      }
                      return null;
                    },
                  ),
                  if (_isLogin == false)
                    TextFormField(
                      key: const ValueKey('nume'),
                      onSaved: (value) {
                        _userNume = value!;
                      },
                      decoration: const InputDecoration(labelText: 'Nume'),
                      keyboardType: TextInputType.name,
                    ),
                  if (_isLogin == false)
                    TextFormField(
                      key: const ValueKey('prenume'),
                      onSaved: (value) {
                        _userPrenume = value!;
                      },
                      decoration: const InputDecoration(labelText: 'Prenume'),
                      keyboardType: TextInputType.name,
                    ),
                  if (_isLogin == false)
                    TextFormField(
                      key: const ValueKey('telefon'),
                      onSaved: (value) {
                        _userPhoneNumber = value!;
                      },
                      decoration: const InputDecoration(labelText: 'Telefon'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty || value.length != 10) {
                          return 'Numărul de telefon trebuie să conțină 10 caractere. e.g. "0712345678"';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading)
                    const Center(child: CircularProgressIndicator()),
                  ElevatedButton(
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? "Autentificare" : "Înregistrare"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin
                        ? "Nu aveți un cont? Inregistrare!"
                        : "Autentificare!"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
