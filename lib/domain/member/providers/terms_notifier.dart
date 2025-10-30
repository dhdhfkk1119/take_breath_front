import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/models/term.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';

import 'member_repository_provider.dart';

final termsProvider =
    NotifierProvider<TermsNotifier, Member?>(TermsNotifier.new);

class TermsNotifier extends Notifier<Member?> {
  late final MemberRepository memberRepository;

  @override
  Member? build() {
    memberRepository = ref.read(memberRepositoryProvider);
    return null;
  }

  Future<Term> getListTerms() async {
    return await memberRepository.getListTerms();
  }

  Future<Term> getTerms(int id) async {
    return await memberRepository.getTerms(id);
  }
}
