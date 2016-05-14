<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%-- 
    Document   : Home
    Created on : Apr 23, 2016, 2:12:20 PM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                background: white }
            section {
                background: black;
                color: white;
                border-radius: 1em;

                position: absolute;
                top: 260%;
                left: 50%;
                margin-right: -50%;
                transform: translate(-50%, -50%) }
            </style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Share Photo Page</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        </head>
        <body>
            <nav  id="HeaderBar" class="navbar navbar-inverse" style=" width: 100% ; position: fixed;">
            <div class="container-fluid" >
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Team 6</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li ><a href="#">Home</a></li>
                        <li ><a href="#">Photo Hot</a></li>
                        <li><a href="#">New Photo</a></li>
                    </ul>
                    <%  String welcomeMember = "";
                        HttpSession sess = request.getSession(false); //use false to use the existing session
                        Object testObject = sess.getAttribute("nickname");//this will return username anytime in the session
                        Boolean flagUploadAndLogout = false;
                        Boolean flagLogin = true;
                        String styleUploadAndLogout = "visibility: hidden";
                        String styleLogin = "visibility: visible";
                        Object object = request.getAttribute("nickname");
                        if (object != null) {
                            flagLogin = false;
                            flagUploadAndLogout = true;
                            welcomeMember = "Hello " + (String) testObject;

                        } else {
                            HttpSession newsession = request.getSession(false);
                            if (newsession != null) {
                                newsession.invalidate();

                            }
                        }
                        if (flagUploadAndLogout) {
                            styleUploadAndLogout = "visibility: visible";
                        }
                        if (!flagLogin) {
                            styleLogin = "visibility: hidden";
                        }


                    %>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="profile.jsp"  name="user" > <%=welcomeMember%></a></li>
                        </li>
                        <li style='<%= styleUploadAndLogout%>'>
                            <a href="upload.jsp"><span class="icon-bar"></span> Upload</a></li>
                        <li  >
                            <a href="signup.jsp"><span  class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li style='<%= styleLogin%>'>
                            <a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li style='<%= styleUploadAndLogout%>' >
                            <a href="Home.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>

                    </ul>
                    <div>
                        <input  type="text" placeholder="Search here..."  style="vertical-align: auto;" required>
                        <input  type="submit" value="Search" name="Search" style="margin:  12px 10px;" />
                    </div>
                </div>

            </div>

        </nav>

        <!--        <div class="container">
                    <h3>Collapsible Navbar</h3>
                    <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
                    <p>Only when the button is clicked, the navigation bar will be displayed.</p>
                </div>-->
        <section><ul id="myList" style="padding-top: 100px; ">
                <li><div class="content"><img width="600" height="600" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQEhUREBAQFRUVFRYVFxUVFQ8PFhYWFhcWGBgWFRUYHSggGBonGxYXITEiJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQFS0dHyUtLS0tLS0tLSstLS0tLS0tLS0tLS0uNzctKy0tKy0rKy0tMy0tLS0tLSstLS0tLSstK//AABEIAKkBKgMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAgQFBgcDAQj/xABFEAACAQIBCAYHBQcEAAcAAAABAgADEQQFBhIhMUFRYSJxgZGhsQcTMkJScsEjgrLR8BQ0YnOSosIkM0PhU2ODo9Li8f/EABgBAQADAQAAAAAAAAAAAAAAAAABAgME/8QAIBEBAQEBAAIDAQEBAQAAAAAAAAERAgMxITJBIlFxEv/aAAwDAQACEQMRAD8AyCEIQCEIQCEIQCEIQCEIQCEIQCEIGBY8i0tGkDvYk/QeAj+c8OmiqrwUDuE6TN38zJghCEJEIQgEIQgEIQgEIQgEIQgEIQgV/L1O1QH4l8Rq8rSNkxnCNadTf4yItLz04vJ9q8hPbQkqPIT20IHkJ7CAQntoWkpeQntp7aAmEVaFoCYRVoWgJhFWhaAmEVaFoCYumtyBxIHjPLTphx01+ZfMSCLXCEJm7xCEIBCEIBCEIBPUUkgDaZ5LFmVkb9prAEdEa2PBR7XadS9smTVeusmozG4MKgI3bTxvv74wmiZ8ZIFKppqoFOqLWGoBgNYHC4se+Z7UQqSp3G0WYr4+thMIQkNBCEIENnD7n3v8ZESYy/tT73+MibTTn04/L96TCKtC0lQmEVaFoCYRVoWgFp7aKtC0kJtC0VaFoCbQtFWhaAm0LRVoWgJtC0VaFoCbQtFWhaAm0XQ9pfmHnPLRdBCWUKCWJFgAWJPAAazIItBhGmUa2ilhtbV2b/1zneg11U8QJk73SEIQCEIQCEIQFU0LEAbSbTY8xslChhw5HSqWPUg9kdutvvTNs0Ml/tFdV3E2PJRrY92rtm1qANQFgNQE08c/XN5uvnDDLuThiaLU9+1TwcbPy6iZi+WKBVrkEH2SOBHHn+U3iZv6Q8kaLmoo6NUaXVUXb36j2mT3P1Xx9ZWfwnk9mTrEITwwIjLu1Oo/SRdpoOS8zhlGk7isab02CrdQ6EEXOkNRB5g9hlXy9mzi8Cf9RSIW9hVTp0z973epgDL82enJ5ftUNaFoq0LS7Mm0LRVoWgJtC0XaFoBaFoq0LQE2haKtC0Dy0LRVoWjAm0LRVoWjAm0LRVoWjAm08OqPcm5OrYmoKVCmzudw3DezHYq8zNazRzCo4TRq19GtXGsG16dM/wACnaf4j2ASvXU5MUjNj0f4nF2qVr0KR13YfaOP4EOwc27jNUyDm5hcELYekATqao3TqN1udduQsOUlZGZeyuuFS+ou2pF5/EeQmN6tWxhWUn+0K/ASvcbHxj7JrXpjkSPr9ZG46/rKl9um5PWWMeZJbUw6j+u6WdkSEIRKsDs427oSVCEIBCE74KnpOOA1ns/QhFuNK9GmTNBHrEa/9seDP46I7DLvGOQ8H6ihTp21hQW+ZtbeJMb5w5wUcEgappM7X0KSDSdyOA91RvY2AvzAm8+I4r81LSNzhyd+00HpgdIdJPnXZ36x2yo4PLuWcdc0KWFw1MbXfSrlePSNl7gYwxNagTo4vOVSb61pVVpqDvH2LL4yN38W/wDMnuqZi6Oix6z9D9ZxkjlilhFdhhcRSrAFemjhywIuSdZN7m3ZIx2ABJ2DXMq6uLsKnOrUsVHE28D/ANRODYlATvue8mMso1rOv8Ovt/8Ay0hZqfo1H2NX+YPwiW51DAhgCCLEEAgjgQdsyrNvKlTDkvTNwT0lPssOfPnNMyZlGniE06Z5FTtU8DKVy9/aqLnd6OEYGtgAFfaaFwEb+WT7DcvZ+WZfUpspKspVlJBUgqQRtBB2GfSsqOfOZyY1TVpALiFGo7BVA9x+fBt2zZsvx5PyqWMWhadKtJlYqylWUlSpFiCDYgjcbxNpuqTaEVaFoHtoWi7QtARaFou0LQEWhaLtC0BFoWi7QtARaTua2a1fHvZBoUlPTqkXUfwqPeflu321XdZlZrHH1CWJWjTt6xhtYnYinid53DrE2fCYWnRRadJFRFFlVRYATPvvPiJkMsg5DoYKn6qglt7MdbueLtv6tg3ASThOGMxSUUNSobKP0ABvMw9rOeVMoJh6ZqP1Ab2bcBM3x+Meu5qVDcnuA3KOU7ZZyo+JqabagNSruUfnxMYyZEKnlZbVn6794B+s9yW1ntxB/OdcvLaseaqfp9Izwb2dTzt36pd18+ol8XW0FJ37B1zhkpugfmPkI0yjW0msNi6u3fO+SD7Q6j5wskYTwm239XnsDyWLMjBeuxCKRqLi/wAqdNh3ASvW3zQvRbhOk1S3spbtdtXgh75bmbWfluctGmaY3ErXxFfEVVqVKdIFvV0wWd1VgiILeyCWBLbACxJG2aUZAZMzYpIlJj6xKyqNJ0cqSx1kHdtJHVNbNcsZBl18pZTt66pSo4cWCUEY+qQEaVMsFFn4aRO3YBsnDIuQK5SphauGXRNRStQL9qzAgWRtvqtHSYi25ec3KvkDDOdLQKtb2qbNRJvtLBCAx6xOFXNii6lXq4plPu+udB3pY+MvMiGM4vIWFw1iGIrEtoppaZ0LkFmA2C2822iReVKtl0fi8h+hLrnjkmhhKlSlh6YRPszYXY7F2sxJY6t5Mz3H1NJzwGru2+Mw7u11eH6pPBf7a9Uh61TSYtxMkKlTRojiRbv2+EjJVos+Q6l6XUbdwH0tJvJuUKmHcPTPIg7GHAyAzd/2j858lkoJWuXv7VqGTMemIpionURvU7wY7lCzMxJXEaF9VRSCOagsD4EdsvspUM79KObQZf26kvSWwrAe8uwVOsageXyzMbT6PrUldSjgFWBVgdhBFiD2TAMuZNOFxFWgxv6trAnepAKnrKkGbeLrZiLEfaFp7pDiO8T2aoe2haL0YWkoItC0Xae2gc7QtOloWgc7QtOlpxrYhVBuewa4G2ejrAijgKRsL1NKq3PSPR/sCyyxjkOjoYagg92jTXuRRH04+rtXeEzOMv5XbE1DrPq1J0F2atmkeZ8L2lyzpxJp4Z7bWsg+8df9t5nJkwewhCShXs41+0U8Vt3E/nIai2rtPmZPZyr/ALZ+Yfhlewx1H5jLz06OL8R2j3JJ6RHLyI/OMp1w9YobjgR3w0OsoYnpADYpBPXJOV0yewp0lXmB3yEnWIWwT5b95P0tNZ9HWG0MLfez+Cqo89LvmZZWwpU0judbDqDlfMGbBmrS0MJRHFS39TFvrNOJ8ufyX+YloQMJqwEIQgZP6Uq2jWqHgKffo3Ey2aF6Xav+oYfxp4Ul+pmezDr26/H9XavVuEX4V8T+hG6nb1xQ22nCzKHVgQylrg7QZC1q1Zun7I/OfJZKSGzZqXRrcQe8f9SYMrXP39kzml+9U+p/wNNDlFzIo3rlvhpnvJAHheXqUqomR+mjJujWo4kDVUQ0m+ambr2lWP8ARNclT9KGTvX5PqkC7UStYdSan/sZ5PN+RhMIQmqU1aFoq0LTdQm0LRULQE2nGviFTmeH5z3F1dFdW3ykUZTrrEyOtXEM2+w4CLwOAeu2gurV0m3KOPXwETg8K1VwibT3AbyeUvGBwSUU0E7TvY8TMrUthpLZQOAA7hFzyezEV/PZCcOCN1RSeqzDzIlEmn5XwnrqNSnvZdXzDWviBM0o077e6W5CUQnZO6UQNuudAITTE4gs7V+zQ/x271P5Sn4M+11y651L9iDwcHwYfWV3D4PRwSVLa2qsey2j5p4yWvN9GsJ4yk2A2llA6ywA857IaiWDIA0tDkSe65/KV5TfXLbmDhfXVVTcXCnqJW/gDCOrkWvPTAeqGAFv+Jr/ADAq7eLmaVk2noUaS/DTQdygSCz7yYa1Jag20S7n5SjA+IWSONyqMKbYgEUzqSqoLD5HUey3PYeWyayZa5LdkSzfSeRjkrGNXX1hplEPsBvaYfGw3X3Dt3iPpdUQhGuUsWKFJ6p9xSRzPujtNh2wMP8ASbidPFEjZp1f7SqjwWU68m87KhNZQTeyA9pZr/SQbKQ2v4AR1Ekf4znrr5+OYd5HpaeIRd11PYLsfKTmcmThcYlRrW3rB8SD3useXVPMiYTRxFS//HTpp95kUn/Lvmu5kZMUUGqOoPrSRYgHoLcWseJ0vCWk1l31+sfydhvUV6iD2XXTTqB1r2Fu4iS0uGe2agp/6nDrZV1ug9zVYso+HiNxF9mynSnUyqbq65iYe1OpU+Jgo6lF/NvCWeMMhYX1WHpoRr0bnrbpHzt2R/M6CMcuW/Zq2lsNKoD2qRbxj6VfPXKQVP2dT0msX5KNYHWTbsHOIMHq0ijFDtUlT2G08tJPOSho4g298K3fqPip743CzVaTUnaFou0LTpZkWnjkAXM6WjHFVLmw2DzkdXImTa4VjpXjKPY+zbyfp1DUYdGmdXNto7hr7ROfV+k1kLJ3qE6Q6ba25cF7PO8seQMn/tFZUI6I6T/KN3abDtkdLjmHQslWpxYL/SL/AOUpaotInsISiRKFnDgfU4hrDo1OmOu/SHf4ES+yHznwXrKJYe1T6Y6veHdr+6Jbm/IpMIQmqyJzp/dnPDR8wPrPMfgtDB+r/wDDRe9LEnwMkMbh/WLon4kbsV1a3hOlenpqyn3gR3i0JlUbJyaVakP/ADUP9J0v8YjF09B3X4WYdxMc5Bpk4mlyLE9iMPMiGcaaNapz6Xeov43kNd/qo6iOivUD3i/1mmehrCaVVnI9jSb+1VH4z3TO8TT0SF4JTH/trNi9DeHC4d23kr3Eufy7pbn2r3f4XzFhWVkYMQylTZS2oi08fFpvFTtpVrfhjiR1SpjAbCnh3HxesqUu9dFrdhM1cxyMbT+MDruvnHERSL26YUHeFJIHaQL9wiibcgOySPZnXpEzpphfVI11U9Kx9txsUchvP5a+meueyqDRoEkN0br7VQ/DT/h4tv8AOj4XJ7O3rsRYt7qbVQbuszPrr8WkVjGPUq1emOmxAA2WvbRFt20R02GDY31Q9lTST7qU1Y/XvjnAU/W4123Izt/SdEeNj2RzkWlpYnEVeDlB130T+Dxmbe3M/wCJjJeELOwUdKrVsPCmv4fGbPhaC00WmuxFCjqAtKBmPgg1Y1WsEorpXOoBmuBc9WkewSfx+dBa6YGkazbPWWtSU/MbaXeBzM05sk2sOvk7zmy8mEp7mqMCEQ677tJv4R47OrN8hZPbEVlGj0QwZyAAoW9yOAvsA58pY6ObL1XNXGVi7NrIXyLbhyAEsWGwyUlCU1CqNw1dvM85j33pI6whG2UMalCmajnUN28nco5zNJrl7Ky4anfUXbUi8+J5CZ1Wqs7FnJLMbkneZ2yjjnr1DUfadg3KNyjlGGLxK0l0mPUN5PAS8ghM6FUtTN9YDauRIsfOQ07YvENUcu207uA3ATjLNJMTFoWi7QtOtia4upojVtMjp1xNTSYndsHVOU5+7ta8zIJYM2q/RanvB0hzB1HyHfK/HOTsT6qor7th+U7fz7JSps2LjLrmJWBpVE3q+l2MoA/CZSpPZmYrQxGgdlRSv3h0h5EdsrWS+whCUSJ4RPYQKFlzJv7PUsL6Da1PLeOsflI6aBljACvTKe8Nangw+h2dsq2SMhviVqhDapSK9BtQa+kCL7iCs15up1EQnTEUHpsUqKVYbQRYznLJVvJeH0cbUG5VqH+pkt4NG+elOxDcabD+m/8A8hJ+lhrYipUtqamgvzuwPgqyPzwoaVEHgxHYwP1AkLS/KGy4ujWcck/AsuuaOcdTJbhK66VBwo0xqK22A8xc9Y8Krl+jfFBfj0B39H6S01KasCrAEHUQdkmVPfzI2DA4ynXQVKThlOwjyPAxxMJwWKxeTW08K7NT30zrsOFt47PzllT0uLoa8N9p19G/y/8A2mk7jCxpWNxlOipeqwVRvO/kBvPITLs6c9qmLY4fCL0d+vV11GG35R4yEyhjMZlBtPEO1OnuQamI4W90fo32xxh6CU1CooA4DzPEyt61aRwwWACEuxL1Dtc+SjcI9E8jnA4KpWbRpqTxOwDmTulEq9m1R6L1TtdzbqBP1J7pO5pZu1alPTtoLUd6pdgdYdiRojfqtylnzazYp4akgqDSqBRf4VY6zojebnafCWBECgACwAAA4AagJS9f4nq7THCZHo009XYuL6RD9IFtWsrsOzVq1R+BbUNQ4bJ7CV1UQhCQEu4UEsQABck6gANpMzvOHK5xNTVcU11INnWx5nwEkM98vqt6IcBQftDxYe4ONt/PqmcY/LjN0aQKj4j7R6uH62S0hmpXKGU0o6trblH1O6VnF4p6raTm/AbhyAnEmeS+LyYIQhJWT1oivqVjwB8p1tOddbqw5HynXfTFBwhCcjYQhCBZ8g4rTp6J2pq7Nx+nZJahVKMrrtUhh1g3EpWBxRpOHHURxG8S3YeutRQym4P6secrWfUxrWFxC1EWouxlDDt3TrKrmRlC6tQY616SfKfaHYdf3jLVKIEIQkAnPJuE0MS1RdlSnZh/GpFj2i/dznSeq1jcbpbm5dDnKmSqOJXRqre2xhqZeo/TZKDl3Nyrhbt7dP4wNnzjd17PKaTSfSAIimUEEEAgixB1gg7QROqyVWXGNRrlTD+spOu+1x1g3HlLTnPm+2GbTpgmix1HboE+63LgezbtgJlZi8qEylRvjKJ4j8BZvyk3G1fD6VSnU+DTH9Q/68Y5ha0TmMOgbT0F0vi0RfvnSEIEBO2Ewr1WCU1JJ8BxJ3CXLI+Q0oWZrNU+Lcvyj67eqVtxCHyTm2z2etdV+HYx6/hHj1S1YeglNQqKFA3D9azOkJnbqBCEJAIQkNnFnNhcCt6z3ci60ks1RudvdHM2ECYJtrMoedXpFpUg1LB2q1NY9b/xpzU/8h6tXM7JSc588MVjrqx9XR3UkJsf5jbX8By3yuy85/1ecuuIrvUOk7FjxM5QhLrCEIQCEIQLFae2nsJ2MEBiaWgxXu6t05R/lf2h8v1MYTl6mXG09CEISqRHOCxr0TdTq3qdh/XGNoQLtkTLI0lq0jZ0Nyp28xzBGq/OaxgsUtZFqJsYX6uIPMHV2T5/yL/vp2/hM2fMj93P8xvJZTqM7MWCEISiBCEIDrA1LHR47Ov9eUfSKoe0vWJKzp8V3lWkugYEMAQRYggEEHcRvlQy5mcDd8LqO00idR+Rjs6jq5iXGE0s1EuMbqUypKsCCDYgggg8CImWLPz96/8ATT6yuzGzGkEf5JyVUxDdHUo9pzsHIcTyjCXzNz92p9TfiMr1cDnAYGnQXRpi3EnWWPEmOYQmSBCEIBOOLxVOihqVXVEXazEKB2mdpm3pm9nC/O/4ZMmpjjnP6Sma9PAAqNhruOkf5aHZ1tr5DbM8rVWdi7szMxuWYlmJ4knWTEQmkmLyCEISUiEIQCEIQCEIQP/Z">    Nagato naruto pain madara <br>sub-title</div><br style="clear:both"></li>


                <li><div class="content"><img width="600" height="600" src="data:image/jpeg;base64,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">Nagato naruto pain madara <br>sub-title</div><br style="clear:both"></li>
                <li><div class="content"><img width="600" height="600" src="data:image/jpeg;base64,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">Nagato naruto pain madara <br>sub-title</div><br style="clear:both"></li>

                <li>Two</li>
                <li>Three</li>
                <li>Four</li>
                <li>Five</li>
                <li>Six</li>
                <li>Seven</li>
                <li>Eight</li>
                <li>Nine</li>
                <li>Ten</li>
                <li>Eleven</li>
                <li>Twelve</li>
                <li>Thirteen</li>
                <li>Fourteen</li>
                <li>Fifteen</li>
                <li>Sixteen</li>
                <li>Seventeen</li>
                <li>Eighteen</li>
                <li>Nineteen</li>
                <li>Twenty one</li>
                <li>Twenty two</li>
                <li>Twenty three</li>
                <li>Twenty four</li>
                <li>Twenty five</li>
                <li>One</li>
                <li>Two</li>
                <li>Three</li>
                <li>Four</li>
                <li>Five</li>
                <li>Six</li>
                <li>Seven</li>
                <li>Eight</li>
                <li>Nine</li>
                <li>Ten</li>
                <li>Eleven</li>
                <li>Twelve</li>
                <li>Thirteen</li>
                <li>Fourteen</li>
                <li>Fifteen</li>
                <li>Sixteen</li>
                <li>Seventeen</li>
                <li>Eighteen</li>
                <li>Nineteen</li>
                <li>Twenty one</li>
                <li>Twenty two</li>
                <li>Twenty three</li>
                <li>Twenty four</li>
                <li>Twenty five</li>
            </ul>
            <div id="loadMore">Load more</div>
            <div id="showLess">Show less</div>
        </section>
    </body>
</html>
