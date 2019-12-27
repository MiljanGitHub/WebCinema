<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="model.Role"%>
<%@page import="model.Projection"%>
<%@page import="utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%User loggedInUser = (User) request.getSession().getAttribute("loggedInUser"); %>
<%ArrayList<Projection> filteredProjections = (ArrayList<Projection>) request.getAttribute("filteredProjections"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main application page</title>
</head>
<body>

	<a href="./MovieServlet">Show all movies</a>
	<%if (loggedInUser.getRole() == Role.ADMIN){ %>
		<a href="./UsersManagementServlet">Users management</a>
	<%}%>
	
	<a href="./LogoutServlet">Logout</a>
	
	<a href="./MyProfileServlet">My profile</a>
	
	
	
	
	<table border="1" style=width:100%>
		<tr>
			<th>Movie</th>
			<th>Projections</th>
			<th>Projection type</th>
			<th>Hall</th>
			<th>Ticket price</th>
			
					
		</tr>
		
		<form action="MainPageAppServlet" method="get"> 
		<tr>
			<td align="center">
					
				 		
				 		<fieldset> 
							<legend>Filter</legend>
								<input type="text" name="movieFilter" value="<%=request.getAttribute("movieFilter") %>">
				 		</fieldset> 
				 		
    					 <fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="movieAsc" name="byMovie" value="asc">
    							<label for="movieAsc">Ascending</label><br>

    							<input type="radio" id="movieDsc" name="byMovie" value="dsc">
    							<label for="movieDsc">Descending</label>

        					
    					</fieldset> 
					
				
			</td>
			
			<td align="center">
					<fieldset>
						<legend>Filter</legend>
						<%-- from:&nbsp; <select name="fromDay"> <%for (int i = 1; i <= 31; i++ ){ %> <option value="<%=i%>"> <%=request.getAttribute("fromDay") %>  </option>   <%} %>  </select> 
									 <select name="fromMonth"> <%for (int i = 1; i <= 12; i++ ){ %> <option value="<%=i%>"> <%=request.getAttribute("fromMonth") %>  </option>   <%} %>  </select>	
									 <select name="fromYear"> <%for (int i = 1950; i <= 2025; i++ ){ %> <option value="<%=i%>"> <%=request.getAttribute("fromYear") %> </option>   <%}%>  </select></br>	
						
						to:&nbsp; <select name="toDay"> <%for (int i = 1; i <= 31; i++ ){ %> <option value="<%=i %>"> <%=request.getAttribute("toDay") %> </option>   <%} %>  </select> 
									 <select name="toMonth"> <%for (int i = 1; i <= 12; i++ ){ %> <option value="<%=i %>"> <%=request.getAttribute("toMonth") %>  </option>   <%} %>  </select>	
									<select  name="toYear" > <%for (int i = 1950; i <= 2025; i++ ){ %> <option  value="<%=i %>"> <%=request.getAttribute("toYear") %>  </option>   <%}%>  </select></br>		
					   --%>
					   from:&nbsp; <select name="fromDay"> <%for (int i = 1; i <= 31; i++ ){ %> <option value="<%=i %>"> <%=i %> </option>   <%} %>  </select> 
									 <select name="fromMonth"> <%for (int i = 1; i <= 12; i++ ){ %> <option value="<%=i %>"> <%=i %> </option>   <%} %>  </select>	
									 <select name="fromYear"> <%for (int i = 1950; i <= 2025; i++ ){ %> <option value="<%=i %>"> <%=i %> </option>   <%}%>  </select></br>	
						to:&nbsp; <select name="toDay"> <%for (int i = 1; i <= 31; i++ ){ %> <option value="<%=i %>"> <%=i %> </option>   <%} %>  </select> 
									 <select name="toMonth"> <%for (int i = 1; i <= 12; i++ ){ %> <option value="<%=i %>"> <%=i %> </option>   <%} %>  </select>	
									<select  name="toYear" > <%for (int i = 1950; i <= 2025; i++ ){ %> <option selected="selected" value="<%=i %>"> <%=i %> </option>   <%}%>  </select></br>		
					</fieldset>
					
					<fieldset>
						<legend>Sorting</legend>
						
        					<input type="radio" id="dateAsc" name="byDate" value="asc">
    						<label for="dateAsc">Ascending</label><br>

    						<input type="radio" id="dateDsc" name="byDate" value="dsc">
    						<label for="dateDsc">Descending</label>
					
					</fieldset>
					

				</td>
				
				<!-- Projection Type -->
				<td align="center">
				 	
    					 <fieldset>
        						<legend>Filter</legend>
        						
        						<input type="radio" id="dimension2D" <%if(request.getAttribute("dimensionFilter").equals("IID")){ %> checked <%} %> name="dimensionFilter" value="IID">
    							<label for="dimension2D">2D</label><br>

    							<input type="radio" id="dimension3D" <%if(request.getAttribute("dimensionFilter").equals("IIID")){ %> checked <%} %> name="dimensionFilter" value="IIID">
    							<label for="dimension3D">3D</label>
    							
    							<input type="radio" id="dimension4D" <%if(request.getAttribute("dimensionFilter").equals("IVD")){ %> checked <%} %> name="dimensionFilter" value="IVD">
    							<label for="dimension4D">4D</label>

    					</fieldset> 
    					
    					<fieldset>
        						<legend>Sorting</legend>
        						
        						<input type="radio" id="dimensionAsc" name="byDimension" value="asc">
    							<label for="dimensionAsc">Ascending</label><br>

    							<input type="radio" id="dimensionAsc" name="byDimension" value="dsc">
    							<label for="dimensionAsc">Descending</label>

    					</fieldset> 
				</td>
				
				<!-- Halls -->
				<td align="center">
				 	
    					 <fieldset>
        						<legend>Filter</legend>
        						
        						<input type="radio" id="hallWhite" <%if (request.getAttribute("hallFilter").equals("White Hall")){ %> checked <%} %> name="hallFilter" value="1">
    							<label for="hallWhite">White Hall</label><br>

    							<input type="radio" id="hallBlack" <%if (request.getAttribute("hallFilter").equals("Black Hall")){ %> checked <%} %> name="hallFilter" value="2">
    							<label for="hallBlack">Black Hall</label><br>
    							
    							<input type="radio" id="hallOrange" <%if (request.getAttribute("hallFilter").equals("Orange Hall")){ %> checked <%} %> name="hallFilter" value="3">
    							<label for="hallOrange">Orange Hall</label><br>
    							
    							<input type="radio" id="hallBlue" <%if (request.getAttribute("hallFilter").equals("Blue Hall")){ %> checked <%} %> name="hallFilter" value="4">
    							<label for="hallBlue">Blue Hall</label><br>

    					</fieldset> 
    					
    					<fieldset>
        						<legend>Sorting</legend>
        						
        						<input type="radio" id="hallAsc" name="byHall" value="asc">
    							<label for="hallAsc">Ascending</label><br>

    							<input type="radio" id="hallAsc" name="byHall" value="dsc">
    							<label for="hallAsc">Descending</label>

    					</fieldset> 
				</td>
		
				<!-- Ticket price -->
				<td align="center">
				<fieldset>
        					<legend>Filtering</legend>
					from:&nbsp;<input type="text" name="fromPriceFilter" value="<%= request.getAttribute("fromPriceFilter")%>"></br>
					to:&nbsp;<input type="text" name="toPriceFilter" value="<%= request.getAttribute("toPriceFilter")%>">
				</fieldset> 
					
				<fieldset>
        			
        			<legend>Sorting order</legend>
        						
        						
        			<input type="radio" id="priceAsc" name="byPrice" value="asc">
    				<label for="priceAsc">Ascending</label><br>

    				<input type="radio" id="priceDsc" name="byPrice" value="dsc">
    				<label for="priceDsc">Descending</label>

        					
    			</fieldset> 
				
				
				</td>
		
				<td align="center"><input type="submit" value="Filter"></td>
				
				<td align="center"><input type="submit" value="Sort"></td>
		
		</tr>
		
		
	  	</form>
		
		<%for (Projection p : filteredProjections){ %>
			<tr>
					<td><a href="#?id=<%= p.getId() %>"> <%= p.getMovie().getName() %></a></td>
					<td><a href="#?id=<%= p.getId() %>"> <%= Utility.convertDateWithTimeToString(p.getPeriod().getStart()) %></a></td>
					<td><%=p.getProjectionType().getName() %></td>
					<td><%=p.getHall().getName() %></td>
					<td><%=p.getTicketPrice() %></td>
					
					<%if (loggedInUser.getRole() == Role.ADMIN){ %>
						<td>
						<form action="" method="post">
  					
  							<button name="delete" type="submit" value="<%= p.getId()%>">Delete projection</button>
  							
						</form>
					</td> 
					<%} %>
					
					 
				</tr>
		
		<%} %>
		
		</table>
	
</body>
</html>