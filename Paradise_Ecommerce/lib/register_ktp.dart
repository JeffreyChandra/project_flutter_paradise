import 'dart:io';
import 'dart:typed_data';

import 'package:e_commerce/widget/camera-ktp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:opencv_4/factory/pathfrom.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:nik_validator/nik_validator.dart';
import 'package:image/image.dart' as img;
import 'package:opencv_4/opencv_4.dart' as cv;
import 'package:path_provider/path_provider.dart';

class RegisterKTP extends StatefulWidget {
  const RegisterKTP({Key? key}) : super(key: key);

  @override
  _RegisterKTPState createState() => _RegisterKTPState();
}

class _RegisterKTPState extends State<RegisterKTP> {
  String? nik = '';
  String? tglLahir = '';
  String? gender = '';
  String? provinsi = '';
  String? kota = '';
  String? kecamatan = '';
  String? kode_pos = '';

  var errorText = '';
  bool showInput = false;

  var nikController = TextEditingController();

  String? normalizeNikText(String text) {
    // Split the text into lines
    List<String> lines = text.toUpperCase().split('\n');

    // Use a RegEx to find the NIK pattern
    RegExp regExp = RegExp(r"((1[1-9])|(21)|([37][1-6])|(5[1-4])|(6[1-5])|([8-9][1-2]))[0-9]{2}[0-9]{2}(([0-6][0-9])|(7[0-1]))((0[1-9])|(1[0-2]))([0-9]{2})[0-9]{4}");

    // Function to normalize a line and extract the NIK
    String? checkLine(int index) {
      if (index < 0 || index >= lines.length) {
        return null;
      }
      String result = lines[index].replaceAll(' ', '');
      result = result.replaceAll('NIK :', '');
      result = result.replaceAll('NIK:', '');
      result = result.replaceAll('B', '8');
      result = result.replaceAll('b', '6');
      result = result.replaceAll('l', '1');
      result = result.replaceAll('i', '1');
      result = result.replaceAll('I', '1');
      result = result.replaceAll('L', '1');
      result = result.replaceAll('O', '0');
      result = result.replaceAll('o', '0');
      result = result.replaceAll(RegExp(r'\D'), '');

      // Extract the NIK from the normalized line
      Match? match = regExp.firstMatch(result);
      if (match != null) {
        return match.group(0)!;  // group(0) refers to the entire match
      }

      return result.length >= 12 ? result : null;
    }

    // Check line 3 first, then line 2
    return checkLine(3) ?? checkLine(2);
  }

  Future<void> validateNIK(nik) async {
    print("DISINI : ${nik}");
    NIKModel result = await NIKValidator.instance.parse(nik : nik);
    if (result != null && result.valid == true) {
      setState(() {
        showInput = false;
        tglLahir = result.bornDate;
        gender = result.gender;
        provinsi = result.province;
        kota = result.city;
        kecamatan = result.subdistrict;
        kode_pos = result.postalCode;
      });
    } else {
      setState(() {
        showInput = true;
        nikController.text = nik;
      });
    }
  }

  Future<void> scanKtp(ImageSource source) async {
    setState(() {
      errorText = '';
    });

    try {
      String? imagePath;
      if (source == ImageSource.camera) {
        imagePath = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraKTP()));
      } else if (source == ImageSource.gallery) {
        final ImagePicker _picker = ImagePicker();
        final XFile? imageFile = await _picker.pickImage(source: source);
        imagePath = imageFile?.path;
      }

      if (imagePath != null) {
        // Load the image
        img.Image? image = img.decodeImage(File(imagePath).readAsBytesSync());

        // Resize the image
        img.Image resizedImg = img.copyResize(image!, width: 500);

        // Convert the image to grayscale
        img.Image grayscaleImg = img.grayscale(resizedImg);

        // Convert the image for contrast
        img.Image contrastImg = img.contrast(grayscaleImg, contrast: 120);

        // Save the grayscale image to a temporary file
        final directory = await getTemporaryDirectory();
        final path = '${directory.path}/temp.png';
        File(path)..writeAsBytesSync(img.encodePng(contrastImg));

        // Display the preprocessed image
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       content: Image.file(File(path)),
        //     );
        //   },
        // );

        // Apply Gaussian blur using OpenCV
        final Uint8List? blurredImage = await cv.Cv2.gaussianBlur(
          pathFrom: CVPathFrom.GALLERY_CAMERA,
          pathString: path,
          kernelSize: [5.0, 5.0],
          sigmaX: 0.0,
        );

        // Save the blurred image to a temporary file
        final blurredImagePath = '${directory.path}/blurred_temp.png';
        await File(blurredImagePath).writeAsBytes(blurredImage!);

        // Perform OCR on the preprocessed image
        final String recognisedText = await FlutterTesseractOcr.extractText(blurredImagePath, language: 'ind');
        print('Recognised Text: $recognisedText');

        // Normalize the recognisedText to extract the NIK
        nik = normalizeNikText(recognisedText)!;
        print('Normalized NIK: $nik');

        // Validate the NIK using the nik_validator plugin
        if (nik == null || nik!.length < 12) {
          setState(() {
            errorText = 'Foto mu mungkin kurang jernih, pastikan jangan terlalu terang atau gelap, coba ulangi lagi';
          });
        } else {
          // Validate the NIK using the nik_validator plugin
          validateNIK(nik);
        }
      }
    } catch (e) {
      setState(() {
        errorText = 'Foto mu mungkin kurang jernih, pastikan jangan terlalu terang atau gelap, coba ulangi lagi';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KTP Scan')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6366F1)), // Change this to your desired color
                    ),
                    onPressed: () => scanKtp(ImageSource.gallery),
                    icon: Icon(Icons.photo_library, color: Colors.white),
                    label: Text('Gallery', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6366F1)), // Change this to your desired color
                    ),
                    onPressed: () => scanKtp(ImageSource.camera),
                    icon: Icon(Icons.camera, color: Colors.white),
                    label: Text('Camera', style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ],
              ),
            ),
            if (errorText != '')
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(errorText),
              ),
            if (showInput)
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: nikController,
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
                        labelText: 'NIK',
                        errorText: 'Person with this NIK does not exist, please edit it manually',
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ButtonTheme(
                        child: TextButton(
                          onPressed: () {
                            validateNIK(nikController.text);
                          },
                          child: Text('Validate',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFF6366F1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (provinsi != "" && tglLahir != "" && gender != "" && kota != "")
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFDBDBDB),
                    )
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NIK', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(nik ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal Lahir', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(tglLahir ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jenis Kelamin', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(gender ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Provinsi', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(provinsi ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kota', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(kota ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kecamatan', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(kecamatan ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kode Pos', style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
                        SizedBox(height: 4),
                        Text(kode_pos ?? '')
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                     child: ButtonTheme(
                       child: TextButton(
                         onPressed: () {
                           Map<String, dynamic> ktpData = {
                             'nik': nik,
                             'tglLahir': tglLahir,
                             'gender': gender,
                             'provinsi': provinsi,
                             'kota': kota,
                             'kecamatan': kecamatan,
                             'kode_pos': kode_pos,
                           };

                           // Pop the page and return the data
                           Navigator.pop(context, ktpData);
                         },
                         child: Text('Simpan data KTP',
                             style: GoogleFonts.inter(
                               fontSize: 14,
                               fontWeight: FontWeight.w600,
                             )
                         ),
                         style: ElevatedButton.styleFrom(
                           foregroundColor: Colors.white,
                           backgroundColor: Color(0xFF6366F1),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(4)),
                           ),
                         ),
                       ),
                     ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
