<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 소개  > 사랑의 열매는 
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
        
    });
    
    /*===========================================================
     * 신청하기 버튼 클릭시 Function !!
     *===========================================================*/    
    $(document).on("click", "#btnCi", function(e){
        e.preventDefault();
        gf_submitMovePage("<c:url value='/lf/intrcn/initCiintrcn.do' />", "");
        
    });
    
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
                <h3><strong>사랑의열매는</strong><span>나누는 기쁨, 희망과 행복 - 사랑의열매를 소개합니다.</span></h3>
                <div class="contents-menu-nav">
                </div>
            </div>

            <div class="seo-box">
                <div class="about-area">
                    <div class="img-with-txt">
                        <div class="img-area type-center">
                            <img src="/common/img/contents/about_img1.png" alt="">
                        </div>
                        <div class="text-area">
                            <h4 class="title-heading_a line-b">사회복지공동모금회와 사랑의 열매</h4>
                            <p class="txt-big-a">우리나라에는 <span class="point-color1">사랑의열매</span>가 있습니다.</p>
                            <p class="txt-basic-a">
                                세 개의 빨간 열매는 나, 가족, 이웃을 상징하며, 열매의 빨간색은 따뜻한 사랑의 마음을,
                                하나로 모아진 줄기는 더불어 함께 사는 사회를 만들어가자는 뜻을 가지고 있습니다.
                                '사랑의 열매는 나와 가족을 사랑하는 마음으로 이웃에게 사랑을 전하자는 나눔의 의미를 담고 있습니다.<br><br>
                                '사회복지공동모금회'는 '사랑의 열매'를 캠페인 상징으로 연말연시는 물론 연중 이웃돕기 캠페인을 펼치고 있으며,
                                사랑의 열매는 현재 우리 국민에게 이웃사랑의 상징으로 자리잡고 있습니다.
                            </p>
                            <div class="btn-area-r">
                                <a href="" class="btn-base-line small" id ="btnCi" >사랑의열매 CI소개 바로가기</a>
                            </div>
                        </div>
                    </div>
                    <h4 class="title-heading_a line-b mg-t-m">백당나무와 사랑의열매</h4>
                    <p class="txt-basic-a">
                        우리나라에서 사랑의 열매는 1970년 초부터 수재의연금과 불우이웃돕기 성금을 모금할 때 보건복지부 산하 이웃돕기추진운동본부에서
                        사랑의 열매를 “상징”으로 사용해왔으며, 사랑의 열매 형태 는 우리나라 야산에 자생하고 있는 산열매를 형상화했습니다.
                        한편, 2003년 2월 산림청에서 “백당나무”를 이달의 나무로 선정하면서 사랑의 열매와 닮은 점을 언급해 눈길을 끌었습니다.
                    </p>
<!--                     <div class="btn-area-r mg-t-s"> -->
<!--                         <a href="" class="btn-base-line small">자세한 기사보기</a> -->
<!--                     </div> -->
                    <div class="img-center-box mg-t-m"><img src="/common/img/contents/about_img3.png" alt=""></div>
                    <div class="img-with-txt mg-t-m">
                        <div class="img-area">
                            <div class="img-box"><img src="/common/img/contents/about_img4.png" alt=""></div>
                        </div>
                        <div class="text-area">
                            <h4 class="title-heading_a line-b">백당나무와 사랑의열매 </h4>
                            <p class="txt-basic-a">
                                2003년 2월, 산림청에서 매월 선정하는 '이달의 나무'에 백당나무를 선정하면서 『사랑의 열매』를 언급하여 화제가 되었다.<br>
                                산림청은 "나·가족·이웃이 사랑의 마음으로 하나가 되자는 “사랑의 열매”처럼 겨울 눈꽃사이로 달린 백당나무의 빨간 열매는
                                이 추운 계절에 우리 주위를 돌아보는 따뜻한 마음과 이웃사랑에 대한 실천의 상징을 닮고 있다” 고 설명했고, 이후 그 모양이
                                사랑의 열매와 많이 닮아 있어 많은 사람들에게 기억되었다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
 </div>
