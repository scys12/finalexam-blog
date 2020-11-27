<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/navbar.jsp" %>
<style>
    body {
        background-image: url('public/home-bg.jpg');
        font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
</style>

<br />
<form action="login" method="post">
    <div class="col-md-8 justify-content-between">
        <c:if test="${submitted}">
            <p>Lemah</p>
        </c:if>    
        <div class="card mb-5 bg-light">
            <div class="card-header">
                <h2>Login</h2>
            </div>            
            <div class="card-body">
                <div class="form-horizontal">
                    <div class="form-group">                        
                        <label for="email">Email</label>
                        <div class="col-md-10">
                            <input type="email" class="form-control" id="email" name="email" >
                        </div>
                    </div>
    
                    <div class="form-group">                        
                        <label for="exampleInputPassword1">Password</label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <input type="submit" value="Log In" class="btn btn-secondary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%@ include file="/WEB-INF/footer.jsp" %>    
