package com.baohc.test.Filter;

import java.util.List;

import com.baohc.app.dao.book.QueryBuilder;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.core.utils.FilterCriteria;

public class TestFilter {
	public static void main(String[] args) {
		System.out.println("=== TESTING BOOK FILTER SYSTEM ===\n");

		// Test DAO connections
		testDAOConnections();

		// Test filter scenarios
		testFilterScenarios();

		// Test query builder
		testQueryBuilder();

		System.out.println("\n=== TESTING COMPLETED ===");
	}

	private static void testQueryBuilder() {
		// Test complex query building
        FilterCriteria criteria = new FilterCriteria();
        criteria.setKeyword("conan");
        criteria.setCateBookId(1);
        criteria.setMinPrice(50000);
        criteria.setMaxPrice(300000);
        criteria.setSortBy("name");
        criteria.setSortOrder("ASC");
        criteria.setPage(1);
        criteria.setPageSize(10);
        
        QueryBuilder queryBuilder = new QueryBuilder();
        queryBuilder.buildBookQuery(criteria);
        
        System.out.println("   Generated SELECT query:");
        System.out.println("   " + queryBuilder.getSelectQuery());
        System.out.println();
        System.out.println("   Generated COUNT query:");
        System.out.println("   " + queryBuilder.getCountQuery());
        System.out.println();
        System.out.println("   Parameters:");
        List<Object> params = queryBuilder.getParametersWithPagination(criteria);
        for (int i = 0; i < params.size(); i++) {
            System.out.println("   " + (i + 1) + ": " + params.get(i));
        }
        
        System.out.println();

	}

	private static void testFilterScenarios() {
		System.out.println("2. Testing Filter Scenarios...");

		BookService bookService = BookServiceImpl.getInstance();

		// Test 1: Filter by keyword
		System.out.println("   Test 1: Search by keyword 'dragon'");

		FilterCriteria criteria1 = new FilterCriteria();

		criteria1.setKeyword("dragon");

		List<BookDTO> result1 = bookService.getBooksWithFilter(criteria1);
		for (BookDTO b : result1) {
			System.out.println(b);
		}
		int count1 = bookService.countBooksWithFilter(criteria1);
		System.out.println("   Result: " + result1.size() + " books found, count: " + count1);

		// Test 2: Filter by category
		System.out.println("   Test 2: Filter by category 'Manga' (ID: 3)");
		FilterCriteria criteria2 = new FilterCriteria();
		criteria2.setCateBookId(3);
		List<BookDTO> result2 = bookService.getBooksWithFilter(criteria2);
		for (BookDTO b : result2) {
			System.out.println(b);
		}
		int count2 = bookService.countBooksWithFilter(criteria2);
		System.out.println("   Result: " + result2.size() + " books found, count: " + count2);

		// Test 3: Filter by price range
		System.out.println("   Test 3: Filter by price range 50,000 - 100,000");
		FilterCriteria criteria3 = new FilterCriteria();
		criteria3.setMinPrice(50000);
		criteria3.setMaxPrice(100000);
		List<BookDTO> result3 = bookService.getBooksWithFilter(criteria3);
		for (BookDTO b : result3) {
			System.out.println(b);
		}
		int count3 = bookService.countBooksWithFilter(criteria3);
		System.out.println("   Result: " + result3.size() + " books found, count: " + count3);
		
		// Test 4: Multi-criteria filter
		System.out.println("   Test 4: Multi-criteria (keyword + category + price)");
		FilterCriteria criteria4 = new FilterCriteria();
		criteria4.setKeyword("dragon");
		criteria4.setCateBookId(3);
		criteria4.setMinPrice(20000);
		List<BookDTO> result4 = bookService.getBooksWithFilter(criteria4);
		for (BookDTO b : result4) {
			System.out.println(b);
		}
		int count4 = bookService.countBooksWithFilter(criteria4);
		System.out.println("   Result: " + result4.size() + " books found, count: " + count4);
		
		// Test 5: Pagination
        System.out.println("   Test 5: Pagination (page 2, size 3)");
        FilterCriteria criteria5 = new FilterCriteria();
        criteria5.setPage(2);
        criteria5.setPageSize(3);
      
        List<BookDTO> result5 = bookService.getBooksWithFilter(criteria5);
        System.out.println("   Result: " + result5.size() + " books on page 2");
        for (BookDTO b : result5) {
			System.out.println(b);
		}
        
        // Test 6: Promotion
        System.out.println("   Test 6: Promotion(id = 3, Flash sale)");
        FilterCriteria criteria6 = new FilterCriteria();
        criteria6.setPromotionId(3);
        List<BookDTO> result6 = bookService.getBooksWithFilter(criteria6);
        int count6 = bookService.countBooksWithFilter(criteria6);
        System.out.println("   Result: " + result6.size() + " books found, count: " + count6);
        for (BookDTO b : result6) {
			System.out.println(b);
		}
        
        // Test 7: Author
        System.out.println("   Test 7: Author(id = TG04, Hoang Khanh Duy)");
        FilterCriteria criteria7 = new FilterCriteria();
        criteria7.setAuthorId("TG04");
        List<BookDTO> result7 = bookService.getBooksWithFilter(criteria7);
        int count7 = bookService.countBooksWithFilter(criteria7);
        System.out.println("   Result: " + result7.size() + " books found, count: " + count7);
        for (BookDTO b : result7) {
			System.out.println(b);
		}
        
        // Test 8: GET TOP 6 NEW Book
        System.out.println("   Test 8: 6 new book");
        FilterCriteria criteria8 = new FilterCriteria();
        criteria8.setPage(1);
        criteria8.setPageSize(6);
        criteria8.setSortBy("createDate");
        criteria8.setSortOrder("DESC");
        System.err.println(criteria8);
        List<BookDTO> result8 = bookService.getBooksWithFilter(criteria8);
        int count8 = bookService.countBooksWithFilter(criteria8);
        System.out.println("   Result: " + result8.size() + " books found, count: " + count8);
        for (BookDTO b : result8) {
			System.out.println(b);
		}
        
        System.out.println();
	}

	private static void testDAOConnections() {
		// TODO Auto-generated method stub
		System.out.println("1. Testing DAO Connections...");

		try {
			CateBookService cateBookService = CateBookServiceImpl.getInstance();

			List<CateBookDTO> categories = cateBookService.getAllCateBook();
			System.out.println("    Categories loaded: " + categories.size());

			/*
			 * for(Category c : categories) { System.out.println(c); }
			 */

			BookService bookService = BookServiceImpl.getInstance();
			List<BookDTO> books = bookService.getAllBook();
			System.out.println("    Books loaded: " + books.size());
			/*
			 * for(Book b : books) { System.out.println(b); }
			 */
		} catch (Exception e) {
			System.out.println("   DAO Connection failed: " + e.getMessage());
		}

		System.out.println();
	}
}
