<a href="https://club-project-one.vercel.app/" target="_blank">
  <img width="1920" height="1080" alt="제목을-입력해주세요_-001" src="https://github.com/user-attachments/assets/57f2e633-5a95-40b1-aaa2-cb102c8399bb" />
</a>

<br/>
<br/>

# 📝 Front Flutter 소개 


## 💻 0. Getting Started 프로그램 시작하는 법 
- server 깃 코드 다운 받으신 후 프로그램 실행 (IntelliJ , VScode , Eclipse) 등등
- 서버가 돌아가고 있다고 가정하에 Flutter 실행하시면 됩니다


## 📖 1. Project Overview (프로젝트 개요)
- 프로젝트 이름: 한숨(Take_Breath) 
- 프로젝트 설명: 익명 기반 커뮤니티와 전문 상담 연계를 통해 직장 내 따돌림 괴롭힘에 대한 심리적 회복과 안전 , 자신의 경험을 공유를 지원 신뢰 기반 디지털 앱


## 🛠️ 2. Front Flutter 개발 환경 
- **언어** : Dart
- **프레임워크** : Flutter
- **SDK** : Flutter 3.27.4
- **Build Tool** : Gradle (Groovy)
- **의존성 관리** : pubspec.yaml (YAML 기반)
- **개발기간** : 2025.10.22 ~ 2025.11.11

## 🔑 3. Key Features (주요 기능)
- **회원 가입**
  - 아이디 형식 회원 가입 및 이메일 회원 가입
  - 약관 동의 (체크)
  - 중복 체크 및 이메일 인증(Google SMTP 인증방식)
    
- **로그인**
  -  소셜 로그인 (google - firebase 사용) (네이버 로그인 사용)
  -  일반 로그인 및 이메일 로그인
    
- **채팅 기능**
  -  1:1 채팅 기능 
  -  WebSocket 사용
  -  STOMP 사용

- **기록실 등록**
  - 기록실 작성하기 (이미지,녹음파일 첨부 가능)
  - 기록실 수정 삭제
  - 기록실 다운로드
    - 자신이 작성한 날짜에 다운로드 누르면 pdf 형식으로 로컬에 다운로드 됨 
      
- **게시물 등록**
  - 게시물 등록 삭제 수정 (커뮤니티)
  - 게시물 신고 하기 (신고 승인 결과 따라 정지 유무 결정)
    - 신고 횟수에 따른 게시물 등록 하지 못하는 시간이 늘어남(정지 기능)
   
- **결제(포트원)**
  - 포트원을 사용해서 결제 하기(해당 유저의 포인트 증가) 
  - 환불 하기
    - 포인트 히스토리 내역을 만들어서 결제했던 건에 대해서 제일 최신을 기준으로 포인트 사용하지 않은것만 환불 가능 

- **웹 서버 어드민 페이지**
  - 커뮤니티 신고 목록 검사하기 (신고 승인)
  - 상담사 승인
  - 시청각 자료 관리 (Youtube Data API 연동)
  - 통계 (회원가입,로그인,매출 등등 대시보드)

## ♻️ 4. Tasks & Responsibilities (작업 및 역할 분담)
|  |  |  |
|-----------------|-----------------|-----------------|
| 조정우    |  [<img src="https://avatars.githubusercontent.com/u/140272714?v=4" alt="조정우" width="100">](https://github.com/dhdhfkk1119) | <ul><li>전체적인 프로젝트 계획,배포 및 관리</li><li>[SpringBoot] 공통 Util , AOP 예외 처리, 구글 소셜 로그인 및 필요한 코드 리펙토링 코드편집 </li><li>[Flutter] 전체적인 UI 구성 및 상태관리 회원가입,소셜로그인,커뮤니티</li></ul>     |
| 이승민   |  [<img src="https://avatars.githubusercontent.com/u/208729786?v=4" alt="이승민" width="100">](https://github.com/leesssmin)| <ul><li>기록실 추가 기능 및 코드 수정</li><li>스플래쉬 화면 , 기록실 화면 , 상담사 리스트 화면, 마이페이지 화면,  알림 화면 및 UI 전반 기능관리, 백엔드 연동</li></ul> |
| 양성빈   |  [<img src="https://avatars.githubusercontent.com/u/197378605?v=4" alt="양성빈" width="100">](https://github.com/ysb5397)    |<ul><li>Flutter GPS 기능 </li><li>Toss 결제 하기 기능</li><li>상품 등록 Ai 이미지 인식 기능</li></ul>  |
| 안성엽    |  [<img src="https://avatars.githubusercontent.com/u/183344667?v=4&size=64" alt="안성엽" width="100">](https://github.com/seongyob99)    | <ul><li>회원가입 및 로그인 기능</li><li>관리자 기능 및 관리자 페이지</li></ul>    |
| 손지윤    |  [<img src="https://avatars.githubusercontent.com/u/208729868?v=4" alt="손지윤" width="100">](https://github.com/sonjiyoon12)    | <ul><li>Back 게시물 전체적인 기능 및 신고 SSE 알람기능</li><li>Front 상태관리 게시물 리스트 및 상세보기</li><li>게시물 댓글 작성 좋아요</li></ul>    |


<br/>
<br/>

## 🎞️ 5. 시현 영상

### 회원정보
<table>
  <tr>
    <td align="center"><b>로그인 </b></td>
    <td align="center"><b>회원가입</b></td>
    <td align="center"><b>소셜 로그인</b></td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/0a4cf10c-630d-45a1-b9db-da277b10787b" alt="로그인" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/44e7c906-1549-4ab4-96d1-e30e5a342497" alt="회원 가입" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/77d69377-c050-4e16-9e28-2a916cb034ac" alt="소셜 로그인" width="250"/>
    </td>
  </tr>
</table>

### 상품페이지 
<table>
  <tr>
    <td align="center"><b>상품 등록</b></td>
    <td align="center"><b>상품 리스트 및 검색 기능</b></td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/d7b61c9c-358a-4d8c-97c1-f1d48e33db0c" alt="상품 등록" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/77d69377-c050-4e16-9e28-2a916cb034ac" alt="상품 리스트 및 검색 기능" width="250"/>
    </td>
  </tr>
</table>

### 커뮤니티 페이지
<table>
  <tr>
    <td align="center"><b>커뮤니티 등록</b></td>
    <td align="center"><b>커뮤니티 검색</b></td>
    <td align="center"><b>커뮤니티 수정 삭제</b></td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/c92af136-4139-442f-a4ad-b551dc0645a2" alt="커뮤니티 등록" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/b7e9e6b3-50d9-4cfd-a396-3dc25b077b1e" alt="커뮤니티 검색" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/d0a98ffc-0791-408c-b75c-89e6bbb8f1d1" alt="커뮤니티 수정 삭제" width="250"/>
    </td>
  </tr>
</table>

### 채팅 페이지
<table>
  <tr>
    <td align="center"><b>로그인 유저 채팅 보내기</b></td>
    <td align="center"><b>상대방 채팅 보내기</b></td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/49e655ef-89fb-4633-b27c-b417554c645a" alt="상품 등록" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/49e4862b-2168-4c37-b134-03d7486c1206" alt="상품 수정 삭제" width="250"/>
    </td>
  </tr>
</table>

### 마이 페이지 
<table>
  <tr>
    <td align="center"><b>마이페이지 리스트 페이지</b></td>
    <td align="center"><b>프로필 수정</b></td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/c1fd9553-27ce-4ba0-ba8e-a7074cda22e6" alt="리스트 페이지" width="250"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/207fdd05-ec6b-41ef-8f81-fe5ef84f4731" alt="프로필 수정" width="250"/>
    </td>
  </tr>
</table>

### 관리자 페이지 
<table>
  <tr>
    <td align="center"><b>관리자 페이지</b></td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/e15f504d-9f9b-49d4-9aef-2bcd5a5ca0e1" alt="관리자 페이지" width="600"/>
    </td>
  </tr>
</table>

