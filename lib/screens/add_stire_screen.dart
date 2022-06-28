import 'package:aplicatie_gestiune_rezervari/models/stiri/manager_stiri.dart';
import 'package:flutter/material.dart';

class AddStireScreen extends StatefulWidget {
  static const String routeName = "/add_stire";

  const AddStireScreen({Key? key}) : super(key: key);

  @override
  State<AddStireScreen> createState() => _AddStireScreenState();
}

class _AddStireScreenState extends State<AddStireScreen> {
  String _urlImagine = "";
  String _descriere = "";
  final TextEditingController _urlTextController = TextEditingController();

  final _addStireformKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _addStireformKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid!) {
      _addStireformKey.currentState?.save();
      ManagerStiri().incarcaStire(_descriere, _urlImagine, context);
    }
  }

  Image imageBuilder() {
    if (_urlImagine != "") {
      return Image.network(_urlImagine);
    } else {
      return Image.asset("lib/assets/pictures/mountains.png");
    }
  }

  @override
  void initState() {
    _urlTextController.addListener(onUrlChanged);
    super.initState();
  }

  void onUrlChanged() {
    setState(() {
      _addStireformKey.currentState?.save();
    });
  }

  @override
  void dispose() {
    _urlTextController.removeListener(onUrlChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adaugare știre nouă"),
      ),
      body: Center(
        child: Card(
          color: Colors.white60,
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _addStireformKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    imageBuilder(),
                    TextFormField(
                      key: const ValueKey('imagine'),
                      controller: _urlTextController,
                      onSaved: (value) {
                        _urlImagine = value!;
                      },
                      validator: (value) {
                        if (value == "") {
                          return "Trebuie incarcat url-ul unei imagini";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                          labelText: 'Url imagine știre: '),
                    ),
                    TextFormField(
                      key: const ValueKey('descriere'),
                      maxLines: null,
                      onSaved: (value) {
                        _descriere = value!;
                      },
                      validator: (value) {
                        if (value == "") {
                          return "Trebuie incarcată url-ul o descriere";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      decoration:
                          const InputDecoration(labelText: 'Descriere știre: '),
                    ),
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: const Text("Adaugă știre"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
