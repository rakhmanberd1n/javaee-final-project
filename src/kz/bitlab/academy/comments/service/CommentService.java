package kz.bitlab.academy.comments.service;

import kz.bitlab.academy.comments.entity.CommentsEntity;
import kz.bitlab.academy.core.DBManager;
import kz.bitlab.academy.news.entity.NewsEntity;
import kz.bitlab.academy.news.service.NewsService;
import kz.bitlab.academy.users.service.UserService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CommentService extends DBManager {

    public static List<CommentsEntity> findAllByNews(Long newsId){
        List<CommentsEntity> commentList = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "select * from comments where news_id = ?");
            statement.setLong(1, newsId);

            ResultSet resultSet = statement.executeQuery();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            while (resultSet.next()){
                CommentsEntity comments = new CommentsEntity();
                comments.setId(resultSet.getLong("id"));
                var createdAt = resultSet.getTimestamp("post_date").toLocalDateTime();
                comments.setCreatedAt(LocalDateTime.parse(createdAt.format(formatter)));
                //comments.setTitle(resultSet.getString("title"));
                comments.setComment(resultSet.getString("comment"));
                comments.setBlog(NewsService.findById(resultSet.getLong("news_id")));
                comments.setAuthor(UserService.findById(resultSet.getLong("user_id")));

                commentList.add(comments);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return commentList;
    }

    public static void create(CommentsEntity comment){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "insert into comments (title, comment, news_id, user_id)" +
                        "values (?, ?, ?, ?)");
            statement.setString(1, comment.getTitle());
            statement.setString(2, comment.getComment());
            statement.setLong(3, comment.getBlog().getId());
            statement.setLong(4, comment.getAuthor().getId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteByNewsId(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "delete from comments where news_id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
