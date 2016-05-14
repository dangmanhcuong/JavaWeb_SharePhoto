/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sevletfile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Photo;
import nhom6.PhotoHelper;

/**
 *
 * @author Nagato_Pain
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/Upload"})
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //
        Part photo = request.getPart("photo");
        String status = "file null";
        if (getFileName(photo).equals("")) {
            request.setAttribute("status", "plese select file");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        } //
        else {
            request.setAttribute("status", " file selected ");
            try {
                InputStream inputStream = photo.getInputStream();
                PhotoHelper helper = new PhotoHelper();
                Photo photo1 = new Photo();
                //
                byte[] src = new byte[inputStream.available()];
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                int nRead;
                while ((nRead = inputStream.read(src)) != -1) {
                    buffer.write(src, 0, nRead);
                }
                byte[] data = buffer.toByteArray();
                buffer.flush();
                //
                photo1.setPhotoSrc(data);
                if (helper.uploadPhoto(photo1)) {
                    request.setAttribute("status", " upload  ok ");
                    request.getRequestDispatcher("/upload.jsp").forward(request, response);
                } else {
                    request.setAttribute("status", " upload  fail when connect database ");
                    request.getRequestDispatcher("/upload.jsp").forward(request, response);
                }

            } catch (Exception e) {
                request.setAttribute("status", " upload fail ex ");
                request.getRequestDispatcher("/upload.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        }
        //
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UploadServlet </title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UploadServlet at " + status + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
