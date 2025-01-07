# 날 JOB아줘
> 우리를 JOB아줄 채용 사이트!

## 프로젝트 소개
  - "날JOB아줘"는 효율적인 채용연계 플랫폼으로, 주된 목적은 구직자와 기업 간의 매칭을 원활하게 돕고, 채용 프로세스를 체계적으로 관리하는 사이트입니다.
  - 구직자는 플랫폼에서 간편하게 이력서 및 자기소개서를 등록하고, 자신에게 적합한 채용 기회를 제공받을 수 있습니다.
  - 기업 비교, 기업 리뷰 기능, 취업QnA게시판 등을 통해 다방면으로 기업 정보를 비교하여 본인이 원하는 기업을 찾을 수 있다. 또한, 전문적인 상담사와의 상담을 통해 취업에 관한 구체적인 컨설팅을 받을 수 있습니다.
  - 기업은 구직자의 정보를 신속하게 검토하고, 적합한 인재를 선별하여 효과적인 채용 프로세스를 진행할 수 있습니다. 또한, 플랫폼은 맞춤인재 추천과 함께 기업 정보 및 채용 공고를 효과적으로 홍보할 수 있는 다양한 상품을 제공합니다.
  - 이를 통해 "날JOB아줘"는 구직자와 기업 간의 원활한 상호 작용을 도모하여, 채용 활동을 효과적이고 효율적으로 수행할 수 있는 플랫폼입니다.

## 개발 기간
  - 전체 개발 기간 : 2023.11.22 ~ 2024.01.16
  - UI 구현 : 2024.01.01 ~ 2024.01.09
  - 기능구현 : 2023.12.11 ~ 2024.01.12

## 작업관리
  - REDMINE을 통해 일정 관리
  - SVN을 통한 코드 관리

## 맡은 역할
#### DA / UA
  - 단어사전, 용어사전, 테이블 정의서를 정의하여 각종 Data를 문서화로 만들어 DB에 저장될 데이터를 표준화
  - ERD 물리 용어를 통일시키고, 표준 용어집에 맞춰 수정
  - 개발단계에서 변경되는 요구사항 변경과 일부 추가되는 기능을 반영하기 위해 협의를 통해 DB를 수정했고, 변경사항을 설계과정에서 작성된 ERD에 현행화
  - DB테이블마다 코멘트 작성
  - 종속 관계인 테이블마다 cascade삭제 여부를 설정
  - 공통코드로 코드를 관리하며, 첨부파일 테이블로 모든 첨부파일을 관리함. (썸네일 제외)
  - 컬러의 통일성이 없는 부분을 캐치해내고, 화면의 통일성을 위해 버튼 크기나 호버 색상, 모양 등 의견 제시
  - 맡은 기능을 구현 후 페이지 통일성을 위해 CSS를 보완
  - 프로젝트 진행 시 각 기능 구현을 하면서 필요한 크고 작은 기술이나 API를 리스트로 정리
  - 페이징이 필요한 부분에서 사용할 수 있게 util에 List<?>로 페이징 클래스 생성
