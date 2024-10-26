package NewUser;

public class NewBook {
	
	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String category;
	private String photo;
	private String email;
	
	
	public NewBook()
	{
		
	}
	public NewBook(String bookName, String author, String price, String category, String photo, String email) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.category = category;
		this.photo = photo;
		this.email = email;
	}
	
	public void setId(int bookId)
	{
		this.bookId=bookId;
	}
	public int getId()
	{
		return bookId;
	}
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}

	@Override
	public String toString() {
		return "NewBook [bookName=" + bookName + ", author=" + author + ", price=" + price + ", category=" + category
				+ ", photo=" + photo + ", email=" + email + "]";
	}
	
	

}
