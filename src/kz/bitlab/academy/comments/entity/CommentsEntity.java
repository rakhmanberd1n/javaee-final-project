package kz.bitlab.academy.comments.entity;

import kz.bitlab.academy.news.entity.NewsEntity;
import kz.bitlab.academy.users.entity.UserEntity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class CommentsEntity {
    private Long id;
    private UserEntity author;
    private NewsEntity blog;
    private String title;
    private String comment;
    private LocalDateTime createdAt;

    public CommentsEntity(){}

    public CommentsEntity(String title, String comment, NewsEntity blog,UserEntity author) {
        this.title = title;
        this.comment = comment;
        this.author = author;
        this.blog = blog;
    }
    public CommentsEntity(Long id, UserEntity author, NewsEntity blog, String title, String comment, LocalDateTime createdAt) {
        this.id = id;
        this.author = author;
        this.blog = blog;
        this.title = title;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    public CommentsEntity(UserEntity author, NewsEntity blog, String title, String comment, LocalDateTime createdAt) {
        this.author = author;
        this.blog = blog;
        this.title = title;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserEntity getAuthor() {
        return author;
    }

    public void setAuthor(UserEntity author) {
        this.author = author;
    }

    public NewsEntity getBlog() {
        return blog;
    }

    public void setBlog(NewsEntity blog) {
        this.blog = blog;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}

