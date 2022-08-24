import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'hello': 'Hello World',
          'message': 'Welcome to Proto Coders Point',
          'title': 'Flutter Language - Localization',
          'sub': 'Subscribe Now',
          'Change Language': 'Change Language',
          'inbox': 'INBOX'
        },

        'arabic': {
          "Welcome": "أهلا بك",
          "Encryption": "التشفير",
          "To-Do": "لكى يفعل",
          "Stopwatch": "ساعة التوقيف",
          "Message": "رسالة",
          "Secret Key": "المفتاح السري",
          "Encrypt": "تشفير",
          "Decrypt": "فك تشفير",
          "Delete": "حذف",
          "Are you sure you want to delete this task?":
              "هل أنت متأكد أنك تريد حذف هذه المهمة؟",
          "Task Name": "اسم المهمة",
          "Date and time": "التاريخ و الوقت",
          "Save": "أضف",
          "Clear": "واضح",
          "OK": "حسنا",
          "Cancel": "إلغاء",
          "Change Language": "إلغاء",
          "Logout": "تسجيل خروج",
          "Are you sure you want to logout?":
              "هل أنت متأكد أنك تريد تسجيل الخروج؟"
        },
        //HINDI LANGUAGE
        'hi_IN': {
          'hello': 'नमस्ते दुनिया',
          'message': 'प्रोटो कोडर प्वाइंट में आपका स्वागत है',
          'title': 'स्पंदन भाषा - स्थानीयकरण',
          'subscribe': 'सब्सक्राइब',
          'changelang': 'भाषा बदलो',
          'inbox': 'भाषा बदलो'
        },
        //KANNADA LANGUAGE
        'kn_IN': {
          'hello': 'ಹಲೋ ವರ್ಲ್ಡ್',
          'message': 'ಪ್ರೋಟೋ ಕೋಡರ್ ಪಾಯಿಂಟ್‌ಗೆ ಸುಸ್ವಾಗತ',
          'title': 'ಬೀಸು ಭಾಷೆ - ಸ್ಥಳೀಕರಣ',
          'subscribe': 'ವಂತಿಗೆ ಕೊಡು',
          'changelang': 'ಭಾಷೆ ಬದಲಿಸಿ'
        }
      };
}
