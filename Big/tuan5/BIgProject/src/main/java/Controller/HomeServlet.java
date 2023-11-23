package Controller;

import Model.User;
import Service.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/Home")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50
        ,maxFileSize = 1024 *1024 *500
        ,maxRequestSize = 1024 *1024 *500)
public class HomeServlet extends HttpServlet {
    UserDao userDao=new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action=req.getParameter("action");
        switch (action){
           case "update":
               UpdateForm(req,resp);
       }
    }

    private void UpdateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("updateUserForm.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action=req.getParameter("action");
        switch (action){
            case "Home":
                try {
                    Home(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "Logout":
                Logout(req,resp);
                break;
            case "UpdateProfile":
                try {
                    UpdateProfile(req,resp);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "uploadPicture":
                try {
                    UpPicture(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }
    private void UpPicture(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException, ClassNotFoundException {
        Part filePart = req.getPart("file");
        String fileName = extractFileName(filePart);
        filePart.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        HttpSession session= req.getSession();
        User user= (User) session.getAttribute("user");
        int id= user.getId();
        user.setImage("fileImage/" + fileName);
        userDao.AddImage(user.getImage(),id);
        session.setAttribute("user",user);
        req.getRequestDispatcher("updateUserForm.jsp").forward(req,resp);
    }
    public File getFolderUpload() {
        File folderUpload = new File(System.getProperty("user.home") + "/Big/tuan5/BIgProject/src/main/webapp/fileImage");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("Content-Disposition Header: " + contentDisp);

        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String fileName = s.substring(s.indexOf("=") + 2).replaceAll("\"", "").trim();
                System.out.println("Extracted Filename: " + fileName);
                return fileName;
            }
        }

        System.out.println("Filename not found in content-disposition.");
        return "";
    }

    private void UpdateProfile(HttpServletRequest req, HttpServletResponse resp) throws ParseException, SQLException, ClassNotFoundException, ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String a = req.getCharacterEncoding();
        String userName = user.getUserName();
        String password = user.getPassword();
        int id = user.getId();
        String email = user.getEmail();
        int phoneNumber = Integer.parseInt(req.getParameter("phoneNumber"));
        String fullName =req.getParameter("fullName");
        String BirthdateModal = req.getParameter("birthdate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse(BirthdateModal);
        String gender=req.getParameter("gender");
        String image=user.getImage();
        user=new User(id,fullName,userName,password,gender,date,phoneNumber,image,email);
        userDao.UpdateUser(user);
        User user1=userDao.TakeSessionOfUser(userName,password);
        session.setAttribute("user",user1);
        UpdateForm(req,resp);
    }



    // dang suat tai khoan
    private void Logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.invalidate();
        req.getRequestDispatcher("Login.jsp").forward(req,resp);
    }

    // An vao Home thi se vao Trang Home
    private void Home(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUserName();
        String password = user.getPassword();
        userDao.Login(userName, password);
        req.getRequestDispatcher("Home.jsp").forward(req, resp);

    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
