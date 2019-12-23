<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스터디넷</title>
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 상단 타이틀 -->
    <div class="title-box mb40">
    	<div class="inner-box">
    		<form class="search-box flex-box">
    			<h2 class="section-title tac">
    				당신에게 <span class="section-title">딱</span> 맞는 스터디,<br />찾아보실래요?
    			</h2>
    			<div>
    				<select>
	    				<option>분류</option>
	    				<option>온라인</option>
	    				<option>오프라인</option>
					</select>
					<input type="text" placeholder="검색어를 입력해주세요" />
    			</div>
    			<input class="my-btn black-white" type="button" value="검색" />
    		</form>
    	</div>
	</div>

	<!-- 모집 중인 스터디 -->
	<div class="show-study-box mb20">
		<div class="inner-box contents-box">
			<h2 class="section-title">인원 모집이 곧 끝나는 스터디</h2>
			<div class="swiper-container swiper1">
				<!-- swiperjs 영역 -->
				<ul class="swiper-wrapper">
					<li class="swiper-slide">
						<span class="icon icon-pre01"></span>
						<h3><a href="javascript:void(0);"><span>[온라인] 웹 페이지 만들기</span></a></h3>
						<p class="flex-box">
							<span>2019.12.08 모집 마감</span>
							<span>카카오톡</span>
						</p>
					</li>
					<li class="swiper-slide">
						<span class="icon icon-pre02"></span>
						<h3><a href="javascript:void(0);"><span>[오프라인] 취업 면접 연습하기</span></a></h3>
						<p class="flex-box">
							<span>2019.12.19 모집 마감</span>
							<span>서울/경기</span>
						</p>
					</li>
					<li class="swiper-slide">
						<span class="icon icon-pre01"></span>
						<h3><a href="javascript:void(0);"><span>[온라인] 웹 페이지 만들기</span></a></h3>
						<p class="flex-box">
							<span>2019.12.08 모집 마감</span>
							<span>카카오톡</span>
						</p>
					</li>
					<li class="swiper-slide">
						<span class="icon icon-pre02"></span>
						<h3><a href="javascript:void(0);"><span>[오프라인] 취업 면접 연습하기</span></a></h3>
						<p class="flex-box">
							<span>2019.12.19 모집 마감</span>
							<span>서울/경기</span>
						</p>
					</li>
					<li class="swiper-slide">
						<span class="icon icon-pre02"></span>
						<h3><a href="javascript:void(0);"><span>[오프라인] 취업 면접 연습하기</span></a></h3>
						<p class="flex-box">
							<span>2019.12.19 모집 마감</span>
							<span>서울/경기</span>
						</p>
					</li>
					<li class="swiper-slide">
						<span class="icon icon-pre02"></span>
						<h3><a href="javascript:void(0);"><span>[오프라인] 취업 면접 연습하기</span></a></h3>
						<p class="flex-box">
							<span>2019.12.19 모집 마감</span>
							<span>서울/경기</span>
						</p>
					</li>
				</ul>
				<!-- Add Pagination -->
				<div class="swiper-pagination swiper-pagination1"></div>
			</div>
		</div>
	</div>
	
	<!-- 커뮤니티 신규 글 -->
	<div class="new-article-box mb40">
		<div class="inner-box contents-box">
			<div class="flex-box">
				<h2 class="section-title">커뮤니티 신규 글</h2>
				<a href="community_list.do"><span>더보기</span></a>
			</div>
			<div>
				<table class="tac">
					<caption class="txt-only">커뮤니티 신규 글</caption>
					<tbody>
						<c:forEach var="vo" items="${ board }">
						<tr>
							<td><a href="community_list_detail.do?idx=${ vo.idx }">${ vo.title }</a></td>
							<td><fmt:formatDate value="${ vo.created_at }" type="date" pattern="yyyy.MM.dd"/></td>
							<td>${ vo.user_idx }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 광고 배너 -->
	<div class="banner-box mb40">							
		<div class="inner-box contents-box">
			<div class="swiper-container swiper2">
				<!-- swiperjs 영역 -->
				<ul class="swiper-wrapper">
					<li class="swiper-slide"><a href="javascript:void(0);"><span class="icon icon-event01"></span></a></li>
					<li class="swiper-slide"><a href="javascript:void(0);"><span class="icon icon-event02"></span></a></li>
					<li class="swiper-slide"><a href="javascript:void(0);"><span class="icon icon-event01"></span></a></li>
				</ul>
				<!-- Add Pagination -->
				<div class="swiper-pagination swiper-pagination2"></div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- swiper 스크립트 -->
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script type="text/javascript">
		var swiper1 = new Swiper('.swiper1', {
			slidesPerView: 'auto',
			spaceBetween: 20,
			loop: true,
			autoplay: {
				delay: 2500,
				disableOnInteraction: false,
			},
			pagination: {
				el: '.swiper-pagination1',
				clickable: true,
			}
		});

		var swiper2 = new Swiper('.swiper2', {
			slidesPerView: 'auto',
			spaceBetween: 2,
			loop: true,
			autoplay: {
				delay: 2500,
				disableOnInteraction: false,
			},
			pagination: {
				el: '.swiper-pagination2',
				type: 'fraction',
			},
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
		});
	</script>
</body>
</html>