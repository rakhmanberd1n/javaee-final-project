<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.academy.news.entity.NewsEntity" %>
<%@ page import="kz.bitlab.academy.categories.entity.CategoryEntity" %>
<%@ page import="kz.bitlab.academy.comments.entity.CommentsEntity" %>
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
        NewsEntity news = (NewsEntity) request.getAttribute("news");
    %>
    <div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary">
        <div class="col-lg-6 px-0">
            <h1 class="display-4 fst-italic"><b><%=news.getTitle()%></b></h1>
            <p class="lead my-3"><%=news.getContent()%></p>
            <p class="lead my-3"><%=news.getCategory().getName()%></p>
            <p class="lead my-3">This news posted at <b><%=news.getPostDate()%></b></p>
        </div>

        <%
            if (request.getSession().getAttribute("currentUser") != null){
        %>
        <form class="form-control mt-3" action="/addComment" method="post">
            <input type="hidden" name="newsId" value="<%=news.getId()%>">
            <div class="mb-3">
                <label class="form-label"> Title: </label>
                <input class="form-control" placeholder="Comment title " name="title">
            </div>
            <div class="mb-3">
                <label class="form-label"> Comment: </label>
                <textarea class="form-control" placeholder="comment..." name="comment"></textarea>
            </div>
            <button class="btn btn-success">Add comment</button>
        </form>
        <%
            }
        %>

        <hr>

        <%
            List<CommentsEntity> commentList = (List<CommentsEntity>) request.getAttribute("commentList");
            for(CommentsEntity comment : commentList) {
        %>

        <div class="row mt-2">
            <h3><%=comment.getAuthor().getFullName()%></h3>

            <p><%=comment.getComment()%></p>
            <p>At <b><%=comment.getCreatedAt()%></b> </p>
        </div>

        <%
            }
        %>
    </div>


    <%
        if (currentUser != null && currentUser.getRoleId() == 1) {
    %>
    <div class="mt-3">
        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateNews">
            UPDATE
        </button>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteNews">
            DELETE
        </button>
    </div>
    <%
        }
    %>


    <form class="form-control w-30" action="/details" method="post">
        <div class="modal fade" id="updateNews" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" value="<%= news.getId() %>">
                        <div class="form-floating">
                            <input style="margin-bottom: 10px" class="form-control" id="floatingInput" placeholder="Test title" name="title" value="<%=news.getTitle()%>">
                            <label for="floatingInput">TITLE:</label>
                        </div>
                        <div class="form-floating">
                            <textarea style="margin-bottom: 10px" class="form-control" placeholder="Test content..." name="content"><%=news.getContent()%></textarea>
                            <label>CONTENT:</label>
                        </div>
                        <div class="form-floating">
                            <select class="form-select" name="categoryId">
                                <option selected value="<%=news.getCategory().getId()%>"><%=news.getCategory().getName()%></option>
                                <%
                                    List<CategoryEntity> categories = (List<CategoryEntity>) request.getAttribute("categories");
                                    if (!categories.isEmpty()) {
                                        for (CategoryEntity category : categories) {
                                %>
                                <option value="<%=category.getId()%>"><%=category.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-warning">UPDATE</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <form class="form-control w-30" action="/deleteNews" method="post">
        <div class="modal fade" id="deleteNews" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" value="<%=news.getId()%>">
                        Are you sure to want to deleting???
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-danger">DELETE</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>

</body>
</html>
