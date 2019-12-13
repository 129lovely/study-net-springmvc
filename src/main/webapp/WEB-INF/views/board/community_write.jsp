<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function send(form) {
			var title = form.title.value.trim();
			var content = form.content.value;
			
			// 데이터 유효성 검사
			if( title == '' ) {
				alert("제목을 입력해주세요");
				form.title.focus();
				return;
			}
			if( content == '' ){
				alert("내용을 입력해주세요");
				form.content.focus();
				return;
			}
			
			form.action = "community_write.do";
			form.method = "post";
			form.submit();
		}
	</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div class="body-bgcolor-set">
        <div class="community-writing">
            <div class="inner-box pt190">
                <form class="contents-box board">
                	<!-- 회원 idx 넘기는 input -->
                	<input type="hidden" value="3" name="user_idx">
                	
                    <h3 class="section-title blue">커뮤니티 글 작성</h3>
                    <p class="section-discription tal mb40">이용약관을 준수하여 올바른 커뮤니티 사용을 부탁드립니다.</p>
                    
                    <!--제목-->
                    <div class="line-bottom flex-box">
                        <label for="board-title">제목</label>
                        <input id="board-title" type="text" placeholder="제목을 입력해주세요." name="title" />
                    </div>
                    
                    <!--텍스트-->
                    <div class="note-my-custom">
                        <textarea class="summernote-community-writing-box" name="content"></textarea>	
                    </div>
                    
                    <!--버튼-->
                    <div class="btn-box tac">
                        <input class="my-btn yellow-black" type="button" value="올리기" onclick="send(this.form);"/>
                        <input class="my-btn yellow-black" type="button" value="취소" onclick="location.href='community_list.do'"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>