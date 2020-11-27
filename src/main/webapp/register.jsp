<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/navbar.jsp" %>
<style>
    body {
        background-image: url('public/home-bg.jpg');
        font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
</style>

<br />

<form action="register" method="post">
    <div class="col-md-8 justify-content-between">
        <div class="card bg-light mb-5">
            <div class="card-header">
                <h2>Sign Up</h2>
            </div>
            <div class="card-body">
                <div class="form-horizontal">                    
                    <div class="form-group">
                        <label for="name">Name</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="name" name="name" >
                        </div>                        
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="col-md-10">
                            <input type="email" class="form-control" id="email" name="email" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="password" name="password" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmation_password">Confirmation Password</label>
                        <div class="col-md-10">
                            <input type="confirmation_password" class="form-control" id="confirmation_password" name="confirmation_password" >
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <input type="submit" value="Create" class="btn btn-secondary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<%@ include file="/WEB-INF/footer.jsp" %>
