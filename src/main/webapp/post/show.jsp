<%@ include file="/WEB-INF/header.jspf" %>
<%@ include file="/WEB-INF/navbar.jspf" %> 
<br>
<br>       
        <div class="container mt-5 mb-5 ">
            <div class="d-flex justify-content-center row">
                <div class="col-md-8">
                    <a href="/Post/Index" class="font-weight-bold" style="color:dark;">Kembali</a>
                    <div class="card mb-4 p-4">
                        <h5 class="card-title">Judul</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Author : Penulis</h6>
                        <div class="card-body">
                            <p>Deskripsi</p>
                        </div>
                    </div>
        
                    <!-- BUAT KOMENTAR -->
                    <h5> Tambahkan Komentar </h5>
                    <!-- @using (Html.BeginForm("CreateComment", "Post", new { id = Model.Item1.PostID }, FormMethod.Post))
                    {
                        @Html.AntiForgeryToken() -->
                    <div class="form-group">
                        <textarea name="description" class="form-control" rows="3"></textarea>
                    </div>
                    <button class="btn btn-primary mb-5" type="submit">Add Comment</button>
                    <!-- } -->
        
                    <!-- DAFTAR KOMENTAR -->
                    <h3 class="mb-3">Komentar </h3>
                    <!-- @foreach ($jawaban as $jwb) -->
                    <div class="card bg-white ">
                        <div class="card-header">
                            <!-- @if ($jwb->user_id == Auth::user()->id) -->
                            <a class="nav-link nav-link-right dropdown-toggle float-right " role="button" data-toggle="dropdown"></a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown " >
                                    <form action="/jawabans/{{$jwb->id}}/edit" class="mt-2 ml-2 float-left"> 
                                    <!-- @csrf -->
                                    <button class="btn btn-warning "type="submit" >Edit</button>   
                                    </form>  
                                    
                                    <form action="/jawabans/{{$jwb->id}} " class="mt-2 mr-2 float-right " method="post"> 
                                    <!-- @method('delete')
                                    @csrf -->
                                    <button class="btn btn-danger "type="submit" >Delete</button>   
                                    </form>
                                </a>
                            </div>
                            <!-- @endif -->
                            <div>Nama </div>
                        </div>
                        <div class="comment-text-sm ml-3">
                            <span>Isi Komentar</span>
                        </div>
                    </div>
                    <h1> </h1>
                    <!-- @endforeach -->
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/footer.jspf" %>