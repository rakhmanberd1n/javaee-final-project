<%@ page import="kz.bitlab.academy.users.entity.UserEntity" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid" style="background: darkblue">
        <a class="navbar-brand" style="font-size: 30px; color: white" href="/"><b>BITLAB NEWS</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="color: white; font-size: 20px">

                <%
                    if (request.getSession().getAttribute("currentUser") == null) {
                %>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" style="color: white;" href="/register">Register</a>
                </li>

                <%
                    }
                %>

                <%
                    UserEntity currentUser = (UserEntity) request.getSession().getAttribute("currentUser");
                    if (currentUser != null && currentUser.getRoleId() == 1) {
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/categories" style="color: white;">Categories</a>
                </li>
                <%
                    }
                %>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/login" style="color: white;">Login</a>
                </li>

            </ul>
        </div>
    </div>
</nav>