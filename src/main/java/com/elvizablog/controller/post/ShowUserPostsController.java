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
import com.elvizablog.model.User;
import com.elvizablog.repository.PostRepository;

@WebServlet(name = "ShowUserPostsController", urlPatterns = { "/post/index" })
public class ShowUserPostsController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private PostRepository postRepository = new PostRepository();

  public ShowUserPostsController() {
    postRepository = new PostRepository();
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    try {
      User user = (User) request.getSession(false).getAttribute("user");
      List<Post> posts = postRepository.getUserPosts(user.getId());
      request.setAttribute("posts", posts);
      RequestDispatcher requestDispatcher = request.getRequestDispatcher("/post/index.jsp");
      requestDispatcher.forward(request, response);
    } catch (SQLException e) {
      // TODO: handle exception
      e.printStackTrace();
    }
  }
}
