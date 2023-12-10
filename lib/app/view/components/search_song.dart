import 'package:flutter/material.dart';
import 'package:repertorio/app/utils/color.dart';
import 'package:repertorio/app/view/components/text_input.dart';

import '../../controller/repertorio_controller.dart';
import '../../model/song.dart';
import '../../model/song_response.dart';
import '../../service/search_service.dart';

class SearchSong extends StatefulWidget {
  const SearchSong({
    super.key,
    required this.repertorio,
  });
  final RepertoireController repertorio;

  @override
  State<SearchSong> createState() => _SearchSongState();
}

class _SearchSongState extends State<SearchSong> {
  late TextEditingController _nameController;
  late GlobalKey<FormState> _formKey;
  final SearchService service = SearchService();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsOptions.primary),
      child: SizedBox(
        height: 150,
        width: 600,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 400,
                      child: TextInput(
                        label: 'Nome da música',
                        controller: _nameController,
                        validators: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsOptions.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                )),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                SongResponseEntity song =
                                    await widget.repertorio.getSongs(service);
                                widget.repertorio.addNewSong(
                                  Song(
                                      name: song.docs[0].title ?? '',
                                      artist: song.docs[0].band),
                                );
                              }
                              Navigator.pop(context);
                              _formKey.currentState!.reset();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
