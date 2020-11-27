package com.elvizablog.controller.post;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elvizablog.model.Post;
import com.elvizablog.repository.PostRepository;

@WebServlet(name = "ShowAllPostController", urlPatterns = { "/posts" })
public class ShowAllPostController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private PostRepository postRepository = new PostRepository();

  public ShowAllPostController() {
    postRepository = new PostRepository();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    try {
      List<Post> posts = postRepository.getAllPosts();
      request.setAttribute("posts", posts);
      RequestDispatcher requestDispatcher = request.getRequestDispatcher("/post.jsp");
      requestDispatcher.forward(request, response);
    } catch (SQLException e) {
      // TODO: handle exception
      e.printStackTrace();
    }
  }
}
