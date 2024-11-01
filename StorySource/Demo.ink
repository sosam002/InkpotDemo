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

VAR Dust = "더스트"
VAR Hes = "헤시타거스"
VAR Fer = "페르고니브스"
LIST CubeColour = (White), Red, Blue, Green
LIST visited =  Cube, RedRoundel, BlueBox, Parms, FlowsExplained, ExternalFuncs
LIST NephewNames = Huey, Duey, Louie
VAR mybool = true
VAR myfloat = 3.142
VAR myinteger = 42
VAR mystring = "hello from ink"
VAR mycombinedlist = (Cube, Blue, Louie)


->Main 

== Main
    {  
    - not visited : 
        This is a demo of some of the types of interaction between Ink script and the game world.
        The Ink flow is controlled by triggers that have been setup in the level blueprint.  
        Use W,A,S,D to walk, and the left and right arrow keys to turn.
        Now, walk towards to the colourless cubes.
    - not (visited has RedRoundel or visited has BlueBox ):
        Visit the blue box or the red roundel areas.
    - not ( visited has BlueBox ):
        -> FlowDescription ->
        Check out the blue box.
    - not ( visited has RedRoundel ):
        -> FlowDescription ->
        Now, go visit out the red roundel.
    - visited has (RedRoundel, BlueBox) and not ( visited has Parms ) and Main >= 7:
        Ok, enough of facts about red and blue!
        Walk over to the parameter passing pad, 
        and see how easy it is to pass parameters to Ink.
    - Main < 7:
        { shuffle :
        - See the blue box again.
        - Regard the red roundel once more.
        }
    - else :
        { shuffle :
        - Change the colour of the cubes, again.
        - Go back to the blue box.
        - Return to the red roundel.
        }
    }
    -> DONE
    
= FlowDescription
    { not( visited ? FlowsExplained ):
        The Red Roundel and the Blue Box show how flows can switch and continue from where they left off. 
        Walking into either colour area will switch the flow and continue the Ink script for red or blue. 
        Leaving the area will pause the script for that flow.
        ~visited += FlowsExplained
    }
    ->->

== BigCubeEncounter
    {
    - not (visited ? Cube) :
        These cubes demo how you can react to an Ink variable changing its value. 
        For these cubes, we are waiting for the Ink variable 'CubeColour' to change.
        Check the details panel for the cube to see this, under Inkpot Watch.
        Open the blueprint, props\\BP_InkyCube, to see how this is setup using an Inkpot watch component.
        Now, these cubes have no colour! 
        What colour should they be?
    - else :
        The cubes are {CubeColour}, what new colour should they be?
    }
    ~visited += Cube
    +[Red] You chose Red.
        ~CubeColour = Red
    +[Blue] Blue is the choice you made. 
        ~CubeColour =Blue
    +[Green] Green, green, green, it's not easy bein’ green!
        ~CubeColour = Green
    - The cubes are now {CubeColour}
    Now go check out some of the other areas.
    When you come back here you can change the cube colour again. 
    -> DONE

== FlowsDemo

= BabblingBlueBox
    ~visited += BlueBox
    Blue is the colour of the sky and the ocean, two of nature's most vast and awe-inspiring wonders. 
    Blue is also one of the most popular colours in the world, beloved by people of all ages and cultures.
    Blue is a primary colour in the RGB colour model, which means that it cannot be created by mixing other colours. 
    Blue is also one of the three primary colours in the traditional RYB colour model.
    Blue has a wide range of shades and hues, from light and airy sky blue to deep and rich navy blue. 
    Blue is often associated with positive emotions such as peace, tranquility, trust, and intelligence. 
    Blue is also associated with coldness, distance, and sadness.
    In many cultures, blue is associated with royalty and nobility. 
    Blue is also a popular colour for corporate branding, as it conveys a sense of professionalism and trust. 
    The first documented use of blue pigment was in ancient Egypt, where it was used to decorate tombs and temples.
    In the Middle Ages, blue was a very expensive colour, as it was made from the mineral lapis lazuli.
    The first synthetic blue dye was invented in 1828.
    Blue is the most popular colour in the world, according to surveys.
    Blue is a colour of the human eye.
    Blue is the colour of the sky because of the way sunlight interacts with the atmosphere.
    Blue is a beautiful and versatile colour that can be used in many different ways. 
    Blue is a popular choice for everything from home decor to fashion to art.
    -> DONE
    
= RamblingRedRoundel
    ~visited += RedRoundel
    Red is the colour at the long wavelength end of the visible spectrum of light, next to orange and opposite violet. 
    Red has a dominant wavelength of approximately 625–740 nanometres. 
    Red is a primary colour in the RGB colour model 
    Red is a secondary colour (made from magenta and yellow) in the CMYK colour model, and is the complementary colour of cyan. 
    Reds range from the brilliant yellow-tinged scarlet and vermillion to bluish-red crimson. 
    Reds vary in shade from the pale red pink to the dark red burgundy.
    Red is one of the most powerful and evocative colours in the world. 
    Red is often associated with strong emotions such as love, passion, anger, and danger. 
    Red is also associated with heat, energy, and excitement.
    Red is a very visible colour, which is why it is often used in warning signs and traffic lights. 
    Red is also a popular colour for marketing and advertising, as it can grab people's attention quickly.
    Red is the colour of blood, which is why it is often associated with danger and violence.
    Red is the colour of fire, which is why it is often associated with heat and energy.
    Red is the colour of love and passion, which is why it is often used in romantic settings.
    Red is the colour of anger and rage, which is why it is often used to express these emotions.
    Red is a versatile colour that can be used in many different ways. 
    Red is a popular choice for everything from home decor to fashion to art.
    -> DONE

== ParameterPassingDemo( ABoolean, TheAnswer, PI, Message, Nephews ) 
    {
    - not (visited ? Parms) :
        These parameters have been passed from Blueprint to Ink. 
    - else:
        Parameters passed are 
    }
    Message : "{ Message }"
    ABoolean : { ABoolean }
    TheAnswer : { TheAnswer }
    PI : { PI }
    Nephews : { Nephews }
    {
    - not (visited ? Parms) :
        See the level blueprint to see how this has been setup. 
    }
    ~visited += Parms
    ->DONE
    
== ExternalFunctionDemo
    ~visited += ExternalFuncs
    ddfdfdfdasfㅁㅇㄴㄹ미ㅏ넝ㄹ;ㅣ마넝;리ㅏㅓㅁ
    This section demos how Ink can call into a blueprint function. 
    // any of the values here can be changed in the inkpot debug
    // ~temp ReturnValue = MyExternalBPFunction( mybool, myinteger, myfloat, mystring, mycombinedlist )
    // ~temp ReturnValue = ExBGMTrans("hard","hard","dwarf")
    // and this, '{ReturnValue}', is what it returned. 
    // ~temp ReturnValue2 = ExBGMTrans("fade","hard","human")
    // and this, '{ReturnValue}', is what it returned. 
    // ~temp ReturnValue3 = ExBGMTrans("hard","fade","orc")
    // and this, '{ReturnValue}', is what it returned. 
    
    // ~temp ReturnValue4 = ExConversation("더스트")
    // 나는 카오스 브링어가 될테야아아
    // ~temp ReturnValue5 = ExCamShake(true)
    // 카메라셰이크 돌아라
    // ~temp ReturnValue6 = ExRecall(true)
    // 비네뜨 떠라
    // ~temp ReturnValue7 = ExBlackout(true)
    // 화면 꺼져랑
    // ~temp ReturnValue8 = ExBlackout(false)
    // ExRecall(true)
~temp ReturnValue = ExBGMTrans("fade","fade", "human")
// ~ReturnValue = ExConversation(Dust)
+ [이것이 나의 마지막 기억... 이상한 점을 찾아야 해.]
- 
// ~ReturnValue = ExConversation(Fer)
+ [일단 신전에서 준비한 장비를 준비하자.]
-
상점에서 구매 완료
+ [모두 장비하도록...]
-
무기장착 완료

+ [자, 이제 드디어 마지막... 헤시타거스만 처치하면 된다. 아드라시스를 위하여!]
-
헤시타거스 맵 진입

+ [Section: Intro_2 시간 되돌아간 더스트 - 헤시타거스]
-
// 배경구성 (3D)   헤시타거스 던전
// 등장인물 (3D)	반격전사  토르, 아이리스(궁수or법사), 페르고니브스 전사, 라스엘(치유성기사든 신성법사든 관계없음), 더스트(쪼렙 전사템 입고있는 청년), 헤시타거스
// 인물연출 (3D)	영웅 4인과 헤시타거스 레이드 전투중. 기둥 뒤 더스트 숨어서 전투를 지켜봄
// BGTrans("iris_in", "HesitagusBattleMap")
~ReturnValue = ExBGTrans("fade","fade", "HesitagusBattleMap3D")
~ReturnValue = ExBGMTrans("fade","fade", "HesitagusBGM")
// 카메라초점
// 카메라구도	    기본 아이소메트릭 (모든 등장인물이 보이는 크기로)
// 카메라연출	    -
~ReturnValue = ExConversation(Dust)
+ [이것이 나의 마지막 기억... 이상한 점을 찾아야 해.]
-
~ReturnValue = ExConversation(Hes)
이 미미한 것들!

~ReturnValue = ExIsEvent(false) // 전투 UI 발생
// ~ReturnValue = ExRaidMsg("헤시타거스가 [호권]을 시전합니다." )// 레이드 알람     헤시타거스가 "호권"을 시전합니다.
~ReturnValue = ExStreaming(false) //시간연출 (전투)        "호권"시전 후 0.5초 후 자동정지

+ [Section: intro_2_BattleEnds 전투 끝 페르고니브스와 대화]
-
~ReturnValue = ExIsEvent(true) //전투 UI 제거
// 배경종류        비전투 3D (헤시타거스 레이드 던전화면 그대로)
// 배경구성 (3D)   헤시타거스 던전
// 등장인물 (3D)	반격전사  토르, 아이리스(궁수or법사), 페르고니브스 전사, 라스엘(치유성기사든 신성법사든 관계없음), 더스트(쪼렙 전사템 입고있는 청년), 헤시타거스
~ReturnValue = ExBlackout(true)
~ReturnValue = ExBlackout(false) //같은 맵에 카메라 앵글만 바꾸기 위함
~ReturnValue = ExBGMTrans("fade", "fade","victory")
~ReturnValue = ExConversation(Hes)
으윽...내가.. 이대로..!
~ReturnValue = ExConversation(Fer)
해냈다... 모두 살아남고, 헤시타거스도 끝났어.

// 인물연출        페르고니브스가 더스트에게 걸어감
// 카메라초점      페르고니브스 포커스
// 카메라연출      패닝으로 따라감
더스트, 잘 지켜보았나? 이것이 바로 진정한 영웅들의 힘이야.
~ReturnValue = ExConversation(Dust)
+ [네, 정말... 대단합니다!]
-
~ReturnValue = ExConversation(Fer)
...네게 조용히, 할 말이 있다. 아주 중요한..
오늘 밤 숙소에서 만나자. 모두가 잠든 후에.
~ReturnValue = ExConversation(Dust)
+ [...알겠습니다.]
-

+ [Section: Intro_2_Death 몬스터등장 - 현실까지]
-
// 배경구성 (3D)   헤시타거스 던전, 해시타거스 너머 벽이 뚫렸음(더스트 탈출로)
// 등장인물 (3D)	반격전사  토르, 아이리스(궁수or법사), 페르고니브스 전사, 라스엘(치유성기사든 신성법사든 관계없음), 더스트(쪼렙 전사템 입고있는 청년), 쓰러진 헤시타거스, 몬스터들
// 인물연출 (3D)	영웅들의 몸이 굳음, 몬스터들은 더스트를 신경쓰지 않음. 수가 많고 어그로와 상관 없이 영웅마다 한두마리씩
~ReturnValue = ExBGMTrans("hard", "hard", "death")
// ~ReturnValue = ExSFX("동굴 깊은 곳에서의 저음의 울림. 대지의 신음같은")
~ReturnValue = ExBlackout(true)
~ReturnValue = ExBlackout(false)
~ReturnValue = ExCamShake(true)
~ReturnValue = ExConversation(Fer)
몸이 움직이지 않아! 숨... 숨이..!
크윽... 이대로는 안돼....! 아직은.. 때가 아닐텐데...!
+ [연출: 모든 영웅이 다 쓰러짐]
- 
더스트... 잘 들어. 기억해. 벨라니아가... 넌 살릴, 것이다. 모든 것이... 거짓... 도망가...
~ReturnValue = ExCamShake(false)
~ReturnValue = ExRecall(false) //회상 vignette 사라짐

~ReturnValue = ExConversation(Dust)
+ [... 이.. 이건! 그 떄와, 똑같아.....]
-
+ [으아아아아! 아니야!]
-
+ [허억, 헉! 더이상 과거의 기억을 보는 게 아니야... 감, 감각이 느껴지는...]
-
+ [질서의 반지가..질서의 신이 날 지킨 게 아니었어! 모든 게, 모든 것이 똑같았어...방금 .. 아니... 미래의 나와 나의 동료들이 겪은 일과...]
-
+ [Section: Intro_2_Escape 좁은 통로로 헤시타거스 동굴 탈출]
-
~ReturnValue = ExIsEvent(false) // 전투 UI 발생
// 배경종류        전투 3D (헤시타거스 레이드 던전화면 그대로)
// 배경구성 (3D)   헤시타거스 던전, 해시타거스 너머 벽이 뚫렸음(더스트 탈출로)
// 등장인물 (3D)	온갖 몬스터들
// 인물연출 (3D)	몬스터들 로밍
// 일시정지로 시작, 자동 재생모드
~ReturnValue = ExTutorial("자동 재생기능이 켜졌습니다. 스킬이 예약되면 자동으로 전투를 시작합니다.","","")
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

+ [Section: 월드맵]
-
~ReturnValue = ExBGMTrans("fade","fade", "world")
저기다. 숲으로 가면 당분간은 안전할 거야.

// ~ReturnValue = ExNewQuest("main", "어둠이 질 때까지", "숲")
// ~ReturnValue = ExShowQuest("main")
~ReturnValue = ExTutorial("퀘스트 마크가 있는 목적지를 우클릭하여 [이동]하세요.", "퀘스트마크","목적지로 이동")
+ [상황: 목표 지점으로 이동]
-
~ReturnValue = ExIsEvent(true) // 월드맵 조작 UI 숨김
질서의 힘만 사라진 게 아냐. 몬스터가 죽을 때 분명히, 반지가 혼돈의 기운을 흡수했다...왜지?
벨라니아. 우리들을 기만하다니.. 젠장..
내가 베어왔던 수많은 혼돈의 존재들. 사실은 그들도.. 원래는... 우..우욱..!
...
질서를 지키는 피스 브링어따위...
~ReturnValue = ExBlackout(true)
// ~ReturnValue = ExQuestDone("main")
~ReturnValue = ExBGMTrans("fade","fade", "decide")

어머니가 들려주시던 카오스 브링어의 전설이 떠오른다.
그저 전설이 아니었던 것일까...
난...
이제 다시 태어나겠어.
~ReturnValue = ExBGTrans("hard", "hard","Chaos Bringer Logo - Main menu") //카오스 브링어 로고 꽝 > 광원 쉬이익 움직이면서 애니메이션 멈추고 아래 메뉴 등장 (이대로 메인페이지가 됨)
~ReturnValue = ExBGMTrans("hard","hard", "main theme bgm")

    ->DONE


