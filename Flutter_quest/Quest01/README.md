## AIFFEL Campus Online Code Peer Review Templete
- 코더 : 서승호
- 리뷰어 : 이혁희


## PRT(Peer Review Template)

- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 주어진 문제를 해결하는 코드가 제출되었습니다.
    - 4번째 실행에서 휴식시간을 15분으로 늘이는 코드도 작성했습니다.
    ```
      } else {
      if (studyMinutes > 0 || studyss > 0) {
        if (studyss > 10) {
          studyss--;
          print('flutter : $studyMinutes:$studyss');
        } else if (studyss > 0) {
          studyss--;
          print('flutter : $studyMinutes:0$studyss');
        } else {
          studyMinutes--;
          studyss = 60;
          if (studyMinutes < 0) {
            print('공부시간이 끝났습니다.');
            print('쉬는 시간 시작합니다');
          }
        }
      } else {
        breakMinutes = 14;
        breakss = 59;
        if (breakss > 10) {
          breakss--;
          print('flutter : $breakMinutes:$breakss');
        } else if (breakss > 0) {
          breakss--;
          print('flutter : $breakMinutes:0$breakss');
        } else {
          breakMinutes--;
          breakss = 60;
          if (breakMinutes < 0) {
            print('타이머가 종료 되었습니다.');           
          }
        }
      }
    }
    ```
    
- [ ]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 코드를 보고 로직이 잘 이해되었습니다.


- [ ]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 테스트를 통하여 오류를 잘 잡았습니다.
        
- [ ]  **4. 회고를 잘 작성했나요?**
    - 회고를 작성하지 않았습니다.

- [ ]  **5. 코드가 간결하고 효율적인가요?**
    - 4번째 실행에서 휴식시간이 바뀌는 부분을 처리하기 위해서 일/휴식 사이클 전체 코드를 다시 작성하였습니다.
    - 해당 부분을 함수로 만들면 중복된 부분을 줄일 수 있을 것 같습니다.
    - PomodoroTimer를 class로 만들고 실행할 때마다 새로 생성해서 실행하면 타이머 코드의 중복을 없애고 코드의 재사용성을 높일 수 있을 것 같습니다.
    ```
    void main() {
        PomodoroTimer timer;

            var timeSettings = [
            {'workTime': 25, 'breakTime': 5},
            {'workTime': 25, 'breakTime': 5},
            {'workTime': 25, 'breakTime': 5},
            {'workTime': 25, 'breakTime': 15},
        ];

        for (var setting in timeSettings) {
            timer = PomodoroTimer(setting['workTime']??0, setting['breakTime']??0);
            timer.start();
        }
    }

    ```

## 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
