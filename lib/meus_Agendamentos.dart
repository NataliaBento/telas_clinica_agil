import 'package:flutter/material.dart';
import 'detalhes_do_agendamento.dart';

class AppointmentListPage extends StatefulWidget {
  const AppointmentListPage({super.key});

  @override
  State<AppointmentListPage> createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<AppointmentListPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToDetailedPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AppointmentDetailsPage()), // Corrigido para usar a classe correta
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF222083),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 20,
                icon: const Icon(Icons.arrow_back, color: Color(0xFF222083)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Expanded(
              child: Center(child: Placeholder(fallbackHeight: 40, fallbackWidth: 100)),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Meus Agendamentos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // inicio do primeiro card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow(Icons.calendar_today, "Data", "27/12/2024"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.access_time, "Horário", "08:00"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.person, "Paciente", "João Silva"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.medical_services, "Médico", "Dra. Maria Fernandes"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.location_on, "Localização", "Clínica Ágil - Centro"),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _navigateToDetailedPage, // Navega para a nova página de detalhes
                        icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                        label: const Text(
                          'Detalhes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // inicio do primeiro card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow(Icons.calendar_today, "Data", "27/12/2024"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.access_time, "Horário", "08:00"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.person, "Paciente", "João Silva"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.medical_services, "Médico", "Dra. Maria Fernandes"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.location_on, "Localização", "Clínica Ágil - Centro"),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _navigateToDetailedPage, // Navega para a nova página de detalhes
                        icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                        label: const Text(
                          'Detalhes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // inicio do primeiro card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow(Icons.calendar_today, "Data", "27/12/2024"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.access_time, "Horário", "08:00"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.person, "Paciente", "João Silva"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.medical_services, "Médico", "Dra. Maria Fernandes"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.location_on, "Localização", "Clínica Ágil - Centro"),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _navigateToDetailedPage, // Navega para a nova página de detalhes
                        icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                        label: const Text(
                          'Detalhes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // inicio do primeiro card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow(Icons.calendar_today, "Data", "27/12/2024"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.access_time, "Horário", "08:00"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.person, "Paciente", "João Silva"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.medical_services, "Médico", "Dra. Maria Fernandes"),
                    const SizedBox(height: 16),
                    buildDetailRow(Icons.location_on, "Localização", "Clínica Ágil - Centro"),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _navigateToDetailedPage, // Navega para a nova página de detalhes
                        icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                        label: const Text(
                          'Detalhes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Carteirinha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF01C3CC),
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, String info) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF222083), size: 28),
        const SizedBox(width: 16),
        Text(
          "$label: ",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
