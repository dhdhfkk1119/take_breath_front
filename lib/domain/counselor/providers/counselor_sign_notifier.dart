import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/counselor/models/counselor_license_request.dart';
import 'package:take_breath/domain/counselor/models/counselor_sign.dart';
import 'package:take_breath/domain/counselor/providers/counselor_repository_provider.dart';
import 'package:take_breath/domain/counselor/repositories/counselor_repository.dart';
import 'package:take_breath/domain/member/models/email.dart';
import 'package:take_breath/domain/member/models/is_email_check.dart';
import 'package:take_breath/domain/member/models/terms_request.dart';
import 'package:take_breath/domain/member/providers/member_repository_provider.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';

final counselorSignProvider =
    NotifierProvider<CounselorSignNotifier, CounselorSign>(
        CounselorSignNotifier.new);

class CounselorSignNotifier extends Notifier<CounselorSign> {
  late final CounselorRepository counselorRepository;
  late final MemberRepository memberRepository;

  @override
  CounselorSign build() {
    counselorRepository = ref.read(counselorRepositoryProvider);
    memberRepository = ref.read(memberRepositoryProvider);
    return const CounselorSign(
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
      phone: '',
      address: '',
      specialty: '',
      introduction: '',
      gender: '',
      profileImage: '',
      hashtags: '',
      price: 0,
      licenses: [],
      agreements: [],
    );
  }

  void updateForm({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    String? phone,
    String? address,
    String? specialty,
    String? introduction,
    String? gender,
    String? profileImage,
    String? hashtags,
    int? price,
    List<CounselorLicenseRequest>? licenses,
  }) {
    state = state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
      confirmPassword: confirmPassword ?? state.confirmPassword,
      name: name ?? state.name,
      phone: phone ?? state.phone,
      address: address ?? state.address,
      // 상담사 정보
      specialty: specialty ?? state.specialty,
      introduction: introduction ?? state.introduction,
      gender: gender ?? state.gender,
      profileImage: profileImage ?? state.profileImage,
      hashtags: hashtags ?? state.hashtags,
      price: price ?? state.price,
      // 자격증 목록
      licenses: licenses ?? state.licenses,
    );
  }

  Future<void> sign() async {
    await counselorRepository.counselorSign(state);
  }

  // 자격증 항목을 리스트에 추가합니다.
  void addLicense(CounselorLicenseRequest newLicense) {
    state = state.copyWith(licenses: [...state.licenses, newLicense]);
  }

  // 특정 자격증 항목을 리스트에서 제거합니다.
  void removeLicense(int licenseId) {
    state = state.copyWith(
      licenses: state.licenses.where((l) => l.id != licenseId).toList(),
    );
  }

  void updateLicense(CounselorLicenseRequest updatedLicense) {
    final currentLicenses = state.licenses.toList();

    final index = currentLicenses.indexWhere((l) => l.id == updatedLicense.id);

    if (index != -1) {
      currentLicenses[index] = updatedLicense;

      state = state.copyWith(licenses: currentLicenses);
    }
  }

  // 이메일 중복 체크 (기존 유지)
  Future<IsEmailCheck> isEmailCheck(String email) async {
    return await memberRepository.isEmailCheck(email);
  }

  // 이메일 인증 보내기 (기존 유지)
  Future<void> sendCode(String email) async {
    await memberRepository.sendCode(Email(email: email, code: ""));
  }

  // 이메일 코드 검사 (기존 유지)
  Future<bool> verifyCode(Email email) async {
    return await memberRepository.verifyCode(email);
  }

  void setAgreements(List<TermsRequest> agreements) {
    state = state.copyWith(agreements: agreements);
  }
}
