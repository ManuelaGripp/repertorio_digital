import 'package:flutter/material.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';
import 'package:repertorio/app/utils/color.dart';
import 'package:repertorio/app/view/components/text_input.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key, required RepertoireController repertorio, index})
      : _repertorio = repertorio,
        _index = index;

  final RepertoireController _repertorio;
  final int _index;

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
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
    _nameController = TextEditingController(
        text: widget._repertorio.list[widget._index].name);
    _genderController = TextEditingController(
        text: widget._repertorio.list[widget._index].gender);
    _durationController = TextEditingController(
        text: widget._repertorio.list[widget._index].duration);
    _artistController = TextEditingController(
        text: widget._repertorio.list[widget._index].artist);
    _albumController = TextEditingController(
        text: widget._repertorio.list[widget._index].album);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: const BoxDecoration(color: ColorsOptions.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
            key: _formKey,
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.8,
              child: Column(
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
                    height: 10,
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
                    height: 10,
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
                    height: 10,
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
                    height: 10,
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
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsOptions.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                    onPressed: () {
                      widget._repertorio.updateSong(
                        index: widget._index,
                        album: _albumController.text,
                        artist: _artistController.text,
                        duration: _durationController.text,
                        gender: _genderController.text,
                        name: _nameController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Text(
                          'Atualizar música',
                          style: TextStyle(
                            color: ColorsOptions.primary,
                            fontSize: 15,
                          ),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
