import 'dart:convert';

import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart';
import 'package:local_auth/local_auth.dart';
import 'package:e_commerce/widget/face_api.dart' as FaceApi hide Image;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool loading = false;
  late TextEditingController name;
  var imageValid = FaceApi.MatchFacesImage();

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    name = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].name : '');
  }

  matchFaces() {
    setState(() {
      loading = true;
    });

    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    if (profileProvider.account[0].faceData.bitmap == null ||
        profileProvider.account[0].faceData.bitmap == "" ||
        imageValid == null ||
        imageValid.bitmap == null ||
        imageValid.bitmap == "") return;
    var request = new FaceApi.MatchFacesRequest();
    request.images = [profileProvider.account[0].faceData, imageValid];
    FaceApi.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
      print('Face Unlock Info : matchFaces request completed');
      var response = FaceApi.MatchFacesResponse.fromJson(json.decode(value));
      print('Face Unlock Info : ${response}');
      FaceApi.FaceSDK.matchFacesSimilarityThresholdSplit(
          jsonEncode(response!.results), 0.75)
          .then((str) {
        print('Face Unlock Info : matchFacesSimilarityThresholdSplit request completed');
        var split = FaceApi.MatchFacesSimilarityThresholdSplit.fromJson(
            json.decode(str));
        setState(() {
          if (split!.matchedFaces.length > 0) {
            var percent = double.parse((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2));
            print('Face Unlock Info : percent = $percent');

            if (percent > 80) {
              profileProvider.changeName(0, name.text);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
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
        print('Face Unlock Info : Error in matchFacesSimilarityThresholdSplit: $error');
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
            TextField(
              controller: name,
              style: TextStyle(
                  color: Colors.black,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6366F1), width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6366F1))
                ),
                labelText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: Colors.black),
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: loading ? null : () async {
                  setState(() {
                    loading = true;
                  });
                  try {
                    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
                    bool isBiometricEnabled = profileProvider.account.isNotEmpty ? profileProvider.account[0].isBiometricEnabled : false;
                    bool isFaceUnlockEnabled = profileProvider.account.isNotEmpty ? profileProvider.account[0].isFaceUnlockEnabled : false;
                    bool inputDifference = profileProvider.account[0].name == name.text;

                    if (isBiometricEnabled && !inputDifference) {
                      try {
                        bool isAuthenticated = await LocalAuthentication().authenticate(
                          localizedReason: 'Please authenticate to edit profile',
                        );

                        if (isAuthenticated) {
                          profileProvider.changeName(0, name.text);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
                        }
                      } catch (e) {
                        print(e);
                      }
                    } else if (isFaceUnlockEnabled && !inputDifference) {
                      FaceApi.FaceSDK.presentFaceCaptureActivity().then((result) {
                        var response =
                        FaceApi.FaceCaptureResponse.fromJson(json.decode(result))!;

                        if (response.image != null && response.image!.bitmap != null)
                          setState(() {
                            imageValid.bitmap = base64Encode(base64Decode(response.image!.bitmap!.replaceAll("\n", "")));
                            imageValid.imageType = FaceApi.ImageType.LIVE;
                          });

                        matchFaces();
                      });
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
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
                    : Text('Save',
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
            )
          ],
        )
      )
    );
  }
}
