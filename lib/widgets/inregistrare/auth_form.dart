import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, bool isLogin) submitFn;
  final bool isLoading;

  const AuthForm(this.submitFn, this.isLoading);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid!) {
      _formKey.currentState?.save();
    }

    widget.submitFn(_userEmail, _userPassword, _isLogin);
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
                        return 'Vă rugăm introduceți o adresă de email!';
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
                      if (value!.isEmpty || value.length <= 7) {
                        return 'Parola trebuie să aibă o lungime de cel puțin 7 litere';
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
                    child: Text(_isLogin ? "Logare" : "Înregistrare"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin
                        ? "Nu aveți un cont? Inregistrare!"
                        : "Logare!"),
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
