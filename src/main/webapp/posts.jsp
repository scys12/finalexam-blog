<%@ include file="WEB-INF/header.jsp" %>
<%@ include file="WEB-INF/navbar.jsp" %>
<%@page import="com.elvizablog.repository.PostRepository"%> 
<%@page import="com.elvizablog.model.Post"%> 
<%@page import="java.util.List"%> 
    <div class="container mt-4">
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
                    <%
                        PostRepository postRepository = new PostRepository();
                        List<Post> posts = postRepository.getAllPosts();
                        for(Post item: posts){%> 
                            <div class="list-group list-group-flush">
                                <a href="/elvizablog/post/show.jsp?id=<%=item.getId()%>" class="list-group-item list-group-item-action">
                                    <div class="d-flex">
                                        <small class="mb-1">
                                            <%=item.getUser().getName()%>
                                        </small>
                                    </div>
                                    <p><%=item.getTitle()%></p>
                                    <small><%=item.getDescription()%></small>
                                </a>
                            </div>                            
                        <%}
                    %>                    
                </div>
            </div>
        </div>
    </div>
<%@ include file="WEB-INF/footer.jsp" %>       





