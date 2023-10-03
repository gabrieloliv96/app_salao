// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import '../stores/user/user_store.dart';
import '../utils/routes.dart';
import '../widget/card_index_widget.dart';
import '../widget/drawer_widget.dart';
// import 'package:flutter_animate/flutter_animate.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userStore = GetIt.I.get<UserStore>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Tela de index'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
            },
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) {
                  return Text(userStore.user.email);
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    // Lottie.asset('assets/lottie/doctor.json'),
                    const CardIndexWidget(
                      nome: 'Consultas',
                      icon: Icons.sick,
                      approute: AppRoutes.ATENDIMENTO,
                    ),
                    const CardIndexWidget(
                      nome: 'Assinaturas',
                      icon: Icons.abc,
                      approute: AppRoutes.ATENDIMENTO,
                    ),
                    const CardIndexWidget(
                      nome: 'Meus dados',
                      icon: Icons.abc,
                      approute: AppRoutes.MEUSDADOS,
                    ),
                    const CardIndexWidget(
                      nome: 'Contatos',
                      icon: Icons.abc,
                      approute: AppRoutes.ATENDIMENTO,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),

              // List view pra por alguma coisa aqui

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 570,
                        ),
                        decoration: BoxDecoration(
