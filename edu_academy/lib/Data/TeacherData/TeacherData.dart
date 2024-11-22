class TeacherData {
  static String name="";
  static String email="";
  static String number="";
  static String password="";
  static List ListOfGrades=[];
  static List<String> TeacherSubjects = ['null', 'null', 'null'];
  static String Subject1 = "Loading....";
  static String Subject2 = "null";
  static String Subject3 = "null";
  static String SubjectThatIsSelected = Subject1;
  static int numberOfSubjects = 1;
  static Map<String, dynamic> teacher_profile_data = {};
  static bool AccountActivation = true;
  static List AllMessages = [
    ["Messgae", "Time", "Duration"] 
  ];
  static List<dynamic> all_Homeworks = [];
  static List<dynamic> HomeWorks = [
  [
    "اللغة العربية",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
        "images/Logo.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['3', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
  [
    "الرياضيات",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['score', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
  [
    "الكيمياء",
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [false],

      /// solve or not
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ]
      ],

      /// solve or not [data of solve]
    ],
    [
      "Teacher Name", //teacher name,
      "Title", //title,
      "HomeWork Body",
      [
        "images/Logo.png",
        "images/webinar.png",
      ], //these images contain the questions from the teacher to the student
      [],
      "Date", //Date
      "score", //score
      [
        true,
        [
          'bodey',
          ['files']
        ],
        ['score', 'comment']
      ],

      /// solve or not [data of solve] [score,comment]
    ],
  ],
];
}
