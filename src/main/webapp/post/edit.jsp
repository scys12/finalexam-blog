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

        <div class="d-flex justify-content-center" style="text-transform:uppercase">
            <h3>Edit Post</h3>
        </div>

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" style="background-color: white" name="title" class="form-control" id="title" placeholder="Title">
          </div>
          <div class="form-group">
            <label for="description">Description</label>
            <textarea  placeholder="Description" class="form-control" id="description" type="text" name="description" style="background-color: white" height="auto" rows="7" ></textarea>
          </div>

            <button class="btn btn-secondary" type="submit">
                Edit Post
            </button>
        
    </div>
</div>
<%@ include file="/WEB-INF/footer.jsp" %>