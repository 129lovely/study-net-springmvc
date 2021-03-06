<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스터디 찾아보기</title>
	<script type="text/javascript">
	function send(f){
		var purpose = "";
		var purposeList = $("input[type='checkbox']:checked");
		
		if( purposeList.length > 0 ){
			$("input[type='checkbox']:checked").each(function() {
				 purpose += $(this).val() + ",";
			});
			
			purpose = purpose.substring( 0, purpose.length - 1);			
		}
		
		$("input[name='purpose']").val(purpose);
		
		f.action = "study_list.do";
		f.method = "get";
		f.submit();
	}
	</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="study-search-page">
		<!-- 원하는 스터디 검색하기 -->
		<form class="search-box mb20"  >
			<input type="hidden" value="" name="purpose"/>
			
			<div class="flex-box pt190">
				<h2 class="section-title">원하는 스터디 검색하기</h2>
				<p class="mb10">step 1. 스터디 목적 선택하기 (복수 선택 가능)</p>
				<div class="btn-box mb10">
					<ul class="flex-box">
						<!-- 이거 파라미터 여러개일 경우엔 어떻게 체크해야 되지 ?!! -->
						<li>
							<input type="checkbox" value="공모전" id="purp_1" <c:if test="${param.purpose eq '공모전' }">checked</c:if> />
							<label class="my-btn select black-white" for="purp_1">공모전</label>
						</li>
						<li>
							<input type="checkbox" value="취업준비" id="purp_2" <c:if test="${param.purpose eq '취업준비' }">checked</c:if> />
							<label class="my-btn select black-white" for="purp_2">취업준비</label>
						</li>
						<li>
							<input type="checkbox" value="기상습관" id="purp_3" <c:if test="${param.purpose eq '기상습관' }">checked</c:if> />
							<label class="my-btn select black-white" for="purp_3">기상/습관</label>
						</li>
						<li>
							<input type="checkbox" value="공부" id="purp_4" <c:if test="${param.purpose eq '공부' }">checked</c:if> />
							<label class="my-btn select black-white" for="purp_4">공부</label>
						</li>
						<li>
							<input type="checkbox" value="기타" id="purp_5" <c:if test="${param.purpose eq '기타' }">checked</c:if> />
							<label class="my-btn select black-white" for="purp_5">기타</label>
						</li>
					</ul>
				</div>
				<p class="mb10">step 2. 온/오프라인 분류를 선택하고 검색어 입력하기</p>
				<div class="mb40 flex-box">
					<div class="flex-box">
						<form name="f">
						<select name="search_option" id="search_option">
							<option value="3" <c:if test="${param.search_option eq 3 }">selected</c:if>>전체</option>
 							<option value='1' <c:if test="${param.search_option eq 1 }">selected</c:if>>온라인</option>
							<option value='0' <c:if test="${param.search_option eq 0 }">selected</c:if>>오프라인</option>
							<option value='2' <c:if test="${param.search_option eq 2 }">selected</c:if>>복합</option>
						</select>
					
						<input type="text" placeholder="검색어를 입력해주세요" name="search" id="search" <c:if test="${param.search ne ''}">value="${param.search}"</c:if> />
					</div>
					<input class="my-btn black-white" type="button" value="찾아보기" name="btnSearch" id="btnSearch"
								onclick="send(this.form);" />
				
						</form>
				</div>
			</div>
		</form>
		
		<!-- 검색 결과 -->
		<div class="search-result-box">
			<div class="contents-box">
				<p class="mb10"> <span>(총 스터디 수: 총  ${ row_total }건)</span></p>
				<div class="search-result">
					<ul>
						<c:forEach var="vo" items="${list }">
						<c:if test="${ vo.deleted_at == null }">
							<li class="flex-box">
							
							<span><img src="resources/images/study_profile/${vo.photo}"/> </span>
							
								<!-- 온라인 -->
                         	<c:if test="${ vo.is_online == 1 }">
		                        <div>		               
		                           	<h3><a href="study_list_detail.do?idx=${ vo.idx }"><span>[온라인] ${ vo.title }</span></a></h3>	                            	
		                            <p><span class = "addinfo1 tar">모집 마감   </span> <span class = "addinfo_back tal">| <fmt:parseDate var="dateString" value="${vo.deadline}" pattern="yyyy-MM-dd HH:mm:ss.SSS" /> 
						<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" /></span></p>
		                            <p><span class = "addinfo1 tar" >스터디목적   </span> <span class = "addinfo_back tal" >| ${ vo.purpose }</span></p>
		                            <p><span class = "addinfo1 tar">모집 인원 </span><span class = "addinfo_back tal">  &nbsp;| ${ vo.approve_count }</span></p>
	              				</div>
              				</c:if>
	              				
	              				
	              				<!-- 오프라인 -->
                         	<c:if test="${ vo.is_online == 0 }">
	                         	<div>
		                           	<h3><a href="study_list_detail.do?idx=${ vo.idx }"><span>[오프라인] ${ vo.title }</span></a></h3>	                            	
		                            <p><span class = "addinfo1 tar">모집 마감  &nbsp;  </span><span class = "addinfo_back ">|  <fmt:parseDate var="dateString" value="${vo.deadline}" pattern="yyyy-MM-dd HH:mm:ss.SSS" /> 
						<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" /> </span></p>
		                            <p><span class = "addinfo1 tar">스터디목적    &nbsp; </span><span class = "addinfo_back "> | ${ vo.purpose }</span></p>
		                            <p><span class = "addinfo1 tar">모집 인원  &nbsp; </span><span class = "addinfo_back ">|  ${ vo.approve_count }</span></p>
	              				</div>
              				</c:if>
	              				
	              				
	              				<!-- 온/오프라인 -->
	                        <c:if test="${ vo.is_online == 2 }">
		                        <div>
		                           	<h3><a href="study_list_detail.do?idx=${ vo.idx }"><span>[복합] ${ vo.title }</span></a></h3>	                            	
		                            <p><span class = "addinfo1 tar">모집 마감  &nbsp;  </span><span class = "addinfo_back tal"> |  <fmt:parseDate var="dateString" value="${vo.deadline}" pattern="yyyy-MM-dd HH:mm:ss.SSS" /> 
										<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" /></span> </p>
		                            <p><span class = "addinfo1 tar">스터디목적 &nbsp;  </span><span class = "addinfo_back tal">|  ${ vo.purpose }</span></p>
		                            <p><span class = "addinfo1 tar">모집 인원 &nbsp;</span><span class = "addinfo_back tal">  |  ${ vo.approve_count }</span></p>	              				
		              			</div>
		              		</c:if>
							</li>
						</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			 <!-- 페이징 -->
				<div class="paging-box tac mb20">
				${pageMenu}
				</div>
				
			<div class="tac mb40">
				<span>마음에 드는 스터디가 없으신가요?</span></br>
				<a href="study_create_caution.do"><span>직접 스터디 만들기</span></a>
			</div>
		</div>	
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>