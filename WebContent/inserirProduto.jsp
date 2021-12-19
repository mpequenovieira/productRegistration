<%@page import="br.com.uninove.projeto.dao.ProdutoDao"%>
<%@page import="br.com.uninove.projeto.dto.ProdutoDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		
		<%
		
			try{
				
				ProdutoDto objProdutoDto = new ProdutoDto();
				
				objProdutoDto.setProduto(request.getParameter("produto"));
				objProdutoDto.setValor(Float.valueOf(request.getParameter("valor")));
				objProdutoDto.setQuantidade(Integer.valueOf(request.getParameter("quantidade")));
				
				ProdutoDao objProdutoDao = new ProdutoDao();
				
				objProdutoDao.CadastrarProduto(objProdutoDto);
				
				out.print("PRODUTO CADASTRADO COM SUCESSO!");
				
			}catch (Exception e){
				
			}
		%>
		
		<br><br>
		<form action="produtoView.html" method="post">
			
			<button type="submit"> CADASTRAR OUTRO PRODUTO </button>
		
		</form><br><br>
		
		<form action="listarProduto.jsp" method="post">
		
			<button type="submit">VER LISTA DE PRODUTOS</button>
		
		</form>
		
	</body>
</html>