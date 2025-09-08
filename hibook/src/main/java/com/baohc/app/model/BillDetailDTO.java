package com.baohc.app.model;

public class BillDetailDTO {
    private BillDTO bill;
    private BookDTO book;
    private int quantity;
    private double price;

    public BillDetailDTO() {
        super();
    }

    public BillDetailDTO(BillDTO bill, BookDTO book, int quantity, double price) {
        super();
        this.bill = bill;
        this.book = book;
        this.quantity = quantity;
        this.price = price;
    }

    public BillDTO getBill() {
        return bill;
    }

    public void setBill(BillDTO bill) {
        this.bill = bill;
    }

    public BookDTO getBook() {
        return book;
    }

    public void setBook(BookDTO book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        String billId = (bill != null && bill.getId() != null) ? bill.getId() : "null";
        String bookId = (book != null && book.getId() != null) ? book.getId() : "null";
        return "BillDetailDTO [bill=" + billId + ", book=" + bookId 
                + ", quantity=" + quantity + ", price=" + price + "]";
    }
}
