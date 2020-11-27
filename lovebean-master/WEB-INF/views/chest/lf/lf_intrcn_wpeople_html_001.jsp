
<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 소개  > 함께하는 사람들 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<style>
.group-imgbox {margin-top:45px;text-align:center; position:relative;}
.group-imgbox img {vertical-align:top;max-width:100%;heigtht:100%;}
</style>


<script type="text/javascript">

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        
        goTabDisplay(0);
        
        //$('img[usemap]').rwdImageMaps();

        $('.btn-base-imp').off('click').on('click', function(e) {
            btnClickPageMove(this);
        });

        
    });
    
    function goTabDisplay(obj){

        $(".ui-tab-pnl").attr({'aria-hidden':'true'}) ;
        $(".ui-tab-btn").attr('class','ui-tab-btn');

        $("#btn" + obj ).attr('class','ui-tab-btn selected');
        $("#pnl"+ obj +".ui-tab-pnl").attr({'aria-hidden':'false'}) ;
        

    }
    /*===========================================================
     * 버튼 Click 페이지 이동!
     *===========================================================*/
    
    // 바로가기 
    function btnClickPageMove(obj){
        
        
        // 1. 역대명예회장 btn 클릭시  :  걸어온길의 역대명예회장 탭  
        // 2. 역대회장      btn 클릭시  :   걸어온길의 역대회장 탭   
        // 3. 역대사무총장 btn 클릭시 :   걸어온길의 역대사무총장 탭 
        
        btnText = (obj).innerHTML;
        if ( btnText == "역대명예회장"){
            param = "pTab=1";
        }else
        if ( btnText == "역대회장"){    
            param = "pTab=2";
        }else
        if ( btnText == "역대사무총장"){    
            param = "pTab=3";
        }

         gf_submitMovePage("<c:url value='/lf/intrcn/initHist.do' />", param);
        
    }
    
    function getLoc(){
        var x = event.offsetX;
        var y = event.offsetY;
        console.log("현재좌표는 : "+x+" / "+y);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
</script>

<div class="base-body type-sub" id="baseBody">
    <div class="sub-visual visual04_02">
        <div class="sub-title-area">
            <h2 class="heading-title-a">소개</h2>
            <p class="title-sub-txt">사랑의열매는 이웃사랑의 상징입니다.</p>
        </div>
    </div>
    
    <%@ include file="../../layout/breadcrumbs.jsp"%>
    
<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>함께하는 사람들</strong><span>나누는 기쁨, 희망과 행복 - 사랑의열매를 소개합니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>
        
        <div class="seo-box">
            <div class="ui-tab ui-tab-type2 col-6 contents-tab" id="uiTabCCKI12_1">
                <div class="ui-tab-btns" btn-id="uiTabCCKI12_1">
                    <button type="button" class="ui-tab-btn" id ="btn0" onclick="javascript:goTabDisplay(0);"><i>조직도</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>명예회장</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn2" onclick="javascript:goTabDisplay(2);"><i>회장</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn3" onclick="javascript:goTabDisplay(3);"><i>사무총장</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn4" onclick="javascript:goTabDisplay(4);"><i>이사회</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn5" onclick="javascript:goTabDisplay(5);"><i>분과실행위원회</i></button>
                </div>
                <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                    <!-- S : 조직도 -->
                    <section class="ui-tab-pnl" id ="pnl0" >
                        <div class="tab-contents">
                            <div class="group-imgbox">
<!--                                 <img src="/common/img/contents/group_img01.jpg" alt="" onClick="javascript:getLoc()"> -->
                                <img src="/common/img/contents/group_img01.jpg" alt="조직도" usemap="#Map" >
                                <map name ="Map" id = "Map">
                                    <area shape="rect" coords="2,633,116,675" title="조직도:전략기획본부" alt="기획팀" href="#t4"> <!-- 기획팀 -->
                                    <area shape="rect" coords="2,697,116,739" title="조직도:전략기획본부" alt="소통협력팀"  href="#t5"> <!-- 소통협력팀  -->
                                    <area shape="rect" coords="2,764,116,800" title="조직도:전략기획본부" alt="아이티팀" href="#t6"> <!-- it팀 --> 
                                    <area shape="rect" coords="129,634,242,672" title="조직도:경영지원본부" alt="인재경영팀" href="#t1"> <!-- 인재경영팀  -->
                                    <area shape="rect" coords="130,697,243,735"  title="조직도:경영지원본부" alt="재무팀" href="#t2"> <!-- 재무팀 -->
                                    <area shape="rect" coords="129,762,242,799"  title="조직도:경영지원본부" alt="관리팀"  href="#t3"> <!-- 관리팀 -->
                                    <area shape="rect" coords="259,634,372,671" title="조직도:자원개발본부" alt="자원기획팀"  href="#t10"> <!-- 자원기획팀 -->
                                    <area shape="rect" coords="259,697,372,736" title="조직도:자원개발본부" alt="개인자원팀"  href="#t11"> <!-- 개인자원팀 -->
                                    <area shape="rect" coords="387,634,500,670" title="조직도:사회공헌본부" alt="법인사업1팀" href="#t12"> <!-- 법인사업1팀 -->
                                    <area shape="rect" coords="386,696,499,736" title="조직도:사회공헌본부" alt="법인사업2팀"  href="#t13"> <!--법인사업2팀  -->
                                    <area shape="rect" coords="517,635,629,672"  title="조직도:나눔사업본부" alt="배분기획팀"   href="#t14"> <!--배분기획팀 -->
                                    <area shape="rect" coords="515,697,628,736" title="조직도:나눔사업본부" alt="배분사업팀"  href="#t15"> <!--배분사업팀  -->
                                    <area shape="rect" coords="647,634,760,670" title="조직도:마케팅본부" alt="홍보기획팀" href="#t7"> <!--홍보기획팀 -->
                                    <area shape="rect" coords="647,697,760,736" title="조직도:마케팅본부" alt="미디어팀" href="#t8"> <!--미디어팀  -->
                                    <area shape="rect" coords="647,762,760,799" title="조직도:마케팅본부" alt="온라인팀" href="#t9"> <!--온라인팀  -->
                                    <area shape="rect" coords="775,570,888,608" title="조직도" alt="나눔문화연구소" href="#t16"> <!--나눔문화연구소  -->
                                    <area shape="rect" coords="904,569,1017,607" title="조직도"  alt="준법감사실" href="#t17"> <!--준법감사실  -->
                                </map>
                                <ul class="base-skip hidden">
					            <li>명예회장</li>
					            <ul>
					                <li>회장
					                    <ul>
					                        <li>나눔문화연구소</li>
					                        <li>준법감사실</li>
					                    </ul>
					                    </>
					                <li>사무총장
					                    <ul>
					                        <li>전략기획본부
					                            <ul>
					                                <li>기획팀</li>
					                                <li>소통협력팀</li>
					                                <li>IT팀</li>
					                            </ul>
					                        </li>
					                        <li>경영지원본부
					                            <ul>
					                                <li>인재경영팀</li>
					                                <li>재무팀</li>
					                                <li>관리팀</li>
					                            </ul>
					                        </li>
					                        <li>자원개발본부
					                            <ul>
					                                <li>자원기획팀</li>
					                                <li>개인자원팀</li>
					                            </ul>
					                        </li>
					                        <li>사회공헌본부
					                            <ul>
					                                <li>법인사업1팀</li>
					                                <li>법인사업2팀</li>
					                            </ul>
					                        <li>나눔사업본부
					                            <ul>
					                                <li>배분기획팀</li>
					                                <li>배분사업팀</li>
					                            </ul>
					                        </li>
					                        <li>마케팅본부
					                            <ul>
					                                <li>홍보기획팀</li>
					                                <li>미디어팀</li>
					                                <li>온라인팀</li>
					                            </ul>
					                        </li>
					                    </ul>
					                </li>
					            </ul>
					            <ul>
					                <li>운영위원회</li>
					                <li>분과실행위원회</li>
					            </ul>
					            <ul>
					                <li>감사</li>
					                <li>분과실행위원회</li>
					            </ul>
					        </ul>
                            </div>

                            <h4 class="title-heading_a mg-t-l" id ="t1" >경영지원본부[인재경영팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">본부장 정회영</dt>
                                    <dd class="fake-table-td">
                                        <p>경영지원본부 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3003</p>
                                       <!--  <p><i class="sprite-group-mail"></i>hanbull7@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">팀장 김미경</dt>
                                    <dd class="fake-table-td">
                                        <p>인재경영팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3016</p>
                                       <!--  <p><i class="sprite-group-mail"></i>gswkim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 손석훈</dt>
                                    <dd class="fake-table-td">
                                        <p>인사(승진승급,근무평정 등), 직원교육</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3027</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ssh8974@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 김보라</dt>
                                    <dd class="fake-table-td">
                                        <p>급여, 수당, 퇴직금</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3024</p>
                                        <!-- <p><i class="sprite-group-mail"></i>bora29@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 주미진</dt>
                                    <dd class="fake-table-td">
                                        <p>채용, 직원복리후생</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3017</p>
                                        <!-- <p><i class="sprite-group-mail"></i>mijin5@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id ="t2">경영지원본부[재무팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 유은경</dt>
                                    <dd class="fake-table-td">
                                        <p>재무팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3020</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yooek@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김현진</dt>
                                    <dd class="fake-table-td">
                                        <p>공익법인 결산 및 공시업무, 지출전표 검토, 재무제표 시스템 구축관련 업무</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3023</p>
                                       <!--  <p><i class="sprite-group-mail"></i>khj8554@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김민철</dt>
                                    <dd class="fake-table-td">
                                        <p>재원운용,  ERP 시스템 운영</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3018</p>
                                        <!-- <p><i class="sprite-group-mail"></i>minddori@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 최유미</dt>
                                    <dd class="fake-table-td">
                                        <p>결산, 지출, 전세지원자금관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3015</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yumi1108@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 배문주</dt>
                                    <dd class="fake-table-td">
                                        <p>세무, 법인카드, 펌뱅킹</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3023</p>
                                        <!-- <p><i class="sprite-group-mail"></i>minddori@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id ="t3">경영지원본부[관리팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 조진호</dt>
                                    <dd class="fake-table-td">
                                        <p>관리팀 총괄(이사회)</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3010</p>
                                       <!--  <p><i class="sprite-group-mail"></i>chotajo@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">과장 함주안</dt>
                                    <dd class="fake-table-td">
                                        <p>정보보안 기획, 개인정보보호 관리, 보안시스템 운영</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3012</p>
                                        <!-- <p><i class="sprite-group-mail"></i>juanh28@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김정민</dt>
                                    <dd class="fake-table-td">
                                        <p>임원 수행, 업무용차량관리, 문서관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3021</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kjmjnr@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 홍선주</dt>
                                    <dd class="fake-table-td">
                                        <p>임원 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3022</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hong@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 나종현</dt>
                                    <dd class="fake-table-td">
                                        <p>계약, 건물 및 재물관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3013</p>
                                        <!-- <p><i class="sprite-group-mail"></i>naaaajh@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 김한얼</dt>
                                    <dd class="fake-table-td">
                                        <p>대관(회의시설) 및 총무</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3011</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hekim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            
                            <h4 class="title-heading_a mg-t-m"  id ="t4">전략기획본부[기획팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">본부장 김효진</dt>
                                    <dd class="fake-table-td">
                                        <p>전략기획본부 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3060</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hyojin@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">팀장 김윤구</dt>
                                    <dd class="fake-table-td">
                                        <p>기획팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3063</p>
                                      <!--   <p><i class="sprite-group-mail"></i>yungu@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 황은진</dt>
                                    <dd class="fake-table-td">
                                        <p>조직평가, 위원회 및 회규 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3064</p>
                                        <!-- <p><i class="sprite-group-mail"></i>eunjin@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 허담</dt>
                                    <dd class="fake-table-td">
                                        <p>사업기획, 모니터링, 경영공시</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3058</p>
                                       <!--  <p><i class="sprite-group-mail"></i>myhhdd123@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 이희선</dt>
                                    <dd class="fake-table-td">
                                        <p>사업계획 및 예산 수립</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3068</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hs.lee@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id ="t5">전략기획본부[소통협력팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 김진곤</dt>
                                    <dd class="fake-table-td">
                                        <p>소통협력팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3062</p>
                                        <!-- <p><i class="sprite-group-mail"></i>gonnykim@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">과장 김희정</dt>
                                    <dd class="fake-table-td">
                                        <p>시민단체, 유관단체 및 시민참여 협력업무</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3061</p>
                                       <!--  <p><i class="sprite-group-mail"></i>wildling@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 박동욱</dt>
                                    <dd class="fake-table-td">
                                        <p>정부·국회 협력, 나눔 관련 정책 개발</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3066</p>
                                        <!-- <p><i class="sprite-group-mail"></i>penny1981@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 오진영</dt>
                                    <dd class="fake-table-td">
                                        <p>민간기관 소통·협력, 국제협력</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3059</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jinoh@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id ="t6">전략기획본부[IT 팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 신상욱</dt>
                                    <dd class="fake-table-td">
                                        <p>정보시스템 운영관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3065</p>
                                        <!-- <p><i class="sprite-group-mail"></i>phoenix@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">차장 배규식</dt>
                                    <dd class="fake-table-td">
                                        <p>정보시스템 운영관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3069</p>
                                        <!-- <p><i class="sprite-group-mail"></i>phoenix@chest.or.kr</p> -->
                                    </dd>
                                </dl> 
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 이상아</dt>
                                    <dd class="fake-table-td">
                                        <p>정보시스템 운영관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3067</p>
                                       <!--  <p><i class="sprite-group-mail"></i>ivorysea@chest.or.kr</p> -->
                                    </dd>
                                </dl> 
                            </div>
                           <h4 class="title-heading_a mg-t-m" id ="t7">마케팅본부[홍보기획팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                <dt class="fake-table-th">본부장 김누리</dt>
                                    <dd class="fake-table-td">
                                        <p>마케팅본부 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3120</p>
                                        <!-- <p><i class="sprite-group-mail"></i>noori@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">팀장 이윤나</dt>
                                    <dd class="fake-table-td">
                                        <p>홍보기획팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3080</p>
                                        <!-- <p><i class="sprite-group-mail"></i>candy@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 임지은</dt>
                                    <dd class="fake-table-td">
                                        <p>마케팅 전략기획, 인쇄물, 연말캠페인 </p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3035</p>
                                        <!-- <p><i class="sprite-group-mail"></i>je7280@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 최보람</dt>
                                    <dd class="fake-table-td">
                                        <p>나눔공모전, 나눔체험관, 홍보물품 </p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3034</p>
                                        <!-- <p><i class="sprite-group-mail"></i>choibr0530@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 최영인</dt>
                                    <dd class="fake-table-td">
                                        <p>행사 이벤트, 지회 소통 지원 </p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3035</p>
                                        <!-- <p><i class="sprite-group-mail"></i>je7280@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                           <h4 class="title-heading_a mg-t-m" id ="t8">마케팅본부[미디어팀]</h4>	
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                <dt class="fake-table-th">팀장 손세은</dt>
                                    <dd class="fake-table-td">
                                        <p>미디어팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3036</p>
                                        <!-- <p><i class="sprite-group-mail"></i>prson@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 홍지선</dt>
                                    <dd class="fake-table-td">
                                        <p>광고, 방송</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3264</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jshong@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 연두환</dt>			
                                    <dd class="fake-table-td">
                                        <p>언론 대응, 공동캠페인(신문, 방송)</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3031</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ydh144@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id="t9">마케팅본부[온라인팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 이장희</dt>
                                    <dd class="fake-table-td">
                                        <p>온라인팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3037</p>
                                       <!--  <p><i class="sprite-group-mail"></i>janghee@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 한소연</dt>			
                                    <dd class="fake-table-td">
                                        <p>홈페이지, 온라인 콘텐츠, 웹디자인</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3039</p>
                                       <!--  <p><i class="sprite-group-mail"></i>soomom83@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김지수</dt>
                                    <dd class="fake-table-td">
                                        <p>SNS, 유튜브, 카카오톡 플러스친구</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3033</p>
                                       <!--  <p><i class="sprite-group-mail"></i>jisoo1002@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 서정애</dt>			
                                    <dd class="fake-table-td">
                                        <p>크라우드 펀딩, 블로그, 서포터즈, 기관방문</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3038</p>
                                       <!--  <p><i class="sprite-group-mail"></i>sja0727@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>   
                            
                            <h4 class="title-heading_a mg-t-m" id="t10">자원개발본부[자원기획팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">본부장 신혜영</dt>			
                                    <dd class="fake-table-td">
                                        <p>자원개발본부 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3005</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jjeja@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">팀장 장원석</dt>
                                    <dd class="fake-table-td">
                                        <p>기획팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3121</p>
                                        <!-- <p><i class="sprite-group-mail"></i>1010jws@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 이주희</dt>	
                                    <dd class="fake-table-td">
                                        <p>모금사업기획, 회의체 운영, 집중모금캠페인 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3123</p>
                                       <!--  <p><i class="sprite-group-mail"></i>judy@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김초희</dt>		
                                    <dd class="fake-table-td">
                                        <p>개인기부활성화(소다수캠페인, 착한가게, 나눔리더 등), 나눔봉사단 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3083</p>
                                       <!--  <p><i class="sprite-group-mail"></i>chkim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김영천</dt>				
                                    <dd class="fake-table-td">
                                        <p>기부자관리, 기부자포상</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3082</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yckim@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 이수민</dt>
                                    <dd class="fake-table-td">
                                        <p>기부자관리, 통계관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3084</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kang@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id="t11">자원개발본부[개인자원팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 왕승연</dt>			
                                    <dd class="fake-table-td">
                                        <p>개발팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3122</p>
                                       <!--  <p><i class="sprite-group-mail"></i>king3262@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김홍경</dt>			
                                    <dd class="fake-table-td">
                                        <p>고액기부 개발, 한국형 기부자맞춤기금 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3081</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hkyung0322@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김별지</dt>			
                                    <dd class="fake-table-td">
                                        <p>고액기부 개발, 아너 소사이어티 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3124</p>
                                       <!--  <p><i class="sprite-group-mail"></i>kimbj@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김민기</dt> 			
                                    <dd class="fake-table-td">
                                        <p>방송모금 및 이벤트 모금 및 배분</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3176</p>
                                       <!--  <p><i class="sprite-group-mail"></i>mkkim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 엄지혜</dt>						
                                    <dd class="fake-table-td">
                                        <p>온라인 모금 및 배분</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3087</p>
                                       <!--  <p><i class="sprite-group-mail"></i>969096@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 이희서</dt>			
                                    <dd class="fake-table-td">
                                        <p>정기, 비정기 모금 및 배분</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3085</p>
                                       <!--  <p><i class="sprite-group-mail"></i>heeso2@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김그림</dt>
                                    <dd class="fake-table-td">
                                        <p>- 방송 및 온라인 배분, 기타 개인모금</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3155</p>
                                      <!--   <p><i class="sprite-group-mail"></i>pickim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>                            
                            <h4 class="title-heading_a mg-t-m" id="t12">사회공헌본부[법인사업 1팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">본부장 김경희</dt>
                                    <dd class="fake-table-td">
                                        <p>사회공헌본부 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3008</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ision73@chest.or.kr</p> -->
                                    </dd>
                                     <dt class="fake-table-th">팀장 송정민</dt>			
                                    <dd class="fake-table-td">
                                        <p>법인사업1팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3151</p>
                                        <!-- <p><i class="sprite-group-mail"></i>nocarrot@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">과장 박문진</dt>
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3072</p>
                                       <!--  <p><i class="sprite-group-mail"></i>dreamer365@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김이은</dt>
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3153</p>
                                       <!--  <p><i class="sprite-group-mail"></i>kgkee3@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 노경산</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3077</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ksno@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 강지현</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3157</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jhk@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 권미리</dt>
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3089</p>
                                        <!-- <p><i class="sprite-group-mail"></i>already@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 문소희</dt>	
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3152</p>
                                        <!-- <p><i class="sprite-group-mail"></i>sh2525@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김예손</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3094</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yesonkim@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 강소희</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3074</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yesonkim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id="t13">사회공헌본부[법인사업 2팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 한상춘</dt>
                                    <dd class="fake-table-td">
                                        <p>법인사업2팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3046</p>
                                        <!-- <p><i class="sprite-group-mail"></i>choonwow@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김도헌</dt>
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3156</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kimdh@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 양효은</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3078</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hyoeun@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 홍지원</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3154</p>
                                       <!--  <p><i class="sprite-group-mail"></i>plutus86@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 이재정</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3159</p>
                                        <!-- <p><i class="sprite-group-mail"></i>friendlee13@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 이지현</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3074</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jhlee@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 이승희</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3079</p>
                                       <!--  <p><i class="sprite-group-mail"></i>shee216@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 함성아</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3047</p>
                                        <!-- <p><i class="sprite-group-mail"></i>lsk@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김가빈</dt>			
                                    <dd class="fake-table-td">
                                        <p>- 기업사회공헌</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3073</p>
                                        <!-- <p><i class="sprite-group-mail"></i>lsk@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>                        
                            <h4 class="title-heading_a mg-t-m" id="t14">나눔사업본부[배분기획팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">본부장 박흥철</dt>	
                                    <dd class="fake-table-td">
                                        <p>나눔사업본부 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3006</p>
                                        <!-- <p><i class="sprite-group-mail"></i>phc@chest.or.kr	</p> -->
                                    </dd>
                                    <dt class="fake-table-th">팀장 이영주</dt>			
                                    <dd class="fake-table-td">
                                        <p>기획팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3045</p>
                                       <!--  <p><i class="sprite-group-mail"></i>yjlee@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">과장 안은숙</dt>			
                                    <dd class="fake-table-td">
                                        <p>배분관련 제도개선 및 시스템 개선, 배분기준 수립, 신규 일반사업 기획</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3266</p>
                                       <!--  <p><i class="sprite-group-mail"></i>anshin81@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 류세희</dt>			
                                    <dd class="fake-table-td">
                                        <p>신규 혁신사업 기획,  19년 전국기획사업 지원, 지회평가/지회배분전출금지원	</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3088</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yousay@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 고성은</dt>
                                    <dd class="fake-table-td">
                                        <p>신규 혁신사업 기획, 배분분과실행위원회 운영 지원, 사회성과보상사업 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3044</p>
                                        <!-- <p><i class="sprite-group-mail"></i>seko@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 최정은</dt>			
                                    <dd class="fake-table-td">
                                        <p>19년 기획사업 시범사업 운영 및 본사업 기획, 일반사업 기획 지원</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3262</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jchoi@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id="t15">나눔사업본부[배분사업팀]</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 한지선</dt>	
                                    <dd class="fake-table-td">
                                        <p>사업팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3131</p>
                                       <!--  <p><i class="sprite-group-mail"></i>bnw942@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 유은혜</dt>			
                                    <dd class="fake-table-td">
                                        <p>나눔과꿈</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3132</p>
                                        <!-- <p><i class="sprite-group-mail"></i>karis39@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김영빈</dt>			
                                    <dd class="fake-table-td">
                                        <p>국제보건의료지원사업, 북한 지원사업, 소위원회 운영</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3136</p>
                                        <!-- <p><i class="sprite-group-mail"></i>binch007@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김승재</dt>	
                                    <dd class="fake-table-td">
                                        <p>복권기금사업 기획/실행</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3134</p>
                                        <!-- <p><i class="sprite-group-mail"></i>tmdwo720@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 허윤주</dt>			
                                    <dd class="fake-table-td">
                                        <p>긴급지원사업, 2019 전국기획사업, 전세자금 지원사업, 배분차량관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3133</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hyeju@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 조주혜</dt>	
                                    <dd class="fake-table-td">
                                        <p>배분사업관리시스템(CICS), 온라인배분시스템 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3135</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jojuhye12@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 이혜미</dt>			
                                    <dd class="fake-table-td">
                                        <p>나눔과꿈 사업관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3137</p>
                                        <!-- <p><i class="sprite-group-mail"></i>seook0213@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 신주희</dt>	
                                    <dd class="fake-table-td">
                                        <p>나눔과꿈 사업관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3138</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jhshin@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>					


                            <h4 class="title-heading_a mg-t-m" id="t16">나눔문화연구소</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">소장 노진선</dt>
                                    <dd class="fake-table-td">
                                        <p>나눔문화연구소 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3190</p>
                                        <!-- <p><i class="sprite-group-mail"></i>rohstel@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">책임연구원 박미희</dt>
                                    <dd class="fake-table-td">
                                        <p>연구과제 수행</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3191</p>
                                        <!-- <p><i class="sprite-group-mail"></i>parkmh@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">책임연구원 김소영</dt>
                                    <dd class="fake-table-td">
                                        <p>연구과제 수행</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3195</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kimsoy104@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">연구원 유재윤</dt>
                                    <dd class="fake-table-td">
                                        <p>연구과제 수행, 각종 회의자료, 연구소 예산</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3197</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jaeyun@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">연구원 오양래</dt>
                                    <dd class="fake-table-td">
                                        <p>연구과제 수행, 타부서 및 외부 요청자료</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3196</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yroh@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">연구원 이하은</dt>
                                    <dd class="fake-table-td">
                                        <p>연구과제 수행</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3090</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jaeyun@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m" id="t17">준법감시실</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">실장 이경아</dt>
                                    <dd class="fake-table-td">
                                        <p>준법감시실 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3140</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kalee@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">차장 김은정</dt>
                                    <dd class="fake-table-td">
                                        <p>복무점검, 외부감사수감 및 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3141</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ejk821@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">과장 이수철</dt>
                                    <dd class="fake-table-td">
                                        <p>공익신고, 시민참여위원회, 청렴교육</p>
                                        <p><i class="sprite-group-tel"></i>02-6262-3142</p>
                                        <!-- <p><i class="sprite-group-mail"></i>sucheul@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </section>
                    <!-- E : 조직도 -->
                    <!-- S : 명예회장 -->
                    <section class="ui-tab-pnl" id ="pnl1">
                        <div class="tab-contents">
                            <div class="person-area">
                                <div class="person-item">
                                    <div class="person-col-tit">
                                        <p class="person-position">명예회장</p>
                                        <p class="person-time">2019.01 ~ 현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt="김정숙 명예회장님 사진"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">김정숙</p>
                                        <p class="person-txt">“나눔은 마음의 곳간을 기쁨으로 채웁니다.<br>나눔은 세상의 그늘을 환하게 밝힙니다.<br>나눔은 너와 내가 함께 받는 행복에의 초대장입니다”</p>
                                    </div>
                                </div>
                                <div class="btn-area mg-t-l">
                                    <a href="javascript:;" class="btn-base-imp" id="btnGoMove">역대명예회장</a>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E : 명예회장 -->
                    <!-- S : 회장 -->
                    <section class="ui-tab-pnl" id ="pnl2">
                        <div class="tab-contents">
                            <div class="person-area">
                                <div class="person-item">
                                    <div class="person-col-tit">
                                        <p class="person-position">제9대 회장</p>
                                        <p class="person-time">2018.06 ~ 현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman2.jpg" alt="예종석 회장님 사진"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">예종석</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[주요 약력]</p>
                                            <dl class="person-profile-item">
                                                <dt>1953</dt>
                                                <dd>부산 출생<br>캘리포니아 주립 대학교 경제학 학사<br>인디애나대학교 대학원 경제학 석사/ 경영학 석사<br>인디애나대학교 대학원 경영학 박사</dd>
                                                <dt>2007~</dt>
                                                <dd>영도육영회 이사장</dd>
                                                <dt>2014~</dt>
                                                <dd>십시일밥 이사장</dd>
                                                <dt>2016 ~</dt>
                                                <dd>학교법인 국민학원 이사</dd>
                                                <dt>2014 ~</dt>
                                                <dd>소비자와 함께 공동대표</dd>
                                                <dt>2012 ~</dt>
                                                <dd>따뜻한재단 이사</dd>
                                                <dt>2007 ~ 2011</dt>
                                                <dd>한양대학교 경영대학학장 및 경영전문대학원장</dd>
                                                <dt>2012 ~ 2017.02</dt>
                                                <dd>아름다운재단 이사장</dd>
                                                <dt>2012 ~ 2017</dt>
                                                <dd>루트임팩트 이사장</dd>
                                                <dt>2013 ~ 2017</dt>
                                                <dd>나눔국민운동본부 공동대표</dd>
                                                <dt>2005 ~ 2008</dt>
                                                <dd>대한적십자사 총재특별보좌역</dd>
                                                <dt>2012</dt>
                                                <dd>국가인권위원회 정책자문위원</dd>
                                                <dt>2004 ~ 2008</dt>
                                                <dd>아름다운재단 기부문화연구소 소장</dd>
                                                <dt>2009 ~ 2011</dt>
                                                <dd>학교법인 이화예술학원 이사</dd>
                                                <dt>1998 ~ 2000</dt>
                                                <dd>한국소비자학회 회장</dd>
                                                <dt>2013 ~ 2014</dt>
                                                <dd>한국미래전략학회 회장</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-area mg-t-l">
                                    <a href="javascript:;" class="btn-base-imp" id="btnGoMove">역대회장</a>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E : 회장 -->
                    <!-- S : 사무총장 -->
                    <section class="ui-tab-pnl" id ="pnl3">
                        <div class="tab-contents">
                            <div class="person-area">
                                <div class="person-item">
                                    <div class="person-col-tit">
                                        <p class="person-position">사무총장</p>
                                        <p class="person-time">2018.02 ~ 현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman3.jpg" alt="김연순 사무총장님 사진"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">김연순</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[주요 약력]</p>
                                            <dl class="person-profile-item">
                                                <dt>1964</dt>
                                                <dd>출생</dd>
                                                <dt>1987</dt>
                                                <dd>상명여자대학교 사학과 학사</dd>
                                                <dt>2007</dt>
                                                <dd>경희대학교 NGO대학원 시민사회학 석사</dd>
                                                <dt>2010</dt>
                                                <dd>서울사이버대학교 사회복지학과</dd>
                                                <dt>1999~2002</dt>
                                                <dd>서울동북여성민우회 대표</dd>
                                                <dt>2007~2010</dt>
                                                <dd>한국여성민우회생협 이사장</dd>
                                                <dt>2011~2012</dt>
                                                <dd>행복중심생협연합회 회장</dd>
                                                <dt>2014~2016</dt>
                                                <dd>한국여성민우회 이사</dd>
                                                <dt>2003~2004</dt>
                                                <dd>환경부 중앙환경보전자문위원회 위원</dd>
                                                <dt>2007~2008</dt>
                                                <dd>대통령직속 농어업 농어촌특별대책위원회 위원</dd>
                                                <dt>2008~2011</dt>
                                                <dd>환경농업단체연합회 부회장</dd>
                                                <dt>2012.11~2016.3</dt>
                                                <dd>서울시녹색서울시민위원회 위원</dd>
                                                <dt>2015~2016</dt>
                                                <dd>서울시 여성명예부시장</dd>
                                                <dt>2015~2018.2</dt>
                                                <dd>(협)행복중심협동조합지원센터 이사장</dd>
                                                <dt>2014~2017</dt>
                                                <dd>한국여성재단 운영위원</dd>
                                                <dt>2011~2018.2</dt>
                                                <dd>아름다운재단 배분위원</dd>
                                                <dt>2016~2017</dt>
                                                <dd>도봉구 지속가능발전위원회 위원장</dd>
                                                <dt>2015~2018.3</dt>
                                                <dd>서울시 마을공동체위원회 부위원장</dd>
                                                <dt>2016~2018.3</dt>
                                                <dd>서울시 성평등위원회 위원</dd>
                                                <dt>2017.12~2018.3</dt>
                                                <dd>대통령직속 정책기획위원회 위원</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-area mg-t-l">
                                    <a href="javascript:;" class="btn-base-imp" id="btnGoMove">역대사무총장</a>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E : 사무총장 -->
                    <!-- S : 이사회 -->
                    <section class="ui-tab-pnl" id ="pnl4">
                        <div class="tab-contents">
                            <div class="tb-type_c mg-t-m">
                                <table summary="회장">
                                    <caption>회장 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">회장</th>
                                        <td class="td-point">예종석</td>
                                        <td>사회복지공동모금회 회장 </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table summary="부회장">
                                    <caption>부회장 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="3" class="no-line">부회장</th>
                                        <td class="td-point">문형구</td>
                                        <td>고려대학교 경영대학 명예교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">이연배</td>
                                        <td>서울YWCA 명예이사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">최신원</td>
                                        <td>SK네트웍스(주) 대표이사 회장</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="wide-scroll members">
                                    <table summary="이사">
                                        <caption>이사 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="9" class="no-line">이사</th>
                                            <td class="td-point">권태선</td>
                                            <td>환경운동연합 공동대표</td>
                                            <td class="td-point">신헌철</td>
                                            <td>신한회계법인 상임고문</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김연순</td>
                                            <td>사회복지공동모금회 사무총장</td>
                                            <td class="td-point">양옥경</td>
                                            <td>이화여자대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">우태희</td>
                                            <td>대한상공회의소 상근부회장</td>
                                            <td class="td-point">김지형</td>
                                            <td>법무법인 지평 대표변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">유영학</td>
                                            <td>법무법인 율촌 고문</td>
                                            <td class="td-point">윤정숙</td>
                                            <td>시민사회단체연대회의 공동대표</td>
                                        </tr>
                                            <td class="td-point">김희중</td>
                                            <td>천주교 광주대교구 교구장</td>
                                            <td class="td-point">남중수</td>
                                            <td>서울대학교 산업대학원 객원교수</td>
                                        <tr>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박용준</td>
                                            <td>글로벌케어 회장</td>
                                            <td class="td-point">방하남</td>
                                            <td>국민대학교 행정대학원 석좌교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이태수</td>
                                            <td>꽃동네대학교 사회복지학부 교수</td>
                                            <td class="td-point">황창순</td>
                                            <td>순천향대학교 교학부총장 </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <table summary="감사">
                                    <caption>감사 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="2" class="no-line">감사</th>
                                        <td class="td-point">이정희</td>
                                        <td>딜로이트 안진회계법인 상임고문</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">윤영선</td>
                                        <td>법무법인 광장 상임고문</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                    <!-- E : 이사회 -->
                    <!-- S : 분과실행위원회 -->
                    <section class="ui-tab-pnl"  id ="pnl5">
                        <div class="tab-contents">
                            <h4 class="title-heading_a mg-t-m">중앙회 기획분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table>
                                        <caption><p>중앙회 기획분과 실행위원 정보입니다.</p></caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody> 
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">유영학</td>
                                            <td  colspan="3" >법무법인 율촌 고문</td>
                                        </tr> 
                                        <tr>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">이상경</td>
                                            <td colspan="3">현대리서치연구소 대표이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">성종규</td>
                                            <td colspan="3">법률사무소 오름 변호사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="9">위원</th>
                                            <td class="td-point">고경빈</td>
                                            <td>평화재단 연구위원장</td>
                                            <td class="td-point">기현주</td>
                                            <td>서울시 청년활동지원센터 센터장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김영수</td>
                                            <td>한국YMCA전국연맹 국장</td>
                                            <td class="td-point">김형용</td>
                                            <td>동국대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">남기철</td>
                                            <td>동덕여자대학교 사회복지학과 교수</td>
                                            <td class="td-point">박경수</td>
                                            <td>한양사이버대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박찬용</td>
                                            <td>휴먼앤컴퍼니노무법인<br/>
공인노무사(여의지사대표)</td>
                                            <td class="td-point">변영선</td>
                                            <td>삼일회계법인 비영리법인지원센터 센터장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">염형국</td>
                                            <td>공익인권법재단 공감 변호사</td>
                                            <td class="td-point">이경호</td>
                                            <td>사회적경제법센터 더함<br/>
대표변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이상용</td>
                                            <td>한양대학교 경영대학 교수</td>
                                            <td class="td-point">정애리</td>
                                            <td>국제한국입양인봉사회 회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조대식</td>
                                            <td>국제개발협력민간협의회 사무총장</td>
                                            <td class="td-point">최혜지</td>
                                            <td>서울여자대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">한상진</td>
                                            <td>방아골종합사회복지관 관장</td>
                                            <td class="td-point">한형준</td>
                                            <td>법무법인 세주로 변호사</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">중앙회 홍보분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table>
                                        <caption><p>중앙회 홍보분과 실행위원 정보입니다.</p></caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">권태선</td>
                                            <td  colspan="3" >환경운동연합 공동대표</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="9">위원</th>
                                            <td class="td-point">김병철</td>
                                            <td>한국필립모리스(주) 전무</td>
                                            <td class="td-point">박혜영</td>
                                            <td>MBC나눔 대표이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김찬석</td>
                                            <td>청주대학교 광고홍보학과 교수</td>
                                            <td class="td-point">성낙용</td>
                                            <td>한국케이블TV방송협회 콘텐츠국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이수진</td>
                                            <td>이노션월드와이드 국장</td>
                                            <td class="td-point">전종우</td>
                                            <td>단국대 커뮤니케이션학부 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">홍종선</td>
                                            <td>- 숭의여대 특임교수<br>
                                            - OBS부사장</td>
                                            <td class="td-point">이희정</td>
                                            <td>한국일보 미디어전략실장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김민아</td>
                                            <td>경향신문 논설위원</td>
                                            <td class="td-point">함석진</td>
                                            <td>前 NHN NEXT 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">육심나</td>
                                            <td >- 카카오 소셜임팩트 총괄이사<br>
                                            - 재단법인 카카오임팩트 사무국장</td>
                                            <td class="td-point">권오현</td>
                                            <td >-슬로워크<br>
                                            -빠띠 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">방은하</td>
                                            <td >HS애드 ECD(제작전문위원)</td>
                                            <td class="td-point">이광수</td>
                                            <td >SM C&C 본부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이범재</td>
                                            <td >(주)비케이아이디 대표</td>
                                            <td class="td-point">정철</td>
                                            <td >정철카피 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조소담</td>
                                            <td >닷페이스 대표</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">중앙회 모금분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table>
                                        <caption><p>중앙회 모금분과 실행위원 정보입니다.</p></caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">남중수</td>
                                            <td colspan="3">서울대학교 산업대학원 객원교수</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">부위원장</th>
                                            <td class="td-point">이종수</td>
                                            <td colspan="3">한국임팩트금융 대표</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="12">위원</th>
                                            <td class="td-point">권미영</td>
                                            <td>한국중앙자원봉사센터 센터장</td>
                                            <td class="td-point">김도영</td>
                                            <td>CSR포럼 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김성규</td>
                                            <td>재단법인 세종문화회관 사장</td>
                                            <td class="td-point">김진경</td>
                                            <td>한국케이블TV방송협회 기획홍보국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김한승</td>
                                            <td>성공회 푸드뱅크 대표</td>
                                            <td class="td-point">박란희</td>
                                            <td>더퍼블리카 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박바름</td>
                                            <td>SM엔터테인먼트 사회공헌 팀장</td>
                                            <td class="td-point">박창교</td>
                                            <td>중소기업미래경영원 이사장</td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="td-point">방대욱</td>
                                            <td>다음세대재단 대표</td>
                                            <td class="td-point">비케이안</td>
                                            <td>한국기부문화연구소 소장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서현선</td>
                                            <td>진저티 프로젝트 대표</td>
                                            <td class="td-point">신종익</td>
                                            <td>인터넷신문위원회 이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">양세영</td>
                                            <td>기업사회연구원 원장</td>
                                            <td class="td-point">은신애</td>
                                            <td>서울특별시 민관협력담당관</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이낙진</td>
                                            <td>자유일보 편집부장</td>
                                            <td class="td-point">이민영</td>
                                            <td>고려사이버대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이상신</td>
                                            <td>서울시립대 세무학과 교수</td>
                                            <td class="td-point">이상연</td>
                                            <td>한국신문협회 전문위원</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이선희</td>
                                            <td>휴먼트리 대표</td>
                                            <td class="td-point">전성률</td>
                                            <td>서강대 경영학부학장/서강대 경영전문대학원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">지은배</td>
                                            <td>한국노총 좋은친구 산업복지재단 본부장</td>
                                            <td class="td-point">지은용</td>
                                            <td>알파트너스㈜ 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">한정원</td>
                                            <td colspan="3">마크스폰 대표이사</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">중앙회 배분분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table>
                                        <caption><p>중앙회 배분분과 실행위원 정보입니다.</p></caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">이태수</td>
                                            <td colspan="3"> 꽃동네대학교 사회복지학부 교수</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">백은령</td>
                                            <td colspan="3"> 총신대학교 사회복지학과 교수</td>
                                        </tr>
										<tr>
                                            <td class="td-point">신명호</td>
                                            <td colspan="3">사회투자지원재단 사회적경제연구센터 소장</td>
                                        </tr>
										<!--
                                        <tr>
                                            <td class="td-point">송효석</td>
                                            <td colspan="3">삼성서울병원 사회공헌팀 부장</td>
                                        </tr> -->
                                        <tr>
                                            <th scope="row" rowspan="11">위원</th>
                                            <td class="td-point">고미경</td>
                                            <td>한국여성의전화 상임대표</td>
                                            <td class="td-point">권자영</td>
                                            <td>세명대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
											<td class="td-point">김녹영 </td>
                                            <td>대한상공회의소 지속가능경영센터장</td>
                                            <td class="td-point">김신열</td>
                                            <td>전북대학교 사회복지학과 교수</td>
                                           <!-- <td class="td-point">김용표</td>
                                            <td>한국국제개발협력센터 이사장<br/>전북대학교 산학협력단 산학겸임교수</td>-->
                                        </tr>
                                        <tr>
                                            <td class="td-point">김진석</td>
                                            <td>서울여자대학교 사회복지학과 교수</td>
                                            <td class="td-point">김혜경</td>
                                            <td>이화여자대학교 국제대학원 초빙교수<br/> 지구촌나눔운동 이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">민 앵</td>
                                            <td>한국의료복지사회적협동조합연합회 공동대표</td>
											<td class="td-point">심정영</td>
                                            <td>이랜드복지재단 국장</td>
                                        </tr>
                                        <tr>
                                            <!-- <td class="td-point">배복주</td>
                                            <td>장애여성공감 대표</td> -->
                                            <!-- <td class="td-point">송다영</td>
                                            <td>인천대학교 사회복지학과 교수</td> -->
                                            <td class="td-point">안인숙</td>
                                            <td>한국사회적경제연대회의 집행위원장</td>
											<td class="td-point">유서구</td>
                                            <td>숭실대학교 사회복지학부 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이경숙</td>
                                            <td>아시아재단 한국지부 사업본부장</td>
											<td class="td-point">이봉원</td>
                                            <td>한국자활연수원 자활역량강화센터장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이철수</td>
                                            <td>신한대학교 대학원 사회복지학과 교수</td>
											<td class="td-point">장숙랑</td>
                                            <td>중앙대학교 간호학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정익중 </td>
                                            <td>한국아동복지학회 회장<br/>이화여자대학교 사회복지학과 교수</td>
                                            <td class="td-point">최상미</td>
                                            <td>동국대학교 사회복지상담학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">허오영숙</td>
                                            <td colspan="3">한국이주여성인권센터 대표</td>
                                        </tr>
                                        <tr>
                                            
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- S : 분과실행위원회 -->
                </div>
            </div>
        </div>



    </div>
</main>
</div>
        
