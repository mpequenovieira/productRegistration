<%@page import="br.com.uninove.projeto.dto.ProdutoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.uninove.projeto.dao.ProdutoDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<h1> MOSTRAR PRODUTOS </h1><br>
	
		<form action="produtoView.html" method="post">
			
			<button type="submit">CADASTRAR PRODUTO</button>
		
		</form><br><br>
		
		<%
		
			try {
				
				ProdutoDao objProdutoDao = new ProdutoDao();
				ArrayList<ProdutoDto> lista = objProdutoDao.PesquisarProduto();
				
				for(int num = 0; num < lista.size(); num ++){
					
					out.print("Código: " + lista.get(num).getCodigo() + "<br>");
					out.print("Produto: " + lista.get(num).getProduto() + "<br>");
					out.print("Valor: " + lista.get(num).getValor() + "<br>");
					out.print("Quantidade: " + lista.get(num).getQuantidade() + "<br><br><br>");
				}
				
			}catch (Exception e){
				
			}
		
		%>
	
	</body>
</html>