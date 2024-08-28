import 'package:fixit_admin/features/provider_verification/presentation/widgets/application_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_bloc.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_event.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_state.dart';
import 'package:fixit_admin/features/provider_verification/presentation/widgets/side_bar.dart';

class ApplicationsView extends StatelessWidget {
  const ApplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applications'),
        leading: MediaQuery.of(context).size.width < 1024
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : null,
      ),
      drawer: MediaQuery.of(context).size.width < 1024
          ? const SideBarWidget()
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth >= 1024;
          final isMediumScreen =
              constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

          return Row(
            children: [
              if (isLargeScreen) const SideBarWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocBuilder<ApplicationsBloc, ApplicationsState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state is ApplicationsLoaded) _buildHeader(state),
                          const SizedBox(height: 16),
                          // Always show the toggle buttons
                          _buildToggleButtons(context, state),
                          const SizedBox(height: 16),
                          if (state is ApplicationsLoading)
                            const Center(child: CircularProgressIndicator()),
                          if (state is ApplicationsError)
                            Center(child: Text('Error: ${state.message}')),
                          if (state is ApplicationsEmpty)
                            Center(
                              child: Text(
                                  'No ${state.showPending ? 'pending' : 'verified'} applications found'),
                            ),
                          if (state is ApplicationsLoaded)
                            Expanded(
                              child: ApplicationsGrid(
                                isVerified: state.applications[0]['isVerified'],
                                isLargeScreen: isLargeScreen,
                                isMediumScreen: isMediumScreen,
                                applications: state.applications,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(ApplicationsLoaded state) {
    return Text(
      state.showPending ? 'Pending Applications' : 'Verified Applications',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildToggleButtons(BuildContext context, ApplicationsState state) {
    final isPendingSelected =
        state is ApplicationsLoaded ? state.showPending : true;

    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            context
                .read<ApplicationsBloc>()
                .add(ToggleApplicationsView(showPending: true));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isPendingSelected ? Colors.blue[900] : Colors.grey,
          ),
          child: const Text('Pending'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            context
                .read<ApplicationsBloc>()
                .add(ToggleApplicationsView(showPending: false));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                !isPendingSelected ? Colors.blue[900] : Colors.grey,
          ),
          child: const Text('Verified'),
        ),
      ],
    );
  }
}
