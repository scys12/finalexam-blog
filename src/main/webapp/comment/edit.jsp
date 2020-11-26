<%@ include file="/WEB-INF/header.jspf" %>
<%@ include file="/WEB-INF/navbar.jspf" %>
    <br>
    <br>
<style>
    .container-create-post:hover{
        transform:translateY(5px);
    }
</style>
<br />

<div class="page-header clear-filter" filter-color="orange">
    <div class="page-header-image" data-parallax="true">
    </div>
    <div class="container container-create-post shadow p-5" style="transition:all ease 0.3s;background:#ddd;border-radius:10px">

        <div class="d-flex justify-content-center" style="text-transform:uppercase">
            <h3>Edit Comment</h3>
        </div>
        <div class="form-group">
            <label for="description">Comment</label>
            <textarea  placeholder="" class="form-control" id="description" type="text" name="description" style="background-color: white" height="auto" rows="7" ></textarea>
        </div>
        <button class="btn btn-secondary" type="submit">
            Edit
        </button>
        
    </div>
</div>

<%@ include file="/WEB-INF/footer.jspf" %>       