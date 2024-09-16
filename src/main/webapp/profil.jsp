<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="CSS/profil.css">
</head>
<body>
	<c:import url="Header"></c:import>
<form class="container form-horizontal" role="form" action="Profil" method="post" enctype="multipart/form-data">
    <h1 class="text-white text-center my-3">Modifier Profile</h1>
    <c:if test="${msVerifForm }">
    	<h5 class="text-danger text-center my-3">Veuillez saisir tous les champs du formulaire </h5>
    </c:if>
    <hr>
    <div class="row">
        <div class="col-md-3">
            <div class="text-center">
                <img src="${userPhoto}" 
                alt="Photo de profil" 
                style="height: 15rem;width:15rem;border-radius: 50%;margin-bottom: 1rem"
                />
                
                <h6 class="text-white">Upload a different photo...</h6>
                <input type="file" class="form-control" name="profileImage" style="color: orangered">
            </div>
        </div>

        <div class="col-md-9 personal-info my-3">
            
            <div class="form-group mt-2">
                <label class="col-md-3 control-label text-white">Username:</label>
                <div class="col-md-8">
                    <input class="form-control" type="text" value="${prenom }" name="username">
                </div>
            </div>
            <div class="form-group mt-2">
                <label class="col-lg-3 control-label text-white">Email:</label>
                <div class="col-lg-8">
                    <input class="form-control" type="text" value="${emailU }" name="email">
                </div>
            </div>
            <div class="form-group mt-2">
                <label class="col-md-3 control-label text-white">Password:</label>
                <div class="col-md-8">
                    <input class="form-control" type="password" value="${pwd }" name="password">
                    <input type="hidden" name="userId" value="${userId}">
                    
                </div>
            </div>
<!--             <div class="form-group">
                <label class="col-md-3 control-label">Confirm password:</label>
                <div class="col-md-8">
                    <input class="form-control" type="password" value="11111122333">
                </div>
            </div> -->
            <div class="form-group mt-5">
                <div class="col-md-8">
                    <input type="submit" class="btn btn-primary" value="Save Changes">
                    <input type="reset" class="btn btn-danger" value="Cancel">
                </div>
            </div>
        </div>
    </div>
</form>

<hr>
<%-- <c:import url="Footer"></c:import> --%>
  <jsp:include page="footer.jsp" />
</body>
</html>

<!-- ============================================================================= -->
