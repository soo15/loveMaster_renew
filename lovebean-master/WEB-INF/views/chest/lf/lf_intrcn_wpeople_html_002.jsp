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

<script type="text/javascript">
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        
        goTabDisplay(0);

    });
    
    function goTabDisplay(obj){
        // 초기화 
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
            <div class="ui-tab ui-tab-type2 col-4 contents-tab" id="uiTabCCKI12_1">
                <div class="ui-tab-btns" btn-id="uiTabCCKI12_1">
                    <button type="button" class="ui-tab-btn" id ="btn0" onclick="javascript:goTabDisplay(0);"><i>조직도</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>회장</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn2" onclick="javascript:goTabDisplay(2);"><i>운영위원회</i></button>
                    <button type="button" class="ui-tab-btn" id ="btn3" onclick="javascript:goTabDisplay(3);"><i>분과실행위원회</i></button>
                    <!-- <button type="button" class="ui-tab-btn" id ="btn4" onclick="javascript:goTabDisplay(4);"><i>시민감시위원</i></button> -->
                </div>

                <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                    <!-- S : 조직도 -->
                    <section class="ui-tab-pnl" id ="pnl0">
                        <div class="tab-contents">
                            <div class="group-imgbox"><img src="/common/img/contents/group_img02.jpg" alt=""></div>
                            
                            <h4 class="title-heading_a mg-t-l">
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">김용희</dt>
                                    <dd class="fake-table-td">
                                        <p>서울지회 총괄</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yonghi@chest.or.kr	</p> -->
                                    </dd>
                                </dl>
                            </div>
                           			 
                            <h4 class="title-heading_a mg-t-l">경영지원팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 천부건</dt>
                                    <dd class="fake-table-td">
                                        <p>경영지원팀 업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0220</p>
                                        <!-- <p><i class="sprite-group-mail"></i>bugeon@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">과장 김언옥</dt>
                                    <dd class="fake-table-td">
                                        <p>위원회, 예산, 인사</p>
                                        <p><i class="sprite-group-tel"></i>02-3144-0415</p>
                                       <!--  <p><i class="sprite-group-mail"></i>crystal@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 신태섭</dt>
                                    <dd class="fake-table-td">
                                        <p>회계, 자원운용</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0496</p>
                                        <!-- <p><i class="sprite-group-mail"></i>sts4226@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 임균영</dt>
                                    <dd class="fake-table-td">
                                        <p>구매, 총무, 교육</p>
                                        <p><i class="sprite-group-tel"></i>02-323-7398</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kth0718@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 오은주</dt>
                                    <dd class="fake-table-td">
                                        <p>휴직중</p>
                                        <p><i class="sprite-group-tel"></i>-</p>
                                        <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                    </dd>
                                </dl>
                            </div>                          
                            
                            <h4 class="title-heading_a mg-t-m">자원개발팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 양호영</dt>
                                    <dd class="fake-table-td">
                                        <p>자원개발팀 업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0258</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yank@chest.or.kr</p> -->
                                    </dd>
                                    
                                    <dt class="fake-table-th">대리 김기광</dt>			
                                    <dd class="fake-table-td">
                                        <p>현물 모금 및 배분, 연말캠페인 관리, 예산 및 실적관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0452</p>
                                        <!-- <p><i class="sprite-group-mail"></i>pupple7979@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 권정만</dt>			
                                    <dd class="fake-table-td">
                                        <p>아너 소사이어티 개발/행사, 한국형 기부자 맞춤기금, 희망자산나눔. 유산기부, 모금분과실행위원회</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0167</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jigomany@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 이지은</dt>		
                                    <dd class="fake-table-td">
                                        <p>착한가게, 착한가정, 연합모금, 학교모금, 특별모금</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0391</p>
                                        <!-- <p><i class="sprite-group-mail"></i>lee@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 조해인</dt>
                                    <dd class="fake-table-td">
                                        <p>언론홍보, 온라인모금 및 마케팅, 기획/홍보분과실행위원회</p>
                                        <p><i class="sprite-group-tel"></i>02-3142-7701</p>
                                        <!-- <p><i class="sprite-group-mail"></i>chohi@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 주예은</dt>
                                    <dd class="fake-table-td">
                                        <p>아너 소사이어티 개발/행사, 회원 관리</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0158</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kk79011@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                   <dt class="fake-table-th">담당 김태형</dt>
                                    <dd class="fake-table-td">
                                        <p>기부자 관리, 개인정기기부개발, 모금수입(CMS, 이니시스등 포함)</p>
                                        <p><i class="sprite-group-tel"></i>02-3144-0101</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hongsy5787@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 조혜민</dt>
                                    <dd class="fake-table-td">
                                        <p>온라인 모금 및 홍보, SNS관리, 방송 및 언론모금, 대학생기자단 운영</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0072</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hongsy5787@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                 <dl class="fake-table-item">
                                     <dt class="fake-table-th">대리 허소담</dt>      
                                    <dd class="fake-table-td">
                                        <p>나눔리더/나눔리더스클럽, 이벤트모금, 모금함(지하철포함)모금, CMS 정기기부</p>
                                        <p><i class="sprite-group-tel"></i>02-323-3875</p>
                                        <!-- <p><i class="sprite-group-mail"></i>srkim@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 최지원</dt>
                                    <dd class="fake-table-td">
                                        <p>육아휴직</p>
                                        <p><i class="sprite-group-tel"></i>-</p>
                                        <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김소라</dt>      
                                    <dd class="fake-table-td">
                                        <p>청원휴직</p>
                                        <p><i class="sprite-group-tel"></i>-</p>
                                        <!-- <p><i class="sprite-group-mail"></i>srkim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            
                            			
			






                            <h4 class="title-heading_a mg-t-m">전략사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 방선진</dt>
                                    <dd class="fake-table-td">
                                        <p>전략사업팀 업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0302</p>
                                       <!--  <p><i class="sprite-group-mail"></i>yessunjin@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 임유진</dt>
                                    <dd class="fake-table-td">
                                        <p>CSR 모금/배분(일반), 나눔명문기업</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0190</p>
                                       <!--  <p><i class="sprite-group-mail"></i>yujin@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김범수</dt>			
                                    <dd class="fake-table-td">
                                        <p>CSR 모금/배분(보건), 착한소비, CSR아카데미 </p>
                                        <p><i class="sprite-group-tel"></i>02-6365-0001</p>
                                       <!--  <p><i class="sprite-group-mail"></i>kkstorm@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 안지빈</dt>
                                    <dd class="fake-table-td">
                                        <p>CSR 모금/배분(공공기관), 사회공헌 동반성장위원회</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0456</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jibin0216@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김종훈</dt>
                                    <dd class="fake-table-td">
                                        <p>CSR 모금/배분(건설, 기타), 기업 사회공헌 사례집 발간</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0326</p>
                                       <!--  <p><i class="sprite-group-mail"></i>jonghun@chest.or.kr	</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 박재신</dt>
                                    <dd class="fake-table-td">
                                        <p>CSR 모금/배분(금융 및 보험), 이슈별 스토리 펀딩</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0399</p>
                                       <!--  <p><i class="sprite-group-mail"></i>pakjs0215@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김유진</dt>
                                    <dd class="fake-table-td">
                                        <p>CSR 모금/배분(교육서비스, 운수, 기타), 대학생 CSR 서포터즈 운영</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0432</p>
                                       <!--  <p><i class="sprite-group-mail"></i>pakjs0215@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-m">지역사업팀</h4>
                            <div class="fake-table-box">
                               
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 최윤경</dt>
                                    <dd class="fake-table-td">
                                        <p>지역사업팀 업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0493</p>
                                        <!-- <p><i class="sprite-group-mail"></i>babyyoon@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">차장 류희숙</dt>
                                    <dd class="fake-table-td">
                                        <p>나눔네트워크사업, 지역 사회공헌 및 재단관리,강남구, 광진구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-323-4836</p>
                                        <!-- <p><i class="sprite-group-mail"></i>godcare@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김운현</dt>
                                    <dd class="fake-table-td">
                                        <p>나눔네트워크사업(위원회 관리 및 행사기획, 협의체 관리) 성동구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0283</p>
                                        <!-- <p><i class="sprite-group-mail"></i>pumpick@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김재훈</dt>
                                    <dd class="fake-table-td">
                                        <p>나눔봉사단 행사 및 지역관리, 구로구, 노원구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0504</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ijaehoon@chest.or</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김송은</dt>
                                    <dd class="fake-table-td">
                                        <p>강동구, 서초구, 동작구  담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6365-0004</p>
                                        <!-- <p><i class="sprite-group-mail"></i>soi@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 손차영</dt>
                                    <dd class="fake-table-td">
                                        <p>강남구, 광진구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0301</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ayoung@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th"> 담당 민다경</dt>
                                    <dd class="fake-table-td">
                                        <p>강서구, 은평구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6365-0003</p>
                                        <!-- <p><i class="sprite-group-mail"></i>dkmin@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 전호정</dt>
                                    <dd class="fake-table-td">
                                        <p>강북구, 용산구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0236</p>
                                       <!--  <p><i class="sprite-group-mail"></i>hojung@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                 <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 강승재</dt>
                                    <dd class="fake-table-td">
                                        <p>마포구 담당, 현물(관악, 강동, 구로, 금천, 노원, 동대문, 마포, 성북, 송파, 양천, 영등포, 용산, 종로, 중구, 중랑) 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0422</p>
                                       <!--  <p><i class="sprite-group-mail"></i>ksj@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 김효정</dt>
                                    <dd class="fake-table-td">
                                        <p>금천구, 송파구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0150</p>
                                        <!-- <p><i class="sprite-group-mail"></i>prayas@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 조주현</dt>
                                    <dd class="fake-table-td">
                                        <p>서대문구 담당, 현물(강남구, 강북구, 광진구, 도봉구, 동작구,  서대문구, 서초구, 은평구, 성동구, 강서구) 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0182</p>
                                        <!-- <p><i class="sprite-group-mail"></i>yurim@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 하은성 </dt>
                                    <dd class="fake-table-td">
                                        <p>영등포구, 양천구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0149</p>
                                        <!-- <p><i class="sprite-group-mail"></i>guszmzm@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 송인영</dt>
                                    <dd class="fake-table-td">
                                        <p>성북구, 중구, 동대문구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0529</p>
                                        <!-- <p><i class="sprite-group-mail"></i>dlwltn033@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 박지은 </dt>
                                    <dd class="fake-table-td">
                                        <p>관악구, 도봉구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0301</p>
                                        <!-- <p><i class="sprite-group-mail"></i>guszmzm@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 최서영</dt>
                                    <dd class="fake-table-td">
                                        <p>정기모금수입, 학원수강권, 종로구, 중랑구 담당</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0291</p>
                                        <!-- <p><i class="sprite-group-mail"></i>dlwltn033@chest.or.kr</p> -->
                                    </dd>
                                   
                                </dl>
                               
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 이재은</dt>
                                    <dd class="fake-table-td">
                                        <p>육아휴직</p>
                                        <p><i class="sprite-group-tel"></i>-</p>
                                        <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 손차영</dt>
                                    <dd class="fake-table-td">
                                        <p>육아휴직</p>
                                        <p><i class="sprite-group-tel"></i>-</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ayoung@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            
                            <h4 class="title-heading_a mg-t-m">배분사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 강성훈</dt>		
                                    <dd class="fake-table-td">
                                        <p>배분사업팀 업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0334</p>
                                        <!-- <p><i class="sprite-group-mail"></i>goodk@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 박현진</dt>
                                    <dd class="fake-table-td">
                                        <p>기획사업(기초복지, 소규모 지원), 정기평가, 평가지원단 관리, 사업계획/예산, 자금계획</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0082</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hyeonjin@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 곽난영</dt>			
                                    <dd class="fake-table-td">
                                        <p>기부자조언기금, 배분위, 기획사업(지원주택, 신규)</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0477</p>
                                        <!-- <p><i class="sprite-group-mail"></i>nan22ppo@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 이진희</dt>	
                                    <dd class="fake-table-td">
                                        <p>신청사업(18년), 기획사업(종사자위기대응, 정신장애인사회적응),아너 지정기탁, 특별모금 전입금 배분</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0490</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ljh@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 서유미</dt>		
                                    <dd class="fake-table-td">
                                        <p>신청사업(21년), 기획사업(사회적돌봄강화, 위기임신출산, 소액대출), 특별모금배분</p>
                                        <p><i class="sprite-group-tel"></i>02-323-7399	</p>
                                        <!-- <p><i class="sprite-group-mail"></i>tjdbal84@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 조은수</dt>			
                                    <dd class="fake-table-td">
                                        <p>복권기금사업, 회계법인관리, 차량관리, 긴급지원</p>
                                        <p><i class="sprite-group-tel"></i>02-6053-0295</p>
                                        <!-- <p><i class="sprite-group-mail"></i>2sungae@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 김유천</dt>
                                    <dd class="fake-table-td">
                                        <p>신청사업(20년), 기획사업(연합모금, 조식지원), 나눔리더,재난적의료비</p>
                                        <p><i class="sprite-group-tel"></i>02-6365-0002</p>
                                        <!-- <p><i class="sprite-group-mail"></i>saemyi2@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
    
                        </div>
                    </section>
                    <!-- E : 조직도 -->
                    <!-- S : 회장 -->
                    <section class="ui-tab-pnl" id ="pnl1">
                        <div class="tab-contents">
                            <div class="person-area">
                                <div class="person-item">
                                    <div class="person-col-tit">
                                        <p class="person-position">제9대 회장</p>
                                        <p class="person-time">2017.01 ~ 현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_02.jpg" alt="윤영석 프로필 이미지"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">윤영석</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[주요 약력]</p>
                                            <dl class="person-profile-item">
                                                <dt>1938</dt>
                                                <dd>
                                                    서울 출생<br>
                                                    서울대학교 경제학과 학사<br>
                                                    미국 스탠퍼드대 AMP과정 수료<br>
                                                    샌프란시스코주립대학교 대학원 경영학 석사
                                                </dd>
                                                <dt>1977 ~ 1980</dt>
                                                <dd>대우실업 전무 이사</dd>
                                                <dt>1980 ~ 1985</dt>
                                                <dd>대우중공업 대표이사 사장</dd>
                                                <dt>1983 ~ 1985</dt>
                                                <dd>한국공작기계공업협회 회장</dd>
                                                <dt>1985 ~ 1987</dt>
                                                <dd>대우조선공업 대표이사 사장</dd>
                                                <dt>1994 ~ 1997</dt>
                                                <dd>산업디자인포장개발원 이사</dd>
                                                <dt>1995 ~ 1997</dt>
                                                <dd>대우그룹 총괄 회장</dd>
                                                <dt>1996 ~ 1997</dt>
                                                <dd>국제산업디자인대학원 초대 이사장</dd>
                                                <dt>2001 ~ 2002</dt>
                                                <dd>두산중공업 대표이사 사장</dd>
                                                <dt>2002 ~ 2009</dt>
                                                <dd>두산중공업 부회장</dd>
                                                <dt>2009 ~</dt>
                                                <dd>두산중공업 고문</dd>
                                                <dt>2003 ~ 2009</dt>
                                                <dd>한국플랜트산업협회 회장(1대, 2대)</dd>
                                                <dt>2014 ~ 2015</dt>
                                                <dd>한국로타리장학문화재단 이사장</dd>
                                                <dt>2014 ~ 2018</dt>
                                                <dd>국제로타리재단 이사</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
<!--                                 <div class="btn-area mg-t-l"> -->
<!--                                     <a href="javascript:;" class="btn-base-imp" id="btnGoMove">역대회장</a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </section>
                    <!-- E : 회장 -->
                    <!-- S : 운영위원회 -->
                    <section class="ui-tab-pnl" id ="pnl2">
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
                                        <td class="td-point">윤영석</td>
                                        <td>국제로타리재단 이사</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="no-line">부회장<br>/<br>모금분과실행위원장</th>
                                        <td class="td-point">박용주</td>
                                        <td>㈜지비스타일 대표이사</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table summary="운영위원">
                                    <caption>운영위원 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>운영위원<br>/<br>배분분과실행위원장</th>
                                        <td class="td-point">서정화</td>
                                        <td>사단법인 열린여성센터 센터장</td>
                                    </tr>
                                    <tr>
                                        <th rowspan="8" class="no-line">위원</th>
                                        <td class="td-point">백효채</td>
                                        <td>연세대학교 의과대학 흉부외과학 교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">임병수</td>
                                        <td>법무법인 태평양 고문</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">여우훈</td>
                                        <td>서울연회 서강교회 담임목사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">이경상</td>
                                        <td>대한상공회의소 경제조사본부장 및 지속가능경영원장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">이기연</td>
                                        <td>서강대학교 공공정책대학원 사회복지학과 대우교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">김한주</td>
                                        <td> 법무법인 동서양재 대표변호사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">이동형</td>
                                        <td> 前 조선일보 더나은미래 센터장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">허대건</td>
                                        <td>유베이스 대표이사</td>
                                    </tr>
                                    </tbody>
                                </table>
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
                                        <td class="td-point">박경수</td>
                                        <td>한양사이버대학교 사회복지학과 교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">고광진</td>
                                        <td>공인회계사 고광진사무소</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                    <!-- E : 운영위원회 -->
                    <!-- S : 분과실행위원회 -->
                    <section class="ui-tab-pnl" id ="pnl3">
                        <div class="tab-contents">
                            <h4 class="title-heading_a mg-t-m">기획·홍보분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                <table summary="기획·홍보분과 실행위원">
                                    <caption>기획·홍보분과 실행위원 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="5">위원</th>
                                            <td class="td-point">곽경인</td>
                                            <td>서울시사회복지사협회 사무처장</td>
                                            <td class="td-point">황운성</td>
                                            <td>한국보건복지인력개발원 아동복지교육본부 본부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이경림</td>
                                            <td>사단법인 아동복지실천회 세움 상임이사</td>
                                            <td class="td-point">이재현</td>
                                            <td>NPO 스쿨 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김지혜</td>
                                            <td>남서울대학교 사회복지학과 교수</td>
                                            <td class="td-point">최재민</td>
                                            <td>EBS CSR팀 기획팀장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">허대건</td>
                                            <td>(주)유베이스 대표</td>
                                            <td class="td-point">이인원</td>
                                            <td>구립성수종합사회복지관 부장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">모금분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                <table summary="모금분과 실행위원">
                                    <caption>모금분과 실행위원 정보입니다.</caption>
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
                                            <td class="td-point">박용주</td>
                                            <td colspan="3">㈜지비스타일 대표이사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="5">위원</th>
                                            <td class="td-point">이재만</td>
                                            <td>소셜한국경제 대표이사</td>
                                            <td class="td-point">황정은</td>
                                            <td>이화여자대학교 겸임교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">양선희</td>
                                            <td>서울YWCA 사무총장</td>
                                            <td class="td-point">어대훈</td>
                                            <td>박문각 남부고시학원 전임교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">하정은</td>
                                            <td>한국사회적기업 중앙협의회 공제사업단 단장</td>
                                            <td class="td-point">김한술</td>
                                            <td>광명데이콤 대표이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서판숙</td>
                                            <td>대한의사협회 사회공헌팀장</td>
                                            <td class="td-point">임금희</td>
                                            <td>애경산업(주) 경영관리팀 차장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">배분분과 실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                <table summary="배분분과 실행위원">
                                    <caption>배분분과 실행위원 정보입니다.</caption>
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
                                            <td class="td-point">서정화</td>
                                            <td colspan="3">열린여성센터 센터장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point"> 이준영</td>
                                            <td>서울시립대학교 사회복지학과 교수</td>
                                            <td class="td-point">우수명</td>
                                            <td>대림대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김수정</td>
                                            <td>국제사이버대학교 사회복지학과 교수</td>
                                            <td class="td-point">박영숙</td>
                                            <td>영등포노인복지관 관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">최미경</td>
                                            <td>대청종합사회복지관 관장</td>
                                            <td class="td-point">심정원</td>
                                            <td>성산종합사회복지관 관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정병오</td>
                                            <td>재단법인우천복지재단 상임이사</td>
                                            <td class="td-point">손병덕</td>
                                            <td>총신대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">한명섭</td>
                                            <td>서울시립비전트레이닝센터 센터장</td>
                                            <td class="td-point">김정환</td>
                                            <td>법무법인 도담 변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김린아</td>
                                            <td>강동경희대병원 사회사업팀장</td>
                                            <td class="td-point">김수영</td>
                                            <td>서울대 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">장연진</td>
                                            <td>한양사이버대학교 사회복지학과 교수</td>
                                            <td class="td-point">서진석</td>
                                            <td>SK 행복나눔재단 SI사업팀 그룹장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E : 분과실행위원회 -->
                    <!-- S : 시민감시위원 -->
                    <section class="ui-tab-pnl" id ="pnl4">
                        <div class="tab-contents">
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table>
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
                                            <td class="td-point">이정원</td>
                                            <td colspan="3">사단법인 사랑의친구들 사무총장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="3">위원</th>
                                            <td class="td-point">김현식</td>
                                            <td>비즈테크파트너스 센터장</td>
                                            <td class="td-point">박바름</td>
                                            <td>SM엔터테인먼트 사회공헌팀 팀장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">양윤모</td>
                                            <td>한국타이어복지재단 과장</td>
                                            <td class="td-point">이정호</td>
                                            <td>녹번종합사회복지관 부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이주우</td>
                                            <td>도예작가</td>
                                            <td class="td-point">정지현</td>
                                            <td>前)세이브더칠드런 기업모금팀장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- E : 분과실행위원회 -->
                </div>
            </div>
        </div>
    </div>

</main>
</div>
        
