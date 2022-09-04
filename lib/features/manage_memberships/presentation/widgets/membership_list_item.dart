import 'package:flutter/material.dart';
import 'package:gymna/features/manage_memberships/domain/entities/membership_entity.dart';

class MembershipItemList extends StatelessWidget {
  final Membership membership;
  
  const MembershipItemList({
    Key? key, required this.membership,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      padding: const EdgeInsets.only(bottom: 8.0, right: 0.0, left: 0.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        title: Text(membership.title),
        leading: CircleAvatar(
          child: Text(membership.dateToExpair),
        ),
        subtitle: Text(membership.ownerName),
        trailing: Column(
          children: [
            Text(membership.ownerMobile),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('stop it'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
