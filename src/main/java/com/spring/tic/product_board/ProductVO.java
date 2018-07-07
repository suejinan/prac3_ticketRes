package com.spring.tic.product_board;


import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
   private int play_id;
   private String p_id;
   private String title;
   private String play_date;
   private String time;
   private int price;
   private int seat_max;
   private int seat_rest;
   private String category;
   private String content;
   private String file_name;
    private String partner_name;
    private String address;
    private String phone;
   
   //검색조건용 필드 추가
   private String searchCondition;
   private String searchKeyword;
    
   //파일 관련 필드 추가
   private MultipartFile uploadFile;
   
   //getter/setter
   public int getPlay_id() {
      return play_id;
   }
   public void setPlay_id(int play_id) {
      this.play_id = play_id;
   }
   public String getP_id() {
      return p_id;
   }
   public void setP_id(String p_id) {
      this.p_id = p_id;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getPlay_date() {
      return play_date;
   }
   public void setPlay_date(String play_date) {
      this.play_date = play_date;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getSeat_max() {
      return seat_max;
   }
   public void setSeat_max(int seat_max) {
      this.seat_max = seat_max;
   }
   public int getSeat_rest() {
      return seat_rest;
   }
   public void setSeat_rest(int seat_rest) {
      this.seat_rest = seat_rest;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getFile_name() {
      return file_name;
   }
   public void setFile_name(String file_name) {
      this.file_name = file_name;
   }
   public String getPartner_name() {
      return partner_name;
   }
   public void setPartner_name(String partner_name) {
      this.partner_name = partner_name;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   
   
   //검색조건용 필드
   public String getSearchCondition() {
      return searchCondition;
   }
   public void setSearchCondition(String searchCondition) {
      this.searchCondition = searchCondition;
   }
   public String getSearchKeyword() {
      return searchKeyword;
   }
   public void setSearchKeyword(String searchKeyword) {
      this.searchKeyword = searchKeyword;
   }

   
   @Override
   public String toString() {
      return "ProductVO [play_id=" + play_id + ", p_id=" + p_id + ", title=" + title + ", play_date=" + play_date
            + ", time=" + time + ", price=" + price + ", seat_max=" + seat_max + ", seat_rest=" + seat_rest
            + ", category=" + category + ", content=" + content + ", file_name=" + file_name + ", partner_name="
            + partner_name + ", address=" + address + ", phone=" + phone + ", searchCondition=" + searchCondition
            + ", searchKeyword=" + searchKeyword + ", uploadFile=" + uploadFile + "]";
   }
   
   
   //파일 업로드 관련 필드
   public MultipartFile getUploadFile() {
      return uploadFile;
   }
   public void setUploadFile(MultipartFile uploadFile) {
      this.uploadFile = uploadFile;
   }
   
}