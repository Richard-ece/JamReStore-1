import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/user/user_bloc.dart';
import 'package:jam_re_store/bloc/user/user_state.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/helpers/cool_functions.dart';

class EditProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _nameController = useTextEditingController();
    final _userNameController = useTextEditingController();
    final _biographyController = useTextEditingController();
    final _locationController = useTextEditingController();

    void configuracion() {
      Navigator.pushNamed(context, NamesRoutes.settings);
    }

    void guardar() {
      Navigator.pushNamed(context, NamesRoutes.home);
    }

    void cancelar() {
      Navigator.pushNamed(context, NamesRoutes.home);
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.editProfile)),
      ),
      body: Container(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        child: Center(
                          child: Text(
                            'Añadir foto de portada',
                            style: TextStyleApp.labelXs(ColorTheme.white),
                          ),
                        ),
                        width: double.infinity,
                        height: 240,
                        decoration: BoxDecoration(
                          color: ColorTheme.textBlack,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Icon(Icons.camera_alt_outlined,
                          color: ColorTheme.white, size: 36),
                      top: 79,
                      right: 0,
                      left: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: Column(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: ColorTheme.grey8,
                                    radius: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Icon(Icons.camera_alt_outlined,
                          color: ColorTheme.white, size: 36),
                      top: 215,
                      right: 0,
                      left: 0,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 36, 18, 0),
                  child: InputName(
                    controller: _nameController,
                    errorInput: ErrorInput(
                      error: getErrorInput(
                          "name", state.editProfileRequestError?.errors),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 6, 18, 0),
                  child: InputUserName(
                    controller: _userNameController,
                    errorInput: ErrorInput(
                      error: getErrorInput(
                          "userName", state.editProfileRequestError?.errors),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 6, 18, 0),
                  child: InputBiography(
                    controller: _biographyController,
                    errorInput: ErrorInput(
                      error: getErrorInput(
                          "Biography", state.editProfileRequestError?.errors),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 6, 18, 0),
                  child: InputLocation(
                    controller: _locationController,
                    errorInput: ErrorInput(
                      error: getErrorInput(
                          "location", state.editProfileRequestError?.errors),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class InputName extends StatelessWidget {
  const InputName({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return Input(
      hintText: AppLocalizations.of(context)!.hintName,
      controller: controller,
      errorInput: errorInput,
      keyboardType: TextInputType.name,
      labelText: AppLocalizations.of(context)!.name,
    );
  }
}

class InputUserName extends StatelessWidget {
  const InputUserName({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return Input(
      hintText: AppLocalizations.of(context)!.hintUserName,
      controller: controller,
      errorInput: errorInput,
      keyboardType: TextInputType.name,
      labelText: AppLocalizations.of(context)!.userName,
    );
  }
}

class InputBiography extends StatelessWidget {
  const InputBiography({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return Input(
      hintText: AppLocalizations.of(context)!.hintBiography,
      controller: controller,
      errorInput: errorInput,
      keyboardType: TextInputType.name,
      labelText: AppLocalizations.of(context)!.biography,
    );
  }
}

class InputLocation extends StatelessWidget {
  const InputLocation({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return Input(
      hintText: AppLocalizations.of(context)!.hintLocation,
      controller: controller,
      errorInput: errorInput,
      keyboardType: TextInputType.name,
      labelText: AppLocalizations.of(context)!.location,
    );
  }
}
