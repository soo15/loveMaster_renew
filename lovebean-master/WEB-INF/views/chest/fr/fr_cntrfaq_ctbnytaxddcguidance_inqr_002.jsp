<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">

    /*===========================================================
     * Page Loading !!
     *===========================================================*/

     $(document).ready(function(){

         init();
         
         $('.ui-acco-btn').off("click").on('click', function(e){
             clickEvent(this);
         });
         
         $('#btn0').click();
         
    });
    

    
    function init(){
        
        $('.ui-acco-pnl').slideToggle();
              
    }
    
    function clickEvent(obj){
        p = obj.parentElement.parentElement;
        c = p.lastElementChild;
        
        $(c).slideToggle();
    }
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
</script>

<div class="base-body type-sub" id="baseBody">
    <div class="sub-visual visual04_02">
        <div class="sub-title-area">
            <h2 class="heading-title-a">소개</h2>
            <p class="title-sub-txt">2depth 설명글 수급 중입니다.</p>
        </div>
    </div>
    
    <%@ include file="../../layout/breadcrumbs.jsp"%>
    
    <main class="base-main" id="baseMain">
        <div class="contents-area">
            <div class="contents-hd">
                <h3><strong>기부금 세액공제 안내</strong><span>기부관련 자주하는 질문과 답변입니다.</span></h3>
                <div class="contents-menu-nav">
                </div>
            </div>

            <div class="seo-box">
                <div class="ui-acco type-qna" role="group" id="uiAccoGUID04_1">
                    <dl class="ui-acco-wrap">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn" id="btn0">성금을 내면 필요한 곳에 쓰지 않고, 사회복지공동모금회가 맘대로 운영비로 쓴다면서요? <span class="ui-acco-arrow"></span></button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p>○ 법정기관인 공동모금회는 「사회복지공동모금회법 제25조(재원의 사용 등)」에 근거해 전년 모금액의 10% 범위 내에서만 관리운영비를 쓸 수 있습니다. 국민의 소중한 성금을 조금이라도 더 어려운 이웃에 지원하기 위해 명확한 집행지침을 세워서 예산을 절감하고 있습니다.</p>

                            <p>○ 그 결과 최근 5년간(2012~2016) 모금회의 관리운영비 평균비율은 5.6%이며, 2016년의 경우 6.1%를 관리운영비로 사용했습니다. 주요 모금기관의 관리운영비 평균 비율이 15.2% ([국세청 공익법인 결산서류 공시시스템] 결산액 기준)인데 비하면 약 3분의 1수준으로 매우 낮은 비율을 유지하고 있음을 알려드립니다. 미국 등 기부선진국에서는 약 15~30%를 사용하고 있습니다.</p>

                            <p>○ 관리운영비를 포함한 조직운영에 대해서는 시민감시위원회를 통해 운영의 투명성을 점검받고 있으며, 정기적인 내부감사와 보건복지부 감사, 국회 국정감사를 받고 있습니다. 덧붙여 경영의 투명성과 기부자의 알권리를 위해 자발적으로 경영공시를 하고 있습니다. 수입 및 지출현황을 비롯한 정보는 홈페이지에서 확인 가능합니다.</p>

                            <p>○ 앞으로도 저희 공동모금회는 기부자들의 소중한 성금을 최대한 아껴 사용하고, 효과적인 배분과 투명한 조직운영으로 더 큰 믿음을 드리도록 노력하겠습니다.</p>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn" >다른 모금기관들과 사회복지공동모금회는 어떻게 다른가요?<span class="ui-acco-arrow"></span></button>
                        </dt>
                        <dd class="ui-acco-pnl" >
                            <p>○ 법정기관인 공동모금회는 「사회복지공동모금회법 제25조(재원의 사용 등)」에 근거해 전년 모금액의 10% 범위 내에서만 관리운영비를 쓸 수 있습니다. 국민의 소중한 성금을 조금이라도 더 어려운 이웃에 지원하기 위해 명확한 집행지침을 세워서 예산을 절감하고 있습니다.</p>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn" >사회복지공동모금회는 정부기구입니까?<span class="ui-acco-arrow"></span></button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p>○ 법정기관인 공동모금회는 「사회복지공동모금회법 제25조(재원의 사용 등)」에 근거해 전년 모금액의 10% 범위 내에서만 관리운영비를 쓸 수 있습니다. 국민의 소중한 성금을 조금이라도 더 어려운 이웃에 지원하기 위해 명확한 집행지침을 세워서 예산을 절감하고 있습니다.</p>
                        </dd>
                    </dl>
                </div>

            </div>
        </div>
    </main>

 </div>
