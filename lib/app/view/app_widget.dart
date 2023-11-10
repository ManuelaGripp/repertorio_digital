import 'package:flutter/material.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';
import 'package:repertorio/app/model/song.dart';
import 'package:repertorio/app/utils/color.dart';
import 'package:repertorio/app/view/components/edit_bottom_sheet.dart';
import 'package:repertorio/app/view/components/text_input.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
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

  int selectedIndex = -1;
  RepertoireController repertorio = RepertoireController();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: Container(
            color: ColorsOptions.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('Repertório',
                        style: TextStyle(
                          fontSize: 40,
                          color: ColorsOptions.secondary,
                          decoration: TextDecoration.none,
                        )),
                  ),
                  ListenableBuilder(
                      listenable: repertorio,
                      builder: (context, child) {
                        return Expanded(
                          child: ListView.builder(
                              itemCount: repertorio.list.length,
                              itemBuilder: (context, index) {
                                var musica = repertorio.list[index];
                                return Column(
                                  children: [
                                    Card(
                                      color: const Color.fromARGB(
                                          228, 255, 204, 1),
                                      child: SizedBox(
                                        height: 65,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 15),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    musica.name,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(musica.artist,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: ColorsOptions
                                                            .neutral,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Text(
                                                      musica.album,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: ColorsOptions
                                                            .neutral,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    musica.duration,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          ColorsOptions.neutral,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    color:
                                                        ColorsOptions.neutral,
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                      repertorio.removeSong(
                                                          index: selectedIndex);
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    color:
                                                        ColorsOptions.neutral,
                                                    onPressed: () async {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                      await showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                content: EditForm(
                                                                    repertorio:
                                                                        repertorio,
                                                                    index:
                                                                        index),
                                                              ));
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    )
                                  ],
                                );
                              }),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        Container(
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
                                repertorio.addNewSong(Song(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: const Text(
                                  'Adiconar nova música',
                                  style: TextStyle(
                                    color: ColorsOptions.primary,
                                    fontSize: 15,
                                  ),
                                )),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
