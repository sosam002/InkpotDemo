EXTERNAL MyExternalBPFunction( ABoolean, TheAnswer, PI, Message, AreasVisited )
EXTERNAL ExBGMTrans(offType, onType, bgmName)
EXTERNAL ExRecall(myBool)
EXTERNAL ExCamShake(myBool)
EXTERNAL ExBlackout(myBool)
EXTERNAL ExStreaming(myBool)
EXTERNAL ExTutorial(msg,UI,endCondition)
EXTERNAL ExBGTrans(offType, onType,bgName)
EXTERNAL ExIsEvent(myBool)
EXTERNAL ExSFX(effeectName)
EXTERNAL ExNewQuest(questType, questName, locationX, locationY)
EXTERNAL ExShowQuest(questType)
EXTERNAL ExQuestDone(questType)

VAR Dust = "%더스트%"
VAR Hes = "%헤시타거스%"
VAR Fer = "%페르고니브스%"
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
~temp ReturnValue = ExBGMTrans("fade","fade", "human")
~ReturnValue = ExIsEvent(true)
더스트 회상 속 월드맵입니다.
{Dust} 이 곳은... 무자비하게 동료를 모두 잃었던… 왜 이 기억이 보이는거지?
// 배경구성 (3D)   헤시타거스 던전
// 등장인물 (3D)	아이리스(궁수), 페르고니브스 반격전사, 라스엘(신성법사), 더스트(분노전사), 헤시타거스
~ReturnValue = ExNewQuest("main", "헤시타거스 토벌", 2,3)
~ReturnValue = ExShowQuest("main")
'-------------------------
월드맵에서 헤시타거스 맵으로 진입합니다.
~ReturnValue = ExBGTrans("fade","fade", "HesitagusBattleMap3D")
~ReturnValue = ExBGMTrans("fade","fade", "HesitagusBGM")
'-------------------------
{Dust} ... 시작이다. (사념파 대사)
'-------------------------
전투가 시작됩니다.
{Hes} 이 미미한 것들! (사념파 대사)
~ReturnValue = ExStreaming(false)
'-------------------------
헤시타거스가 첫 호권을 시전하면, 시전시작 후 0.1초후 정도에 시간이 멈추고  페르고니브스가 대사를 칩니다. (사념파 대사)
{Fer} 모두 이동해! 호권이다!
'-------------------------
레이드 전투가 끝납니다.
~ReturnValue = ExBlackout(true)
~ReturnValue = ExBlackout(false) //같은 맵에 카메라 앵글만 바꾸기 위함
'--------------------------
헤시타거스 육각맵 컷씬이 시작됩니다.
~ReturnValue = ExBGMTrans("fade", "fade","victory")
{Hes} 으윽...내가.. 이대로..!
{Fer} 해냈다... 모두 살아남고, 헤시타거스도 끝났어.
// 인물연출        페르고니브스가 더스트에게 걸어감
// 카메라초점      페르고니브스 포커스
// 카메라연출      패닝으로 따라감
{Fer} 더스트, 잘 지켜보았나? 이것이 바로 진정한 영웅들의 힘이야.
{Dust} 네, 정말... 대단합니다!
{Fer} ...네게 조용히, 할 말이 있다. 아주 중요한..
{Fer}오늘 밤 숙소에서 만나자. 모두가 잠든 후에.
{Dust} ...알겠습니다.
~ReturnValue = ExCamShake(true)
~ReturnValue = ExBGMTrans("hard", "hard", "death")
~ReturnValue = ExSFX("동굴 깊은 곳에서의 저음의 울림. 대지의 신음같은")
'-------------------------
탈출맵 컷씬이 시작됩니다. 헤시타거스 시체 뒤에 동굴이 무너진 듯한 잔해와 같은 것이 널브러져 있고 좁은 길이 나있는 것이 보입니다. 거기서 아주 천천히 몬스터들이 걸어나와 동료들의 앞까지 1:1 매칭하듯 다가옵니다.
~ReturnValue = ExBlackout(true)
~ReturnValue = ExBlackout(false)
{Fer} 몸이 움직이지 않아! 숨... 숨이..!
{Fer} 크윽... 이대로는 안돼....! 아직은.. 때가 아닐텐데...!
{Fer} 더스트... 잘 들어. 기억해. 벨라니아가... 넌 살릴, 것이다. 모든 것이... 거짓... 도망가...
'-------------------------
더스트를 제외한 나머지 영웅들의 모습이 몬스터로 바뀝니다. (mesh fade out and fade in)
~ReturnValue = ExCamShake(false)
~ReturnValue = ExRecall(false) //회상 vignette 사라짐

{Dust} 허억, 헉! 더이상 과거의 기억을 보는 게 아니야... 감, 감각이 느껴지는...
{Dust} ... 이.. 이건! 그 떄와, 똑같아..... 왜 이 기억을 잃고 살았던 거지?!
{Dust} 질서의 반지가..질서의 신이 날 지킨 게 아니었어! 모든 게, 모든 것이 똑같았어...아까 .. 아니... 미래의 나와 나의 동료들이 겪은 일과...
'-------------------------
탈출맵 전투가 시작됩니다. (자동재생모드 시작, 전투 UI 발생)
~ReturnValue = ExIsEvent(false) // 전투 UI 발생
~ReturnValue = ExTutorial("헤시타거스의 시체 뒤로 탈출하세요. 자동 재생기능이 켜졌습니다. 스킬이 예약되면 자동으로 전투를 시작합니다.","","")
'-------------------------
헤시타거스 뒷 길로 탈출해야 합니다. 길목을 지키는 몬스터가 더스트를 공격하지 않습니다. 하나씩 처치할 때마다 사념파 대사가 나옵니다.
{Dust} 일단, 타, 탈출해야 해!
{Dust} 이제.. 과거처럼. 교회로 돌아갈 수 없어.
{Dust} 반지가 날 지켜준 게 아니었어.
{Dust} 바보같이, 교회에 돌아가 반지에, 질서에. 충성을 맹세했는데.
{Dust} 페르고니브스도. 혼돈의 존재로...
{Dust} 벨라니아 짓이야!
{Dust} 과거와, 과거와 달라져야 해.
'-------------------------
이제 몬스터가 더스트를 공격하기 시작합니다. 어그로 끌려서 가까이 다가오는 정도의 AI입니다.하나 처치할 때마다 사념파 대사가 나옵니다.
{Dust} 나를 공격해..? 반지가..?
{Dust} 반지... 느낌이 이상하다.
{Dust} 반지의 힘이. 질서의 힘이 사라지고 있는건가?
{Dust} 반지에, 더 이상 질서의 힘이 느껴지지 않아... 그렇다면...!
'-------------------------
모든 몬스터를 처치하고 좁은 길 마지막 광원까지 도착하여 사념파 대사가 나옵니다.
{Dust} ...이 길로, 교회로 돌아갔었는데.
{Dust} ...질서의 힘이 없어진 반지라...
{Dust} 벨라니아로부터 도망갈 수 있는, 기회. 과거와 달라.
{Dust} ... ... 일단 도망가자...
~ReturnValue = ExTutorial(" [토벌완료] 버튼을 누르고 월드맵으로 진출하세요.", "[토벌완료] 버튼 클릭", "[토벌완료]버튼 클릭")
'-------------------------
토벌완료 후 월드맵으로 나왔습니다.
~ReturnValue = ExBGMTrans("fade","fade", "world")
{Dust} 저기다. 숲으로 가서 어두울 때까지 기다리자.
~ReturnValue = ExNewQuest("main", "어둠이 질 때까지", 5,6)
~ReturnValue = ExShowQuest("main")
~ReturnValue = ExTutorial("퀘스트 마크가 있는 목적지를 우클릭하여 [이동]하세요.", "퀘스트마크","목적지로 이동")
'-------------------------
퀘스트마크가 있는 목적지로 이동하였습니다.
~ReturnValue = ExQuestDone("main")
~ReturnValue = ExBlackout(true)
~ReturnValue = ExBlackout(false)
~ReturnValue = ExIsEvent(true) // 월드맵 조작 UI 숨김
{Dust} 질서의 힘만 사라진 게 아냐. 몬스터가 죽을 때 분명히, 반지가 혼돈의 기운을 흡수했다...왜지?
{Dust} 벨라니아. 우리들을 기만하다니.. 젠장..
{Dust} 내가 베어왔던 수많은 혼돈의 존재들. 사실은 그들도.. 원래는... 우..우욱..!
{Dust} ...
{Dust} 질서를 지키는 피스 브링어. 페르고니브스. 그리고 후계자인 나...
~ReturnValue = ExBlackout(true)
~ReturnValue = ExBGMTrans("fade","fade", "decide")
{Dust} 어머니가 들려주시던 카오스 브링어의 전설이 그저 전설이 아니었던가...
{Dust} ...난...
{Dust} 이제 다시 태어나겠어.
~ReturnValue = ExBGTrans("hard", "hard","Chaos Bringer Logo - Main menu") //카오스 브링어 로고 꽝 > 광원 쉬이익 움직이면서 애니메이션 멈추고 아래 메뉴 등장 (이대로 메인페이지가 됨)
~ReturnValue = ExBGMTrans("hard","hard", "main theme bgm")

    ->DONE


