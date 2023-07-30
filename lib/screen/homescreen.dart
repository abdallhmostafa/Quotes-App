import 'package:flutter/material.dart';

import 'quotescreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List allQuotes = [
  Quote(quote: "– من كرمت عليه نفسه هان عليه ماله.", author: "علي بن أبي طالب"),
  Quote(
      quote: "– ولربما ابتسمَ الوقورُ من الأذى.. وفؤادُه من حَرَّه يتأوهُ.",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– يجب عليك أن تشفق على ولدك من إشفاقك عليه.",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– إن الله جعل مكارم الأخلاق ومحاسنها وصلا بيننا وبينه.",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– وكُلُّ جراحةٍ فلها دواءٌ.. وسوءُ الخلقِ ليسَ له دواءُ",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– وليس بدائمٍ أبداً نعيمٌ.. كذاكَ البؤسُ ليس له بقاءُ .",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– من ضيع الأمانة ورضي بالخيانة فقد تبرأ من الديانة.",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– عليك ببرِ الوالدين كليهما وبر ذوي القربى وبر الأباعد.",
      author: "علي بن أبي طالب"),
  Quote(quote: "– أداء الأمانة مفتاح الرزق.", author: "علي بن أبي طالب"),
  Quote(quote: "– من أطال الأمل أساء العمل.", author: "علي بن أبي طالب"),
  Quote(quote: "– من جرى في عنان أمله عثر بأجله.", author: "علي بن أبي طالب"),
  Quote(
      quote: "– كل الحادثات إذا تناهت فموصول بها الفرج.",
      author: "علي بن أبي طالب"),
  Quote(
      quote: "– البخل أن يرى الرجل ما أنفقه تلفاً وما أمسكه شرفاً.",
      author: "علي بن أبي طالب"),
  Quote(quote: "– من تكبر على الناس ذل.", author: "علي بن أبي طالب"),
  Quote(
      quote:
          " إذا حار أمرك في شيئين، ولم تدرِ أين الخطأ والصواب، فخالف هواك فإن الهوى يقود النفس إلى ما يُعاب",
      author: "لإمام الشافعي"),
  Quote(
      quote:
          " وجدتُ سكوتي متجرًا فلزمته، إذا لم أجد ربحًا فلستُ بخاسرٍ، وما الصمت إلا في الرجال متاجرٌ، وتاجره يعلو على كل تاجرٍ.",
      author: "لإمام الشافعي"),
  Quote(
      quote:
          "تموت الأسود في الغابات جوعًا ولحم الضأن تأكله الكلاب، وذو جهلٍ قد ينام على حرير، وذو علمٍ مفارشه التراب.",
      author: "لإمام الشافعي"),
  Quote(
      quote: "من علامة الصدق هي أن تكون لصديق صديقك صديقًا.",
      author: "لإمام الشافعي"),
  Quote(quote: "– اشتر نفسك؛ فالسوق قائمة، والثمن موجود.", author: "ابن تيمية"),
  Quote(
      quote:
          "– من وطن قلبه عند ربه سكن واستراح، ومن أرسله في الناس اضطرب واشتد به القلق.",
      author: "ابن تيمية"),
  Quote(
      quote:
          "– لو كان كل ما اختلف مسلمان في شيء تهاجرا لم يبق بين المسلمين عصمة ولا أخوة.",
      author: "ابن تيمية"),
];

class Quote {
  String quote;
  String author;

  Quote({required this.quote, required this.author});
}

class _HomeState extends State<Home> {
  deleteQuote(int index) {
    setState(() {
      allQuotes.removeAt(index);
    });
  }

  TextEditingController quoteController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  addQuote() {
    setState(() {
      if (quoteController.text == "" || authorController.text == "") {
        showDialog(
          context: context,
          builder: (context) =>  Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5.0) ),
              child: const Text(
                "تأكد من أدخال كافة الحقول",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Cairo",
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              )),
        );
      } else {
        allQuotes.add(
            Quote(quote: quoteController.text, author: authorController.text));
        Navigator.pop(context);
        quoteController.text = "";
        authorController.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "أقوايل ماثورة",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              letterSpacing: 5.0,
              fontFamily: "Cairo",
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: const Icon(Icons.text_snippet),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 550.0,
              child: ListView.builder(
                  itemCount: allQuotes.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Quotes(
                      quote: allQuotes[index].quote,
                      author: allQuotes[index].author,
                      index: index,
                      deleteQuote: deleteQuote,
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
            useSafeArea: true,
            isScrollControlled: true,
            shape:const  RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
            context: context,
            builder: (_) {
              return Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(30.0)),

                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: quoteController,
                          autocorrect: true,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.rtl,

                          style: const TextStyle(
                            fontFamily: "Cairo",
                            color: Colors.black,
                            fontSize: 20.0,
                            overflow: TextOverflow.clip,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "...أكتب حكمة",
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: Icon(
                              Icons.textsms_outlined,
                              color: Colors.blue,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: authorController,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "...أكتب أسم قائلها",
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: Icon(
                              Icons.textsms_outlined,
                              color: Colors.blue,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      ElevatedButton(
                          onPressed: () { addQuote();},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(horizontal: 60.0)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0)))),
                          child: const Text(
                            "إضافة",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              overflow: TextOverflow.clip,
                            ),
                          )),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 40.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
