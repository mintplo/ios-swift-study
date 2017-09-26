변수와 상수
===========

Variables and Constants

변수와 상수는 사용하기 위해 미리 선언해야 한다.
-----------------------------------------------

상수는 \`let\`
--------------

### 상수로 선언한 값은 다음에 수정할 수 없다.

변수는 \`var\`
--------------

타입을 지정해야 하는 경우는 \`:\`를 사용
----------------------------------------

ex) `var welcomeMessage: String`

주석은 \`//\`
-------------

### 멀티플 라인은 \`/\* \*/\`

\`;\`은 사용해도 되고 안 사용해도 됨 하지만 사용하지 않는 것을 권장
-------------------------------------------------------------------

컬렉션 타입
===========

Collection Types

스위프트에서 제공하는 3가지 컬렉션 타입
---------------------------------------

### arrays (배열)

같은 타입, Ordered

#### \`var\`로 배열을 선언하면 \`mutable\` (사이즈나 내용을 배경할 수 있다.)

#### \`let\`로 배열을 선언하면 \`immutable\` (사이즈나 내용을 변경할 수 없다.)

#### \`Array\` Full

#### \`\[Element\]\` Short-hand

#### \`var someInts = \[Int\]()\` 선언과 초기화를 함께

#### \`someInts.append(3)\`

#### 배열을 초기화 하는 방법중 하나 \`Array Literal\`

##### \`\[value1, value2, value3\]\`

##### \`var strArr = \['Str', 'Str1'\]\`

#### 타입 추정이 가능한 경우 아래와 같이 사용할 수 있음

##### \`var strArr = \['Str', 'Str1'\]\`

#### 아이템의 마지막에 추가하는 방법 2가지

##### \`shoppingList.append("flour")\`

##### \`shoppingList += \["Breaking Powder"\]\`

### dictionaries (딕셔너리)

같은 타입, Un-ordered, Key-value

#### Key 값은 고유한 값 (다른 값과 중복되지 않는)

##### Key 값으로 접근하기 때문에

#### \`Dictionary\`

#### \`\[Key:Value\]\` Short-hand

#### \`var namesOfIntegers = \[Int: String\]()\`

#### \`var namesOfIntegers: \[String:Int\] = \[:\]\`

#### \`Dictionary Literal\`

##### \`\[Key1: Value1, Key2: Value2, Key3:Value3\]\`

#### \`airports\["LHR"\] = "London"\`

### sets (셋)

Un-ordered

#### 추후 업데이트

제어문
======

Control Flow

For-In Loops
------------

### \`for index in 1...5 {}\`

### \`for \_ in 1...5 {}\` 오로지 반복을 위함

### \`for name in names {}\` 배열

### \`for (animalName, legCount) in numberOfLegs {}\` 딕셔너리

While Loops
-----------

### \`while condition { statements }\`

If
--

간단한 조건

### \`if condition {} elseif {} else {}\`

Switch
------

복잡한 조건

### \`switch (value) { case value1: respond to value 1 }\`

### \`case value2, value3:\`

### \`break\`가 없어도 됨

### \`default\`가 없으면 오류

### \`case 3 ... 20:\` 3 ~ 20이 걸림

### \`case 3 ..&lt; 20:\` 3~19가 걸림

### \`case 0, 1, 2:\` 0, 1, 2가 걸림

함수
====

Functions

특정한 기능을 수행하는 코드 뭉치
--------------------------------

모든 파라미터는 고유한 이름을 가진다. (함수 내부에서 변수로 사용하기 때문에)
----------------------------------------------------------------------------

\`func greet(person: String) -&gt; String { return "String" }\`
---------------------------------------------------------------

\`return arrow -&gt;\`
----------------------

함수의 파라미터는 argument label과 parameter name을 가지고 있다.
----------------------------------------------------------------

기본적으로 parameter name이 argument label의 역할도 수행
--------------------------------------------------------

\`func someFunction(first: Int, second: Int) {}\`
-------------------------------------------------

\`someFunction(first: 1, second: 2)\`
-------------------------------------

Argument Label
--------------

### parameter name 전에 쓴다.

### \`func someFunction(argumentLabel parameterName: Int)\`

### 고유하지 않아도 된다. 하지만 가독성을 위해 중복 사용은 자제

### \`func someFunction(\_ parameterName: Int)\` omitting argument label

### 기본 값 설정 가능

#### \`func someFunction(parameterWithDefault: Int = 12)\`

클래스, 구조체
==============

Classes, Structures

속성과 메서드를 정의할 수 있다
------------------------------

클래스는 상속이 가능하고 형 변환이 가능하다.
--------------------------------------------

\`class SomeClass {}\`
----------------------

\`struct Resolution {}\`
------------------------

속성
----

### stored property

#### 변수 또는 상수

### variable stored property

### constant sotred property

### computed property

#### 실제로 값이 저장되는 건 아님

### property observer

#### 속성 값이 변경되기 전, 된 후를 추적하여 추가적인 작업을 할 수 있도록

#### \`didSet\`

#### \`willSet\`

상속
----

### \`class someClass: ParentClass {}\`

### \`override func someMethod() {}\`

### \`override var someProperty: String {}\`

### super 키워드

#### 상위 클래스(부모)의 속성, 메서드에 접근할 수 있는 키워드

구조체
------

### 상속 불가

### 멤버 변수의 모임

옵셔널
======

Optional Value

변수에 nil값을 넣을수 있음
--------------------------

nil 비교가 가능
---------------

코드 안정화를 위한 키워드
-------------------------

초기화를 안한다면 nil값이 기본
------------------------------

\`var optionalString: String? = "Hello"\`
-----------------------------------------

Optional로 wrap된 변수를 unwrap하는 키워드는 \`!\`
--------------------------------------------------

\`print(optionalString!)\`
--------------------------
