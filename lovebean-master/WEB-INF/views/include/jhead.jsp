<fmt:formatDate var="CHEST_APPLY_VER" value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss" />
<c:set var="CTX_PATH" value="${pageContext.request.contextPath}"/>
<c:set var="CM_JS_PATH" value="${CTX_PATH}/common/js"/>
<c:set var="CM_CSS_PATH" value="${CTX_PATH}/common/css"/>
<link rel="icon" href="${CTX_PATH}/favicon.ico">
<!-- css ê²½ë¡  -->
<link rel="stylesheet" href="${CM_CSS_PATH}/ui.base.css?_v=${CHEST_APPLY_VER}">
<link rel="stylesheet" href="${CM_CSS_PATH}/ui.main.css?_v=${CHEST_APPLY_VER}">
<link rel="stylesheet" href="${CM_CSS_PATH}/swiper.css">

<!--slick_campagin  -->
<link rel="stylesheet" href="${CM_CSS_PATH}/slick/slick-theme.css">
<link rel="stylesheet" href="${CM_CSS_PATH}/slick/slick.css">
<link rel="stylesheet" href="${CM_CSS_PATH}/slick/slick-custom.css">
<link rel="stylesheet" href="${CM_CSS_PATH}/ui.responsive.css">


<!-- Jquery -->
<script type="text/javascript" src="${CM_JS_PATH}/jquery/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${CM_JS_PATH}/jquery/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${CM_JS_PATH}/jquery/plugin/jquery.cookie.js"></script><!-- cookie Plugin -->
<script type="text/javascript" src="${CM_JS_PATH}/jquery/js/jquery-ui.js"></script>

<!-- Chest Front Common -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_menu.js?_v=${CHEST_APPLY_VER}"></script><!-- menu script -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_util.js"></script><!-- util script -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_ajax.js"></script><!-- ajax script -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_com.js"></script><!-- common script -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_grid.js"></script><!-- grid script -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_date.js"></script><!-- date script -->
<script type="text/javascript" src="${CM_JS_PATH}/chest_user.js"></script><!-- user script -->
<!-- Chest ui Common -->
<script type="text/javascript" src="${CM_JS_PATH}/slick/slick.js"></script>
<script type="text/javascript" src="${CM_JS_PATH}/swiper.js"></script>
<script type="text/javascript" src="${CM_JS_PATH}/ui.global.js"></script>
<script type="text/javascript" src="${CM_JS_PATH}/ui.plugins.js"></script>
<script type="text/javascript" src="${CM_JS_PATH}/ui.common.js?_v=${CHEST_APPLY_VER}"></script>
<script type="text/javascript" src="${CM_JS_PATH}/signature_pad.min.js"></script>
<!-- ADD KMS HTTP/HTTPS URL DIVIDE  -->
<c:choose>
<c:when test="${fn:indexOf(pageContext.request.requestURL, 'https://') > -1}">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</c:when>
<c:otherwise>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</c:otherwise>
</c:choose>
