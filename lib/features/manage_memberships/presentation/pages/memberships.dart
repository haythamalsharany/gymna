// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymna/features/manage_memberships/presentation/manager/bloc/membership_bloc.dart';
import 'package:gymna/features/manage_memberships/presentation/widgets/membership_list_item.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets/message_display_widget.dart';

class MembershipsPage extends StatefulWidget {
  const MembershipsPage({Key? key}) : super(key: key);

  @override
  State<MembershipsPage> createState() => _MembershipsPageState();
}

class _MembershipsPageState extends State<MembershipsPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('close to expairs memberships'),
        ),
        body: RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: BlocBuilder<MembershipBloc, MembershipState>(
            builder: (context, state) {
              if (state is LoadedMembershipsState) {
                return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: ListView.builder(
                    itemCount: state.memberships.length,
                    itemBuilder: ((context, index) => MembershipItemList(
                          membership: state.memberships[index],
                        )),
                  ),
                );
              }
              if (state is LoadingMembershipsState) {
                return const LoadingWidget();
              } else if (state is ErrorMembershipsState) {
                return MessageDisplayWidget(message: state.message);
              } else {
                return const Center(
                  child: Text('unknown error'),
                );
              }
            },
          ),
        ));
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MembershipBloc>(context).add(RefreshMembershipsEvent());
  }
}
