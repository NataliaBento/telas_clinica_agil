// tela_especialidades.dart
import 'package:flutter/material.dart';
import 'pagina_inicial.dart';
import 'carteirinha.dart';
import 'escolha_do_medico.dart';

class TelaEspecialidades extends StatefulWidget {
  const TelaEspecialidades({super.key});

  @override
  State<TelaEspecialidades> createState() => _TelaEspecialidadesState();
}

class _TelaEspecialidadesState extends State<TelaEspecialidades> {
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

  void _navigateToEscolhaDoMedico(String especialidade) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EscolhaDoMedico(especialidade: especialidade),
      ),
    );
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
            const Center(
              child: Text(
                'Escolha a especialidade:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Barra de pesquisa
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Lista de especialidades
            Expanded(
              child: ListView(
                children: [
                  EspecialidadeBar(
                    nome: 'Clínico Geral',
                    onTap: () => _navigateToEscolhaDoMedico('Clínico Geral'),
                  ),
                  EspecialidadeBar(
                    nome: 'Neurologista',
                    onTap: () => _navigateToEscolhaDoMedico('Neurologista'),
                  ),
                  EspecialidadeBar(
                    nome: 'Cardiologista',
                    onTap: () => _navigateToEscolhaDoMedico('Cardiologista'),
                  ),
                  EspecialidadeBar(
                    nome: 'Endocrinologista',
                    onTap: () => _navigateToEscolhaDoMedico('Endocrinologista'),
                  ),
                  EspecialidadeBar(
                    nome: 'Pediatra',
                    onTap: () => _navigateToEscolhaDoMedico('Pediatra'),
                  ),
                  EspecialidadeBar(
                    nome: 'Dermatologista',
                    onTap: () => _navigateToEscolhaDoMedico('Dermatologista'),
                  ),
                  EspecialidadeBar(
                    nome: 'Ginecologista',
                    onTap: () => _navigateToEscolhaDoMedico('Ginecologista'),
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
}

// Widget para barra de especialidade
class EspecialidadeBar extends StatelessWidget {
  final String nome;
  final VoidCallback onTap;

  const EspecialidadeBar({Key? key, required this.nome, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF2260FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              nome,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
