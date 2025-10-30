import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/models/term.dart';
import 'package:take_breath/domain/member/models/terms_request.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';
import 'member_repository_provider.dart';

final termsProvider =
    AsyncNotifierProvider<TermsNotifier, List<Term>>(TermsNotifier.new);

class TermsNotifier extends AsyncNotifier<List<Term>> {
  late final MemberRepository memberRepository;

  @override
  Future<List<Term>> build() async {
    memberRepository = ref.read(memberRepositoryProvider);

    return await memberRepository.getListTerms();
  }

  Future<Term> getTerms(int id) async {
    return await memberRepository.getTerms(id);
  }
}
