<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 소개  > CI소개 
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
                <h3><strong>CI소개</strong><span>나누는 기쁨, 희망과 행복 - 사랑의열매를 소개합니다.</span></h3>
                <div class="contents-menu-nav">
                </div>
            </div>

            <div class="seo-box">
                <div class="ci-area">
                    <div class="btn-area-r">
                        <button type="button" class="btn-base-line small" onclick="gf_genFileExport(this);">사랑의열매 로고 파일 다운로드</button>
                        <input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}' escapeXml='false' />" />
                        <input id="phycFileNm" name="phycFileNm" type="hidden" value="logo.zip" />
                        <input id="logcFileNm" name="logcFileNm" type="hidden" value="logo.zip" />
                        <p class="txt-s">지회로고 포함</p>
                    </div>
                    <h4 class="heading-title-b">Logo Type</h4>
                    <p class="txt-basic-a">로고타입은 다른 CI 요소와의 조화와 가독성을 고려하여 특별히 제정한 독자적인 문자체이다.<br>
                        로고타입은 심벌과 조합하여 사용하거나 독자적으로 활용되며 임의로 글자의 비례. 간격. 형태를 변경할 수 없다.<br>
                        Christiana Mediom 체를 영문 로고타입으로 사용하여 규정된 크기와 비례를 준수하여야 한다.</p>
                    <div class="ci-imgbox"><img src="/common/img/contents/ci_01.jpg" alt=""></div>
                    <h4 class="heading-title-b">Signature(시그니처 조합)</h4>
                    <p class="txt-basic-a">아래 예시된 시그니처는 높이 H 기준으로 시각적 비례에 맞게 로고타입 및 마크 크기를 규정하였다. 이 조합은 사랑의열매 각 지회가 공통된 비례로 사용하여야 하며 색상, 위치 간격, 공간 등을 임의로 변경할 수 없다. 다만 불가피한 매체의 경우에는 CI관리 담당부서와 협의하여 조정한다.</p>
                    <div class="ci-imgbox"><img src="/common/img/contents/ci_02.jpg" alt=""></div>
                    <h4 class="heading-title-b">Color</h4>
                    <div class="color-box">
                        <div class="color-box-col">
                            <div class="ci-imgbox"><img src="/common/img/contents/color_01.jpg" alt=""></div>
                            <p class="txt-basic-a">별색표현(DIC  548p) / 4원색 표현</p>
                        </div>
                        <div class="color-box-col">
                            <div class="ci-imgbox"><img src="/common/img/contents/color_02.jpg" alt=""></div>
                            <p class="txt-basic-a">별색표현(DIC  388p, 528p, 620p, 621p) / 4원색 표현</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    
</div>        
