import 'package:flutter/material.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';
import 'package:repertorio/app/model/song.dart';
import 'package:repertorio/app/utils/color.dart';
import 'package:repertorio/app/view/components/search_song.dart';
import 'package:repertorio/app/view/components/text_input.dart';

class RepertoireForm extends StatefulWidget {
  const RepertoireForm({
    super.key,
    required this.repertorio,
  });

  final RepertoireController repertorio;

  @override
  State<RepertoireForm> createState() => _RepertoireFormState();
}

class _RepertoireFormState extends State<RepertoireForm> {
  late TextEditingController _nameController;
  late TextEditingController _genderController;
  late TextEditingController _durationController;
  late TextEditingController _artistController;
  late TextEditingController _albumController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _genderController = TextEditingController();
    _durationController = TextEditingController();
    _artistController = TextEditingController();
    _albumController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: ColorsOptions.primary,
      width: size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('Nova música',
                  style: TextStyle(
                    color: ColorsOptions.secondary,
                    fontSize: 40,
                    decoration: TextDecoration.none,
                  )),
            ),
            Expanded(
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextInput(
                        label: 'Nome da música',
                        controller: _nameController,
                        validators: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextInput(
                        label: 'Gênero da música',
                        controller: _genderController,
                        validators: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextInput(
                        label: 'Duração da música',
                        controller: _durationController,
                        validators: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextInput(
                        label: 'Artista da música',
                        controller: _artistController,
                        validators: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextInput(
                        label: 'Álbum da música',
                        controller: _albumController,
                        validators: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsOptions.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.repertorio.addNewSong(Song(
                              name: _nameController.text,
                              gender: _genderController.text,
                              duration: _durationController.text,
                              artist: _artistController.text,
                              album: _albumController.text,
                            ));
                          }
                          _formKey.currentState!.reset();
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: const Text(
                              'Adiconar nova música',
                              style: TextStyle(
                                color: ColorsOptions.primary,
                                fontSize: 15,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsOptions.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(0),
                              content:
                                  SearchSong(repertorio: widget.repertorio),
                            ),
                          );
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: const Text(
                              'Pesquisar música',
                              style: TextStyle(
                                color: ColorsOptions.primary,
                                fontSize: 15,
                              ),
                            )),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
