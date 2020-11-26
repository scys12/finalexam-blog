<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/navbar.jsp" %>    
    <!-- <style>
        body {
            background-image: url('../../Content/bg-7.png');
            "}
    </style> -->
    <br>
    <br>
    <br />
    
    <div class="row justify-content-center">    
        <div class="col-md-8 ">        
            <div class="pull-left">
                <h2 style="font-weight: bold;">All My Posts</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="/elvizablog/post/create.jsp"> Create New Post</a>
            </div>
        </div>
    </div>
    <!-- @if (ViewBag.Message != "")
        {
            <div class="alert alert-@ViewBag.Status">
                <strong>@ViewBag.Message</strong>
            </div>
        } -->
    <div class="row justify-content-center"> 
        <table class="table table-bordered table-hover col-md-8 " style="table-layout: fixed">
            <tr>
                <th width="50px">No</th>
                <th>Title</th>
                <th>Description</th>
                <th width="280px">Action</th>
            </tr>
            <tbody>
                <tr>
                    <td>1</td>
                        <td style="word-wrap: break-word">Judul Post)</td>
                        <td style="word-wrap: break-word">
                            Deskripsi
                        </td>
                    <td class="row justify-content-center">
                        <a class="btn btn-info mr-2" href="../Post/Show/@item.PostID">Show</a>
                        <a class="btn btn-primary mr-2" href="../Post/Edit/@item.PostID">Edit</a>                       
                        <a class="btn btn-danger" href="" onclick="event.preventDefault();
                                                                document.getElementById('delete-form').submit();">
                            Delete
                        </a>                       
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
<%@ include file="/WEB-INF/footer.jsp" %>