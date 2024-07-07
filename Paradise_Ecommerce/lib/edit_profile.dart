import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart';
import 'package:local_auth/local_auth.dart';
import 'package:e_commerce/widget/face_api.dart' as FaceApi;
import 'package:image_picker/image_picker.dart';
import 'package:universal_html/html.dart' as html;

String createBlobUrlFromUint8List(Uint8List uint8List) {
  final blob = html.Blob([uint8List]);
  return html.Url.createObjectUrlFromBlob(blob);
}

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool loading = false;
  late TextEditingController name;
  var imageValid = FaceApi.MatchFacesImage();
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    name = TextEditingController(
      text: profileProvider.account.isNotEmpty
          ? profileProvider.account[0].name
          : '',
    );
  }

  // Method to pick an image for the profile
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage;

    // Show dialog to select image source
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () async {
                  pickedImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () async {
                  // pickedImage =
                  //     await _picker.pickImage(source: ImageSource.gallery);
                  // Navigator.of(context).pop();
                  _pickImageFromGallery(context);
                },
              ),
            ],
          ),
        );
      },
    );

    // Ensure an image was picked
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage!.path);

        // Update profile image in ProfileProvider
        final profileProvider =
            Provider.of<ProfileProvider>(context, listen: false);
        profileProvider.changeProfilePicture(0, _profileImage!.path);
      });
    }
  }

  matchFaces() {
    setState(() {
      loading = true;
    });

    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    if (profileProvider.account[0].faceData.bitmap == null ||
        profileProvider.account[0].faceData.bitmap == "" ||
        imageValid == null ||
        imageValid.bitmap == null ||
        imageValid.bitmap == "") return;
    var request = FaceApi.MatchFacesRequest();
    request.images = [profileProvider.account[0].faceData, imageValid];
    FaceApi.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
      print('Face Unlock Info : matchFaces request completed');
      var response = FaceApi.MatchFacesResponse.fromJson(json.decode(value));
      print('Face Unlock Info : $response');
      FaceApi.FaceSDK.matchFacesSimilarityThresholdSplit(
              jsonEncode(response!.results), 0.75)
          .then((str) {
        print(
            'Face Unlock Info : matchFacesSimilarityThresholdSplit request completed');
        var split = FaceApi.MatchFacesSimilarityThresholdSplit.fromJson(
            json.decode(str));
        setState(() {
          if (split!.matchedFaces.length > 0) {
            var percent = double.parse(
                (split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2));
            print('Face Unlock Info : percent = $percent');

            if (percent > 80) {
              profileProvider.changeName(0, name.text);
              if (_profileImage != null) {
                profileProvider.changeProfilePicture(0, _profileImage!.path);
              }
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Profile()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Face unlock failed. Please try again.'),
                  duration: Duration(seconds: 2),
                ),
              );
              setState(() {
                loading = false;
              });
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Face unlock failed. Please try again.'),
                duration: Duration(seconds: 2),
              ),
            );
            setState(() {
              loading = false;
            });
          }
        });
      }).catchError((error) {
        print(
            'Face Unlock Info : Error in matchFacesSimilarityThresholdSplit: $error');
        setState(() {
          loading = false;
        });
      });
    }).catchError((error) {
      print('Face Unlock Info : Error in matchFaces: $error');
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
        title: Text('Edit Profile'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFF31323d),
        ),
        titleSpacing: 12,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                // InkWell(
                //   onTap: _pickImage,
                //   child: CircleAvatar(
                //     radius: 50,
                //     backgroundImage: _profileImage != null
                //         ? FileImage(_profileImage!)
                //         : NetworkImage(
                //             Provider.of<ProfileProvider>(context)
                //                 .account[0]
                //                 .profilePictureUrl,
                //           ) as ImageProvider,
                //     child: Icon(
                //       Icons.camera_alt,
                //       size: 50,
                //       color: Colors.white.withOpacity(0.7),
                //     ),
                //   ),
                // ),

                InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: _profileImage != null
                              ? FileImage(_profileImage!)
                              : Provider.of<ProfileProvider>(context).imgWeb != null
                                  ? NetworkImage(Provider.of<ProfileProvider>(context).imgWeb!)
                                  : Provider.of<ProfileProvider>(context).imgPath != null
                                      ? FileImage(File(Provider.of<ProfileProvider>(context).imgPath!))
                                      : AssetImage('assets/images/pp-placeholder.webp') as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Provider.of<ProfileProvider>(context).imgWeb == null &&
                              Provider.of<ProfileProvider>(context).imgPath == null
                          ? Icon(Icons.camera_alt, size: 50, color: Colors.white.withOpacity(0.7))
                          : null,
                    )),

                SizedBox(height: 16),
                TextField(
                  controller: name,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF6366F1), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6366F1)),
                    ),
                    labelText: "Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: loading
                    ? null
                    : () async {
                        setState(() {
                          loading = true;
                        });
                        try {
                          final profileProvider = Provider.of<ProfileProvider>(
                              context,
                              listen: false);
                          bool isBiometricEnabled = profileProvider
                                  .account.isNotEmpty
                              ? profileProvider.account[0].isBiometricEnabled
                              : false;
                          bool isFaceUnlockEnabled = profileProvider
                                  .account.isNotEmpty
                              ? profileProvider.account[0].isFaceUnlockEnabled
                              : false;
                          bool inputDifference =
                              profileProvider.account[0].name != name.text;

                          if (isBiometricEnabled && inputDifference) {
                            try {
                              bool isAuthenticated =
                                  await LocalAuthentication().authenticate(
                                localizedReason:
                                    'Please authenticate to edit profile',
                              );

                              if (isAuthenticated) {
                                profileProvider.changeName(0, name.text);
                                if (_profileImage != null) {
                                  profileProvider.changeProfilePicture(
                                      0, _profileImage!.path);
                                }
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          } else if (isFaceUnlockEnabled && inputDifference) {
                            FaceApi.FaceSDK.presentFaceCaptureActivity()
                                .then((result) {
                              var response =
                                  FaceApi.FaceCaptureResponse.fromJson(
                                      json.decode(result))!;

                              if (response.image != null &&
                                  response.image!.bitmap != null) {
                                setState(() {
                                  imageValid.bitmap = base64Encode(base64Decode(
                                      response.image!.bitmap!
                                          .replaceAll("\n", "")));
                                  imageValid.imageType = FaceApi.ImageType.LIVE;
                                });

                                matchFaces();
                              }
                            });
                          } else {
                            profileProvider.changeName(0, name.text);
                            if (_profileImage != null) {
                              profileProvider.changeProfilePicture(
                                  0, _profileImage!.path);
                            }
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          }
                        } catch (e) {
                          print(e);
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                child: loading
                    ? CircularProgressIndicator()
                    : Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF6366F1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _pickImageFromGallery(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) return;

  if (kIsWeb) {
    // For web, read the image as bytes and convert to Blob URL
    final bytes = await pickedFile.readAsBytes();
    final blobUrl = _createBlobUrlFromUint8List(bytes);
    Provider.of<ProfileProvider>(context, listen: false)
        .changeImgWeb(blobUrl);
  } else {
    // For mobile/desktop, use the file path
    Provider.of<ProfileProvider>(context, listen: false)
        .changeImgPath(pickedFile.path);
  }
}

String _createBlobUrlFromUint8List(Uint8List uint8List) {
  final blob = html.Blob([uint8List]);
  return html.Url.createObjectUrlFromBlob(blob);
}