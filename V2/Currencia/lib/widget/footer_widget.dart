import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 30,
                  left: _screenSize.width / 10,
                  right: _screenSize.width / 10),
              height: _screenSize.height * 0.50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(234, 175, 145, 80),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color.fromARGB(255, 230, 39, 80),
                      Color.fromARGB(255, 255, 238, 184),
                    ],
                  )),
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0),
                          Center(
                            child: Image.asset('assets/images/try2.png'),
                          ),
                          //followmeView('assets/images/brand.png', 'Currencia'),
                          Text(
                            '   ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Roboto-Light',
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          followmeView('assets/images/123.png', 'ENSIAS',
                              'assets/images/321.png', 'UM5'),
                          Text(
                            '   ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 1,
                            ),
                          ),
                          Text(
                            '      @moontucer                   @itsabder',
                            style: TextStyle(
                              color: Color.fromARGB(255, 58, 55, 55),
                              fontFamily: 'Roboto-Light',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '                         © 2022, Currencia.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container followmeView(
      String iconSrc, String title, String iconSrc2, String title2) {
    return Container(
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 30,
              maxHeight: 30,
              minWidth: 30,
              maxWidth: 30,
            ),
            child: Image.asset(iconSrc),
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 59, 59),
                fontFamily: 'Roboto-Light',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 130),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 42,
              maxHeight: 42,
              minWidth: 42,
              maxWidth: 42,
            ),
            child: Image.asset(iconSrc2),
          ),
          SizedBox(width: 5),
          Text(
            title2,
            style: TextStyle(
                color: Color.fromARGB(255, 24, 61, 163),
                fontFamily: 'Roboto-Light',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
