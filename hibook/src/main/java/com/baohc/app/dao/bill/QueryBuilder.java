package com.baohc.app.dao.bill;

import java.util.ArrayList;
import java.util.List;

import com.baohc.core.utils.BillCriteria;

public class QueryBuilder {
	private StringBuilder sql;
	private StringBuilder countSql;
	private List<Object> parameters;

	public QueryBuilder() {
		this.sql = new StringBuilder();
		this.countSql = new StringBuilder();
		this.parameters = new ArrayList<Object>();
	}

	public QueryBuilder buildBillQuery(BillCriteria criteria) {
		// Base SQL;
		sql.append("SELECT * ");
		sql.append("FROM bill b ");
		sql.append("WHERE 1=1 ");

		// Count SQL
		countSql.append("SELECT COUNT(*) ");
		countSql.append("FROM bill b ");
		countSql.append("WHERE 1=1 ");
		
		// Add condition
		addCondition(criteria);

		// Add sort
		addSorting(criteria);
		
		return this;
	}

	public QueryBuilder buildBillQueryWithFilter(BillCriteria criteria) {

		// Base SQL
		sql.append("SELECT * ");
		sql.append("FROM bill b ");
		sql.append("WHERE 1=1 ");

		// Count SQL
		countSql.append("SELECT COUNT(*) ");
		countSql.append("FROM bill b ");
		countSql.append("WHERE 1=1 ");

		// Add condition
		addCondition(criteria);

		// Add sort
		addSorting(criteria);
		
		// Add pagination
		addPagination(criteria);

		return this;
	}
	
	public List<Object> getParametersWithPagination(BillCriteria criteria) {
		List<Object> allParams = new ArrayList<Object>(this.parameters);
		allParams.add(criteria.getPageSize());
		allParams.add(criteria.getOffset());
		return allParams;
	}
	
	private void addCondition(BillCriteria criteria) {
		// Keyword

		// UserId
		if (criteria.hasUserId()) {
			String condition = "AND b.user_id=? ";
			sql.append(condition);
			countSql.append(condition);
			parameters.add(criteria.getUserId());
		}
		
		// Status
		if (criteria.hasStatus()) {
			String condition = "AND b.status=? ";
			sql.append(condition);
			countSql.append(condition);
			parameters.add(criteria.getStatus());
		}

	}

	private void addSorting(BillCriteria criteria) {
		sql.append("ORDER BY ");
		switch (criteria.getSortBy()) {
		case "totalPrice":
			sql.append("b.totalPrice ");
			break;
		default:
			sql.append("b.createAt ");
			break;
		}
		
		sql.append(criteria.getSortOrder().trim().toUpperCase());
	}

	private void addPagination(BillCriteria criteria) {
		sql.append(" LIMIT ? OFFSET ?");
		// Add parameter with method getParametersWithPagination()
	}

	public String getSelectQuery() {
		return sql.toString();
	}

	public String getCountQuery() {
		return sql.toString();
	}

	public List<Object> getParameters() {
		return parameters;
	}

	public void reset() {
		this.sql.setLength(0);
		this.countSql.setLength(0);
		this.parameters.clear();

	}
}
