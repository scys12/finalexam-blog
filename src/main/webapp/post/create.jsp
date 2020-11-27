<%@ include file="/WEB-INF/header.jsp" %>
<%@ include file="/WEB-INF/navbar.jsp" %>
<style>
    .container-create-post:hover{
        transform:translateY(5px);
    }
</style>
<br />
<br>
<br>
<div class="page-header clear-filter" filter-color="orange">
    <div class="page-header-image" data-parallax="true">
    </div>
    <div class="container container-create-post shadow p-5" style="transition:all ease 0.3s;background:#ddd;border-radius:10px">
        @if ($errors->any())
            <div class="alert alert-danger">
            <ul >
                @foreach ($errors->all() as $error)
                    <li style = "list-style-type: none; text-align:right; padding-bottom:5px"><strong>{{$error}}</strong></li>
                @endforeach
            </ul>
            </div>                  
        @endif
        <div class="d-flex justify-content-center" style="text-transform:uppercase">
            <h3>Create Post</h3>
        </div>
        <form method="POST" action="{{action('PostController@store')}}">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" style="background-color: white" name="title" class="form-control" id="title" placeholder="Title">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea  placeholder="Description" class="form-control" id="description" type="text" name="description" style="background-color: white" height="auto" rows="7" ></textarea>
            </div>
            <button class="btn btn-secondary" type="submit">
                Create Post
            </button>
        </form>
    </div>
</div>
<%@ include file="/WEB-INF/footer.jsp" %>