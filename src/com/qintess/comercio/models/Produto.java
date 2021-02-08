package com.qintess.comercio.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;


@Entity
public class Produto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private BigDecimal valorUnitario;
	
	@Type(type="org.hibernate.type.BinaryType")
	@Column(nullable = true, columnDefinition="bytea")
	private byte[] imagemProd;
	
	@Transient //esse campo n�o ser� persistido no hibernate
	private String imagemEncoded;
	
	@Column(nullable = true, length = 2000)
	private String descricao;
	
	@OneToMany(mappedBy = "produto", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CompraProduto> compras = new ArrayList<CompraProduto>();

	public List<CompraProduto> getCompras() {
		return compras;
	}

	public void setCompras(List<CompraProduto> compras) {
		this.compras = compras;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public BigDecimal getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(BigDecimal valorUnitario) {
		this.valorUnitario = valorUnitario;
	}
	
	public byte[] getImagemProd() {
		return imagemProd;
	}

	public void setImagemProd(byte[] imagemProd) {
		this.imagemProd = imagemProd;
	}
	
	public String getImagemEncoded() {
		return imagemEncoded;
	}

	public void setImagemEncoded(String imagemEncoded) {
		this.imagemEncoded = imagemEncoded;
	}
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	
}
