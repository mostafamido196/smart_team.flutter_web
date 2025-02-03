import 'package:flutter/cupertino.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 480),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('ABOUT US'  , style: TextStyle(
          fontFamily: 'Montserrat.ttf',
          fontSize: 20,
        ),
        ),
        SizedBox(height: 10,),
        Text('''We are Al-Enjaz Integrated Company for General Building Contracting One of the approved and leading companies in its field We are distinguished by high quality in all the fields we offer We are a first-class company classified by the General Fire Department We have the most efficient and dedicated employees in various fields and the largest team of certified engineers and technicians We are one of the technical companies specialized in fire and sanitation work and all maintenance services in accordance with internationally recognized quality standards. The company is responsible for implanting permanent vitality in the work team in management and work sites Involving clients in planning through constant communication and listening to their problems to contribute to solutions and improve work performance Within an accurate and in-depth information base that is updated on a regular basis By a full team of managers, engineers and technicians with complete professional knowledge They have experience, distinguished work performance, and form a clear vision from the beginning to always raise the level of work and the company to the highest level The motivation behind continued success is “our passion for protection.” Our vision is to always become number one in providing innovative solutions in the field of protecting life, environment and property We have been pioneers in our field for eighteen years.'''
          ,
          style: TextStyle(
            fontFamily: 'Montserrat-Italic.ttf',
            fontSize: 14,
          ),),

      ],
    ));
  }
}
