/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.News;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author phung
 */
public class NewsDAOTest {

    public NewsDAOTest() {

    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getAllNews method, of class NewsDAO.
     */
//    @Test
//    public void testGetAllNews() {
//        System.out.println("getAllNews");
//        NewsDAO instance = new NewsDAO();
//        List<News> expResult = new ArrayList<>();
//        List<News> result = instance.getAllNews();
//        assertEquals(expResult, result);
//    }
    /**
     * Test of getNewsById method, of class NewsDAO.
     */
//    @Test
//    public void testGetNewsById() {
//        System.out.println("getNewsById");
//        int id = 1;
//        String content = "<p>Ch&agrave;o mừng qu&yacute; kh&aacute;ch đến với Tripove - nền tảng đặt v&eacute; xe h&agrave;ng đầu! Ch&uacute;ng t&ocirc;i rất vui mừng th&ocirc;ng b&aacute;o rằng hệ thống của ch&uacute;ng t&ocirc;i đ&atilde; ch&iacute;nh thức mở cửa, mang đến cho qu&yacute; kh&aacute;ch trải nghiệm đặt v&eacute; xe m&aacute;y trực tuyến ho&agrave;n to&agrave;n mới lạ v&agrave; tiện lợi.Với Tripove, bạn c&oacute; thể dễ d&agrave;ng lựa chọn c&aacute;c chuyến xe uy t&iacute;n, từ c&aacute;c nh&agrave; vận chuyển h&agrave;ng đầu, v&agrave; đặt v&eacute; ngay tại nh&agrave; một c&aacute;ch nhanh ch&oacute;ng. Hệ thống thanh to&aacute;n an to&agrave;n v&agrave; tiện lợi gi&uacute;p bạn ho&agrave;n th&agrave;nh mọi giao dịch một c&aacute;ch trơn tru, chỉ với v&agrave;i c&uacute; click chuột.</p>\n" +
//"\n" +
//"<p>Ch&uacute;ng t&ocirc;i cam kết cung cấp dịch vụ chất lượng cao v&agrave; hỗ trợ kh&aacute;ch h&agrave;ng nhiệt t&igrave;nh, lu&ocirc;n sẵn s&agrave;ng đ&aacute;p ứng mọi nhu cầu của qu&yacute; kh&aacute;ch.</p>\n" +
//"\n" +
//"<p>H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i kh&aacute;m ph&aacute; v&agrave; trải nghiệm sự kh&aacute;c biệt với Tripove ngay h&ocirc;m nay!</p>\n" +
//"\n" +
//"<p>&nbsp;</p>\n" +
//"\n" +
//"<p>&nbsp;</p>\n" +
//"\n" +
//"<h3><strong>1. Hướng Dẫn Đặt V&eacute; Xe Trực Tuyến Tại Tripove</strong></h3>\n" +
//"\n" +
//"<p><img alt=\"\" src=\"https://static.vecteezy.com/system/resources/previews/010/200/115/non_2x/internet-service-for-book-and-buy-bus-ticket-travel-and-tourism-concept-tourist-planning-trip-online-passengers-buying-tickets-for-bus-in-mobile-app-vector.jpg\" style=\"height:109px; width:265px\" /></p>\n" +
//"\n" +
//"<p>Giới Thiệu</p>\n" +
//"\n" +
//"<p>Tr&ecirc;n thế giới ng&agrave;y nay, sự tiện lợi l&agrave; rất quan trọng. Việc đặt v&eacute; xe m&aacute;y trực tuyến ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến với nhiều du kh&aacute;ch. Với nền tảng như Tripove, qu&aacute; tr&igrave;nh n&agrave;y diễn ra một c&aacute;ch mượt m&agrave; v&agrave; hiệu quả. Hướng dẫn n&agrave;y sẽ chỉ bạn từng bước c&aacute;ch đặt v&eacute; xe m&aacute;y trực tuyến.</p>\n" +
//"\n" +
//"<p>C&aacute;c Lợi &Iacute;ch Của Việc Đặt V&eacute; Xe M&aacute;y Trực Tuyến</p>\n" +
//"\n" +
//"<ol>\n" +
//"	<li><strong>Tiện Lợi</strong>: Đặt v&eacute; từ nh&agrave; hoặc bất cứ đ&acirc;u bằng điện thoại th&ocirc;ng minh.</li>\n" +
//"	<li><strong>Tiết Kiệm Thời Gian</strong>: Kh&ocirc;ng cần phải đứng xếp h&agrave;ng d&agrave;i tại bến xe.</li>\n" +
//"	<li><strong>C&oacute; Sẵn 24/7</strong>: Đặt v&eacute; bất cứ l&uacute;c n&agrave;o, ở đ&acirc;u.</li>\n" +
//"	<li><strong>So S&aacute;nh Dễ D&agrave;ng</strong>: Dễ d&agrave;ng so s&aacute;nh gi&aacute; cả v&agrave; lịch tr&igrave;nh của c&aacute;c chuyến xe.</li>\n" +
//"</ol>\n" +
//"\n" +
//"<h3><strong>2. Những Điều Cần Biết Khi Sử Dụng Dịch Vụ Đặt V&eacute; Xe&nbsp;</strong></h3>\n" +
//"\n" +
//"<h3><img alt=\"\" src=\"https://static.vecteezy.com/system/resources/previews/008/517/686/original/online-booking-design-concept-for-mobile-phone-hotel-flight-car-tickets-vector.jpg\" style=\"height:177px; width:265px\" /></h3>\n" +
//"\n" +
//"<p>Điều G&igrave; L&agrave;m N&ecirc;n Sự Kh&aacute;c Biệt</p>\n" +
//"\n" +
//"<ol>\n" +
//"	<li><strong>Độ Tin Cậy</strong>: Tripove cam kết về độ tin cậy v&agrave; dịch vụ chuy&ecirc;n nghiệp.</li>\n" +
//"	<li><strong>Sự Th&acirc;n Thiện</strong>: Dịch vụ hỗ trợ kh&aacute;ch h&agrave;ng nhanh ch&oacute;ng v&agrave; th&acirc;n thiện.</li>\n" +
//"	<li><strong>T&iacute;nh Năng Nổi Bật</strong>: C&aacute;c t&iacute;nh năng tiện &iacute;ch như th&ocirc;ng tin chi tiết về chuyến đi, đ&aacute;nh gi&aacute; từ người d&ugrave;ng.</li>\n" +
//"</ol>\n" +
//"\n" +
//"<h3><strong>3. Lợi &Iacute;ch Của Việc Sử Dụng Tripove Để Đặt V&eacute; Xe&nbsp;</strong></h3>\n" +
//"\n" +
//"<p><strong><img alt=\"\" src=\"https://as1.ftcdn.net/v2/jpg/01/76/39/98/1000_F_176399837_ITXfxUJPx7F8o66ywgW5GEt5WZ0dQS4Z.jpg\" style=\"height:212px; width:265px\" /></strong></p>\n" +
//"\n" +
//"<p>Đảm Bảo An To&agrave;n V&agrave; Tiện Lợi</p>\n" +
//"\n" +
//"<ol>\n" +
//"	<li><strong>An To&agrave;n</strong>: Thanh to&aacute;n trực tuyến an to&agrave;n v&agrave; bảo mật.</li>\n" +
//"	<li><strong>Chất Lượng Dịch Vụ</strong>: Chọn lựa c&aacute;c đối t&aacute;c vận chuyển uy t&iacute;n, đảm bảo chất lượng dịch vụ.</li>\n" +
//"	<li><strong>Sự Chuy&ecirc;n Nghiệp</strong>: Đội ngũ hỗ trợ kh&aacute;ch h&agrave;ng nhiệt t&igrave;nh v&agrave; chuy&ecirc;n nghiệp.</li>\n" +
//"</ol>\n" +
//"\n" +
//"<h3><strong>4. Cẩm Nang Đặt V&eacute; Xe Tại Tripove Cho Người Mới Bắt Đầu:</strong></h3>\n" +
//"\n" +
//"<p><strong><img alt=\"\" src=\"https://img.freepik.com/premium-vector/flight-tickets-online-booking-illustration-concept_108061-1163.jpg\" style=\"height:265px; width:265px\" /></strong></p>\n" +
//"\n" +
//"<p>Hướng Dẫn Cụ Thể Bước Đặt V&eacute;</p>\n" +
//"\n" +
//"<ol>\n" +
//"	<li><strong>Bước 1</strong>: Truy cập v&agrave;o trang web hoặc ứng dụng Tripove.</li>\n" +
//"	<li><strong>Bước 2</strong>: Chọn điểm đi v&agrave; điểm đến, nhập th&ocirc;ng tin chuyến đi.</li>\n" +
//"	<li><strong>Bước 3</strong>: Chọn lựa chuyến xe v&agrave; ghế ngồi ph&ugrave; hợp.</li>\n" +
//"	<li><strong>Bước 4</strong>: Thanh to&aacute;n v&agrave; nhận v&eacute; qua email hoặc ứng dụng Tripove.</li>\n" +
//"</ol>\n" +
//"\n" +
//"<h3><strong>5. Tin Tức Về C&aacute;c Sự Kiện V&agrave; Ưu Đ&atilde;i Đặc Biệt Tại Tripove</strong></h3>\n" +
//"\n" +
//"<p><strong><img alt=\"\" src=\"https://cdn.dribbble.com/users/2317423/screenshots/16332635/media/27614114fb991d7f22748f3f48f939e9.jpg?resize=400x0\" style=\"height:199px; width:265px\" /></strong></p>\n" +
//"\n" +
//"<p>Cập Nhật Tin Tức Mới Nhất</p>\n" +
//"\n" +
//"<ol>\n" +
//"	<li><strong>Khuyến M&atilde;i Đặc Biệt</strong>: Th&ocirc;ng tin về c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; hấp dẫn.</li>\n" +
//"	<li><strong>Sự Kiện Đặc Biệt</strong>: C&aacute;c sự kiện, lễ hội được tổ chức v&agrave; hỗ trợ bởi Tripove.</li>\n" +
//"</ol>\n" +
//"\n" +
//"<p>&nbsp;</p>";
//        String image = "image/news/tripove.png";
//        Timestamp created_at = Timestamp.valueOf("2024-07-04 17:29:50.887");
//        Timestamp updated_at = Timestamp.valueOf("2024-07-05 11:37:44.603");
//        String title = "Hệ thống đặt vé xe trực tuyến Tripove chính thức đi vào hoạt động kể từ ngày 10/07/2024";
//        NewsDAO instance = new NewsDAO();
//        News expResult = new News(1, title, content, image, created_at, updated_at);
//        News result = instance.getNewsById(id);
//        assertEquals(expResult.getId(), result.getId());
//        assertEquals(expResult.getTitle(), result.getTitle());
//        assertEquals(expResult.getContent(), result.getContent());
//        assertEquals(expResult.getImage(), result.getImage());
//        assertEquals(expResult.getCreated_at(), result.getCreated_at());
//        assertEquals(expResult.getUpdated_at(), result.getUpdated_at());
//    }
//    /**
//     * Test of addNews method, of class NewsDAO.
//     */
    @Test
    public void testAddNews() {
        System.out.println("addNews");
        News news = new News("Thông Báo Bảo Trì Hệ Thống", 
                "Hệ thống bắt đầu bảo trì từ 3h đến 5h", "image/news/logo2.png");
        NewsDAO instance = new NewsDAO();
        boolean expResult = instance.addNews(news);
        boolean result = true;
        assertEquals(expResult, result);
    }

    /**
     * Test of updateNews method, of class NewsDAO.
     */
    @Test
    public void testUpdateNews() {
        System.out.println("updateNews");
        News news = new News(61, "Thông Báo Bảo Trì Hệ Thống", "Hệ thống bắt đầu bảo trì từ 3h đến 5h", "image/news/logo2.png");
        NewsDAO instance = new NewsDAO();
        boolean expResult = instance.updateNews(news);
        boolean result = true;
        assertEquals(expResult, result);
    }
//
//    /**
//     * Test of deleteNewsById method, of class NewsDAO.
//     */

    @Test
    public void testDeleteNewsById() {
        System.out.println("deleteNewsById");
        int id = 62;
        NewsDAO instance = new NewsDAO();
        boolean expResult = instance.deleteNewsById(id);
        boolean result = true;
        assertEquals(expResult, result);

    }
}
