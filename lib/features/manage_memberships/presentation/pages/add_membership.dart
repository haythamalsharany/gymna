import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gymna/core/widgets/loading_widget.dart';
import 'package:gymna/features/home/presentation/pages/home.dart';
import 'package:hive/hive.dart';

import '../../../../core/util/snackbar_message.dart';
import '../../domain/entities/membership_entity.dart';
import '../manager/bloc/membership_bloc.dart';

class Addmembership extends StatelessWidget {
  const Addmembership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Membership '),
      ),
      body: Center(
        child: BlocConsumer<MembershipBloc, MembershipState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdateMembershipState) {
              SnackBarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              Get.off(() => const Home());
              // Get.toEnd(() => const Home(),);
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (_) => Home()), (route) => false);
            } else if (state is ErrorAddDeleteUpdateMembershipState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdateMembershipState) {
              return const LoadingWidget();
            }
            return Column(
              children: [
                const Text('test add membership fun press belw'),
                ElevatedButton(
                    onPressed: () async {
                      Box box = await Hive.openBox('appIds');

                      Membership membership = Membership(
                          dateToExpair: '3',
                          ownerMobile: '66666666',
                          ownerName: 'haytham',
                          title: 'gym1',
                          id: box.get("membershipId"));
                      box.put("membershipId", box.get('membershipId') + 1);
                      BlocProvider.of<MembershipBloc>(context)
                          .add(AddMembershipEvent(membership));
                    },
                    child: const Icon(Icons.add))
              ],
            );
          },
        ),
      ),
    );
  }
}
