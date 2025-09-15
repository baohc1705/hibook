package com.baohc.app.dao.book;

import java.util.ArrayList;
import java.util.List;

import com.baohc.core.utils.FilterCriteria;

public class QueryBuilder {
	private StringBuilder sql;
	private StringBuilder countSql;
	private List<Object> parameters; // All parameter condition, sorting

	public QueryBuilder() {
		this.sql = new StringBuilder();
		this.countSql = new StringBuilder();
		this.parameters = new ArrayList<Object>();
	}

	public QueryBuilder buildBookQuery(FilterCriteria criteria) {
		// Base select query
		sql.append(
				"SELECT b.id, b.name, b.cateBook_id, b.author_id, b.promotion_id, b.price, b.amount, b.description, b.createDate, c.name ");
		sql.append("FROM book b JOIN cate_book c ON b.cateBook_id = c.id ");
		sql.append("WHERE 1=1 ");

		// Base count query
		countSql.append("SELECT COUNT(*) ");
		countSql.append("FROM book b JOIN cate_book c ON b.cateBook_id = c.id ");
		countSql.append("WHERE 1=1 ");

		// Add condition
		addCondition(criteria);

		// Add sorting
		addSorting(criteria);

		// Add pagination
		addPagination(criteria);

		return this;
	}

	private void addCondition(FilterCriteria criteria) {
		// Add keyword condition (search with keyword on name)
		if (criteria.hasKeyword()) {
			String condition = " AND b.name LIKE ? ";
			sql.append(condition); // "WHERE 1=1 AND b.name LIKE ? "
			countSql.append(condition);
			String keyword = "%" + criteria.getKeyword().trim() + "%"; // parameter
			parameters.add(keyword);
		}

		// Add category condition
		if (criteria.hasCategoryFilter()) {
			String condition = " AND b.cateBook_id=? ";
			sql.append(condition);
			countSql.append(condition);
			parameters.add(criteria.getCateBookId());
		}
		
		// Add promotion condition
		if (criteria.hasPromotionFilter()) {
			String condition = " AND b.promotion_id=? ";
			sql.append(condition);
			countSql.append(condition);
			parameters.add(criteria.getPromotionId());
		}
		
		// Add author condition
		if (criteria.hasAuthorFilter()) {
			String condition = " AND b.author_id=? ";
			sql.append(condition);
			countSql.append(condition);
			parameters.add(criteria.getAuthorId());
		}

		// Add price range
		if (criteria.hasPriceFilter()) {
			if (criteria.getMinPrice() > 10000 && criteria.getMinPrice() < 999999999) {
				String condition = " AND b.price >= ? ";
				sql.append(condition);
				countSql.append(condition);
				parameters.add(criteria.getMinPrice());
			}

			if (criteria.getMaxPrice() > 10000 && criteria.getMaxPrice() < 999999999) {
				String condition = " AND b.price <= ? ";
				sql.append(condition);
				countSql.append(condition);
				parameters.add(criteria.getMaxPrice());
			}
		}
	}

	private void addSorting(FilterCriteria criteria) {
		sql.append(" ORDER BY ");
		switch (criteria.getSortBy()) {
		case "name":
			sql.append("b.name ");
			break;
		case "price":
			sql.append("b.price ");
			break;
		case "amount":
			sql.append("b.amount ");
			break;
		case "cateBook":
			sql.append("c.name ");
			break;
		case "createDate":
			sql.append("b.createDate ");
			break;
		default:
			sql.append("b.name ");
		}
		
		sql.append(criteria.getSortOrder().trim().toUpperCase());
	}

	private void addPagination(FilterCriteria criteria) {
		sql.append(" LIMIT ? OFFSET ?");
		// Add parameter with method
	}
	
	// All parameter condition and pagination
	public List<Object> getParametersWithPagination(FilterCriteria criteria) {
		List<Object> allParams = new ArrayList<Object>(parameters); // Copy condition, sorting parameter 
		allParams.add(criteria.getPageSize());
		allParams.add(criteria.getOffset());
		return allParams;
	}
	
	public String getSelectQuery() {
		return sql.toString();
	}
	
	public String getCountQuery() {
		return countSql.toString();
	}
	
	public List<Object> getParameters() {
		return parameters;
	}
	
	public void Reset() {
		sql.setLength(0);
		countSql.setLength(0);
		parameters.clear();
	}
	
	 // Debug method
    public void printQuery() {
        System.out.println("=== SELECT QUERY ===");
        System.out.println(sql.toString());
        System.out.println("=== COUNT QUERY ===");
        System.out.println(countSql.toString());
        System.out.println("=== PARAMETERS ===");
        for (int i = 0; i < parameters.size(); i++) {
            System.out.println((i + 1) + ": " + parameters.get(i));
        }
    }

}
