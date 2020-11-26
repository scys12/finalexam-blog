<%@ include file="WEB-INF/header.jsp" %>
<%@ include file="WEB-INF/navbar.jsp" %>
    <br>
    <br>
    <br>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header ">
                        <h2 style="font-weight: bold;"> All Post </h2>
                        <!-- kalo mau dikasih Search -->
                        <!-- <ul class="navbar-nav float-right">
                            <form class="form-inline" method="GET" action="/home">
                                <input name="cari" class="form-control mr-sm-2" type="search"
                                       placeholder="Search Jobs..." aria-label="Search">
                                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </ul> -->
                    </div>
                    <div class="list-group list-group-flush">
                        <a href="" class="list-group-item list-group-item-action">
                            <div class="d-flex">
                                <small class="mb-1">
                                   Nama Pengunggah
                                </small>
                            </div>
                            <p>Judul</p>
                            <small>Deskripsi </small>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="WEB-INF/footer.jsp" %>       





