'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "16b3798ff22c1dcbb6e99c8b08d84b4b",
"assets/AssetManifest.bin.json": "a3f2064fafd0d0d6e361db180705097b",
"assets/AssetManifest.json": "061d01b1ef1b3f85847b26fe93b866de",
"assets/FontManifest.json": "17d7fef54db8ca95bf1cdd024f531261",
"assets/fonts/MaterialIcons-Regular.otf": "fa4bb9bbffbdbf6d0207440368039cbc",
"assets/images/avatar.png": "a79e249bad6709414ebc15ce9a96c7ac",
"assets/images/Book.png": "040b4a0f8de3ddb6ac67f97e58996215",
"assets/images/Logo.png": "040b4a0f8de3ddb6ac67f97e58996215",
"assets/images/Logo1.png": "8ef601e54f49cbb8ba0dfcaeed9eb2cf",
"assets/images/Me.jpg": "92f7f0045c2ea15fce66d0474b5edc95",
"assets/images/Person.png": "b5622b2967a8949c2a187d74b1b615c1",
"assets/images/personDeafult.png": "feeb164e2fd13df9094acfe75d451128",
"assets/images/SubjectsIcons/%25D8%25A3%25D9%2584%25D9%2585%25D8%25A7%25D9%2586%25D9%258A.png": "de056762b14d652d59483dda69187493",
"assets/images/SubjectsIcons/%25D8%25A5%25D9%258A%25D8%25B7%25D8%25A7%25D9%2584%25D9%258A.png": "a24fcc40d3990048ecbf18d83a261e25",
"assets/images/SubjectsIcons/%25D8%25A7%25D8%25B3%25D8%25AA%25D8%25A7%25D8%25AA%25D9%258A%25D9%2583%25D8%25A7.png": "fc66a63aabaca0afcbed887455fc90d3",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2583%25D8%25AA%25D8%25B4%25D9%2581.png": "d2775cd6990a85b0ef14c4cc443fcc5c",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D8%25A3%25D8%25AD%25D9%258A%25D8%25A7%25D8%25A1.png": "0c7cc83f099cadec12213ca5bc270b7d",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D8%25AA%25D9%2588%25D9%2583%25D8%25A7%25D8%25AA%25D8%25B3%25D9%2588.png": "7d1ffdaedab5ba213f1a4f2afcadb695",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D8%25AC%25D8%25BA%25D8%25B1%25D8%25A7%25D9%2581%25D9%258A%25D8%25A7.png": "81e28048080b1f945600274eacb7c27b",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D8%25AC%25D9%258A%25D9%2588%25D9%2584%25D9%2588%25D8%25AC%25D9%258A%25D8%25A7.png": "482a42dd65256f2bf415661cb0379b24",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D8%25B1%25D9%258A%25D8%25A7%25D8%25B6%25D9%258A%25D8%25A7%25D8%25AA.png": "3e0c39a093edb0df7cca731f08120177",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D8%25B9%25D9%2584%25D9%2588%25D9%2585.png": "f56a362d0440919eca73341698877a36",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D9%2581%25D9%258A%25D8%25B2%25D9%258A%25D8%25A7%25D8%25A1.png": "c861af024b4d1e3b6a46988ed7806846",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D9%2583%25D9%258A%25D9%2585%25D9%258A%25D8%25A7%25D8%25A1.png": "361a2b9a440b4449f6b062c8c2659089",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D9%2584%25D8%25BA%25D8%25A9%2520%25D8%25A7%25D9%2584%25D8%25A3%25D8%25B3%25D8%25A8%25D8%25A7%25D9%2586%25D9%258A%25D8%25A9.png": "a5f85ec245a53d9c52b1a4af46847770",
"assets/images/SubjectsIcons/%25D8%25A7%25D9%2584%25D9%2584%25D8%25BA%25D9%2587%2520%25D8%25A7%25D9%2584%25D8%25A7%25D9%2586%25D8%25AC%25D9%2584%25D9%258A%25D8%25B2%25D9%258A%25D8%25A9.png": "05ee435c15a743e54e0ee7fd582c0e7a",
"assets/images/SubjectsIcons/%25D8%25AA%25D8%25A7%25D8%25B1%25D9%258A%25D8%25AE.png": "57fdbe3c3032a1c415178caab31e3e5b",
"assets/images/SubjectsIcons/%25D8%25AA%25D8%25B1%25D8%25A8%25D9%258A%25D8%25A9%2520%25D8%25AF%25D9%258A%25D9%2586%25D9%258A%25D8%25A9.png": "d3b2f32a283feae8172d4b9ae2c9aeec",
"assets/images/SubjectsIcons/%25D8%25AA%25D8%25B1%25D8%25A8%25D9%258A%25D8%25A9%2520%25D9%2581%25D9%2586%25D9%258A%25D8%25A9.png": "851c91927176962c290ea2a8e5069fd0",
"assets/images/SubjectsIcons/%25D8%25AA%25D9%2581%25D8%25A7%25D8%25B6%25D9%2584%2520%25D9%2588%25D8%25AA%25D9%2583%25D8%25A7%25D9%2585%25D9%2584.png": "a49edbce9001de71bd394fbb045da895",
"assets/images/SubjectsIcons/%25D8%25AA%25D9%2583%25D9%2586%25D9%2588%25D9%2584%25D9%2588%25D8%25AC%25D9%258A%25D8%25A7%2520%25D8%25A7%25D9%2584%25D9%2585%25D8%25B9%25D9%2584%25D9%2588%25D9%2585%25D8%25A7%25D8%25AA.png": "3b5b2331d6af781a73a11f7c20403b7d",
"assets/images/SubjectsIcons/%25D8%25AC%25D8%25A8%25D8%25B1.png": "f699d5bc3665a75a0d23c5dacc3eb33e",
"assets/images/SubjectsIcons/%25D8%25AD%25D8%25A7%25D8%25B3%25D8%25A8%2520%25D8%25A2%25D9%2584%25D9%258A.png": "09587f83e32214afa342400439dddae5",
"assets/images/SubjectsIcons/%25D8%25AF%25D8%25B1%25D8%25A7%25D8%25B3%25D8%25A7%25D8%25AA%2520.png": "d5069810cb79c63a817a56319f231115",
"assets/images/SubjectsIcons/%25D8%25AF%25D9%258A%25D9%2586%25D8%25A7%25D9%2585%25D9%258A%25D9%2583%25D8%25A7.png": "f077108f19dbc4e063a7370a892cab7a",
"assets/images/SubjectsIcons/%25D8%25B9%25D8%25B1%25D8%25A8%25D9%258A.png": "05cb6f44be012ef7f365ad745ea0a587",
"assets/images/SubjectsIcons/%25D8%25B9%25D9%2584%25D9%2585%2520%25D8%25A7%25D9%2584%25D9%2586%25D9%2581%25D8%25B3.png": "fd8b4b01a13b75e3b8aedc7f5dc64461",
"assets/images/SubjectsIcons/%25D9%2581%25D8%25B1%25D9%2586%25D8%25B3%25D8%25A7%25D9%2588%25D9%258A.png": "32d28d85cb77ee53ee21b9b5b4e41b13",
"assets/images/SubjectsIcons/%25D9%2581%25D9%2584%25D8%25B3%25D9%2581%25D9%2587.png": "c186639b6f03f1a674c519a820269d32",
"assets/images/SubjectsIcons/%25D9%2582%25D9%258A%25D9%2585%2520%25D9%2588%25D8%25A7%25D8%25AD%25D8%25AA%25D8%25B1%25D8%25A7%25D9%2585%2520%25D8%25A7%25D9%2584%25D8%25A2%25D8%25AE%25D8%25B1.png": "1b601bde266c7467f12b152c63d960a7",
"assets/images/SubjectsIcons/%25D9%2585%25D9%2587%25D8%25A7%25D8%25B1%25D8%25A7%25D8%25AA%2520%25D8%25A7%25D9%2584%25D9%2585%25D9%2587%25D9%2586%25D9%258A%25D8%25A9.png": "7ac6aa7c049642d7cf476798b99a2659",
"assets/images/SubjectsIcons/%25D9%2587%25D9%2586%25D8%25AF%25D8%25B3%25D8%25A9%2520%25D9%2581%25D8%25B1%25D8%25A7%25D8%25BA%25D9%258A%25D9%2587.png": "2473639c32389cf45fb5f9187424e7ec",
"assets/images/SubjectsIcons/%25D9%2587%25D9%2586%25D8%25AF%25D8%25B3%25D8%25A9.png": "bcc431892ec396f72da2535ece258fce",
"assets/images/Time.png": "10c9f5166e46543f0936552d8b02941e",
"assets/images/webinar.png": "1356b2a090611913b10b2934412bfb0d",
"assets/NOTICES": "43cf7ea58aa9a818f938a568de0ec543",
"assets/packages/arabic_font/assets/fonts/Amiri/Amiri-Bold.ttf": "2accfcd6b3faf83d349942a19b91e12b",
"assets/packages/arabic_font/assets/fonts/Amiri/Amiri-BoldItalic.ttf": "1f0cfd59bef4321ff35af3ea69415e55",
"assets/packages/arabic_font/assets/fonts/Amiri/Amiri-Italic.ttf": "ca54f2483d9429c0a47fba80249ceede",
"assets/packages/arabic_font/assets/fonts/Amiri/Amiri-Regular.ttf": "a61fbc4d3da365e17f68e1bba6415e47",
"assets/packages/arabic_font/assets/fonts/Aref_Ruqaa/ArefRuqaa-Bold.ttf": "7b87d843f32f71e0cf71766945d712e4",
"assets/packages/arabic_font/assets/fonts/Aref_Ruqaa/ArefRuqaa-Regular.ttf": "8ff92bc4b7f51b61d2d628220a08d2d3",
"assets/packages/arabic_font/assets/fonts/Avenir_Arabic/Avenir-Arabic-Black.ttf": "8da1b8bbca4fc2b131d4fbe89401ead7",
"assets/packages/arabic_font/assets/fonts/Avenir_Arabic/Avenir-Arabic-Book.ttf": "3ea540836144a296c99076a69a5191b1",
"assets/packages/arabic_font/assets/fonts/Avenir_Arabic/Avenir-Arabic-Heavy.ttf": "bae31091c8c902377f6459130fd3548e",
"assets/packages/arabic_font/assets/fonts/Avenir_Arabic/Avenir-Arabic-Medium.ttf": "9cfd6cd4923f712b864f4d891959d107",
"assets/packages/arabic_font/assets/fonts/Avenir_Arabic/Avenir-Arabic-Regular.ttf": "7368b0c6d9169b637e27948df6ff72f0",
"assets/packages/arabic_font/assets/fonts/Baloo_Bhaijaan/BalooBhaijaan-Regular.ttf": "28190ae5cd54e8bf270404320d5e0821",
"assets/packages/arabic_font/assets/fonts/Cairo/Cairo-Black.ttf": "41774c33b29f951d86110f0e8cd527bb",
"assets/packages/arabic_font/assets/fonts/Cairo/Cairo-Bold.ttf": "ca9036ba6a756880f334d959b1b5f549",
"assets/packages/arabic_font/assets/fonts/Cairo/Cairo-ExtraLight.ttf": "118c56fd3f0773d43bdcd16deb8370d0",
"assets/packages/arabic_font/assets/fonts/Cairo/Cairo-Light.ttf": "532ee41c709ac28455bed88dd839ddb8",
"assets/packages/arabic_font/assets/fonts/Cairo/Cairo-Regular.ttf": "8e62cfbb90ccadc00b59b977c93eb31a",
"assets/packages/arabic_font/assets/fonts/Cairo/Cairo-SemiBold.ttf": "984ec9c232c5936cadb14e87cf1283db",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-Bold.ttf": "919bffaf44e0410995355e7441435370",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-ExtraBold.ttf": "73fcacc8fd46a0eed3037a20982d2cc7",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-ExtraLight.ttf": "0eccd5677b2ef5b0342169564e571a05",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-Light.ttf": "e2f7d3402c1c52456c09db40a80228f0",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-Medium.ttf": "c3af486a73a7461b1122665df86a7733",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-Regular.ttf": "7a53368c4704181a547f440c6273159b",
"assets/packages/arabic_font/assets/fonts/Changa/Changa-SemiBold.ttf": "125489c0710514546290914ac822a720",
"assets/packages/arabic_font/assets/fonts/DinNextLTArabic/ArbFONTS-DINNextLTArabic-Black-3.ttf": "8929fabf224e33fc76110ff98651aa7b",
"assets/packages/arabic_font/assets/fonts/DinNextLTArabic/ArbFONTS-DINNextLTArabic-Bold-2.ttf": "24421421e9210a40c31dda3d7d47995a",
"assets/packages/arabic_font/assets/fonts/DinNextLTArabic/ArbFONTS-DINNextLTArabic-Heavy-1.ttf": "87b2169d28ef227898bfb5db66ef2ca8",
"assets/packages/arabic_font/assets/fonts/DinNextLTArabic/ArbFONTS-DINNEXTLTARABIC-LIGHT-1.ttf": "d78f5d2c76185fa07aaf8dd729eef33e",
"assets/packages/arabic_font/assets/fonts/DinNextLTArabic/ArbFONTS-DINNextLTArabic-Medium-2.ttf": "8bb0cc139f4ae9080896b1bbf8b126ec",
"assets/packages/arabic_font/assets/fonts/DinNextLTArabic/ArbFONTS-DINNextLTArabic-Regular-2.ttf": "61b1e04ff205cd324350749648fe16fc",
"assets/packages/arabic_font/assets/fonts/Dubai/Dubai-Bold.ttf": "8fbdda63d87a91c5600c512a12aec79a",
"assets/packages/arabic_font/assets/fonts/Dubai/Dubai-Light.ttf": "2f7c5bb9cf55f5b0cb2d06c57d5a8ae7",
"assets/packages/arabic_font/assets/fonts/Dubai/Dubai-Medium.ttf": "1b70cb9a589df286a5e4faf70e2a50d9",
"assets/packages/arabic_font/assets/fonts/Dubai/Dubai-Regular.ttf": "24ab51f6ae1804c808f822d28b9be18a",
"assets/packages/arabic_font/assets/fonts/El_Messiri/ElMessiri-Bold.ttf": "1a4d3ffd4a8a7017d2a57c22105dead4",
"assets/packages/arabic_font/assets/fonts/El_Messiri/ElMessiri-Medium.ttf": "a88b6e918867744f5a28a5f4646c712f",
"assets/packages/arabic_font/assets/fonts/El_Messiri/ElMessiri-Regular.ttf": "f987603b0ad311424b5c64c55e10d10c",
"assets/packages/arabic_font/assets/fonts/El_Messiri/ElMessiri-SemiBold.ttf": "a2fc08a54a46b0663a084ce4ba19cce2",
"assets/packages/arabic_font/assets/fonts/Harmattan/Harmattan-Regular.ttf": "bcd87a685fc9fa2f88ae49bf9662649c",
"assets/packages/arabic_font/assets/fonts/ibm/IBMPlexArabic-Text.ttf": "76b0d039397c1d22ed2e38e5d7af9ae7",
"assets/packages/arabic_font/assets/fonts/Jomhuria/Jomhuria-Regular.ttf": "7d6b466d0e08fd984705b6190e6554a6",
"assets/packages/arabic_font/assets/fonts/Katibeh/Katibeh-Regular.ttf": "b9a90c628ecd4066bc9a44f548b67ff9",
"assets/packages/arabic_font/assets/fonts/Lalezar/Lalezar-Regular.ttf": "c07a18bb821945af6ec7de632e877731",
"assets/packages/arabic_font/assets/fonts/Lateef/LateefRegOT.ttf": "f98cf82fba21f78b335a41f343c5f0c9",
"assets/packages/arabic_font/assets/fonts/Lemonada/Lemonada-Bold.ttf": "ec008f8a072ecd3d535f2cac97e9ba89",
"assets/packages/arabic_font/assets/fonts/Lemonada/Lemonada-Light.ttf": "f6dbfb6fa1cf1d1a3070c0f0ceb2d585",
"assets/packages/arabic_font/assets/fonts/Lemonada/Lemonada-Regular.ttf": "659eae40390059a683cc91faf4df4ca9",
"assets/packages/arabic_font/assets/fonts/Lemonada/Lemonada-SemiBold.ttf": "91d517aec1170078f0b2eab23b4eef26",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-Black.ttf": "77e982cb003544f8c4832af58f5a8051",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-Bold.ttf": "6087ba6d5c2ac2ad094c8a545839775e",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-ExtraLight.ttf": "b5043d5fc92c52c730e4faff41118815",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-Light.ttf": "7b3ad1c8f7d7dbc35890123434adae55",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-Medium.ttf": "e3d9e7676a26eae957fad1e69c33d5a7",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-Regular.ttf": "9b3ddca6af7328102938afab0d55bc9d",
"assets/packages/arabic_font/assets/fonts/Mada/Mada-SemiBold.ttf": "28191d02304034b2421f2bacb91b78aa",
"assets/packages/arabic_font/assets/fonts/Markazi_Text/MarkaziText-Regular.ttf": "367d77a763df54f70c6ebe345598f2fb",
"assets/packages/arabic_font/assets/fonts/Mirza/Mirza-Bold.ttf": "d3cc57b384c4ccfcab258d4ade64b7f5",
"assets/packages/arabic_font/assets/fonts/Mirza/Mirza-Medium.ttf": "3b667481a859085d1a27e221bf45f3a9",
"assets/packages/arabic_font/assets/fonts/Mirza/Mirza-Regular.ttf": "21fd4e3c1c6f103d8b00b8a30d211c49",
"assets/packages/arabic_font/assets/fonts/Mirza/Mirza-SemiBold.ttf": "27b1558b9550a3196031a61fc6e0687e",
"assets/packages/arabic_font/assets/fonts/Rakkas/Rakkas-Regular.ttf": "1197ba69414123d92777f819a43a7d27",
"assets/packages/arabic_font/assets/fonts/Reem_Kufi/ReemKufi-Regular.ttf": "1cbfee67b7f1e63e1334e8800d5450b6",
"assets/packages/arabic_font/assets/fonts/Scheherazade/Scheherazade-Bold.ttf": "b26c8ba6aae29ef98d54c0841398ef34",
"assets/packages/arabic_font/assets/fonts/Scheherazade/Scheherazade-Regular.ttf": "87ffd3a053cd6c09186452cb10d9a15a",
"assets/packages/arabic_font/assets/fonts/Tajawal/Tajawal-Black.ttf": "d8e4db47417985783913a2d64ca6e8cf",
"assets/packages/arabic_font/assets/fonts/Tajawal/Tajawal-Bold.ttf": "73222b42f57d11db8ed71c1752e121c0",
"assets/packages/arabic_font/assets/fonts/Tajawal/Tajawal-ExtraBold.ttf": "87a0f0773f0cdc28fd8dd3603bf34837",
"assets/packages/arabic_font/assets/fonts/Tajawal/Tajawal-ExtraLight.ttf": "4dba176f2d532f19d9c4c61502bca07b",
"assets/packages/arabic_font/assets/fonts/Tajawal/Tajawal-Light.ttf": "5c8f739351e568ec0c9fc0dc8a6994b4",
"assets/packages/arabic_font/assets/fonts/Tajawal/Tajawal-Medium.ttf": "1472d65abf09fa765956fd3d32dadf48",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "fe52bfeee94738af399b3429dbac641d",
"assets/packages/panara_dialogs/assets/confirm.png": "acf806139cb7c12e09fc5ca1185b8a2f",
"assets/packages/panara_dialogs/assets/info.png": "e4bb5858c90ab48c72f11ba44bb26b5b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/highlight.png": "7384946432b51b56b0990dca1a735169",
"assets/packages/syncfusion_flutter_pdfviewer/assets/squiggly.png": "c9602bfd4aa99590ca66ce212099885f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/strikethrough.png": "cb39da11cd936bd01d1c5a911e429799",
"assets/packages/syncfusion_flutter_pdfviewer/assets/underline.png": "c94a4441e753e4744e2857f0c4359bf0",
"assets/packages/time_picker_spinner_pop_up/assets/date.gif": "f29701d8ee373e849ae92c4786b63965",
"assets/packages/time_picker_spinner_pop_up/assets/date_time.gif": "c07b4a0761173d4c0812c1c3f53d6477",
"assets/packages/time_picker_spinner_pop_up/assets/ic_calendar.png": "aa1212ec5e0453b1891adaa2a46ee760",
"assets/packages/time_picker_spinner_pop_up/assets/ic_clock.png": "74d0853f80d6d040596a5fc72170dba3",
"assets/packages/time_picker_spinner_pop_up/assets/time.gif": "c28311e9196b3eea656d546b1cef8d27",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "8ab0be27f42f1ed18e8273a6595415ef",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "7709233c62f1058154c18064397bbdcb",
"icons/Icon-192.png": "faf2c894a5806b32a56dd7e745fc7f34",
"icons/Icon-512.png": "16b5076096e5ee1ce23b3bd0a94bb13a",
"icons/Icon-maskable-192.png": "faf2c894a5806b32a56dd7e745fc7f34",
"icons/Icon-maskable-512.png": "16b5076096e5ee1ce23b3bd0a94bb13a",
"index.html": "7a336657b840bcacf0686f4aa5f984f6",
"/": "7a336657b840bcacf0686f4aa5f984f6",
"main.dart.js": "a66e714214a26070fff1478ba306af71",
"manifest.json": "2888b244b5de1ef1d3319c48bfdf3d84",
"version.json": "d4ad5e46233e92caa5033315695da705"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
