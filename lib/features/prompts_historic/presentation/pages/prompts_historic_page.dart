import 'package:flutter/material.dart';

import '../../../../core/helpers/copy_to_clipboard_helper.dart';
import '../../../../core/styles/color_schema.dart';
import '../../../../core/usecases/local_storage_service.dart';

class PromptsHistoricPage extends StatefulWidget {
  const PromptsHistoricPage({super.key});

  @override
  State<PromptsHistoricPage> createState() => _PromptsHistoricPageState();
}

class _PromptsHistoricPageState extends State<PromptsHistoricPage> {
  ValueNotifier<List<String>> promptsList = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    super.initState();
    readOnLocalStorage().then((list) {
      promptsList.value = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: promptsList,
      builder: (_, value, __) => promptsList.value.isEmpty
          ? const Center(
              child: Text('Nenhum Histórico'),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(10.0),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: promptsList.value.length,
              itemBuilder: (_, int index) => ListTile(
                title: Text(promptsList.value[index]),
                trailing: Wrap(
                  spacing: 15.0,
                  children: [
                    InkWell(
                      onTap: () async =>
                          copyToClipboardHelper(promptsList.value[index], context),
                      child: const Icon(
                        Icons.copy,
                        color: kIconButtonColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        removeFromLocalStorage(index)
                            .then((list) => promptsList.value = list);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text('Item Removido'),
                        ));
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: kSecondaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
