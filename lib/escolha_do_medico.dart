import 'package:flutter/material.dart';
import 'pagina_inicial.dart';
import 'carteirinha.dart';
import 'calendario.dart'; // Import da nova página de calendário

class EscolhaDoMedico extends StatefulWidget {
  final String especialidade;

  const EscolhaDoMedico({super.key, required this.especialidade});

  @override
  State<EscolhaDoMedico> createState() => _EscolhaDoMedicoState();
}

class _EscolhaDoMedicoState extends State<EscolhaDoMedico> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaginaInicial()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CarteirinhaPage()),
      );
    }
  }

  String getTituloEspecialidade() {
    switch (widget.especialidade) {
      case 'Clínico Geral':
        return 'Clínicos Gerais disponíveis';
      case 'Neurologista':
        return 'Neurologistas disponíveis';
      case 'Cardiologista':
        return 'Cardiologistas disponíveis';
      case 'Endocrinologista':
        return 'Endocrinologistas disponíveis';
      case 'Pediatra':
        return 'Pediatras disponíveis';
      case 'Dermatologista':
        return 'Dermatologistas disponíveis';
      case 'Ginecologista':
        return 'Ginecologistas disponíveis';
      default:
        return '${widget.especialidade} disponíveis';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF222083),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
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
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/foto_de_menu_suspenso.png'),
                  height: 40,
                ),
              ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                getTituloEspecialidade(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),

            // Lista de cards de médicos
            Expanded(
              child: ListView(
                children: [
                  _buildMedicoCard(
                    nome: "Dr. João Silva",
                    crm: "12345",
                    avaliacao: "4.5",
                  ),
                  _buildMedicoCard(
                    nome: "Dra. Maria Fernandes",
                    crm: "67890",
                    avaliacao: "4.8",
                  ),
                  _buildMedicoCard(
                    nome: "Dr. Pedro Santos",
                    crm: "11223",
                    avaliacao: "4.6",
                  ),
                  _buildMedicoCard(
                    nome: "Dra. Ana Oliveira",
                    crm: "44556",
                    avaliacao: "4.7",
                  ),
                  _buildMedicoCard(
                    nome: "Dr. Carlos Nunes",
                    crm: "33445",
                    avaliacao: "4.3",
                  ),
                  _buildMedicoCard(
                    nome: "Dra. Fernanda Martins",
                    crm: "55667",
                    avaliacao: "4.9",
                  ),
                  _buildMedicoCard(
                    nome: "Dr. Rafael Almeida",
                    crm: "77889",
                    avaliacao: "4.2",
                  ),
                  _buildMedicoCard(
                    nome: "Dra. Juliana Costa",
                    crm: "99880",
                    avaliacao: "4.6",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  // Função para criar o card de médico
  Widget _buildMedicoCard({required String nome, required String crm, required String avaliacao}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.especialidade,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  "CRM: $crm",
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  avaliacao,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalendarioPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF222083),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Selecionar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
