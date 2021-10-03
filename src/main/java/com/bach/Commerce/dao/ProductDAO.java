package com.bach.Commerce.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.bach.Commerce.entity.Product;

public interface ProductDAO {
	
	public List<Product> getAllProduct();
	
	public Product getProductById(int id);
	
	public List<Product> getProductByCategories(int categories);
	
	public List<Product> getProductForProductPage(String findName,long priceStart, long priceEnd, int start, int length);
	
	public List<Product> findAll(String findName,String category, Pageable pageable);
	
	public List<Product> getProductPriceLowtoHigh(String sort);
	
}
