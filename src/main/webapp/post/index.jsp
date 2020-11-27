<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/navbar.jsp" %>    
<%@page import="com.elvizablog.repository.PostRepository"%> 
<%@page import="com.elvizablog.model.Post"%> 
<%@page import="com.elvizablog.model.User"%> 
<%@page import="java.util.List"%> 
<%@page import="javax.servlet.http.HttpSession"%>
    <style>
        body {
            background-image: url('public/bg-7.png');
            }
    </style>
    <br>
    <br>
    <br />
    
    <div class="row justify-content-center">    
        <div class="col-md-8 "> 
            <c:if test="${not empty status}">
                <div class="alert alert-success" role="alert">
                    ${status}
                </div>
                <c:set var="status" value="" scope="session"/>
            </c:if>       
            <c:if test="${not empty wrong_auth}">
                <div class="alert alert-success" role="alert">
                    ${wrong_auth}
                </div>
                <c:set var="wrong_auth" value="" scope="session"/>
            </c:if>       
            <div class="pull-left">
                <h2 style="font-weight: bold;">All My Posts</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="create.jsp"> Create New Post</a>
            </div>
        </div>
    </div>
    <div class="row justify-content-center"> 
        <table class="table table-bordered table-hover col-md-8 " style="table-layout: fixed">
            <tr>
                <th width="50px">No</th>
                <th>Title</th>
                <th>Description</th>
                <th width="280px">Action</th>
            </tr>
            <tbody>
                <%
                    PostRepository postRepository = new PostRepository();
                    User user = (User) session.getAttribute("user");
                    List<Post> posts = postRepository.getUserPosts(user.getId());
                    for(Post item: posts){%> 
                        <tr>
                            <td><%=item.getId()%></td>
                                <td style="word-wrap: break-word"><%=item.getTitle()%></td>
                                <td style="word-wrap: break-word">
                                    <%=item.getDescription()%>
                                </td>
                            <td class="d-flex justify-content-center">
                                <a class="btn btn-info mr-2" href="show.jsp?id=<%=item.getId()%>">Show</a>
                                <a class="btn btn-primary mr-2" href="edit.jsp?id=<%=item.getId()%>">Edit</a>
                                <form action="delete" method="post" id="delete-form">
                                    <input type="hidden" name="id" value="<%=item.getId()%>">
                                    <a class="btn btn-danger" href="delete" onclick="event.preventDefault();
                                                                        document.getElementById('delete-form').submit();">
                                        Delete
                                    </a>
                                </form>
                                
                            </td>
                        </tr>
                    <%}
                %>
            </tbody>
        </table>
    </div>
<%@ include file="/WEB-INF/footer.jsp" %>