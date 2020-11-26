<nav class="navbar fixed-top navbar-expand-md navbar-dark bg-dark text-white shadow-sm">
    <div class="container">            
        <a class="navbar-brand" href="#">
            ElvizaComunity
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left Side Of Navbar -->
            <!-- Right Side Of Navbar -->
            <ul class="navbar-nav ml-auto">
                <!-- Authentication Links -->
                <!-- @if (Request.IsAuthenticated)
                { -->
                    <li class="nav-item">
                        <a class="nav-link" href="/AllPost">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Post/Index">My Post</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                           Nama<span class="caret"></span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            @using (Html.BeginForm("Logout", "User", FormMethod.Post, new { id = "logout-form" }))
                            {
                                @Html.AntiForgeryToken()
                                <a class="dropdown-item" href="" onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                    Logout
                                </a>
                            }
                        </div>
                    </li>
                <!-- } -->
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Registration</a>
                </li>                     -->
            </ul>
        </div>
    </div>
</nav>