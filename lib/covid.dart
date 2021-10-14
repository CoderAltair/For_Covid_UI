import 'package:covid19/information_modul.dart';
import 'package:covid19/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  final int _numPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> builPgeIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 20.0 : 15.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.circular(12.0)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.4,
                        0.7,
                        0.9
                      ],
                      colors: [
                        Color(0xFF3594DD),
                        Color(0xFF4563DB),
                        Color(0xFF5036D5),
                        Color(0xFF5B16D0),
                      ])),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlatButton(
                          onPressed: () => print('ok'),
                          child: Text(
                            'Skip',
                            style:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height:MediaQuery.of(context).size.height*0.8,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 10.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                      width: 300.0,
                                      height: 300.0,
                                      image: AssetImage(
                                          'images/onboarding0.png'))),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Uyda qoling !!!',
                                style: bir,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Kasallikdan himoyalanish:\n-Qo`llaringizni doimo antiseptik\n vositalar bilan dizinfeksiya qiling.\n-Doimo tibiy niqob taqing.\n-Ochiq mahsulotlarni istemol qilmang.\n-Isitmangiz baland bo`lsa\noilaviy shifokorga murojat qiling.',
                                style: ikki,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child:ListView(
                            children: [
                          Image(
                          image: AssetImage('images/onboarding1.png')),
                              Column(
                                children: <Widget>[
                                  _informations(0),
                                  _informations(1),
                                  _informations(2),
                                  _informations(3),
                                  _informations(4),
                                  _informations(5),
                                  _informations(6),
                                  _informations(7),
                                  _informations(8),

                                ],
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 40.0, right: 40.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                      width: 300.0,
                                      height: 300.0,
                                      image: AssetImage(
                                          'images/onboarding2.png'))),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Biz bilan qoling !!!',
                                style: bir,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '',
                                style: ikki,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: builPgeIndicator()),
                  _currentPage != _numPage
                      ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ))
                      : Text(''),
                ],
              ),
            ),
          ),
          bottomSheet: _currentPage == _numPage - 1
              ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            height: 80.0,
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF5B16D0),
                  ),
                ),
              ),
            ),
          )
              : Text('')),
    );
  }
}

Widget _informations(int index) {
  return
    ListTile(
      leading: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 30.0,
              width: 30.0,
              image: AssetImage(information[index].rasmUchun),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        information[index].davlat,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        information[index].malumotuchun,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.white54,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButton(
        onPressed:()=>print('error') ,
        icon: Icon(Icons.warning_amber_rounded,),
        color: Colors.red,
        iconSize: 20.0,
      ),
    );}