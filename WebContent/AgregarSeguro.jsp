<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entidad.TipoSeguro"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Agregar Seguro - SegurosGroup</title>
		<style><%@include file="style.css"%></style>
	</head>
	<body>
		<!-- men� -->
		<%@include file="Header.jsp"%>
		<h1>Agregar Seguros</h1>
		<form class="form-agregar-seguro d-flex flex-column" action="ServletSeguro" method="get">
			<div class="form-group">
				<p>Id Seguro</p>
				<span>
					<%
						//int nextId=0;
						if(request.getAttribute("nextId") != null)
						{
							int nextId=(int)request.getAttribute("nextId");
					%>
						<%=nextId %>
					<%
						}					
					%>
					
				</span>
			</div>
			<div class="form-group">
				<p>Descripci�n</p>
				<input type="text" name="txtDescripcion" required/>
			</div>
				<%
					ArrayList<TipoSeguro> listaTipos = new ArrayList<TipoSeguro>();
					if(request.getAttribute("listaTipos") != null)
					{
						listaTipos = (ArrayList<TipoSeguro>) request.getAttribute("listaTipos");
					}
				%>
			<div class="form-group">
				<p>Tipo de Seguro</p>
				<select name="ddlTipoSeguro">
					<option value="1">Seleccionar Tipo</option>
				<%
					for(TipoSeguro tipo : listaTipos){
				%>
					<option value=<%=tipo.getId() %>><%= tipo.getDescripcion() %></option>
				<% } %>
				</select>
			</div>
			<div class="form-group">
				<p>Costo contrataci�n</p>
				<input type="text" name="txtCosto" required/>
			</div>
			<div class="form-group">
				<p>Costo m�ximo asegurado</p>
				<input type="text" name="txtMaximo" required/>
			</div>
			<button type="submit" name="btnAceptar" >Aceptar</button>
			
			<%
			if(request.getAttribute("message") != null)
			{
				String message = request.getAttribute("message").toString();
			%>
				<%=message %>
			<%	
			}
			%>
			
		</form>
	</body>
</html>