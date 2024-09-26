# 번역기 앱
- 프로젝트 실습 수행평가

### 기능
- 번역 (녹음은 추후 개발 예정, 시간이 된다면 다중 언어 지원도 구현)

### 사용기술
- UI: [SnapKit](https://github.com/SnapKit/SnapKit)
- Project: [Cocoa Pod](https://cocoapods.org/)
- 번역AI: [MLKit](https://developers.google.com/ml-kit?hl=ko)
- 코드: [Then](https://github.com/devxoul/Then)

### 느낀점
- iOS에는 터치하면 키보드가 내려가는 기능을 직접 구현해야 한다(Android는 기본 탑재)
- AutoLayout을 코드로 짜는 게 너무 비직관적이고 어렵다… Android의 xml이나 웹의 html,css는 완전 쉬운데
- TextView의 placeholder를 제공하지 않는 것에 실망했다. TextField은 placeholder가 있는데 TextView는 없고 기능도 제한적이다.

### 배울 것
- scrollView의 frameLayoutGuide, contentLayoutGuide란 무엇인지 공부
