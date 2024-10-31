EXTERNAL MyExternalBPFunction( ABoolean, TheAnswer, PI, Message, AreasVisited )
EXTERNAL ExBGTrans(offType, onType,bgName)
EXTERNAL ExBGMTrans(offType, onType, bgmName)
EXTERNAL ExRecall(myBool)
EXTERNAL ExStreaming(myBool)
EXTERNAL ExTutorial(msg,UI,endCondition)
EXTERNAL ExAutoSave(nextSectionName)
EXTERNAL ExConversation(speaker)
EXTERNAL ExCamShake(myBool)
EXTERNAL ExBlackout(myBool)
EXTERNAL ExIsEvent(myBool)
EXTERNAL ExSFX(effeectName)
EXTERNAL ExNewQuest(questType, questName, location)
EXTERNAL ExShowQuest(questType)

VAR Dust = "더스트"
VAR Hes = "헤시타거스"
VAR Fer = "페르고니브스"

ExRecall(true)
ExBGMTrans("fade","fade", "human")
ExConversation(Dust)
+ [이것이 나의 마지막 기억... 이상한 점을 찾아야 해.]
- 
ExConversation(Fer)
+ [일단 신전에서 준비한 장비를 준비하자.]
-
상점에서 구매 완료
+ [모두 장비하도록...]
-
무기장착 완료

+ [자, 이제 드디어 마지막... 헤시타거스만 처치하면 된다. 아드라시스를 위하여!]
-
헤시타거스 맵 진입
-> HesitagusBattle
===HesitagusBattle===
+ [Section: Intro_2 시간 되돌아간 더스트 - 헤시타거스]
-
// 배경구성 (3D)   헤시타거스 던전
// 등장인물 (3D)	반격전사  토르, 아이리스(궁수or법사), 페르고니브스 전사, 라스엘(치유성기사든 신성법사든 관계없음), 더스트(쪼렙 전사템 입고있는 청년), 헤시타거스
// 인물연출 (3D)	영웅 4인과 헤시타거스 레이드 전투중. 기둥 뒤 더스트 숨어서 전투를 지켜봄
// BGTrans("iris_in", "HesitagusBattleMap")
ExBGTrans("fade","fade", "HesitagusBattleMap3D")
ExBGMTrans("fade","fade", "HesitagusBGM")
// 카메라초점
// 카메라구도	    기본 아이소메트릭 (모든 등장인물이 보이는 크기로)
// 카메라연출	    -
ExConversation(Dust)
+ [이것이 나의 마지막 기억... 이상한 점을 찾아야 해.]
-
ExConversation(Hes)
이 미미한 것들!

ExIsEvent(false) // 전투 UI 발생
ExRaidMsg("헤시타거스가 [호권]을 시전합니다." )// 레이드 알람     헤시타거스가 "호권"을 시전합니다.
ExStreaming(false) //시간연출 (전투)        "호권"시전 후 0.5초 후 자동정지

->BattleEnds
===BattleEnds===
+ [Section: intro_2_BattleEnds 전투 끝 페르고니브스와 대화]
-
ExIsEvent(true) //전투 UI 제거
// 배경종류        비전투 3D (헤시타거스 레이드 던전화면 그대로)
// 배경구성 (3D)   헤시타거스 던전
// 등장인물 (3D)	반격전사  토르, 아이리스(궁수or법사), 페르고니브스 전사, 라스엘(치유성기사든 신성법사든 관계없음), 더스트(쪼렙 전사템 입고있는 청년), 헤시타거스
ExBlackout(true)
ExBlackout(false) //같은 맵에 카메라 앵글만 바꾸기 위함
BGMTrans("fade", "fade","victory")
ExConversation(Hes)
으윽...내가.. 이대로..!
ExConversation(Fer)
해냈다... 모두 살아남고, 헤시타거스도 끝났어.

// 인물연출        페르고니브스가 더스트에게 걸어감
// 카메라초점      페르고니브스 포커스
// 카메라연출      패닝으로 따라감
더스트, 잘 지켜보았나? 이것이 바로 진정한 영웅들의 힘이야.
ExConversation(Dust)
+ [네, 정말... 대단합니다!]
-
ExConversation(Fer)
...네게 조용히, 할 말이 있다. 아주 중요한..
오늘 밤 숙소에서 만나자. 모두가 잠든 후에.
ExConversation(Dust)
+ [...알겠습니다.]
-

->Death
===Death===
+ [Section: Intro_2_Death 몬스터등장 - 현실까지]
-
// 배경구성 (3D)   헤시타거스 던전, 해시타거스 너머 벽이 뚫렸음(더스트 탈출로)
// 등장인물 (3D)	반격전사  토르, 아이리스(궁수or법사), 페르고니브스 전사, 라스엘(치유성기사든 신성법사든 관계없음), 더스트(쪼렙 전사템 입고있는 청년), 쓰러진 헤시타거스, 몬스터들
// 인물연출 (3D)	영웅들의 몸이 굳음, 몬스터들은 더스트를 신경쓰지 않음. 수가 많고 어그로와 상관 없이 영웅마다 한두마리씩
ExBGMTrans("hard", "hard", "비장, 긴박, 슬픈 전투")
ExSFX("동굴 깊은 곳에서의 저음의 울림. 대지의 신음같은")
ExBlackout(true)
ExBlackout(false)
ExCamShake(true)
ExConversation(Fer)
몸이 움직이지 않아! 숨... 숨이..!
크윽... 이대로는 안돼....! 아직은.. 때가 아닐텐데...!
+ [연출: 모든 영웅이 다 쓰러짐]
- 
더스트... 잘 들어. 기억해. 벨라니아가... 넌 살릴, 것이다. 모든 것이... 거짓... 도망가...
ExCamShake(false)
ExRecall(false) //회상 vignette 사라짐

ExConversation(Dust)
+ [... 이.. 이건! 그 떄와, 똑같아.....]
-
+ [으아아아아! 아니야!]
-
+ [허억, 헉! 더이상 과거의 기억을 보는 게 아니야... 감, 감각이 느껴지는...]
-
+ [질서의 반지가..질서의 신이 날 지킨 게 아니었어! 모든 게, 모든 것이 똑같았어...방금 .. 아니... 미래의 나와 나의 동료들이 겪은 일과...]
-
->Escape
===Escape===
+ [Section: Intro_2_Escape 좁은 통로로 헤시타거스 동굴 탈출]
-
ExIsEvent(false) // 전투 UI 발생
// 배경종류        전투 3D (헤시타거스 레이드 던전화면 그대로)
// 배경구성 (3D)   헤시타거스 던전, 해시타거스 너머 벽이 뚫렸음(더스트 탈출로)
// 등장인물 (3D)	온갖 몬스터들
// 인물연출 (3D)	몬스터들 로밍
// 일시정지로 시작, 자동 재생모드
ExTutorial("자동 재생기능이 켜졌습니다. 스킬이 예약되면 자동으로 전투를 시작합니다.","","")
+ [흐흑, 흑. 일단, 타.. 탈출해야 해!]
-
+ [상황: 더스트를 공격하지 않는 몬스터 처치]
-
이제.. 과거처럼. 교회로 돌아갈 수 없어.
+ [상황: 더스트를 공격하지 않는 몬스터 처치]
-
반지가 날 지켜준 게 아니었어.
+ [상황: 더스트를 공격하지 않는 몬스터 처치]
-
바보같이, 교회에 돌아가 반지에, 질서에. 충성을 맹세했는데.
+ [상황: 더스트를 공격하지 않는 몬스터 처치]
-
페르고니브스도. 혼돈의 존재로...변했겠지....
+ [상황: 더스트를 공격하지 않는 몬스터 처치]
-
벨라니아 짓이야!
+ [상황: 더스트를 공격하지 않는 몬스터 처치]
-
과거와, 과거와 달라져야 해.
+ [상황: 제자리에서 더스트를 공격하기 시작]
-
나를 공격해..? 반지가..?
+ [상황: 제자리에서 더스트를 공격하기 시작]
-
반지... 느낌이 이상하다.
+ [상황: 제자리에서 더스트를 공격하기 시작]
-
반지의 힘이. 질서의 힘이 사라지고 있는건가?
+ [상황: 제자리에서 더스트를 공격하기 시작]
반지에, 더 이상 질서의 힘이 느껴지지 않아... 그렇다면...!
-
+[상황: 모든 몬스터 처치. 던전의 끝에 광원 있음]
-
...이 길로, 교회로 돌아갔었는데.
...질서의 힘이 반지에 미치지 않는다.
벨라니아로부터 도망갈 수 있는, 기회.-
... ... 일단 도망가자...
ExTutorial(" [토벌완료] 버튼을 누르고 전리품을 획득하세요.", "[토벌완료] 버튼", "[토벌완료]버튼 누르고 전리품 획득")
+ [상황: 토벌완료 버튼 누르면 토벌완료 시나리오 진행 (레벨업, 전리품)]
-
->HelloWorld
===HelloWorld===
+ [Section: 월드맵]
-
ExBGMTrans("fade","fade", "슬프고 비장한 인간 BGM")
저기다. 숲으로 가면 당분간은 안전할 거야.

ExNewQuest("main", "어둠이 질 때까지", "숲")
ExShowQuest("main")
ExTutorial("퀘스트 마크가 있는 목적지를 우클릭하여 [이동]하세요.", "퀘스트마크","목적지로 이동")
+ [상황: 목표 지점으로 이동]
-
ExIsEvent(true) // 월드맵 조작 UI 숨김
질서의 힘만 사라진 게 아냐. 몬스터가 죽을 때 분명히, 반지가 혼돈의 기운을 흡수했다...왜지?
벨라니아. 우리들을 기만하다니.. 젠장..
내가 베어왔던 수많은 혼돈의 존재들. 사실은 그들도.. 원래는... 우..우욱..!
...
질서를 지키는 피스 브링어따위...
ExBlackout(true)
ExQuestDone("main")
ExBGMTrans("fade","fade", "밤벌레 우는 소리")

어머니가 들려주시던 카오스 브링어의 전설이 떠오른다.
그저 전설이 아니었던 것일까...
난...
이제 다시 태어나겠어.
ExBGTrans("hard blackout", "Chaos Bringer Logo - Main menu") //카오스 브링어 로고 꽝 > 광원 쉬이익 움직이면서 애니메이션 멈추고 아래 메뉴 등장 (이대로 메인페이지가 됨)
ExBGMTrans("hard","hard", "main theme bgm")
->DONE
