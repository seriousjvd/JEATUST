package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.DishDAO;
import es.unex.giiis.pi.jeatust.dao.JDBCDishDAOImpl;
import es.unex.giiis.pi.jeatust.dao.JDBCReviewsDAOImpl;
import es.unex.giiis.pi.jeatust.dao.ReviewsDAO;
import es.unex.giiis.pi.jeatust.model.Dish;
import es.unex.giiis.pi.jeatust.model.Review;
import es.unex.giiis.pi.jeatust.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@WebServlet(name = "ReviewServlet", value = "/ReviewServlet.do")
public class ReviewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        ReviewsDAO reviewsDAO = new JDBCReviewsDAOImpl();
        reviewsDAO.setConnection(conn);

        List<NameValuePair> queryParams = URLEncodedUtils.parse(request.getQueryString(), StandardCharsets.UTF_8);
        Optional<NameValuePair> restaurantId = queryParams.stream().filter((pair) -> pair.getName().equals("restaurant")).findFirst();
        if (restaurantId.isPresent()) {
            User user = (User) session.getAttribute("user");
            Review review = reviewsDAO.get(Long.parseLong(restaurantId.get().getValue()), user.getId());
            if(review != null) {
                request.setAttribute("reviewComment", review.getReview());
                request.setAttribute("starChecked", review.getGrade());
            }
            request.setAttribute("restaurantId", restaurantId.get().getValue());
            List<Review> reviewList = reviewsDAO.getAllByRestaurant(Long.parseLong(restaurantId.get().getValue()));
            request.setAttribute("reviewList", reviewList);
        }

        RequestDispatcher view = request.getRequestDispatcher("/Rates.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        ReviewsDAO reviewsDAO = new JDBCReviewsDAOImpl();
        reviewsDAO.setConnection(conn);

        String stringId = request.getParameter("restaurantId");
        Review review = new Review();
        review.setGrade(Integer.parseInt(request.getParameter("stars")));
        review.setReview(request.getParameter("review"));
        Review done = reviewsDAO.get(Long.parseLong(request.getParameter("restaurantId")), user.getId());
        String action = request.getParameter("action");
        if (Objects.equals(action, "save")) {
            if(done != null) {
                review.setIdu(user.getId());
                reviewsDAO.update(review);
            } else {
                reviewsDAO.add(review);
            }
        } else {
            if (done != null) {
                reviewsDAO.delete(Long.parseLong(stringId), user.getId());
            }
        }
        response.sendRedirect(request.getContextPath() + "/RestaurantServlet.do?restaurant="+request.getParameter("restaurantId"));
    }
}
