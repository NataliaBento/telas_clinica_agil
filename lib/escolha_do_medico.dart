import 'package:flutter/material.dart';
import 'calendario.dart';
import 'pagina_inicial.dart';
import 'carteirinha.dart';

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

  void _navigateToCalendario(String medicoSelecionado) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarioPage(
          especialidade: widget.especialidade,
          medico: medicoSelecionado,
        ),
      ),
    );
  }

  String getTituloEspecialidade() {
    return '${widget.especialidade}s disponíveis';
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
            Expanded(
              child: ListView(
                children: [
                  _buildMedicoCard(
                    nome: 'Dr. João Silva',
                    crm: '12345',
                    onSelect: () => _navigateToCalendario('Dr. João Silva'),
                  ),
                  _buildMedicoCard(
                    nome: 'Dra. Maria Fernandes',
                    crm: '67890',
                    onSelect: () => _navigateToCalendario('Dra. Maria Fernandes'),
                  ),
                  _buildMedicoCard(
                    nome: 'Dr. Carlos Souza',
                    crm: '11223',
                    onSelect: () => _navigateToCalendario('Dr. Carlos Souza'),
                  ),
                  _buildMedicoCard(
                    nome: 'Dra. Ana Oliveira',
                    crm: '33445',
                    onSelect: () => _navigateToCalendario('Dra. Ana Oliveira'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership), label: 'Carteirinha'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF01C3CC),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildMedicoCard({required String nome, required String crm, required VoidCallback onSelect}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                  'CRM: $crm',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: onSelect,
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
