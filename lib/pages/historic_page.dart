import 'package:ai_image_generetor/functions/clipboard_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  List<String> promptsList = [];

  _readOnLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'last_prompts';
    List<String> mypromptsList = prefs.getStringList(key) ?? [];
    setState(() {
      promptsList = mypromptsList;
    });
  }

  _removeFromLocalStorage(int prompIndex) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'last_prompts';
    List<String> mypromptsList = prefs.getStringList(key) ?? [];

    mypromptsList.removeAt(prompIndex);

    setState(() {
      prefs.setStringList(key, mypromptsList);
      promptsList = mypromptsList;
    });
  }

  @override
  void initState() {
    super.initState();
    _readOnLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    if (promptsList.isEmpty) {
      return const Center(
        child: Text('Nenhum Histórico'),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(10.0),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: promptsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(promptsList[index]),
            trailing: Wrap(
              spacing: 15.0,
              children: [
                InkWell(
                  onTap: () async =>
                      copyToClipboard(promptsList[index], context),
                  child: const Icon(
                    Icons.copy,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _removeFromLocalStorage(index);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text('Item Removido'),
                    ));
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          );
        },
      );
    }
  }
}
