<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.academy.news.entity.NewsEntity" %>
<%@ page import="kz.bitlab.academy.categories.entity.CategoryEntity" %>
<%@ page import="kz.bitlab.academy.users.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>

<div class="container">
    <%
        List<CategoryEntity> categories = (List<CategoryEntity>) request.getAttribute("categories");
        for (CategoryEntity category : categories) {
    %>
    <div class="p-4 mb-4 rounded bg-body-secondary mt-2">
        <div class="col-lg-6 px-0">
            <h3 >Category name: <b><%=category.getName()%></b></h3>
            <form action="/deleteCategory" method="post">
                <input type="hidden" name="id" value="<%=category.getId()%>">
                <button type="submit" class="btn btn-danger mt-3">DELETE</button>
            </form>

        </div>
    </div>
    <%
        }
    %>
    <form class="form-control w-30" action="/categories" method="post">
        <div class="modal fade" id="addCategory" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-floating">
                            <input class="form-control" id="floatingInput" placeholder="Test category" name="name">
                            <label for="floatingInput">NAME:</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-success">ADD</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategory" style="margin-bottom: 10px">
        ADD CATEGORY
    </button>
</div>

</body>
</html>

