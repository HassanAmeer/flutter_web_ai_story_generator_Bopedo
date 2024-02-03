import 'dart:io';

import 'package:deborduurshop/provider/database_provider.dart';
import 'package:deborduurshop/src/components/pages/story_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/login.dart';
import '../../../provider/story_provider.dart';
import 'create_story_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authemail = TextEditingController();
  final authpassword = TextEditingController();
  final auth = FirebaseAuth.instance;
  List homeStoriesList = [];
  void setStoriesList() {
    if (homeStoriesList.isEmpty) {
      homeStoriesList = DatabaseProvider().getAllStories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final storyProvider = Provider.of<StoryProvider>(context);
    setStoriesList();
    // if (!kIsWeb) setStoriesList();
    // print(
    //     'Data in web hive storage is : ${DatabaseProvider().getAllStories()}');
    return Scaffold(
      backgroundColor: const Color(0xff1a0f0d),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: IconButton(
                onPressed: () {
                  showMenu(
                    color: Colors.deepOrangeAccent,
                    context: context,
                    position: const RelativeRect.fromLTRB(0, 88, 0, 0),
                    items: [
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: ListTile(
                          // tileColor: Colors.white,
                          onTap: () {
                            auth.signOut().then((value) {
                              Navigator.pushAndRemoveUntil(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  (route) => false);
                            }).onError((error, stackTrace) {});
                          },
                          leading: const Icon(
                            Icons.power_settings_new_rounded,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "LogOut",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: ListTile(
                              onTap: () async {
                                User? user = FirebaseAuth.instance.currentUser;

                                // Check if re-authentication is required
                                if (user != null &&
                                    user.providerData.length > 1) {
                                  showCupertinoDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Scaffold(
                                            backgroundColor: Colors.transparent,
                                            body: CupertinoAlertDialog(
                                                title: const Text(
                                                    'ReAuthenticate For Delete'),
                                                content: Column(
                                                  children: [
                                                    Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            vertical: 15.0),
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        10)),
                                                            child: TextField(
                                                                controller:
                                                                    authemail,
                                                                textAlign: TextAlign
                                                                    .center,
                                                                decoration: InputDecoration(
                                                                    fillColor: Colors
                                                                        .white,
                                                                    hintText:
                                                                        'Email',
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .blueGrey
                                                                            .shade300),
                                                                    border: InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                        InputBorder.none,
                                                                    enabledBorder: InputBorder.none)))),
                                                    Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            vertical: 15.0),
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        10)),
                                                            child: TextField(
                                                                controller:
                                                                    authpassword,
                                                                textAlign: TextAlign
                                                                    .center,
                                                                decoration: InputDecoration(
                                                                    fillColor: Colors
                                                                        .white,
                                                                    hintText:
                                                                        'Password',
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .blueGrey
                                                                            .shade300),
                                                                    border: InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                        InputBorder.none,
                                                                    enabledBorder: InputBorder.none))))
                                                  ],
                                                ),
                                                actions: [
                                                  CupertinoButton(
                                                      onPressed: () async {
                                                        User? user =
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser;

                                                        AuthCredential
                                                            credential =
                                                            EmailAuthProvider.credential(
                                                                email: authemail
                                                                    .toString(),
                                                                password:
                                                                    authpassword
                                                                        .text);
                                                        await user
                                                            ?.reauthenticateWithCredential(
                                                                credential);
                                                        await user
                                                            ?.delete()
                                                            .then((value) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          'Account Deleted!')));
                                                          Navigator.pushAndRemoveUntil(
                                                              (context),
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const LoginScreen()),
                                                              (route) => false);
                                                        }).onError((error,
                                                                stackTrace) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      '$error')));
                                                        });
                                                      },
                                                      child: const Text(
                                                        'YES',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )),
                                                  CupertinoButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('NO')),
                                                ],
                                                insetAnimationCurve:
                                                    Curves.slowMiddle,
                                                insetAnimationDuration:
                                                    const Duration(
                                                        seconds: 2)));
                                      });
                                } else {
                                  await user?.delete().then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Account Deleted!')));
                                    Navigator.pushAndRemoveUntil(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                        (route) => false);
                                  }).onError((error, stackTrace) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("$error")));
                                  });
                                }
                              },
                              leading:
                                  const Icon(Icons.delete, color: Colors.white),
                              title: const Text("Delete Account",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)))),
                    ],
                  );
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white70,
                ),
              ),
            ),

            ///
            /// Upper Text
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Generate\nImages\nFrom Story',
                    style: TextStyle(
                      color: const Color(0xfff6ad80),
                      fontWeight: FontWeight.bold,
                      fontSize: kIsWeb ? size.width * 0.05 : size.width * 0.08,
                    ),
                  ),
                ),
                SizedBox(
                  width: kIsWeb ? size.width * 0.3 : size.width * 0.34,
                  child: Image.asset(
                    'assets/home_page_img.png',
                    width: kIsWeb ? size.width * 0.3 : size.width * 0.34,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),

            ///
            /// Menus genre
            ///
            //

            SizedBox(
              height: kIsWeb ? size.height * 0.1 : size.height * 0.06,
              width: size.width,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                itemCount: storyProvider.listOfGenre.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      storyProvider.changeIndex(index);
                      storyProvider
                          .setCurrentGenre(storyProvider.listOfGenre[index]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: kIsWeb ? size.width * 0.17 : size.width * 0.3,
                      decoration: BoxDecoration(
                        color: storyProvider.selectedMenuIndex == index
                            ? const Color(0xfff6ad80)
                            : const Color(0xff3b2d24),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        storyProvider.listOfGenre[index].toString(),
                        style: TextStyle(
                          color: storyProvider.selectedMenuIndex == index
                              ? Colors.brown.shade900.withOpacity(0.9)
                              : Colors.white60,
                          fontWeight: FontWeight.w600,
                          fontSize:
                              kIsWeb ? size.width * 0.02 : size.width * 0.034,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),

            ///
            /// Story with Images
            ///
            // IconButton(
            //     onPressed: () {
            //       DatabaseProvider().addStoryToList({
            //         'genre': 'romantic'.toString(),
            //         'text': "story01",
            //         'image': "generatedImage"
            //       });
            //     },
            //     icon: Icon(Icons.abc_outlined)),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Wrap(
                children: homeStoriesList
                    .where((item) {
                      return item['genre'].toLowerCase() ==
                          storyProvider.selectedGenre.toLowerCase();
                    })
                    .toList()
                    .asMap()
                    .entries
                    .map((entry) {
                      // int index = entry.key;
                      var item = entry.value;
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // DatabaseProvider().addStoryToList({
                            //   'genre': 'romantic'.toString(),
                            //   'text': "story$index",
                            //   'image': "generatedImage"
                            // });
                            // setState(() {});
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoryDetailPage(
                                        imagePath: item['image'].toString(),
                                        text: item['text'].toString())));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width:
                                kIsWeb ? size.width * 0.3 : size.width * 0.43,
                            height:
                                kIsWeb ? size.width * 0.3 : size.height * 0.27,
                            decoration: BoxDecoration(
                              color: const Color(0xff2b1f17),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.38,
                                      height: kIsWeb
                                          ? size.width * 0.25
                                          : size.height * 0.2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: kIsWeb
                                            ? Image.network(item['image'],
                                                fit: BoxFit.cover, errorBuilder:
                                                    (context, error,
                                                        stackTrace) {
                                                print(
                                                    "🖼🏡in details page Image Path For Web Is: error: $error, stackTrace:$stackTrace, ImagePath:${item['image']}");
                                                return Image.network(
                                                  "https://thebulletin.org/wp-content/uploads/2023/10/Spot-the-bot-v1.png",
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    print(
                                                        "🖼🏡from google Image: Link error: in details page Image Path For Web Is: error: $error, stackTrace:$stackTrace, ImagePath:${item['image']}");
                                                    return Text(
                                                        "🖼🏡 from google Image: Link error: in details page Image Path For Web Is: error: $error, stackTrace:$stackTrace, ImagePath:${item['image']}");
                                                  },
                                                );
                                              })
                                            : Image.file(
                                                File(item['image'].toString()),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.network(
                                                    "https://thebulletin.org/wp-content/uploads/2023/10/Spot-the-bot-v1.png",
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Text(
                                                          error.toString());
                                                    },
                                                  );
                                                },
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        child: IconButton(
                                            onPressed: () {
                                              showCupertinoDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return CupertinoAlertDialog(
                                                      title: const Text(
                                                          'Want To Delete'),
                                                      content: SizedBox(
                                                        width: kIsWeb
                                                            ? size.width * 0.6
                                                            : size.width * 0.38,
                                                        height: kIsWeb
                                                            ? size.height * 0.4
                                                            : size.height * 0.2,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          child: kIsWeb
                                                              ? Image.network(
                                                                  item['image'],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                  print(
                                                                      "🖼🏡in details page Image Path For Web Is: error: $error, stackTrace:$stackTrace, ImagePath:${item['image']}");
                                                                  return Image
                                                                      .network(
                                                                    "https://thebulletin.org/wp-content/uploads/2023/10/Spot-the-bot-v1.png",
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder:
                                                                        (context,
                                                                            error,
                                                                            stackTrace) {
                                                                      return Text(
                                                                          error
                                                                              .toString());
                                                                    },
                                                                  );
                                                                })
                                                              : Image.file(
                                                                  File(item[
                                                                          'image']
                                                                      .toString()),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image.network(
                                                                          "https://thebulletin.org/wp-content/uploads/2023/10/Spot-the-bot-v1.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        CupertinoButton(
                                                            onPressed: () {
                                                              DatabaseProvider()
                                                                  .deleteStory(
                                                                      item);
                                                              setStoriesList();
                                                              setState(() {});
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'yes',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            )),
                                                        CupertinoButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Cancel')),
                                                      ],
                                                      insetAnimationCurve:
                                                          Curves.slowMiddle,
                                                      insetAnimationDuration:
                                                          const Duration(
                                                              seconds: 2),
                                                    );
                                                  });
                                            },
                                            icon: const Icon(
                                                Icons.delete_outline_outlined)),
                                      ),
                                    ),
                                  ],
                                ),
                                if (kIsWeb)
                                  SizedBox(height: size.height * 0.02),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 7),
                                  child: Text(
                                    item['text'].toString().trim(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: kIsWeb
                                          ? size.width * 0.01
                                          : size.width * 0.03,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                    .toList(),
              ),
            ),

            kIsWeb
                ? SizedBox(height: MediaQuery.of(context).size.height * 0.6 / 1)
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1 / 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff6ad80),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CreateStoryPage(),
          ));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
