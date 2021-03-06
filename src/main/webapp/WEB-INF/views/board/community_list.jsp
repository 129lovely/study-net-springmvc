<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티 게시글 목록</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="body-bgcolor-set">
        <div class="community-list-board">
    
            <div class="inner-box pt190">
                <div class="contents-box board">
                    <h2 class="section-title">
                     	   스터디넷에서 다양한 <span class="section-title blue">정보</span>를 나눠주세요.
                    </h2>
                    <div class="flex-box community-board-info mb30">
                            <span class="icon icon-caution"></span>
                            <p>
			                                홈페이지 특성에 맞지 않고 관련 없는 글이나,
			                                광고성 / 음란성 / 누군가를 비방하는 글 등은
			                                무통보 삭제되거나 제제를 받을 수 있습니다.
                            </p>
                    </div>
                    <div class="search-result mb10">
                        <span>(총 게시물 수:  ${ row_total }건)</span>
                    </div>
    
                    <!-- 테이블 -->
                    <div class="mb20">
                        <table class="tac">
                            <tr>
                                <th class="section-discription tal">제목</th>
                                <th class="section-discription">작성자</th>
                                <th class="section-discription">작성일자</th>
                                <th class="section-discription">조회수</th>
                                <th class="section-discription">추천수</th>
                            </tr>
                            
                            <c:forEach var="vo" items="${ list }">
                           		 <tr>
	                            	<c:if test="${ vo.deleted_at != null }"> <!-- 삭제된 게시물 -->
                            		<td colspan="5"><a href="javascript:del_alert();" style="color: #DFE1E4;">${ vo.title }</a></td>
	                            	</c:if>
	                            	
	                            	<c:if test="${ vo.deleted_at == null }"> <!-- 일반 게시물 -->
	                            	<c:if test="${vo.is_notice==1 }">
	                            	<td><a href="community_list_detail.do?idx=${ vo.idx }">[공지] ${ vo.title }</a></td>	                            	
	                                <td>${ vo.name }</td>
	                                <td><fmt:formatDate value="${vo.created_at}" type="date" pattern="yyyy.MM.dd"/></td>
	                                <td>${ vo.hit }</td>
	                                <td>${ vo.recommend }</td>
	                                </c:if>
	                                
	                                <c:if test="${vo.is_notice==0 }">
	                            	<td><a href="community_list_detail.do?idx=${ vo.idx }">${ vo.title }</a></td>	                            	
	                                <td>${ vo.name }</td>
	                                <td><fmt:formatDate value="${vo.created_at}" type="date" pattern="yyyy.MM.dd"/></td>
	                                <td>${ vo.hit }</td>
	                                <td>${ vo.recommend }</td>
	                            	</c:if>
	                            	</c:if>
                            	</tr>
                            </c:forEach>
         
                        </table>
                    </div>
                    
                    <!-- 버튼 -->
                    <div class="flex-box btn-box mb40">
                        <div class="flex-box">
                            <input type="text" id="search-content" placeholder="검색할 제목 키워드 입력" class="tac" <c:if test="${param.search ne ''}">value="${param.search}"</c:if> />
                           	<a href="javascript:send();" class="my-btn black-white">검색</a>
                        </div>
                        <div>
                            <a href="community_write_form.do" class="my-btn black-white">글 작성</a>
                        </div>
                    </div>
    
                    <!-- 페이징 -->
                   <!--  <div class="paging-box tac">
                        <a href="#" class="left-page"></a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#" class="right-page"></a>
                    </div> -->
                    <div class="paging-box tac">
                        ${pageMenu}
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../footer.jsp"></jsp:include>
    <script type="text/javascript">
    function send() {
    	var search=document.getElementById("search-content").value;//아이디를 통해서 검색내용var타입으로 저장하기
    	var url="community_list_search.do?search=" + search;
    	location.href=url;
    	
    	/*
    	var 검색내용 = 아이디값 이용해서 input 검색 value 가져오고
    	var url = "~.do?search=" + 검색내용
    			
    	location.href=url;
    	
    	
    	(컨트롤러 -> 서비스(검색내용) 보내주고 -> dao(검색내용, 즉 파라미터는 string 한개) -> 매퍼에서
    	
    	반환하는 resultType=board
    	select *
    	from board
    	where like 사용해서 제목에 검색내용이 있는 것들 다 가져오기 )
    	
    	dao 에서 list 반환 -> service에서도 컨트롤러로 리스트 반환 -> 컨트롤러에서는 community_list.jsp 로 list를 바인딩해서 보내기만 하면 ok
		*/
	}
    
    function del_alert() {
		alert("삭제된 게시물입니다");
	}
    </script>
</body>
</html>