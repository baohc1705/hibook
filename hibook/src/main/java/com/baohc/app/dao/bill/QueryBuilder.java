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

	public QueryBuilder buildBillQuery() {
		// Base SQL;
		sql.append("SELECT * ");
		sql.append("FROM bill b ");
		sql.append("WHERE 1=1 ");

		// Count SQL
		countSql.append("SELECT COUNT(*) ");
		countSql.append("FROM bill b ");
		countSql.append("WHERE 1=1 ");
		
		// Add condition

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
		return this;
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
