//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   DataTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"


namespace * Noldus.NLinx.Contracts.Public.Types

//////////// EYE TRACKING ///////////////////////
/** The positional data of the left and right eyes, which shows what the eyes are looking at.*/
const string Gaze = "Gaze",
/** The positional data where the eye is fixating, i.e. maintaining the visual gaze on a single location.*/
const string Fixations = "Fixations",
/** The positional data where the eye is in a saccade, i.e. in a quick simultanuous movement of both eyes between two or more phases of fixation in the same direction.*/
const string Saccades = "Saccades",

//////////// PHYSIOLOGY ///////////////////////
/** Electrocardiogram (ECG) data of the heart's electrical activity, a voltage versus time.'*/
const string ECG = "ECG"
/** Photoplethysmography (PPG) data, as  blood volume changes, often measured by changes in light absortption. It can be used to monitor heart beat as well as breathing, and other circulatory conditions. */
const string PPG = "PPG"
/** Electrodermal activity (EDA) data, as conductivity changes of the skin. */
const string EDA = "EDA",
/** Data type that represents heart rate. */
const string HR = "HR",
/** Data type that represents IBI. */
const string IBI = "IBI",
/** Data type that represents IPI. */
const string IPI = "IPI",
/** Data type that represents skin conductance baseline. */
const string Baseline = "Baseline",
/** Data type that represents skin conductance average peaks. */
const string AveragePeaks = "AveragePeaks",

///////////////// VIDEO //////////////////////
/** A video from a human face.*/
const string FaceVideo = "FaceVideo",
/** Data type that represents video from a screen capture.*/
const string ScreenCapture = "ScreenCapture"
/** A static image from a human face.*/
const string FaceImage = "FaceImage"
/** Data type that represents image from a screen capture.*/
const string ScreenImage = "ScreenImage"
/** Data type that represents a general video stream.*/
const string EnvironmentVideo = "EnvironmentVideo"

///////////// FACIAL EXPRESSIONS  //////////////
/** Data type that represents facial expression Neutral.*/
const string Neutral = "Neutral";
/** Data type that represents facial expression Happy.*/
const string Happy = "Happy";
/** Data type that represents facial expression Sad.*/
const string Sad = "Sad";
/** Data type that represents facial expression Angry.*/
const string Angry = "Angry";
/** Data type that represents facial expression Surprised.*/
const string Surprised = "Surprised";
/** Data type that represents facial expression Scared.*/
const string Scared = "Scared";
/** Data type that represents facial expression Disgusted.*/
const string Disgusted = "Disgusted";
/** Data type that represents facial expression Confusion.*/
const string Confusion = "Confusion";
/** Data type that represents facial expression Boredom.*/
const string Boredom = "Boredom";
/** Data type that represents facial expression Interest.*/
const string Interest = "Interest";
/** Data type that represents the 'facial expression' Valence.*/
const string Valence = "Valence";
/** Data type that represents the 'facial expression' Arousal.*/
const string Arousal = "Arousal";

///////////// EVENTS  //////////////
/** Data type that represents an event.*/
const string Event = "Event";

///////////// COGNITIVE LOAD  //////////////
/** Data type that represents a Cognitive load.*/
const string CognitiveLoad = "CognitiveLoad";


const i32 idxIdentifier = 0
const i32 idxCommonName = 1

const map<string, list<string>> predefinedTypes = { // Type         // idxIdentifier                            // idxCommonName
                                                    Gaze:           [ "5e37a7f7-531c-49c2-aeee-5837fa66914d",   "Gaze"              ],                            
                                                    Fixations:      [ "f2408f4f-5930-44d6-9d0b-5ef03e9b56bb",   "Fixations"         ],                            
                                                    Saccades:       [ "87ea64d1-2886-4f37-8dc0-abc32c9e890d",   "Saccades"          ],                            

                                                    ECG:            [ "6e4da528-15cb-4fd5-b270-8bd01fe418bc",   "ECG"               ],
                                                    PPG:            [ "4b91e833-0203-4339-b0a8-614a2df0e40c",   "PPG"               ],
                                                    EDA:            [ "59647ae9-a29a-4cff-9483-00d0d789cdd6",   "EDA"               ],
                                                    HR:             [ "90ece534-885a-454b-9ca3-4b83766d7e02",   "HR"                ],
                                                    IBI:            [ "57499aa3-01d8-429f-91b0-da4f6dce1a9e",   "IBI"               ],
                                                    IPI:            [ "12ec6aa9-8a40-4ea9-83c7-9cf6d46e2e69",   "IPI"               ],
                                                    Baseline:       [ "5b682bc7-a21a-4baa-8aba-1bfb3e2fb291",   "Baseline"          ],
                                                    AveragePeaks:   [ "a05e42d1-5451-49ce-840c-b90ce1520d58",   "AveragePeaks"      ],

                                                    FaceVideo:      [ "dba67fb5-c39e-40f5-8e90-041f06fb8043",   "FaceVideo"         ],
                                                    ScreenCapture:  [ "45eb885f-c950-482e-a0af-6268e5846173",   "ScreenCapture"     ],
                                                    FaceImage:      [ "e5ae3eda-1e6c-4c23-829d-2c5d68b26ea5",   "FaceImage"         ],
                                                    ScreenImage:    [ "7adeca49-2672-076a-a4ff-e792d073f41f",   "ScreenImage"       ],
                                                    EnvironmentVideo:[ "0e87e3c2-1202-462c-9f07-42d4ac2d69ae",  "EnvironmentVideo"  ],

                                                    Neutral:        [ "38b3b5b7-338c-4056-a309-474985c34c7b",   "Neutral"           ],
                                                    Happy:          [ "15dd7c13-e656-435f-b37b-a7d4bb4848d6",   "Happy"             ],
                                                    Sad:            [ "4fc411ab-bac2-4a39-ba62-6cf93773139d",   "Sad"               ],
                                                    Angry:          [ "ba739c49-a54a-401e-b322-e478e1be1f6e",   "Angry"             ],
                                                    Surprised:      [ "07bb881d-6d01-4553-86d8-b8443196c53f",   "Surprised"         ],
                                                    Scared:         [ "7a57185f-f40f-4edb-9eda-ab320fd8509d",   "Scared"            ],
                                                    Disgusted:      [ "39973d8f-fbf9-4f31-8c84-a9b04aa3b946",   "Disgusted"         ],
                                                    Confusion:      [ "57a14d31-b52d-4e0d-9dd8-76a129fb3e04",   "Confusion"         ],
                                                    Boredom:        [ "82d5de23-b0b1-4111-b774-d86c168631d9",   "Boredom"           ],
                                                    Interest:       [ "44a1cd52-2386-45fc-be8c-3a59b2395d3d",   "Interest"          ],
                                                    Valence:        [ "3c4b9f82-b371-44c4-8ea6-97409b8f58ca",   "Valence"           ],
                                                    Arousal:        [ "dfccb530-6d6f-4883-8c2d-05dc68064eb0",   "Arousal"           ],

                                                    Event:          [ "0e2b31f1-e59c-4c20-b576-3ef1d41a329a",   "Event"             ],

                                                    CognitiveLoad:  [ "9214f082-c611-486b-8185-55664baac535",   "CognitiveLoad"     ]
                                                  }
