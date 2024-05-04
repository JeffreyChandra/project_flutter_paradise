import 'dart:convert';

import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart';
import 'package:local_auth/local_auth.dart';
import 'package:e_commerce/widget/face_api.dart' as FaceApi hide Image;

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool loading = false;
  TextEditingController old_password = TextEditingController(text: "");
  TextEditingController new_password = TextEditingController(text: '');
  TextEditingController confirm_new_password = TextEditingController(text: '');
  bool _showNewPassError = false;
  bool _showOldPassError = false;
  var imageValid = FaceApi.MatchFacesImage();

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
              profileProvider.changePassword(0, old_password.text, new_password.text);
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
          title: Text('Edit Password'),
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
                    TextField(
                      controller: old_password,
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
                        labelText: "Old Password",
                        hintText: "Fill your old password",
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        errorText: _showOldPassError ? "Wrong password" : null,
                      ),
                      obscureText: true,
                      onChanged: (text) {
                        setState(() {
                          _showOldPassError = false;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: new_password,
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
                        labelText: "New Password",
                        hintText: "Fill your new password",
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: confirm_new_password,
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
                        labelText: "Confirm New Password",
                        hintText: "Fill again your new password",
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        errorText: _showNewPassError ? "Password not same with the new password" : null,
                      ),
                      obscureText: true,
                      onChanged: (text) {
                        setState(() {
                          _showNewPassError = false;
                        });
                      },
                    ),
                  ],
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
                      bool sameNewPassword = new_password.text == confirm_new_password.text;
                      bool validatePass = old_password.text == profileProvider.account[0].password;

                      if (validatePass) {
                        if (sameNewPassword) {
                          if (isBiometricEnabled) {
                            try {
                              bool isAuthenticated = await LocalAuthentication().authenticate(
                                localizedReason: 'Please authenticate to edit profile',
                              );

                              if (isAuthenticated) {
                                profileProvider.changePassword(0, old_password.text, new_password.text);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          } else if (isFaceUnlockEnabled) {
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
                            profileProvider.changePassword(0, old_password.text, new_password.text);
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
                          }
                        } else {
                          setState(() {
                            _showNewPassError = true;
                          });
                        }
                      } else {
                        _showNewPassError = true;
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
                  ))
                )
              ],
            )
        )
    );
  }
}
