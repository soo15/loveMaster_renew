<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<script type="text/javascript">

    $(function(){
        <%-- 메뉴 가로로 보이게 하고싶은것들. --%>
        var dispWideMenu = "00_00_00|01_00_00|01_01_00|03_01_00|03_02_00";
        var hIdx = 0;
        var GV_SITEMAP = [];
        hIdx = GV_ARR_MENU_H.menu.length;
        GV_SITEMAP = GV_SITEMAP.concat(GV_ARR_MENU_H.menu, GV_ARR_MENU_F.menu);

        <%-- 하드코딩 - 대분류4개다음 FOOTER-묵음 두개씩 SECTION 만들기. --%>
        var _that, _it;
        var hrefStr = "#";
        var hrefTgt = "";
        var menuType = "header";
        var fIdx = 0;

        for(var i in GV_SITEMAP) {
            var menuinfo = GV_SITEMAP[i];
            if(i%3 == 0 && i < hIdx) {
                _that =$("<div/>").attr("class","sitemap-section").appendTo($("#DIV_SITEMAP"));
            }
            if(i < hIdx || (i >= hIdx && fIdx%2 == 0)) {
                _it = $("<div/>").attr("class","sitemap-section-item").appendTo($(_that));
            }
            if(i >= hIdx) {
                menuType = "footer";
                fIdx++;
            }
            var depth1 = $("<p/>").attr("class","sitemap-section-title").appendTo($(_it));
            $(depth1).append(menuinfo.name);
            depth1 = $("<ul/>").attr("class","list-sitemap").appendTo($(_it));
            if(menuinfo.dep2 && menuinfo.dep2.length > 0) {
                for(var j in menuinfo.dep2) {
                    var menuinfo2 = menuinfo.dep2[j];
                    var depth2 = $("<li/>").attr("class","sitema-item").appendTo($(depth1));

                    if(menuinfo2.link && menuinfo2.link == "gf_msg();") {
                        hrefStr = "javascript:gf_msg()";
                        hrefTgt = "";
                    } else if(menuinfo2.target && menuinfo2.target == "_blank") {
                        hrefStr = menuinfo2.link;
                        hrefTgt = "_blank";
                    } else if(menuinfo2.target && menuinfo2.target.indexOf("SNS_") > -1) {
                        hrefStr = "javascript:snsMoveEvent('"+menuinfo2.target+"')";
                        hrefTgt = "";
                    } else {
                        hrefStr = "javascript:headerMenuClickEvent('"+menuinfo2.link+"','"+menuinfo2.code+"','"+menuType+"')";
                        hrefTgt = "";
                    }
                    $("<a/>").attr("href",hrefStr).attr("target",hrefTgt).attr("class","link-sitemap").text(menuinfo2.name).appendTo($(depth2));
                    if(menuinfo2.dep3 && menuinfo2.dep3.length > 0) {
                        hrefStr = "";
                        hrefTgt = "";
                        var depth3 = $("<ul/>").attr("class","list-sitemap-depth").appendTo($(depth2));
                        if(dispWideMenu.indexOf(menuinfo2.code) > -1) {
                            depth3 = $("<ul/>").attr("class","list-sitemap-depth type-wide").appendTo($(depth2));
                        }
                        for(var k in menuinfo2.dep3) {
                            var menuinfo3 = menuinfo2.dep3[k];
                            var _lastObj = $("<li/>").attr("class","sitema-item-depth").appendTo($(depth3));
                            if(menuinfo3.target && menuinfo3.target == "_blank") {
                                hrefStr = menuinfo3.link;
                                hrefTgt = "_blank";
                            } else {
                                hrefStr = "javascript:headerMenuClickEvent('"+menuinfo3.link+"','"+menuinfo3.code+"','"+menuType+"')";
                                hrefTgt = "";
                            }
                            $("<a/>").attr("href",hrefStr).attr("target",hrefTgt).attr("class","link-sitemap-depth").text(menuinfo3.name).appendTo($(_lastObj));
                        }
                    }
                }
            }
        }
    });
</script>
<div class="sub-visual visual08_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">사이트맵</h2>
        <p class="title-sub-txt">사랑의열매 사이트맵 입니다.</p>
    </div>
</div>
<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>사이트맵 </strong><span>사랑의열매 사이트맵 입니다.</span></h3>
        </div>
        <div class="seo-box">
            <div class="sitemap-area" id="DIV_SITEMAP">
            </div>
        </div>
    </div>
</main>

