<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../login_check.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티 글 수정</title>
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css">
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div class="body-bgcolor-set">
        <div class="community-writing">
            <div class="inner-box pt190">
                <form class="contents-box board">
                	<input type="hidden" name="idx" value="${ vo.idx }">
                
                    <h3 class="section-title blue">커뮤니티 글 수정</h3>
                    <p class="section-discription tal mb40">이용약관을 준수하여 올바른 커뮤니티 사용을 부탁드립니다.</p>
                    
                    <!--제목-->
                    <div class="line-bottom flex-box">
                        <label for="board-title">제목</label>
                        <input name="title" id="board-title" type="text" placeholder="제목을 입력해주세요." value="${ vo.title }" maxlength="40"/>
                    </div>
                    
                    <!--텍스트-->
                    <div class="note-my-custom">
                        <textarea name="content" class="summernote-community-writing-box">${ vo.content }</textarea>	
                    </div>
                    
                    <!--버튼-->
                    <div class="btn-box tac">
                        <input class="my-btn yellow-black" type="button" value="수정하기" onclick="write_modify(this.form);"/>
                        <input class="my-btn yellow-black" type="button" value="취소" onclick="location.href='community_list_detail.do?idx=${ vo.idx }'" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
    
    <script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/summernote.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/summernote-ko-KR.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			$('.summernote-community-writing-box').summernote({
				lang: 'ko-KR',
				height: 300 + 'px',                 // set editor height
				minHeight: 200 + 'px',             // set minimum height of editor
				maxHeight: 500 + 'px',             // set maximum height of editor
				focus: false,                  // set focus to editable area after initializing summernote
				placeholder: '',
				toolbar: [
					// [groupName, [list of button]]
					['style', ['bold', 'italic', 'underline', 'clear']],
					['font', ['strikethrough']],
					['fontsize', ['fontsize']],
					['color', ['color']],
					['para', ['paragraph']],
					['height', ['height']],
					['table', ['table']],
					['insert', ['link', 'picture']],
					['view', ['fullscreen', 'codeview']],
					]
			});
		});
		
		function write_modify(f){
			
			var title=f.title.value;
			var content=f.content.value;
			var idx=f.idx.value;
			
			if(title==''){
				alert("제목을 입력해주세요");
				return;
			}
			
			if(content==''){
				alert("내용을 입력해주세요");
				return;
			}
			
			f.method="post";
			f.action="community_write_update.do";
			
			f.submit();	
		}
	
	</script>
</body>

</html>