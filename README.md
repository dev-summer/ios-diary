# 📔 Diary 📔

> 프로젝트 기간: 2022-12-19 ~ 2023-01-06 (3주)

## 🗒︎목차

1. [소개](#-프로젝트-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [파일 구조](#-파일-구조)
6. [프로젝트 구조](#-프로젝트-구조)
7. [실행화면](#-실행-화면)
8. [트러블 슈팅](#-트러블-슈팅)
9. [고민한 점](#-고민한-점)
10. [참고링크](#-참고-링크)

---

## 👋 프로젝트 소개

- 사용자가 작성한 일기를 코어 데이터 저장소에 저장하고, 저장된 일기를 불러와 수정할 수 있는 앱입니다.
- 작성한 일기의 공유와 삭제가 가능합니다.
- 일기를 작성하는 화면에서는 사용자가 입력한 일기 제목 크기와 키보드 화면 표시 여부에 따라 `textView`의 크기가 동적으로 조정됩니다.
- 사용자의 언어 설정에 따라 날짜 표기 형식이 바뀝니다.
- `CoreData`, `UITableView`, `AutoLayout/AutoResizing` 개념을 활용해 진행되었습니다.

---

## 💻 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![iOS](https://img.shields.io/badge/iOS-15.2-blue)]() [![SwiftLint](https://img.shields.io/badge/SwiftLint-0.50-green)]()

---

## 🧑 팀원

|[SummerCat](https://github.com/dev-summer)|[som](https://github.com/jsa0224)|
|:---:|:---:|
|<img src=https://i.imgur.com/TVKv7PD.png width="200" height="200" >|<img src = "https://i.imgur.com/eSlMmiI.png" width=200 height=200>|

---

## 🕖 타임라인

<details>
    <summary><span style="font-size:18.0pt"><b>STEP-1</b></span></summary>

**2022/12/20**
- `DiaryForm` 데이터 타입 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- `DiaryListVC`, `RegisterVC`, `DiaryListTableViewCell` 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- `iOS Deployment Target` 15.2로 변경 [![build](https://img.shields.io/badge/build-purple)]()
- 키보드가 `textView`를 가리지 않는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- `SwiftLint` 적용 [![feat](https://img.shields.io/badge/feat-green)]()

**2022/12/21**
- 날짜 형식이 사용자의 언어에 맞게 자동으로 변경되도록 수정 [![refactor](https://img.shields.io/badge/refactor-blue)]()
- JSON 데이터 디코딩 오류 발생 시 얼럿 메시지를 확인하면 앱이 종료되도록 변경 [![refactor](https://img.shields.io/badge/refactor-blue)]()
- `titleTextView`의 높이가 일정 이상 커질 경우 `titleTextView`의 높이가 더 이상 커지지 않도록 고정하는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
    
 
**2022/12/23**
- `titleTextView`의 높이가 콘텐트 높이에 따라 최대 높이까지 동적으로 증가하고 감소하도록 수정 [![refactor](https://img.shields.io/badge/refactor-blue)]()
    

</details>

<details>
    <summary><span style="font-size:18.0pt"><b>STEP-2</b></span></summary>
    
**2022/12/26**
- Diary 데이터 모델 생성 [![feat](https://img.shields.io/badge/feat-green)]()
- DiaryItemVC 생성 [![feat](https://img.shields.io/badge/feat-green)]()
- CoreDataManager 생성 [![feat](https://img.shields.io/badge/feat-green)]()
- 일기장 list 선택 시, 해당 일기장 상세 화면으로 이동하는 메서드 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- CoreDataManager의 CRUD 관련 메서드 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- 아래로 스와이프 시, 키보드 내리는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- 일기장의 편집이 끝났을 때, CoreData에 저장하는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()

**2022/12/27**
- 앱이 백그라운드 진입 시 일기장이 저장되는 메서드 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- 화면에서 키보드가 사라지면 일기를 저장하는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()

**2022/12/28**
- DiaryItem을 관리하는 DiaryItemManager 생성 [![feat](https://img.shields.io/badge/feat-green)]()
- 새 일기를 생성하는 VC와 기존 일기를 보여주는 VC를 하나의 DiaryItemVC로 통합 [![refactor](https://img.shields.io/badge/refactor-blue)]()
- 더 보기 버튼을 누르면 액션 시트를 보여주는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- 액션 시트에서 공유하기 선택 시 액티비티 뷰를 보여주는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- 빈 일기장이 저장되지 않는 로직 추가 [![refactor](https://img.shields.io/badge/refactor-blue)]()
- 액션시트의 delete 선택 시, 일기장이 삭제되는 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- DiaryListVC의 셀을 스와이프 시 공유 및 삭제가 가능한 기능 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- CoreData Diary의 id의 타입을 UUID -> objectID로 변경 [![refactor](https://img.shields.io/badge/refactor-blue)]()
- 일기의 제목, 본문, 생성일자를 기준으로 비교하여 Diary 객체를 가져오는 메서드 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- 각 VC에서 다이어리를 삭제할 때, 삭제 여부를 확인하는 얼럿 구현 [![feat](https://img.shields.io/badge/feat-green)]()

**2022/12/29**
- UIViewController을 extension하여 삭제 시 보여주는 얼럿의 재사용성을 개선 [![refactor](https://img.shields.io/badge/refactor-blue)]()
- CoreDataManager의 오류를 전달해서 얼럿을 띄우는 AlertManager 구현 [![feat](https://img.shields.io/badge/feat-green)]()

**2022/12/30**
- 새 일기 생성 시 diaryItem이 초기화되지 않은 상태에서 diaryItem을 업데이트 하던 버그를 수정 [![fix](https://img.shields.io/badge/fix-orange)]()
- 기존 일기를 조회 후 새 일기를 생성할 때, 기존 일기의 id 정보를 diaryItemManager가 가지고 있던 버그를 수정 [![fix](https://img.shields.io/badge/fix-orange)]()

**2023/01/03**
- 뒤로가기를 눌렀을 때, 제목과 본문이 비어있을 경우 삭제하는 메서드 추가 [![feat](https://img.shields.io/badge/feat-green)]()
- VC의 텍스트 뷰를 관리해주는 TextViewManager 타입 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- isValid 메서드의 조건부 수정 [![fix](https://img.shields.io/badge/fix-orange)]()

**2023/01/04**
- UUID를 통해 objectID를 가져오는 메서드 구현 및 create와 update 메서드의 불필요한 기능 제거 [![feat](https://img.shields.io/badge/feat-green)]()
- AlertDelegate 프로토콜과 AlertManager 구현 [![feat](https://img.shields.io/badge/feat-green)]()
- CoreDataManager가 채택하는 CoreDataManageable 프로토콜 구현 [![refactor](https://img.shields.io/badge/refactor-blue)]()

**2023/01/05**
- 코어 데이터 로드 실패 시 alert를 띄우는 기능 추가 [![feat](https://img.shields.io/badge/feat-green)]()
- 빈 일기장을 생성한 경우 삭제하는 로직 수정 [![fix](https://img.shields.io/badge/fix-orange)]()
    
</details>

---

## 💾 파일 구조
```
Diary
├── Source
│   ├── AppDelegate
│   └── SceneDelegate
└── Resource
    ├── Common
    │   ├── DateFormatterManager
    │   ├── AlertManager
    │   └── Namespace
    ├── Model
    │   ├── DiaryModel
    │   ├── Diary+CoreDataProperties
    │   ├── Diary+CoreDataClass
    │   ├── DiaryItemManager
    │   ├── CoreDataManageable
    │   └── CoreDataManager
    ├── View
    │   └── DiaryListTableCell
    └── Controller
        ├── DiaryListViewController
        └── DiaryItemViewController
```

---

## 📊 프로젝트 구조
![](https://i.imgur.com/PBTa0xz.jpg)

---

## 💻 실행 화면

|전체적인 흐름|제목 텍스트 뷰 높이 & 키보드 레이아웃 동적 구현|
|:--:|:--:|
|<img src=https://i.imgur.com/yv80Llx.gif width="200">|<img src=https://i.imgur.com/urYCyDz.gif width="200">|

|일기장 저장|제목만 저장할 경우|본문만 저장할 경우|
|:--:|:--:|:--:|
|<img src=https://i.imgur.com/IpBOBuB.gif width="200">|<img src=https://i.imgur.com/942c9YR.gif width="200">|<img src=https://i.imgur.com/lOqe5TA.gif width="200">|

|리스트 화면에서 공유|리스트 화면에서 삭제|상세 화면에서 공유|상세 화면에서 삭제|
|:--:|:--:|:--:|:--:|
|<img src=https://i.imgur.com/R71YWOh.gif width="200">|<img src=https://i.imgur.com/KL7Qdnk.gif width="200">|<img src=https://i.imgur.com/ukWBWrB.gif width="200">|<img src=https://i.imgur.com/r7m7UYz.gif width="200">|


---


## 🎯 트러블 슈팅

### 1. 동적으로 크기가 변경되는 `textView`에 최대 높이 제약을 적용하기

`titleTextView`가 콘텐트 사이즈에 맞추어 크기가 늘어나고, 일정 크기에 도달하면 더 이상 크기가 늘어나지 않고 스크롤이 되도록 변경해 주었습니다. `titleTextView`에 개행을 많이 포함하고 `bodyTextView`에 텍스트를 입력했을 때 `bodyTextView`가 키보드에 가려질 수 있기 때문입니다.
`textViewDidChange(_:)` 메서드를 활용해서 `textView`의 콘텐트 사이즈의 높이에 따라 텍스트뷰의 높이와 스크롤 가능 여부를 변경하는 조건문을 활용해 레이아웃이 동적으로 변경되도록 구현했습니다.
사용자의 입력에 의해 설정한 최대 크기보다 콘텐트 사이즈가 커지면 최대 크기로 `textView`의 크기가 제한되고 스크롤이 가능해지며, 사용자가 텍스트를 지워 최대 크기보다 콘텐트 사이즈가 작아지면 콘텐트 사이즈에 맞게 `textView`의 크기가 줄어듭니다. (참고:[ Auto Resizing a Dynamic UITextView](https://medium.com/macoclock/auto-resizing-dynamic-uitextview-97d151e59ca0))

**Auto Resizing Dynamic TextView with Max Height**

<img src=https://i.imgur.com/RIhXRqF.gif width="250">

---

### 2. 스크롤을 내려도 `textView`의 첫째 줄 위의 여백이 일정하게 보이도록 설정하기

`titleTextView`, `bodyTextView`의 스크롤을 내리기 전과 후의 `textView` 바깥 공간과의 여백이 다른 점을 발견했습니다. 스크롤을 내렸을 때  각 `textView`의 첫 줄의 위에 공간이 존재하고, 스크롤을 내리면 그 공간이 사라진다는 것을 뷰 디버거를 통해 알게 되었습니다. 

| 스크롤을 내리지 않았을 때 | 스크롤을 내렸을 때 |
| --- | --- |
| ![](https://i.imgur.com/iaV7HOn.png) | ![](https://i.imgur.com/XMeEX2w.png) |

`textView` 자체에 첫째줄에만 적용되는 `padding` 같은 개념이 존재할 수 있다고 생각해 `UITextView`의 프로퍼티들을 확인해서 [`textContainerInset`](https://developer.apple.com/documentation/uikit/uitextview/1618619-textcontainerinset)이라는 프로퍼티가 존재하며, 기본값이 `(8, 0, 8, 0)`이라는 것을 알게 되었습니다.
각 `textView`의 스크롤을 내려도 `textView` 바깥 공간과의 여백을 일정하게 유지하기 위해 `textContainerInset`을 `(0, 0, 0, 0)`으로 설정했습니다.

**`textContainerInset` 수정 후**
| 스크롤을 내리지 않았을 때 | 스크롤을 내렸을 때 |
| --- | --- |
| ![](https://i.imgur.com/g8XXybD.png) | ![](https://i.imgur.com/ZSSgcIH.png) |

---

### 3. 일기 상세 화면에서 일기를 삭제 시, 삭제 후 동일한 일기를 새롭게 생성하는 문제 해결

일기 상세 화면에서 일기를 삭제 시 일기 리스트 화면으로 돌아가도록 구현하고자 했습니다.
하지만 CoreData에 삭제 요청을 보낸 이후 일기 상세 화면 뷰컨을 pop할 때, CoreData에 저장을 요청하는 메서드가 호출되어 뷰컨의 `titleTextView`와 `bodyTextView`의 텍스트를 `title`, `body`로 갖는 일기를 새로 생성하여 저장하는 side effect가 발생했습니다.
이를 해결하기 위해 CoreData에 삭제 요청을 보내기 전에 해당 뷰컨의 `titleTextView`와 `bodyTextView`의 텍스트를 비워주고, `title`과 `body`가 모두 비어 있는 일기의 생성을 막는 로직을 추가했습니다.

---

### 4. `keyboardWillHideNotification`이 `post`되는 시점

일기장 상세 화면에서 일기장 리스트 화면(메인 화면)으로 넘어갈 때, 그리고 상세 화면 뷰컨이 `pop` 되는 시점과 키보드가 내려갈 때, 총 2번 저장 로직이 호출되고 있습니다.
일기장 상세 화면에서 나간 후, 일기장에 대한 정보를 리셋하지 않으면 새로 생성하는 일기장에 앞의 일기장을 덮어쓰는 오류가 있어 일기장 상세 화면이 `pop` 될 때(`viewWillDisappear` 할 때), 일기장을 `reset`하는 기능을 추가했습니다. 하지만 키보드가 내려가는 시점이 `viewWillDisappear`보다 늦기 때문에 reset한 일기장을 저장하여, 상세 화면의 일기장과 같은 내용의 일기장을 새로 생성해 저장하게 되었습니다.
그래서 `reset`하는 시점을 `viewDidDisappear`로 변경하니, 키보드가 내려가는 시점 이후에 `reset`이 실행되어 `reset`한 일기장을 저장하는 오류를 해결할 수 있었습니다. 

---        

## 🤔 고민한 점

### 1. `StackView`의 `subview`에 `translatesAutoresizingMaskIntoConstraints = false`를 왜 하지 않을까?

[`StackView`](https://developer.apple.com/documentation/uikit/uistackview)에 따르면,`StackView`는 `.axis`, `.alignment`, `.distribution` 및 `.spacing` 프로퍼티와 `StackView`의 `frame`(또는 `margin`)을 기반으로 자신의 `arrangedSubviews`의 레이아웃을 결정할 수 있기 때문에, 각 서브뷰의 오토레이아웃을 직접 설정하지 않고도 레이아웃을 지정할 수 있습니다.
위 `view`들은 상위 뷰인 `stackView`에서 주어진 `margin`, `spacing` 외에 별도의 제약조건이 필요하지 않다고 생각해 `translatesAutoresizingMaskIntoConstraints`를 기본값인 `true`로 두어 `stackView`의 프로퍼티에 맞게 `subview`가 오토 리사이징 될 수 있도록 했습니다.

**오토 리사이징에 의해 자동으로 생성된 제약**

![](https://i.imgur.com/5ydGQ8G.png)

---

### 2. 클래스를 `final`로 선언하는 이유

`final` 키워드는 더 이상 해당 클래스에서 하위 클래스로의 전체 클래스 또는 일부가 상속 또는 상속에 따른 재정의가 될 필요가 없다고 판단한 경우에 각 클래스 앞에 추가하여 상속을 방지합니다 (메서드, 프로퍼티 등에도 사용 가능). 
`final`로 선언된 요소들은 직접 호출하는 반면, 그렇지 않은 요소들은 **Virtual Method Table(vtable)** 을 통해 간접 호출되어 직접 호출되는 경우보다 느리게 작동하게 됩니다. `vtable`이란 메서드 오버라이딩에 따라 실행 시점에 어떤 메서드를 실행할 지 결정하는 동적 디스패치를 지원하기 위해 사용하는 메커니즘입니다.
다시 말해, `final` 키워드가 적용된 메서드는 컴파일 시점에 어떤 메서드를 실행할 지 결정할 수 있어(해당 메서드는 더 이상 오버라이딩 되지 않을 것임이 보장되기 때문에) 성능상 이점을 가지게 됩니다. ([WWDC16 - Understanding Swift Performance](https://developer.apple.com/videos/play/wwdc2016/416/))

---

### 3. `LaunchScreen`은 `View`로 분류할 수 있을까?

프로젝트 파일링을 하면서, `LaunchScreen` 파일이 어느 폴더에 분류되는 것이 적합할지에 대한 고민이 생겼습니다. `storyboard`가 존재한다는 점과 `main storyboard`와 유사한 점이 있어 처음에는 `view` 폴더에 넣어야겠다고 생각했습니다. `LaunchScreen`은 사용자가 앱을 실행했을 때 앱의 시작 화면을 담당하는데, 이것의 개념을 `View`와 `ViewController` 중 어느 것으로 생각해야 할 지 고민이 되었습니다. 이에 대한 답을 찾기 위해서는 **`View`의 역할이 무엇인가?** 에 대한 고민이 선행되어야 한다는 것을 알게 되었습니다. 
저희가 생각한 `View`의 역할은 **사용자에게 화면을 보여주는 것**, **사용자와 상호작용 하는 것**입니다. 따라서 **`LaunchScreen`은 `View`로 분류해도 괜찮다**는 결론을 내렸습니다.

--- 

### 4. CoreData의 Entity와 별개의 데이터 모델을 구현한 이유
CoreData의 Entity(`Diary`)와 별개로 데이터 모델(`DiaryModel)`을 만든 이유는 앱에 추가적인 기능을 구현할 때 둘을 분리해서 관리할 필요가 생길 수 있다고 판단해서입니다. 예를 들어 `DiaryModel`의 프로퍼티가 갖는 값을 `enum`을 사용해 제한하고 싶을 경우 등이 있습니다.

---

### 5. Singleton 패턴 활용 여부

`CoreDataManager`, `DiaryItemManager`에서 싱글톤 패턴을 활용했던 이유는 각 Manager가 CoreData, DiaryItem의 **동작 로직**을 총괄하는 객체이기 때문에 모든 뷰 컨트롤러에서 동일한 인스턴스를 공유해야 한다고 생각했기 때문입니다.

하지만 아래와 같은 이유로 `DiaryItemManager`에 싱글톤 패턴을 적용하지 않도록 수정했습니다.
1. 싱글톤 패턴을 사용하는 이유는 **공통된 상태를 앱 전체에서 공유하기 위함**이지, 동작 로직을 공유하기 위함이 아니라는 점에서 **싱글톤 패턴을 채택한 이유가 적절하지 못하다**는 것을 알게 되었습니다.
2. `DiaryItemManager`는 **하나의 일기에 대한 상태를 보관하고 있는 객체**이기 때문에, 싱글톤 패턴을 활용하게 되면 하나의 일기에 대한 상태를 앱 전체에서 공유하게 되는 문제가 있었습니다.

`CoreDataManager`의 경우 **앱 전체에서 하나의 코어 데이터 저장소라는 상태를 공유**하고 있기 때문에, 싱글톤 패턴을 활용하는 것이 적절하다고 판단하여 싱글톤 패턴을 사용하기로 했습니다.

---

### 6. NotificationCenter의 활용 vs Delegate 패턴 활용 

서로 다른 객체간에서 일어난 변경사항(또는 이벤트)을 전달하기 위해 `NotificationCenter`를 활용했었으나,`Delegate` 패턴을 이용하도록 수정했습니다.

처음에 `NotificationCenter`를 사용했던 이유는 **`post`하고 `addObserver`하는 시점을 결정할 수 있기 때문**입니다. 이러한 이유로 초반에는 `NotificationCenter`를 활용하여 `CoreDataManager`의 에러를 뷰 컨트롤러에 `post`하여 뷰 컨트롤러에서 `alert`을 띄우게끔 구현하였습니다.
하지만 리뷰를 받으면서, 프로젝트의 규모가 커질 경우 **객체를 뛰어넘어 정보를 전달**하는 `NotificationCenter`의 특성상 **어느 객체에서 `post`를 하는지 추적이 어려워 진다**는 문제가 발생한다는 것을 알게 되었습니다. 그리하여 `CoreDataManager`의 에러를 `DiaryItemManager`로 `throw`하고 그 에러를 뷰 컨트롤러에 넘겨 `alert`을 띄울 수 있는 방안으로 수정했습니다.

---

### 7. 뷰(와 뷰 컨트롤러)에서 로직 분리하기

두 객체 사이에서 일기의 상태와 뷰의 로직을 관리하는 `DiaryItemManager` 객체를 만들어 뷰에 있던 로직을 분리하였습니다.
코어데이터의 CRUD를 관리하는 객체(`CoreDataManager`)와 뷰가 직접적으로 소통하게 되면서 뷰에 로직이 많아지게 되었습니다. 리뷰어 올라프의 조언을 토대로, 저희도 **뷰는 로직을 가지고 있지 않아야** 하며 화면을 띄우는 용도로만 사용해야 한다는 결론을 내리게 되었고, `DiaryItemManager` 객체로 로직을 분리하게 되었습니다.

---

## 📚 참고 링크

### 공식문서

- [DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter)
- [UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- [Adaptivity and Layout](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/)
- [UIKit: Apps for Every Size and Shape](https://developer.apple.com/videos/play/wwdc2018/235/)
- [Making Apps Adaptive, Part 1](https://www.youtube.com/watch?v=hLkqt2g-450) / [Script](https://asciiwwdc.com/2016/sessions/222)
- [Making Apps Adaptive, Part 2](https://www.youtube.com/watch?v=s3utpBiRbB0) / [Script](https://asciiwwdc.com/2016/sessions/233)
- [UITextView](https://developer.apple.com/documentation/uikit/uitextview)
- [Core Data](https://developer.apple.com/documentation/coredata)
- [Making Apps with Core Data](https://developer.apple.com/videos/play/wwdc2019/230/)
- [Making Apps with Core Data](https://developer.apple.com/videos/play/wwdc2019/230/)
- [UITextViewDelegate](https://developer.apple.com/documentation/uikit/uitextviewdelegate)
- [UISwipeActionsConfiguration](https://developer.apple.com/documentation/uikit/uiswipeactionsconfiguration)
- [UIAction](https://developer.apple.com/documentation/uikit/uiaction)
- [Core Data Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html#//apple_ref/doc/uid/TP40001075-CH2-SW1)
- [NSManagedObject](https://developer.apple.com/documentation/coredata/nsmanagedobject)
- [NSManagedObjectID](https://developer.apple.com/documentation/coredata/nsmanagedobjectid)
- [NSManagedObjectContext - .object(with:)](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/1506197-object)
- [NSFetchRequest](https://developer.apple.com/documentation/coredata/nsfetchrequest)
- [Predicate Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795)

### 블로그/기타

- [Move a View Up Only When the Keyboard Covers the Input Field - StackOverflow](https://stackoverflow.com/questions/28813339/move-a-view-up-only-when-the-keyboard-covers-an-input-field)
- [UIKeyboardLayoutGuide - Zedd 블로그](https://zeddios.tistory.com/1282)
- [UITableView Register Cell Identifier - StackOverflow](https://stackoverflow.com/questions/29282447/unable-to-dequeue-a-cell-with-identifier-cell-must-register-a-nib-or-a-class-f)
- [Safe Area와 Layout Margin](https://woozzang.tistory.com/147)
- [UIStackView layoutMargin 적용하기](https://velog.io/@dvhuni/UIStackView-Margin-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0)
- [How to add leading padding to view added inside an UIStackView - StackOverflow](https://stackoverflow.com/questions/32551890/how-to-add-leading-padding-to-view-added-inside-an-uistackview)
- [Auto Resizing a Dynamic UITextView](https://medium.com/macoclock/auto-resizing-dynamic-uitextview-97d151e59ca0)
- [Store a Closure as a Variable - StackOverflow](https://stackoverflow.com/questions/24603559/store-a-closure-as-a-variable-in-swift)
- [CRUD Operation With CoreData](https://stackoverflow.com/questions/24603559/store-a-closure-as-a-variable-in-swift)
