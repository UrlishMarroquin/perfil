import 'package:flutter/material.dart';
import 'package:perfil/services/service_data.dart';
import 'package:perfil/models/mensaje_model.dart';
import 'package:perfil/widgets/mensaje_widget.dart';

class PerfilPage extends StatefulWidget {
  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  ServiceData _serviceData = ServiceData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),                  
                borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      PerfilCabecera(),
                      const SizedBox(height: 16),
                      PerfilBotones(),
                    ]
                  )
                )
              ),
              const SizedBox(height: 16),
              ProfileInformation(),
              SizedBox(height: 16),
              ProfileTareas (),
              
            ],
          ),
        ),
      ),
    );
  }
}

class PerfilCabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: const DecorationImage(
              image: AssetImage('assets/images/persona.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Juan Manuel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Desarrollador',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),                  
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InfoChip(label: 'Articles', value: '43'),
                    const SizedBox(width: 25),
                    InfoChip(label: 'Following', value: '234'),
                    const SizedBox(width: 25),
                    InfoChip(label: 'Rating', value: '6.3'),
                    ]
                )
              )
            ),                
          ],
        ),
      ],
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final String value;

  InfoChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),        
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}

class PerfilBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Border radius
            ),
            minimumSize: const Size(170, 44),   
          ),
          child: const Text(
            'Chat',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Border radius
            ), 
            minimumSize: const Size(170, 44),               
          ),
          child: const Text(
            'Follow',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),              
        ),
      ],
    );
  }
}

class ProfileInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        Text(
          'Information',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s '
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        )
      ]
    );
  }
}

class ProfileTareas extends StatelessWidget {
  ServiceData _serviceData = ServiceData();
  @override
  Widget build(BuildContext context) {
    return 
        FutureBuilder(
          future: _serviceData.getMensajes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<MensajeModel> tourAuxList = snapshot.data;
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:
                      tourAuxList.map((e) => MensajeWidget(e)).toList(),
                  ),
                ),
              );
            }
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );

  }
}