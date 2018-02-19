package com.aarongoldbin.controller;

import com.aarongoldbin.persistence.UserDao;
import com.aarongoldbin.persistence.GymDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/**
 * A servlet to searchForm for users
 *
 * @author agoldbin
 */

@WebServlet(
        urlPatterns = {"/searchUser"}
)

public class searchForm extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        GymDao gymDao = new GymDao();

        String searchType;
        String searchTerm;
        String formAction = req.getParameter("searchForm");

        switch (formAction) {
            case "search":
                searchType = req.getParameter("searchType");
                searchTerm = req.getParameter("searchTerm");
                switch (searchType) {
                    case "id":
                        userDao.getByPropertyLike("id", searchTerm);
                        break;
                    case "lastName":
                        userDao.getByPropertyLike("lastName", searchTerm);
                        break;
                    case "gymName":
                        gymDao.getByPropertyLike("gymName", searchTerm);
                        break;
                    default:
                        logger.info("Error in searchForm. Unexpected Search Term. "
                                + "\nsearchType: " + searchType
                                + "\nsearchTerm: " + searchTerm)
                        ;
                }
            case "viewAllUsers":
                userDao.getAllUsers();
                break;
            case "viewAllGyms":
                gymDao.getAllGyms();
                break;
            default:
                logger.info("Error in searchForm. Unexpected form action: " + formAction);
            }

        }
/*


        if (req.getParameter("submit").equals("searchForm")) {

        }
        switch ()


/*
        String searchButton = "submit";



        if (req.getParameter("submit").equals("searchForm")) {
            if (req.getParameter("searchType").equals("lastName")) {
                req.setAttribute("users", userDao.getAllUsersByLastName(req.getParameter("searchTerm")));
            } else if (req.getParameter("searchType").equals("id")) {
                // convert returned user id to a list
                List<User> users = new ArrayList<User>(Arrays.asList(userDao.getById(Integer.parseInt(req.getParameter("searchTerm")))));
                req.setAttribute("users", users);
            } else if (req.getParameter("searchType").equals("gymName")) {
                // convert returned user id to a list
                List<User> users = new ArrayList<User>(Arrays.asList(userDao.getById(Integer.parseInt(req.getParameter("searchTerm")))));
                req.setAttribute("users", users);
            }
        } else {
            req.setAttribute("users", userDao.getAllGyms());
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/results.jsp");
        dispatcher.forward(req, resp);

*/

}