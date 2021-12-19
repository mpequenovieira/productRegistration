package br.com.uninove.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.com.uninove.projeto.dto.ProdutoDto;

public class ProdutoDao {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	ArrayList<ProdutoDto> lista = new ArrayList<>();
	
	public void CadastrarProduto(ProdutoDto objProdutoDto) throws ClassNotFoundException{
		
		String sql = "INSERT INTO PRODUTO(PRODUTO, VALOR, QUANTIDADE) VALUES (?,?,?)";
		con = new ConexaoDao().connection();
		
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, objProdutoDto.getProduto());
			ps.setFloat(2, objProdutoDto.getValor());
			ps.setInt(3, objProdutoDto.getQuantidade());
			
			ps.execute();
			ps.close();
			
		} catch (Exception e) {
			
		}
	}
	
	public ArrayList<ProdutoDto> PesquisarProduto() throws ClassNotFoundException{
		
		String sql = "SELECT * FROM PRODUTO";
		con = new ConexaoDao().connection();
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			while (rs.next()) {
				
				ProdutoDto objProdutoDto = new ProdutoDto();
				objProdutoDto.setCodigo(rs.getInt("codigo"));
				objProdutoDto.setProduto(rs.getString("produto"));
				objProdutoDto.setValor(rs.getFloat("valor"));
				objProdutoDto.setQuantidade(rs.getInt("quantidade"));
				
				lista.add(objProdutoDto);
			}
			
		} catch (Exception e) {
			
		}
		return lista;
	}
}
