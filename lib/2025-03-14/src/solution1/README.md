# 연습문제 1

Cleric클래스에 관하여, 2가지 수정을 하시오

1. 현시점의 Cleric 클래스의 정의에는, 각 인스턴스별로 최대 HP와 최대 MP 필드에 대한 정보를 가지고 있다. 하지만, 모든 성직자의 최대 HP 는 50, 최대 MP 는 10으로 정해져 있어, 각 인스턴스가 각각의 정보를 가지는 것은 메모리 낭비이다.

   그래서, 최대 HP, 최대 MP의 필드가 공유 되도록

   필드 선언에 적절한 키워드를 추가하시오


| **항목** | **설명** |
| --- | --- |
| **문제점** | 각 인스턴스가 개별적으로 최대 HP, 최대 MP 값을 가짐 (메모리 낭비) |
| **해결 방법** | 최대 HP, 최대 MP를 **클래스 변수(`static`)** 로 선언 |
| **사용 키워드** | `static` |
| **결과** | 모든 인스턴스가 동일한 최대 HP, 최대 MP 값을 공유 |

2. 아래의 방침에 따라, 생성자를 추가 하시오

1. 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
2. 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다. 이 때, MP는 최대 MP와 같은 값이 초기화 된다
3. 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다. 이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
4. 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다. (이름이 없는 성직자는 존재 할 수 없음)
5. 생성자는 가능한 한 중복되는 코드가 없도록 작성한다

| **생성 방식** | **초기화 값** | **설명** |
| --- | --- | --- |
| `Cleric("아서스", hp: 40, mp: 5)` | HP: 40, MP: 5 | 이름, HP, MP를 직접 지정 |
| `Cleric("아서스", hp: 35)` | HP: 35, MP: 최대 MP | 이름과 HP만 지정, MP는 최대 MP로 설정 |
| `Cleric("아서스")` | HP: 최대 HP, MP: 최대 MP | 이름만 지정, HP와 MP는 최대값으로 설정 |
| `Cleric()` | **생성 불가** | 이름 없는 Cleric 인스턴스는 허용되지 않음 |
| **중복 최소화** | **초기화 리스트 사용** | 선택적 매개변수(`{}`)와 기본값 설정으로 코드 간결화 |