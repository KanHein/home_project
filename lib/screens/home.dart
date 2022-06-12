import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/blocs/appointment_bloc/appointment_bloc.dart';
import 'package:gold/blocs/metal_bloc/metal_bloc.dart';
import 'package:gold/screens/login_screen.dart';
import 'package:gold/widgets/shimmer/appointment_shimmer.dart';
import 'package:gold/widgets/shimmer/metal_shimmer.dart';
import '../widgets/appointment_widget.dart';
import '../widgets/metal_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth? _auth;
  GoogleSignIn? _googleSignIn;
  final MetalBloc _metalBloc = MetalBloc();
  final AppointmentBloc _appointmentBloc = AppointmentBloc();

  void initialize() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }
  Future<void> logout() async{
    await _googleSignIn?.signOut();
    await _auth?.signOut();
  }
  @override
  void initState() {
    initialize();
    _metalBloc.add(GetMetalList());
    _appointmentBloc.add(GetAppointmentList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Metal Prices"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Logout?"),
                    content: const Text("Are you sure want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          logout();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (_) => _metalBloc,
              child: BlocListener<MetalBloc, MetalState>(
                listener: (context, state) {
                  if (state is MetalError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No load metal prices!"),
                      ),
                    );
                  }
                },
                child: BlocBuilder<MetalBloc, MetalState>(
                  builder: (context, state) {
                    if (state is MetalInitial) {
                      return const MetalShimmer();
                    } else if (state is MetalLoading) {
                      return const MetalShimmer();
                    } else if (state is MetalSuccess) {
                      return metalCarousel(context, state.metals);
                    } else if (state is MetalEmpty) {
                      return const Center(child: Text("Metals are empty!"));
                    } else if (state is MetalError) {
                      return const Center(
                          child: Text("No load metal prices :("));
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _appointmentBloc,
              child: BlocListener<AppointmentBloc, AppointmentState>(
                listener: (context, state) {
                  if (state is AppointmentError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No Load Data!"),
                      ),
                    );
                  }
                },
                child: BlocBuilder<AppointmentBloc, AppointmentState>(
                  builder: (context, state) {
                    if (state is AppointmentInitial) {
                      return const AppointmentShimmer();
                    } else if (state is AppointmentLoading) {
                      return const AppointmentShimmer();
                    } else if (state is AppointmentSuccess) {
                      return appointmentWidget(context, state.appointments);
                    } else if (state is AppointmentEmpty) {
                      return const Center(
                          child: Text("Appointments are empty!"));
                    } else if (state is AppointmentError) {
                      return const Center(child: Text("No load data :("));
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
