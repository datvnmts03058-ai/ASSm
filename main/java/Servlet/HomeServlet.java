package Servlet;

import java.io.IOException;
import java.util.List;

import Dao.SongDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import Model.Song;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    SongDao dao = new SongDao();
    
    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {
    
        List<Song> songs = dao.findAll();

        req.setAttribute("songs", songs);

        req.getRequestDispatcher("/views/home.jsp")
           .forward(req, resp);
    }
}