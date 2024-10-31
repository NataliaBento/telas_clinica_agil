import 'package:flutter/material.dart';
import 'dart:math';
import 'confirmacao_cancelamento.dart'; // Certifique-se de importar o arquivo corretamente

class AppointmentDetailsPage extends StatefulWidget {
  const AppointmentDetailsPage({super.key});

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Função para gerar número aleatório para o protocolo
  String generateRandomProtocol() {
    final random = Random();
    return '#${random.nextInt(99999999)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222083),
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
                'Detalhes de agendamento',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoBlock(
                      title: 'Data e Horário',
                      content: 'Sexta-Feira, 27/12/2024 às 08:00',
                    ),
                    const SizedBox(height: 16),
                    buildInfoBlock(
                      title: 'Plano e Beneficiário',
                      content: '4825532+ODONTO PREMIUM CLINICA ÁGIL\nNúmero do plano: 51656161\nMaria Jose Ferreira',
                    ),
                    const SizedBox(height: 16),
                    buildInfoBlock(
                      title: 'Profissional',
                      content: 'Dra Angelina Freire - Clinica Geral',
                    ),
                    const SizedBox(height: 16),
                    buildInfoBlock(
                      title: 'Unidade de Atendimento',
                      content: 'Companhia do Sorriso\nAvenida João de Barros, 750 - Proximo ao hospital - Boa Vista, Recife, PE',
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Ação para abrir o mapa
                      },
                      icon: const Icon(Icons.map, color: Color(0xFF222083)),
                      label: const Text(
                        'Ver no mapa',
                        style: TextStyle(color: Color(0xFF222083)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF222083)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildInfoBlock(
                      title: 'Telefone',
                      content: '(81) 1234-5678',
                    ),
                    const SizedBox(height: 16),
                    buildInfoBlock(
                      title: 'Protocolo',
                      content: 'Agendamento ${generateRandomProtocol()}',
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mais Informações',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(Icons.info_outline, color: Colors.red),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'No dia da consulta, apresente um documento com foto juntamente com sua carteirinha do plano (você pode usar a do aplicativo)',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            // Ação para baixar
                          },
                          icon: const Icon(Icons.download, color: Color(0xFF222083)),
                          label: const Text('Baixar', style: TextStyle(color: Color(0xFF222083))),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF222083)),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            // Ação para compartilhar
                          },
                          icon: const Icon(Icons.share, color: Color(0xFF222083)),
                          label: const Text('Compartilhar', style: TextStyle(color: Color(0xFF222083))),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF222083)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Ação para remarcar consulta
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF222083),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Remarcar Consulta',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Navega para a página de confirmação de cancelamento
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CancelConfirmationPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFFD30000),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Cancelar Consulta',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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

  Widget buildInfoBlock({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}
