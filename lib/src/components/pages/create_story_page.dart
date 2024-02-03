import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:deborduurshop/provider/database_provider.dart';
import 'package:deborduurshop/src/components/pages/story_detail_page.dart';
import 'package:deborduurshop/src/modals/loading_dialog.dart';
import 'package:deborduurshop/src/models/models.dart';
import 'package:deborduurshop/src/services/services.dart';
import 'package:deborduurshop/src/utils/const.dart';
import 'package:deborduurshop/src/widgets/app_dropdown_widget.dart';
import 'package:deborduurshop/src/widgets/app_text_field.dart';
import 'package:deborduurshop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/story_provider.dart';

class CreateStoryPage extends StatefulWidget {
  const CreateStoryPage({Key? key}) : super(key: key);

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  var _autoValidateMode = AutovalidateMode.disabled;
  final _mainCharacterNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _brotherSisterNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _grandMotherNameController = TextEditingController();
  final _grandFatherNameController = TextEditingController();
  final _auntNameController = TextEditingController();
  final _uncleNameController = TextEditingController();
  final _friendNameController = TextEditingController();
  final _petNameController = TextEditingController();
  final _residenceController = TextEditingController();
  final _spouseNameController = TextEditingController();
  String? _selectedGenre;
  String? _selectedGender;
  String? _selectedLanguage;
  String story = '';
  String imagePath = '';
  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff1a0f0d),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white70),
          backgroundColor: const Color(0xff22130f),

          ///
          /// logout button
          ///
          // leading: IconButton(
          //   onPressed: () {
          //     showMenu(
          //       color: Colors.deepOrangeAccent,
          //       context: context,
          //       position: RelativeRect.fromLTRB(0, 88, 0, 0),
          //       items: [
          //         // PopupMenuItem(
          //         //   padding: EdgeInsets.zero,
          //         //   child: ListTile(
          //         //     shape: Border(
          //         //       bottom: BorderSide(),
          //         //     ),
          //         //     onTap: () {
          //         //       Navigator.pop(context);
          //         //       AppNavigation.to(
          //         //         context,
          //         //         ProfileView(),
          //         //       );
          //         //     },
          //         //     leading: Icon(
          //         //       Icons.person,
          //         //       color: Colors.white,
          //         //     ),
          //         //     title: Text(
          //         //       "Profile",
          //         //       style: TextStyle(
          //         //         fontSize: 18,
          //         //         fontWeight: FontWeight.w600,
          //         //         color: Colors.white,
          //         //       ),
          //         //     ),
          //         //   ),
          //         // ),
          //         // PopupMenuItem(
          //         //   padding: EdgeInsets.zero,
          //         //   child: ListTile(
          //         //     shape: Border(
          //         //       bottom: BorderSide(),
          //         //     ),
          //         //     onTap: () {},
          //         //     leading: Icon(
          //         //       Icons.menu,
          //         //       color: Colors.white,
          //         //     ),
          //         //     title: Text(
          //         //       "Template",
          //         //       style: TextStyle(
          //         //         fontSize: 18,
          //         //         fontWeight: FontWeight.w600,
          //         //         color: Colors.white,
          //         //       ),
          //         //     ),
          //         //   ),
          //         // ),
          //         PopupMenuItem(
          //           padding: EdgeInsets.zero,
          //           child: ListTile(
          //             onTap: () {
          //               auth.signOut().then((value) {
          //                 Navigator.pushAndRemoveUntil(
          //                     (context),
          //                     MaterialPageRoute(
          //                         builder: (context) => LoginScreen()),
          //                     (route) => false);
          //               }).onError((error, stackTrace) {});
          //             },
          //             leading: Icon(
          //               Icons.power_settings_new_rounded,
          //               color: Colors.white,
          //             ),
          //             title: Text(
          //               "LogOut",
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w600,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          //   icon: Icon(
          //     Icons.menu,
          //   ),
          // ),
          title: const Text(
            'Create Your Custom Book',
            style: TextStyle(
              color: Colors.white70,
            ),
          )),
      body: Center(
        child: SizedBox(
          width: min(800, double.infinity),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(kIsWeb ? 16 : 12),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NOTE\n\n\u2022  Fields with an Asterisks (*) are mandatory\n\u2022 There should be only "one main character!"\n\u2022 Names should be separated with (,) if there is more than one',
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                  const SizedBox(height: 12),
                  AppDropdownButton<String>(
                    onChanged: (_) => _selectedGenre = _,
                    value: _selectedGenre,
                    validate: true,
                    label: 'Select Genre *',
                    items: AppConstants.genre.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                  AppDropdownButton<String>(
                    onChanged: (_) => _selectedLanguage = _,
                    value: _selectedLanguage,
                    validate: true,
                    label: 'Select Language *',
                    items: AppConstants.languages.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                  AppDropdownButton<String>(
                    onChanged: (_) => _selectedGender = _,
                    value: _selectedGender,
                    validate: true,
                    label: 'Select Gender *',
                    items: AppConstants.genders.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                  AppTextField(
                    textEditingController: _mainCharacterNameController,
                    hint: 'Main Character Name *',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Main Character Name(s) Required';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    textEditingController: _ageController,
                    hint: 'Main character age *',
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Age is Required';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    textEditingController: _spouseNameController,
                    hint: 'Name of spouse, fiancé, boyfriend or girlfriend',
                  ),
                  AppTextField(
                    textEditingController: _brotherSisterNameController,
                    hint: 'Name(s) of brother(s) and or sister(s)',
                  ),
                  AppTextField(
                    textEditingController: _motherNameController,
                    hint: 'Name(s) of the mother, or 2 mothers',
                  ),
                  AppTextField(
                    textEditingController: _fatherNameController,
                    hint: 'Name(s) father, or 2 fathers',
                  ),
                  AppTextField(
                    textEditingController: _residenceController,
                    hint: 'Main character lives in',
                  ),
                  AppTextField(
                    textEditingController: _grandMotherNameController,
                    hint: 'Name(s) of the grandmother(s)',
                  ),
                  AppTextField(
                    textEditingController: _grandFatherNameController,
                    hint: 'Name(s) of the grandfather(s)',
                  ),
                  AppTextField(
                    textEditingController: _auntNameController,
                    hint: 'Aunt(s) Name',
                  ),
                  AppTextField(
                    textEditingController: _uncleNameController,
                    hint: 'Uncle(s) Name',
                  ),
                  AppTextField(
                    textEditingController: _friendNameController,
                    hint: 'Friend(s) Name',
                  ),
                  AppTextField(
                    textEditingController: _petNameController,
                    hint: 'Name(s) of a pet or pets and the type of animal(s)',
                    textInputAction: TextInputAction.done,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff6ad80),
                      minimumSize: const Size.fromHeight(56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onPressed: () => _createStory(storyProvider),
                    child: Text(
                      'Generate Story',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.brown.shade900.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createStory(storyProvider) async {
    if (!_formKey.currentState!.validate()) {
      _autoValidateMode = AutovalidateMode.onUserInteraction;
      setState(() {});
      return;
    }
    String generatedImage = '';

    try {
      $showLoadingDialog(context, 'Retrieving Story');
      final prompt = 'Create an interesting story between 2200 to 4000 words. '
          'the choice of language: $_selectedLanguage. '
          'choice of genre: $_selectedGenre. '
          'the name of the main character: ${_mainCharacterNameController.text.trim()} '
          'the age of the main character: ${_ageController.text.trim()} '
          'the gender of the main character: $_selectedGender '
          '${_spouseNameController.text.isEmpty ? '' : 'the name of spouse, fiancé, boyfriend or girlfriend: ${_spouseNameController.text} '}'
          '${_brotherSisterNameController.text.isEmpty ? '' : 'the name of brother(s) and or sister(s): ${_brotherSisterNameController.text} '}'
          '${_motherNameController.text.isEmpty ? '' : 'mother(s) name: ${_motherNameController.text} '}'
          '${_fatherNameController.text.isEmpty ? '' : 'father(s) name: ${_fatherNameController.text} '}'
          '${_residenceController.text.isEmpty ? '' : 'the main character lives in: ${_residenceController.text} '}'
          '${_grandMotherNameController.text.isEmpty ? '' : 'the name of the grandmother(s): ${_grandMotherNameController.text} '}'
          '${_grandFatherNameController.text.isEmpty ? '' : 'the name of the grandfather(s): ${_grandFatherNameController.text} '}'
          '${_auntNameController.text.isEmpty ? '' : 'the name of aunt(s): ${_auntNameController.text} '}'
          '${_uncleNameController.text.isEmpty ? '' : 'the name of uncle(s): ${_uncleNameController.text} '}'
          '${_friendNameController.text.isEmpty ? '' : 'the name(s) of friend(s): ${_friendNameController.text} '}'
          '${_petNameController.text.isEmpty ? '' : 'the name of a pet or pets and the type of animal(s): ${_petNameController.text}.'}';
      final userID = await DeviceInfoUtils().getUserID();
      final result = await GptApiService().messageCompletion(
          ChatGPTCompletionRequest(prompt: prompt, user: userID));
      story = result.choices.first.text;
      // story = 'A quick brown fox jumps over the lazy dog';
      final pdfLink =
          await StorageService().uploadFile(await generatePdf(story));
      print('💕Story here💕💕${story.length}');
      print("📌 Step 1");

// if story is not empty than generate image
      if (story.isNotEmpty) {
        generatedImage = await Utils.generateImage(
            story.length > 100 ? story.substring(0, 99) : story);
        print("🍳 important : $generatedImage");
        print("📌 Step 2"); 

        // image is stored in generatedImge variable,,
        // if generated image is not empty then download the image
        if (generatedImage.isNotEmpty && !kIsWeb) {
          /// adding story and image with genre
          final response = await http.get(Uri.parse(generatedImage));
          final bytes = response.bodyBytes;

          // Get a path to save the image
          final appDir = await getApplicationDocumentsDirectory();
          final time = DateTime.now().microsecond;
          imagePath = '${appDir.path}/story_image$time.jpg';
          print('imagePath is::::::✔✔✔✔$imagePath');
          // Save the image to the path
          await File(imagePath).writeAsBytes(bytes);

          /// adding story and image with genre endddddddd

          if (imagePath.isNotEmpty) {
            DatabaseProvider().addStoryToList({
              'genre': _selectedGenre.toString(),
              'text': story,
              'image': imagePath
            });

            print('data is added to the local storage...😂😂😂😂');

            if (mounted) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              storyProvider.showErrorSnackBar(
                  context, 'Story added Successfully');
              storyProvider.toggleLoading(false);
              Navigator.pop(context);
            }
          }
        }
      }
      print("📌 Step 3");

      if (kIsWeb) {
        DatabaseProvider().addStoryToList({
          'genre': _selectedGenre.toString(),
          'text': story,
          'image': generatedImage
        });

        print('💾 data is added to the local storage..');

        if (mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          storyProvider.showErrorSnackBar(context, 'Story added Successfully');
          storyProvider.toggleLoading(false);
          Navigator.pop(context);
        }
      }
      print("📌 Step 4");

      final storyModel = StoriesFirestoreModel(
          prompt: prompt,
          story: story,
          userId: userID,
          pdfLink: pdfLink,
          genre: _selectedGenre ?? '',
          language: _selectedLanguage ?? '');
      await FirestoreService().savePromptStory(storyModel: storyModel);
      // if (!mounted) return;
      _clearFields();
      print("📌Last Step In Try");
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return StoryDetailPage(
            imagePath: kIsWeb ? generatedImage.toString() : imagePath,
            text: story);
      }));
    } catch (e) {
      dev.log('Exception : $e');
      Navigator.of(context).pop();
      if (generatedImage.isNotEmpty) {
        dev.log('checking generated image in catch block👏👏👏$generatedImage');
        // Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return StoryDetailPage(
            imagePath: generatedImage,
            text: story,
          );
        }));
      }
    }
  }

  void _clearFields() {
    _selectedGenre = null;
    _selectedLanguage = null;
    _selectedGender = null;
    _mainCharacterNameController.clear();
    _ageController.clear();
    _brotherSisterNameController.clear();
    _motherNameController.clear();
    _fatherNameController.clear();
    _residenceController.clear();
    _grandMotherNameController.clear();
    _grandFatherNameController.clear();
    _auntNameController.clear();
    _uncleNameController.clear();
    _friendNameController.clear();
    _petNameController.clear();
    _autoValidateMode = AutovalidateMode.disabled;
    setState(() {});
  }

  Future<Uint8List> generatePdf(String content) async {
    final pdf = pw.Document();
    const pageFormat = PdfPageFormat.a4;
    final paragraphs = content.split('\n\n');
    final pdfContent = <pw.Widget>[];
    for (final paragraph in paragraphs) {
      pdfContent.addAll([pw.Text(paragraph), pw.SizedBox(height: 8)]);
    }
    pdf.addPage(pw.MultiPage(
      pageFormat: pageFormat,
      build: (context) => pdfContent,
    ));
    return await pdf.save();
  }
}
