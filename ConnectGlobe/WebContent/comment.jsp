<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="post.PostId"%>
<%@page import="CurrentUser.Details"%>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Phozogy Template">
    <meta name="keywords" content="Phozogy, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>InterActive</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Quantico:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="hielo/assets/css/main.css" />
    <!-- Css Styles -->
    <link rel="stylesheet" href="phozogy/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="phozogy/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="phozogy/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="phozogy/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="phozogy/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="phozogy/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="phozogy/css/style.css" type="text/css">
</head>

<body style="font-family:Tw Cen MT; font-size: 17px; " >


    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


			

<div style="position: absolute;border-buttom:1px solid black; z-index: -9px; width:100%;">
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="logo">
                        <a href="./index.html">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                    
                    <nav class="nav-menu mobile-menu">
                        <ul>
                        	<li><a href=""> <i style="color:" class="fa fa-user"></i> &nbsp; &nbsp; <%=Details.getUsername()%></a></li>
                            <li ><a href="post.jsp">Home</a></li>
                            <li><a href="createpost.jsp">Create Post</a></li>
                            
                        </ul>
                    </nav>
                    
                    <div class="top-search search-switch">
                    <a href="logout" style="text-decoration: none;" ><i style="color: white" class="fa fa-power-off"></i></a>
                    </div>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </div>
      
    </header>
    <!-- Header End -->
    </div> 
   
    <div id="main">
<div class="inner">


<% String user= PostId.getPostId().substring(0, PostId.getPostId().indexOf("post"));

%>
<%try{
                                           Connection con = DBConnection.getConnection();
                                            Statement st = con.createStatement();
                                            
                                            ResultSet rs = st.executeQuery("Select * from allpost where postid = '"+PostId.getPostId()+"'");
                                             if(rs.next()){
                                                String desc = rs.getString("description");
                                                 
                                            //username and email
                                 %>  

					<!-- Boxes -->
						<div class="thumbnails" style=" padding:0px; margin-left:70px;">
				
					<div class="box" style="width:80%;">
						<div class="content" >
							<header class="align-center">
								<p>Published by <%=user%>@gmail.com</p>
								<h2  style="font-family:Tw Cen MT; font-size: 40px; "><%=rs.getString("title")%></h2>
							</header>
							<img src="postimages/<%=PostId.getPostId()%>.jpg" style="padding-left:150px; padding-right:150px; padding-bottom:30px;"class="image fit">
							<p style="text-align: center;"><%=desc%></p>
							</div>
								
					</div>
						<form method="post" style=" width:100%; padding-left:200px;"action="addcomment">
									<dl>
										
									<div class="row uniform" style="width:100% ;padding-bottom:30px;" >
										<div class="9u 12u$(small)">
											<input type="text" name="comment" id="query"  placeholder="Comment.." />
											
										</div>
										<div class="3u$ 12u$(small)">
											<input type="submit" style="width:100px;" value="Done" class="fit" />
										</div>
									</div>
									
								<% String sql = "select * from "+PostId.getPostId()+"comment";
									Statement stsql = con.createStatement();
									ResultSet rs1 = st.executeQuery(sql);
									while(rs1.next()){
									
								%>
									<dt><%= rs1.getString("CUsername")%></dt>
									<dd>
										<p><%= rs1.getString("description")%></p>
									</dd>
									
									
									
									<% } %>
								
								</dl>	
				</form>
						
				 <%}	
                    }
                                   			catch(Exception e){
                                   				System.out.println("catch mein hun na "+e);
                                                	%>catch mein hun main<%=e%><%
                                                			
                                                }
                                            
                                                %>
						
		
							
							<!--  <div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
								<div class="inner">
									<h3>Nascetur nunc varius commodo</h3>
									<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
									<a href="https://youtu.be/s6zR2T9vn2c" class="button style2 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
								<div class="inner">
									<h3>Nascetur nunc varius commodo</h3>
									<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
									<a href="https://youtu.be/s6zR2T9vn2c" class="button style3 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
								<div class="inner">
									<h3>Nascetur nunc varius commodo</h3>
									<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
									<a href="https://youtu.be/s6zR2T9vn2c" class="button style2 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic05.jpg" alt="" /></a>
								<div class="inner">
									<h3>Nascetur nunc varius commodo</h3>
									<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
									<a href="https://youtu.be/s6zR2T9vn2c" class="button style3 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic06.jpg" alt="" /></a>
								<div class="inner">
									<h3>Nascetur nunc varius commodo</h3>
									<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
									<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>
							 -->
						</div>

					</div>
				</div>

			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
							<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a href="http://coverr.co/">Coverr</a>.</p>
					</div>
				</footer>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
   
    <!-- Js Plugins -->
    <script src="phozogy/js/jquery-3.3.1.min.js"></script>
    <script src="phozogy/js/bootstrap.min.js"></script>
    <script src="phozogy/js/jquery.magnific-popup.min.js"></script>
    <script src="phozogy/js/isotope.pkgd.min.js"></script>
    <script src="phozogy/js/masonry.pkgd.min.js"></script>
    <script src="phozogy/js/jquery.slicknav.js"></script>
    <script src="phozogy/js/owl.carousel.min.js"></script>
    <script src="phozogy/js/main.js"></script>
    
		<!-- Scripts -->
			<script src="hielo/assets/js/jquery.min.js"></script>
			<script src="hielo/assets/js/jquery.scrollex.min.js"></script>
			<script src="hielo/assets/js/skel.min.js"></script>
			<script src="hielo/assets/js/util.js"></script>
			<script src="hielo/assets/js/main.js"></script>
    
</body>

</html>