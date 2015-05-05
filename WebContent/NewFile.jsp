<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
out.write("<HTML>"); out.write("<HEAD><TITLE>foo</TITLE></HEAD>");
out.write("<BODY> List of Temperatures:");
out.write("<UL><LI>La Jolla:" + "sunny" + "</LI>"); 
out.write("<LI>El Cajon:" + "sunny"+ "</LI></UL>"); 
out.write("</BODY></HTML>");
%>
