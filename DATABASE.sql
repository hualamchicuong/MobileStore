
CREATE TABLE PRODUCT(
	ID SERIAL,
	NAME VARCHAR(50) NOT NULL,
	IMAGE VARCHAR(500) NOT NULL,
	QUANTITY INT NOT NULL,
	PRICE NUMERIC NOT NULL,
	DROP DATE NOT NULL,
	TYPE VARCHAR(100) NOT NULL,
	Description TEXT,
	COLOR VARCHAR(100),
	STORAGE VARCHAR(50),
	
	CONSTRAINT PK_PRODUCT
	PRIMARY KEY(ID)
);

CREATE TABLE ACCOUNT(
	ID SERIAL,
	USERNAME VARCHAR(100),
	NAME VARCHAR(100),
	UID VARCHAR(100),
	EMAIL VARCHAR(100),
	PHONE_NUMBER CHAR(50),
	ADDRESS VARCHAR(500),
	CONSTRAINT PK_ACC
	PRIMARY KEY (ID,UID)
);

CREATE TABLE DAILY(
	id SERIAL,
	NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	SDT VARCHAR(50),
	ID_USER INT,
	UID VARCHAR(100),
	
	CONSTRAINT PK_DL
	PRIMARY KEY (id)
);

CREATE TABLE PRODUCT_IMAGE(
	ID SERIAL,
	IMG_PATH VARCHAR(1000),
	ID_PRODUCT INT,
	
	CONSTRAINT PK_PRODUCT_IMGpg
	PRIMARY KEY(ID)

);

CREATE TABLE PRODUCT_SYSTEM(
	ID SERIAL,
	ID_PRODUCT INT,
	NAME TEXT,
	VALUE TEXT,
	
	CONSTRAINT PK_PS
	PRIMARY KEY(ID)
);

CREATE TABLE CART (
	ID SERIAL,
	ID_USER INT,
	UID VARCHAR(100),
	
	CONSTRAINT PK_CART
	PRIMARY KEY(ID)
);

CREATE TABLE CART_DETAIL(
	ID SERIAL,
	ID_CART INT,
	ID_PRODUCT INT,
	NUMBER INT,
	
	
	CONSTRAINT PK_CART_DETAIL
	PRIMARY KEY(ID)
);


CREATE TABLE DL_ORDER(
	ID SERIAL,
	ID_USER INTEGER NOT NULL,
	UID VARCHAR(100) NOT NULL,
	TOTAL_COST INTEGER NOT NULL,
	TOTAL_COST_VAT INTEGER NOT NULL,
	STATE VARCHAR(100),
	ADDRESS TEXT,
	NOTE TEXT,
	ORDER_DATE DATE,
	
	
	CONSTRAINT PK_ORD
	PRIMARY KEY(ID)
);

CREATE TABLE ORDER_DETAIL(
	ID SERIAL,
	ID_ORDER INTEGER NOT NULL,
	ID_PRODUCT INTEGER NOT NULL,
	COST NUMERIC NOT NULL,
	QUANTITY INTEGER NOT NULL,
	
	CONSTRAINT PK_OD
	PRIMARY KEY(ID)
);



ALTER TABLE PRODUCT_IMAGE
ADD
	CONSTRAINT FK_PI_P
	FOREIGN KEY(ID_PRODUCT)
	REFERENCES PRODUCT(ID);

ALTER TABLE DAILY
ADD
	CONSTRAINT FK_DL_ACCOUNT
	FOREIGN KEY(ID_USER,UID)
	REFERENCES ACCOUNT(ID,UID)
	
ALTER TABLE PRODUCT_SYSTEM
ADD
	CONSTRAINT FK_PS_P
	FOREIGN KEY(ID_PRODUCT)
	REFERENCES PRODUCT(ID);
	
ALTER TABLE CART
ADD
	CONSTRAINT FK_CART_ACCOUNT
	FOREIGN KEY(ID_USER,UID)
	REFERENCES ACCOUNT(ID,UID);
	
ALTER TABLE CART_DETAIL
ADD
	CONSTRAINT FK_CART_DETAIL_CART
	FOREIGN KEY (ID_CART)
	REFERENCES CART(ID);
	
ALTER TABLE CART_DETAIL
ADD
	CONSTRAINT FK_CART_DETAIL_PRODUCT
	FOREIGN KEY (ID_PRODUCT)
	REFERENCES PRODUCT(ID);
	
ALTER TABLE DL_ORDER
ADD
	CONSTRAINT FK_O_ACC
	FOREIGN KEY(ID_USER, UID)
	REFERENCES ACCOUNT(ID, UID);
		
	
ALTER TABLE ORDER_DETAIL
ADD
	CONSTRAINT FK_OD_O
	FOREIGN KEY(ID_ORDER)
	REFERENCES DL_ORDER(ID);
	
ALTER TABLE ORDER_DETAIL
ADD
	CONSTRAINT FK_OD_P
	FOREIGN KEY(ID_PRODUCT)
	REFERENCES PRODUCT(ID);
	

	
-- SELECT * FROM PRODUCT
-- SELECT * FROM PRODUCT_SYSTEM

-- DROP TABLE PRODUCT_SYSTEM

-- DROP TABLE DAILY



INSERT INTO DAILY VALUES (1,N'Tester Login','hellocc3602@gmail.com','0817208372',1,'3d83b8c5-26ef-4639-bc03-e9476958a5f1');

INSERT INTO ACCOUNT VALUES (1,'test001','Tester Login','3d83b8c5-26ef-4639-bc03-e9476958a5f1','hellocc3602@gmail.com');


-- DROP TABLE PRODUCT_IMAGE;
-- DROP TABLE PRODUCT;
--ALTER SEQUENCE cart_id_seq RESTART WITH 1




INSERT INTO PRODUCT VALUES (1,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gray.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'Black','128GB');

INSERT INTO PRODUCT VALUES (2,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Phantom-black-640x640-1.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Black','128GB');

INSERT INTO PRODUCT VALUES (3,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_3.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'Black','128GB');

INSERT INTO PRODUCT VALUES (4,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-silver.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'White','128GB');

INSERT INTO PRODUCT VALUES (5,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Moon-Beige-640x640-2.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Metalic Cream','128GB');

INSERT INTO PRODUCT VALUES (6,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_6.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'White','128GB');

INSERT INTO PRODUCT VALUES (7,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gold.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'Gold','256GB');

INSERT INTO PRODUCT VALUES (8,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Green-Gray-640x640-2.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Titan Blue','256GB');

INSERT INTO PRODUCT VALUES (9,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_2.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'Aura Glow','256GB');

INSERT INTO PRODUCT VALUES (10,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_2.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'Aura Glow','512GB');

INSERT INTO PRODUCT VALUES (11,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_2.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'Aura Glow','128GB');

INSERT INTO PRODUCT VALUES (12,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Green-Gray-640x640-2.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Titan Blue','128GB');

INSERT INTO PRODUCT VALUES (13,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Green-Gray-640x640-2.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Titan Blue','512GB');

INSERT INTO PRODUCT VALUES (14,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gold.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'Gold','128GB');

INSERT INTO PRODUCT VALUES (15,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gold.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'Gold','512GB');

INSERT INTO PRODUCT VALUES (16,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_6.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'White','256GB');

INSERT INTO PRODUCT VALUES (17,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_6.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'White','512GB');

INSERT INTO PRODUCT VALUES (18,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Moon-Beige-640x640-2.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Metalic Cream','256GB');

INSERT INTO PRODUCT VALUES (19,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Moon-Beige-640x640-2.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Metalic Cream','512GB');

INSERT INTO PRODUCT VALUES (20,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-silver.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'White','256GB');

INSERT INTO PRODUCT VALUES (21,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-silver.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'White','512GB');

INSERT INTO PRODUCT VALUES (22,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_3.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'Black','256GB');

INSERT INTO PRODUCT VALUES (23,'Samsung Galaxy Note 10', 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_3.jpg',10,20000000,'2023-05-29','Samsung',N'
<h2>Thiết kế tinh tế và sang trọng</h2>
Samsung Galaxy Note 10 tự hào có thiết kế tinh tế và chất lượng xây dựng. Nó vô cùng kiểu dáng đẹp và mỏng, với màn hình 6,3 inch của nó chiếm ưu thế ở mặt trước của điện thoại. Chiếc điện thoại này có một cái nhìn và cảm giác rất cao cấp, với mặt trước và mặt sau bằng kính và một khung kim loại làm tăng độ bền và độ bền của nó.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-3.jpg" alt=" " />
Thiết bị này có nhiều màu sắc, bao gồm Aura Glow, Aura White và Aura Black. Đặc biệt, màu Aura Glow là một màu độc đáo và bắt mắt phản chiếu ánh sáng đẹp mắt.<br>
Màn hình hiển thị trên Samsung Galaxy Note 10 thực sự ấn tượng. Điện thoại này có màn hình Dynamic AMOLED 6,3 inch, cung cấp hình ảnh tinh thể rõ ràng và màu sắc sống động. Màn hình có độ phân giải 2280 x 1080 pixel và mật độ điểm ảnh 401 PPI, làm cho nó trở thành một trong những màn hình sắc nét nhất trên thị trường.<br>
<h2>Hệ thống Camera đột phá</h2>
Samsung Galaxy Note 10 tự hào có một hệ thống camera ba phía sau với một ống kính góc rộng 12MP, một ống kính siêu rộng 16MP, và một ống kính tele 12MP, cùng với một máy ảnh mặt trước 10MP. Hệ thống máy ảnh chắc chắn là một trong những điểm nổi bật của điện thoại này, nhưng nó có thực sự hoàn hảo hình ảnh hay không?<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-12.jpg" alt=" " />
<h2>Làm thế nào Note 10 xử lý các tác vụ hàng ngày và sử dụng nặng ?</h2>
Samsung Galaxy Note 10 là một sức mạnh của một thiết bị, và hiệu suất của nó chắc chắn không làm thất vọng. Với bộ vi xử lý Qualcomm Snapdragon 855 và RAM 8GB ( Hoặc Vi xử lý  Exynos 9825 và Ram 12G ở phiên bản Hàn Quốc )  Note 10 xử lý các tác vụ hàng ngày một cách dễ dàng. Cho dù bạn đang cuộn qua phương tiện truyền thông xã hội, gửi email hay duyệt web, mọi thứ đều cảm thấy mượt mà và phản hồi.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note-10-mo-ta-8.JPG" alt=" " />',N'Black','512GB');

INSERT INTO PRODUCT VALUES (24,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Phantom-black-640x640-1.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Black','256GB');

INSERT INTO PRODUCT VALUES (25,'Samsung Galaxy Z Fold 4', 'https://clickbuy.com.vn/uploads/2022/07/Z-Fold-Phantom-black-640x640-1.png',10,20000000,'2023-05-29','Samsung',N'
<h2>Đẳng cấp của chiếc smartphone hai màn hình</h2>
Nét độc đáo nhất của Samsung Z Fold 4 là việc sản phẩm được trang bị tới hai màn hình/ Trong đó, màn hình chính rộng 7.6 inch có thể đóng - mở linh hoạt để “hô biến” thành một chiếc tablet khi cần. Khi gập lại, Samsung Galaxy Z Fold 4 vẫn phục vụ bạn dễ dàng nhờ màn hình phụ rộng 6.2 inch trên mặt trước. Tất cả đem đến trải nghiệm hình ảnh trọn vẹn không thể tìm thấy ở đâu khác.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/SM-F936_ZFold4_Openback115_Burgundy.jpg" alt=" "/>
<h2>Mỏng hơn, sang trọng hơn và trau chuốt hơn</h2>
So với thế hệ cũ, Samsung Galaxy Z Fold 4 đánh dấu bước tiến mới về độ hoàn thiện. Dù có kích cỡ tổng thể lớn hơn nhiều khi mở ra, nhưng nhờ những tinh chỉnh hợp lý về kết cấu và sử dụng vật liệu siêu nhẹ, sản phẩm rút gọn trọng lượng về mức xấp xỉ smartphone thông thường.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-2.jpg" alt=" "/>
<h2>Đa nhiệm dễ dàng, làm việc chuyên nghiệp</h2>
Trên thanh tác vụ bên dưới, Galaxy Z Fold4 hỗ trợ bật/tắt nhanh các ứng dụng để giúp người dùng tận dụng trọn vẹn không gian hiển thị lớn của chiếc điện thoại. Tính năng App Pair cho phép khởi động nhiều nhất ba ứng dụng chỉ trong một cú chạm.<br>
Toàn bộ giao diện OneUI đều được được xây dựng để phát huy tất cả thế mạnh của kiểu dáng độc đáo và hiệu năng ấn tượng từ bộ vi xử lý hàng đầu thế giới. Với Galaxy Z Fold 4, bạn như đang bỏ túi một chiếc PC gọn gàng để kiểm tra tin nhắn, check mail, chơi game và làm mọi điều mình muốn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/galaxy-z-fold4_highlights_multi.jpg" alt=" " />
<h2>Màn hình Infinity Flex trọn vẹn và ấn tượng</h2>
Việc Samsung rút gọn viền bao quanh và đưa camera selfie xuống dưới tấm nền giúp không gian trải nghiệm của Galaxy Z Fold4 trở nên trọn vẹn, cực đại và không khiếm khuyết. Hãy thoải mái tận hưởng những thước phim, tựa game bạn yêu thích trên màn hình 7.6 inch Infinity Flex có một không hai này.<br>
Ngoài ra, mọi thao tác cuộn, vuốt và những khuôn hình chuyển động trên Galaxy Z Fold4 đều được diễn đạt mượt mà khi sản phẩm đạt mức tần số quét là 120Hz, tối ưu hóa trải nghiệm nhìn ngắm cho bạn.<br>
<h2>Đạt tới hiệu suất đỉnh cao với chip xử lý 4nm</h2>
Chìa khóa mọi sức mạnh trên Samsung Galaxy Z Fold 4 đến từ Snapdragon 8+ Gen 1, đây là con chip được chế tác trên tiến trình 4nm và mạnh mẽ nhất thế giới Android. Bộ vi xử lý đỉnh cao là lời cam kết mọi tác vụ thực hiện trên chiếc điện thoại đều luôn được xử lý mượt mà nhất, ấn tượng nhất.<br>
Không chỉ vậy, bạn sẽ được tận hưởng những trải nghiệm những tính năng ưu việt hàng đầu trên chiếc điện thoại này như kết nối 5G, dung lượng pin 4.400 mAh cho trải nghiệm pin dài lâu, cảm biến vân tay một chạm, bảo mật Samsung Knox và hai tùy chọn bộ nhớ trong gồm: 256GB, 512GB.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/asus/Mo-ta-san-pham-samsung-galaxy-z-fold4-d.jpg" alt =" " />',N'Black','512GB');

INSERT INTO PRODUCT VALUES (26,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gray.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'Black','256GB');

INSERT INTO PRODUCT VALUES (27,'Iphone 13 Pro Max', 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gray.png',10,2000000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.<br>
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-2.jpg" alt=" " />
<h2>Màn hình giải trí siêu mượt cùng tần số quét 120 Hz</h2>
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-5.jpg" alt=" " />							
<h2>Cụm camera được nâng cấp toàn diện</h2>
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-21.jpg" alt=" " />							
<h2>Hiệu năng đầy hứa hẹn với Apple A15 Bionic</h2>
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.<br>
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-15.jpg" alt=" " />							',N'Black','512GB');


-- IPHONE 13 PRO MAX

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859769705950103_iPhone%2013%20Promax%20(1).jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro Max';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859769705950103_iPhone%2013%20Promax%20(5).jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro Max';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859769705793853_iPhone%2013%20Promax%20(3).jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro Max';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/4/637846759807197875_iphone-13-pro-max-1.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro Max';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/30/637842409659005219_iphone-13-pro-max-green-2.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro Max';

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,1,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,4,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,7,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,14,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,15,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,20,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,21,N'Pin','3240 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,26,N'Pin','3240 mAh');


INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Trọng lượng','174 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Kích thước màn hình','6.1 inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Công nghệ màn hình','Super Retina XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Kích thước','146,7 x 71,5 x 7,65mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Model','iPhone 13 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Camera sau','Camera góc rộng: 12MP f/1.6 <br> Camera góc siêu rộng: 12MP, ƒ/2.4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Camera trước','12MP, f/2.2');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,27,N'Pin','3240 mAh');


--SAMSUNG GALAXY Z FOLD 4

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-z-fold4/buy/Fold4_ColorSelection_PhantomBlack_PC.png?imwidth=480', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Z Fold 4';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-z-fold4/buy/Fold4_Carousel_ProductKV_EcoKV_PC.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Z Fold 4';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-z-fold4/buy/Fold4_Carousel_ProductKV_PhantomBlack_PC.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Z Fold 4';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-z-fold4/buy/Fold4_Carousel_GroupKV_PC.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Z Fold 4';


INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,2,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,5,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,8,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,12,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,13,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,18,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,19,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,24,N'Pin','4400 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Trọng lượng','263 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Kích thước màn hình','7.6 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Công nghệ màn hình','AMOLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Độ phân giải','2176 x 1812 pixels (QXGA+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Hệ điều hành','Android 12');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Kích thước','Kích thước khi gập lại: 155.1 x 130.1 x 6.3 mm <br> Kích thước khi máy mở ra: 155.1 x 67.1 x 14.2-15.8 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Model','Samsung Galaxy Z Fold 4');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'CPU Series','Snapdragon 8 Plus Gen 1');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Dung lượng RAM','12 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Camera sau','Camera chính: 50MP, f/1.8 <br> Camera góc siêu rộng: 12MP, f/2.2 <br> Camera tele: 10MP, f/2.4 (3x zoom)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Camera trước','10MP (bên ngoài) + 4MP (dưới màn hình)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,25,N'Pin','4400 mAh');

--SAMSUNG GALAXY NOTE 10

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_3.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Note 10';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://static-news.moneycontrol.com/static-mcnews/2019/08/Note_10_Camera.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Note 10';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'http://media.doisongphapluat.com/529/2019/8/10/galaxynote10plus.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Note 10';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://znews-photo.zadn.vn/w1024/Uploaded/neg_wpeczyr/2019_08_12/Image05_Super_Fast_Charging.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy Note 10';

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,3,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,6,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,9,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,10,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,11,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,16,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,17,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,22,N'Pin','3500 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Trọng lượng','168 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Kích thước màn hình','6.3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Công nghệ màn hình','Dynamic AMOLED FHD+ Infinity-O');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Độ phân giải','1080 x 2280 pixels (FullHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Hệ điều hành','Android 9.0 (Pie)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Kích thước','71.8 x 151 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Model','Samsung Note 10');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'CPU Brand','Samsung');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'CPU Series','Samsung Exynos 9825');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Camera sau','Góc siêu rộng: 16MP (F2.2), f/1.8 <br> Góc rộng: 12MP OIS (F.15/F2.4) <br> Camera tele: 12MP OIS (F2.1)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Camera trước','10 MP (F2.2)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,23,N'Pin','3500 mAh');

-- Iphone 14 PRO MAX

INSERT INTO PRODUCT VALUES (28,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/x/_/x_m_24.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Black','128GB');

INSERT INTO PRODUCT VALUES (31,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/x/_/x_m_24.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Black','256GB');


INSERT INTO PRODUCT VALUES (32,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/x/_/x_m_24.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Black','512GB');

INSERT INTO PRODUCT VALUES (29,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/v/_/v_ng_18_1.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Gold','128GB');

INSERT INTO PRODUCT VALUES (33,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/v/_/v_ng_18_1.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Gold','256GB');


INSERT INTO PRODUCT VALUES (34,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/v/_/v_ng_18_1.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Gold','512GB');

INSERT INTO PRODUCT VALUES (30,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/t/_/t_m_19.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Tím','128GB');

INSERT INTO PRODUCT VALUES (35,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/t/_/t_m_19.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Tím','256GB');


INSERT INTO PRODUCT VALUES (36,'Iphone 14 Pro Max', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/t/_/t_m_19.png',10,2600000,'10-29-2022','Iphone',N'
<h2>Thiết kế cao cấp bền bỉ</h2>
<br>iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103221.jpg" alt=" " />
<h2>Nổi bật với thiết kế màn hình mới</h2>
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103229.jpg" alt=" " />
<br>So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103232.jpg" alt=" " />							
<br>Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...<br>				
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103235.jpg" alt=" " />	

<h2>Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng</h2>
Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103237.jpg" alt=" " />	
<br>Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.<br>
Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.<br>
Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt=" " /><br>
							
<h2>Hiệu năng đáng kinh ngạc với chip set Apple A16 Bionic</h2>
<br>Theo thông lệ từ trước đến nay của Apple thì mỗi lần ra mắt dòng điện thoại mới là nhà táo lại trình làng thêm một con chip với hiệu năng cực khủng và ở thế hệ điện iPhone 14 Series sẽ là con chip Apple A16 Bionic 6 nhân với xung nhịp tối đa lên đến 3.46 GHzTheo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.<br>
<br>Theo như thông số mình đo được qua các phần mềm con chip Apple A16 Bionic đạt được mức điểm như sau: 1887 (đơn nhân), 5354 (đa nhân) trên Benchmark và 15508 điểm đánh giá tổng thể. Đây quả thực là những con số quá khủng khiếp, dường như chip đã vượt mặt gần như toàn bộ các vi xử lý hiện đang có mặt trên thị trường di động trong năm 2022.<br>						
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103323.jpg" alt=" " />							',N'Tím','512GB');



INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,28,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,29,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,30,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,31,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,32,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,33,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,34,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,35,N'Pin','4323 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Trọng lượng','240 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Kích thước màn hình','6.7 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Công nghệ màn hình','Super Retina XDR OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Độ phân giải','2796 x 1290-pixel');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Kích thước','160.7 x 77.6 x 7.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Model','iPhone 14 Pro Max');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'CPU Series','Apple A16 Bionic 6-core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Camera sau','Camera chính: 48 MP, f/1.8, 24mm, 1.22µm, PDAF, OIS <br> Camera góc siêu rộng: 12 MP, f/2.2, 13mm, 120˚, 1.4µm, PDAF, <br> Camera tele: 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical zoom
Cảm biến độ sâu TOF 3D LiDAR ');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Camera trước','12 MP, f/1.9, 23mm, 1/3.6", PDAF');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,36,N'Pin','4323 mAh');

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/_/b_c_1_9.png', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/_/b_c_1_9.png', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/x/_/x_m_24.png', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/_/b_c_1_9.png', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/v/_/v_ng_18.png', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn1.viettelstore.vn/Images/Product/ProductImage/1777775996.jpeg', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn1.viettelstore.vn/Images/Product/ProductImage/1231131890.jpeg', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn1.viettelstore.vn/Images/Product/ProductImage/116945881.jpeg', ID
FROM PRODUCT
WHERE name = 'Iphone 14 Pro Max';


-- MacBook Pro 16 inch M1 Pro 2021


INSERT INTO PRODUCT VALUES (37,'MacBook Pro 16 inch M1 Pro 2021', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Hiệu năng vượt trội, chinh phục mọi tác vụ</h2>
<br>MacBook Pro 16 inch sở hữu sức mạnh từ bộ vi xử lý M1 Pro tiên tiến được trang bị 10 nhân CPU (8 nhân hiệu suất cao + 2 nhân tiết kiệm điện) mang đến hiệu suất nhanh hơn tới 70% so với M1, cho khả năng xử lý mượt mà mọi tác vụ từ cơ bản đến khắt khe nhất như chỉnh sửa hình ảnh, dựng video độ phân giải cao,... Không những có thời gian phản hồi nhanh mà còn tối ưu tiết kiệm được đáng kể điện năng. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083928.jpg" alt=" " />
<br>Bên cạnh đó M1 Pro còn được tích hợp lên đến 16 lõi GPU để nâng cao khả năng đồ họa, xử lý hình ảnh chuyên nghiệp, cho mình thỏa sức sáng tạo nội dung, sử dụng mướt các thao tác như render video, dựng hình 3D,... trên các phần mềm thiết kế Photoshop, AI, Premiere,... phát trực tiếp cũng tuyệt vời không kém với độ nét cao lên đến 8K. Mình chỉ mất khoảng 45 giây để xuất một đoạn video ngắn đăng tải lên Tik Tok.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083942.jpg" alt=" " />			
<br>Bộ nhớ RAM 16 GB cho khả năng đa nhiệm cao, mình có thể mở cùng lúc nhiều cửa sổ hay các ứng dụng Adobe khác nhau, dễ dàng di chuyển qua lại mà không hề gặp tình trạng đứng máy hay giật màn hình, cũng như thoải mái bật nhiều layer cùng lúc mà máy vẫn chạy ổn định với hiệu năng cao.<br>
<br>Ổ cứng SSD 512 GB trên MacBook thì có tốc độ truy xuất dữ liệu vượt trội rồi, thời gian khởi động máy hoặc mở các phần mềm nặng chỉ trong vài giây, không gian đủ rộng cho phép mình lưu trữ các tài liệu trong công việc, hình ảnh,... một cách thuận tiện. <br>
<br>Màn hình MacBook Pro 16” có các cạnh viền rất mỏng chỉ 3,5mm đồng thời được làm bo tròn ở hai góc trên và có phần notch “tai thỏ” – vị trí chứa camera FaceTime của máy (1080p).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-13-768x512.webp" alt=" " />							
<h2>Hiệu năng mạnh mẽ từ M1 Pro và M1 Max</h2>
<br>M1 Pro và M1 Max là hai SoC rất mạnh mà Apple trang bị trên MacBook Pro – M1 Pro và M1 Max có 10 nhân CPU bao gồm 8 nhân mạnh và 2 nhân tiết kiệm, riêng M1 Max có tuỳ chọn lên đến 32 nhân GPU cho hiệu năng GPU mạnh hơn gấp 4 so với thông thường và băng thông bộ nhớ với tốc độ 4000GB/s – tức nhanh hơn 2 lần so với M1 Pro và 6 lần so với M1, tuỳ chọn bộ nhớ Unified Memory lên đến 64GB (có thể hiểu là RAM).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-15-768x512.webp" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />
<h2>Thiết kế hiện đại, thời thượng</h2>
<br>Laptop vẫn sở hữu lớp vỏ kim loại nguyên khối nhưng tổng thể thiết kế trông phẳng hơn, có cùng kích thước và chỉ dày hơn một chút so với mẫu Pro 16 inch chạy bộ vi xử lý Intel. Máy có khối lượng 2.1 kg và dày 16.8 mm sẽ hơi khó khăn một chút khi cầm bằng một tay và nặng so với các bạn nữ nhưng vẫn có thể bỏ vào cặp xách hay balo để di chuyển bất cứ nơi đâu.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083931.jpg" alt=" " /><br>
<br>Thay đổi lớn nhất nằm ở màn hình mặt trước với viền mỏng ở các cạnh, bên trên có sự xuất hiện của chiếc notch tai thỏ mới. Trên thực tế macOS sẽ đưa thanh menu lên trên hai bên của phần notch, cho mình một không gian lớn hơn để làm việc. Nhưng vẫn chưa được tối ưu tốt nhất cho quá trình sử dụng, chiếc notch sẽ bị che đi bởi một dải đen khi mình mở ứng dụng toàn màn hình và chỉ hiển thị trở lại ở dạng cửa sổ.<br>
<br>Bên dưới màn hình cũng không còn logo "MacBook Pro" mang tính biểu tượng nữa, thay vào đó Apple đã đưa logo xuống dưới đáy máy. Thêm một chi tiết thiết kế nữa đã được loại bỏ chính là thanh Touch Bar, thay thế bằng một hàng 12 phím chức năng hữu ích hơn rất nhiều, Touch Bar trên thế hệ MacBook cũ cho mình trải nghiệm không thực sự ấn tượng, thường bị lỗi và mình cũng ít khi sử dụng đến, một công cụ có thể nói là "vô nghĩa" dành cho dân chuyên.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083945.jpg" alt=" " /><br>
<br>Magic Keyboard được thiết kế mới và loại bỏ được các khuyết điểm so với thế hệ trước khi có độ nảy cao với cơ chế cắt kéo, hành trình phím phù hợp, khoảng cách rộng rãi cộng thêm chiếu nghỉ tay kích thước lớn cho mình trải nghiệm gõ phím tốt với tốc độ nhanh, êm và chính xác. Bàn phím còn được trang bị thêm đèn nền có thể thay đổi mức độ sáng dựa theo ánh sáng của môi trường xung quanh, cho phép mình làm việc trong những điều kiện ánh sáng tối khác nhau.<br>
<br>Cảm biến Touch ID được tích hợp ở phím nguồn giúp mình mở khóa hay truy cập vào các ứng dụng có bảo mật nhanh chóng chỉ với một cái chạm nhẹ. Bàn di chuột Force Touch có kích thước rất lớn, cảm giác di vuốt mượt mà, thậm chí mình còn không cần đến chuột khi sử dụng, chỉ những khi cần chỉnh sửa nhiều chi tiết trong Photoshop mới cần dùng đến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083956.jpg" alt=" " /><br>
<br>MacBook Pro 16 M1 Pro 2021 xứng danh một chiếc laptop cao cấp - sang trọng khi sở hữu những thông số cấu hình hết sức hoàn hảo, chinh phục được mọi tác vụ từ đơn giản đến phức tạp, một sự lựa chọn lý tưởng dành cho các dân chuyên trong lĩnh vực sáng tạo.<br>',N'Bạc','512GB');

INSERT INTO PRODUCT VALUES (38,'MacBook Pro 16 inch M1 Pro 2021', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Hiệu năng vượt trội, chinh phục mọi tác vụ</h2>
<br>MacBook Pro 16 inch sở hữu sức mạnh từ bộ vi xử lý M1 Pro tiên tiến được trang bị 10 nhân CPU (8 nhân hiệu suất cao + 2 nhân tiết kiệm điện) mang đến hiệu suất nhanh hơn tới 70% so với M1, cho khả năng xử lý mượt mà mọi tác vụ từ cơ bản đến khắt khe nhất như chỉnh sửa hình ảnh, dựng video độ phân giải cao,... Không những có thời gian phản hồi nhanh mà còn tối ưu tiết kiệm được đáng kể điện năng. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083928.jpg" alt=" " />
<br>Bên cạnh đó M1 Pro còn được tích hợp lên đến 16 lõi GPU để nâng cao khả năng đồ họa, xử lý hình ảnh chuyên nghiệp, cho mình thỏa sức sáng tạo nội dung, sử dụng mướt các thao tác như render video, dựng hình 3D,... trên các phần mềm thiết kế Photoshop, AI, Premiere,... phát trực tiếp cũng tuyệt vời không kém với độ nét cao lên đến 8K. Mình chỉ mất khoảng 45 giây để xuất một đoạn video ngắn đăng tải lên Tik Tok.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083942.jpg" alt=" " />			
<br>Bộ nhớ RAM 16 GB cho khả năng đa nhiệm cao, mình có thể mở cùng lúc nhiều cửa sổ hay các ứng dụng Adobe khác nhau, dễ dàng di chuyển qua lại mà không hề gặp tình trạng đứng máy hay giật màn hình, cũng như thoải mái bật nhiều layer cùng lúc mà máy vẫn chạy ổn định với hiệu năng cao.<br>
<br>Ổ cứng SSD 512 GB trên MacBook thì có tốc độ truy xuất dữ liệu vượt trội rồi, thời gian khởi động máy hoặc mở các phần mềm nặng chỉ trong vài giây, không gian đủ rộng cho phép mình lưu trữ các tài liệu trong công việc, hình ảnh,... một cách thuận tiện. <br>
<br>Màn hình MacBook Pro 16” có các cạnh viền rất mỏng chỉ 3,5mm đồng thời được làm bo tròn ở hai góc trên và có phần notch “tai thỏ” – vị trí chứa camera FaceTime của máy (1080p).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-13-768x512.webp" alt=" " />							
<h2>Hiệu năng mạnh mẽ từ M1 Pro và M1 Max</h2>
<br>M1 Pro và M1 Max là hai SoC rất mạnh mà Apple trang bị trên MacBook Pro – M1 Pro và M1 Max có 10 nhân CPU bao gồm 8 nhân mạnh và 2 nhân tiết kiệm, riêng M1 Max có tuỳ chọn lên đến 32 nhân GPU cho hiệu năng GPU mạnh hơn gấp 4 so với thông thường và băng thông bộ nhớ với tốc độ 4000GB/s – tức nhanh hơn 2 lần so với M1 Pro và 6 lần so với M1, tuỳ chọn bộ nhớ Unified Memory lên đến 64GB (có thể hiểu là RAM).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-15-768x512.webp" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />
<h2>Thiết kế hiện đại, thời thượng</h2>
<br>Laptop vẫn sở hữu lớp vỏ kim loại nguyên khối nhưng tổng thể thiết kế trông phẳng hơn, có cùng kích thước và chỉ dày hơn một chút so với mẫu Pro 16 inch chạy bộ vi xử lý Intel. Máy có khối lượng 2.1 kg và dày 16.8 mm sẽ hơi khó khăn một chút khi cầm bằng một tay và nặng so với các bạn nữ nhưng vẫn có thể bỏ vào cặp xách hay balo để di chuyển bất cứ nơi đâu.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083931.jpg" alt=" " /><br>
<br>Thay đổi lớn nhất nằm ở màn hình mặt trước với viền mỏng ở các cạnh, bên trên có sự xuất hiện của chiếc notch tai thỏ mới. Trên thực tế macOS sẽ đưa thanh menu lên trên hai bên của phần notch, cho mình một không gian lớn hơn để làm việc. Nhưng vẫn chưa được tối ưu tốt nhất cho quá trình sử dụng, chiếc notch sẽ bị che đi bởi một dải đen khi mình mở ứng dụng toàn màn hình và chỉ hiển thị trở lại ở dạng cửa sổ.<br>
<br>Bên dưới màn hình cũng không còn logo "MacBook Pro" mang tính biểu tượng nữa, thay vào đó Apple đã đưa logo xuống dưới đáy máy. Thêm một chi tiết thiết kế nữa đã được loại bỏ chính là thanh Touch Bar, thay thế bằng một hàng 12 phím chức năng hữu ích hơn rất nhiều, Touch Bar trên thế hệ MacBook cũ cho mình trải nghiệm không thực sự ấn tượng, thường bị lỗi và mình cũng ít khi sử dụng đến, một công cụ có thể nói là "vô nghĩa" dành cho dân chuyên.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083945.jpg" alt=" " /><br>
<br>Magic Keyboard được thiết kế mới và loại bỏ được các khuyết điểm so với thế hệ trước khi có độ nảy cao với cơ chế cắt kéo, hành trình phím phù hợp, khoảng cách rộng rãi cộng thêm chiếu nghỉ tay kích thước lớn cho mình trải nghiệm gõ phím tốt với tốc độ nhanh, êm và chính xác. Bàn phím còn được trang bị thêm đèn nền có thể thay đổi mức độ sáng dựa theo ánh sáng của môi trường xung quanh, cho phép mình làm việc trong những điều kiện ánh sáng tối khác nhau.<br>
<br>Cảm biến Touch ID được tích hợp ở phím nguồn giúp mình mở khóa hay truy cập vào các ứng dụng có bảo mật nhanh chóng chỉ với một cái chạm nhẹ. Bàn di chuột Force Touch có kích thước rất lớn, cảm giác di vuốt mượt mà, thậm chí mình còn không cần đến chuột khi sử dụng, chỉ những khi cần chỉnh sửa nhiều chi tiết trong Photoshop mới cần dùng đến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083956.jpg" alt=" " /><br>
<br>MacBook Pro 16 M1 Pro 2021 xứng danh một chiếc laptop cao cấp - sang trọng khi sở hữu những thông số cấu hình hết sức hoàn hảo, chinh phục được mọi tác vụ từ đơn giản đến phức tạp, một sự lựa chọn lý tưởng dành cho các dân chuyên trong lĩnh vực sáng tạo.<br>',N'Bạc','1TB');


INSERT INTO PRODUCT VALUES (39,'MacBook Pro 16 inch M1 Pro 2021', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Hiệu năng vượt trội, chinh phục mọi tác vụ</h2>
<br>MacBook Pro 16 inch sở hữu sức mạnh từ bộ vi xử lý M1 Pro tiên tiến được trang bị 10 nhân CPU (8 nhân hiệu suất cao + 2 nhân tiết kiệm điện) mang đến hiệu suất nhanh hơn tới 70% so với M1, cho khả năng xử lý mượt mà mọi tác vụ từ cơ bản đến khắt khe nhất như chỉnh sửa hình ảnh, dựng video độ phân giải cao,... Không những có thời gian phản hồi nhanh mà còn tối ưu tiết kiệm được đáng kể điện năng. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083928.jpg" alt=" " />
<br>Bên cạnh đó M1 Pro còn được tích hợp lên đến 16 lõi GPU để nâng cao khả năng đồ họa, xử lý hình ảnh chuyên nghiệp, cho mình thỏa sức sáng tạo nội dung, sử dụng mướt các thao tác như render video, dựng hình 3D,... trên các phần mềm thiết kế Photoshop, AI, Premiere,... phát trực tiếp cũng tuyệt vời không kém với độ nét cao lên đến 8K. Mình chỉ mất khoảng 45 giây để xuất một đoạn video ngắn đăng tải lên Tik Tok.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083942.jpg" alt=" " />			
<br>Bộ nhớ RAM 16 GB cho khả năng đa nhiệm cao, mình có thể mở cùng lúc nhiều cửa sổ hay các ứng dụng Adobe khác nhau, dễ dàng di chuyển qua lại mà không hề gặp tình trạng đứng máy hay giật màn hình, cũng như thoải mái bật nhiều layer cùng lúc mà máy vẫn chạy ổn định với hiệu năng cao.<br>
<br>Ổ cứng SSD 512 GB trên MacBook thì có tốc độ truy xuất dữ liệu vượt trội rồi, thời gian khởi động máy hoặc mở các phần mềm nặng chỉ trong vài giây, không gian đủ rộng cho phép mình lưu trữ các tài liệu trong công việc, hình ảnh,... một cách thuận tiện. <br>
<br>Màn hình MacBook Pro 16” có các cạnh viền rất mỏng chỉ 3,5mm đồng thời được làm bo tròn ở hai góc trên và có phần notch “tai thỏ” – vị trí chứa camera FaceTime của máy (1080p).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-13-768x512.webp" alt=" " />							
<h2>Hiệu năng mạnh mẽ từ M1 Pro và M1 Max</h2>
<br>M1 Pro và M1 Max là hai SoC rất mạnh mà Apple trang bị trên MacBook Pro – M1 Pro và M1 Max có 10 nhân CPU bao gồm 8 nhân mạnh và 2 nhân tiết kiệm, riêng M1 Max có tuỳ chọn lên đến 32 nhân GPU cho hiệu năng GPU mạnh hơn gấp 4 so với thông thường và băng thông bộ nhớ với tốc độ 4000GB/s – tức nhanh hơn 2 lần so với M1 Pro và 6 lần so với M1, tuỳ chọn bộ nhớ Unified Memory lên đến 64GB (có thể hiểu là RAM).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-15-768x512.webp" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />
<h2>Thiết kế hiện đại, thời thượng</h2>
<br>Laptop vẫn sở hữu lớp vỏ kim loại nguyên khối nhưng tổng thể thiết kế trông phẳng hơn, có cùng kích thước và chỉ dày hơn một chút so với mẫu Pro 16 inch chạy bộ vi xử lý Intel. Máy có khối lượng 2.1 kg và dày 16.8 mm sẽ hơi khó khăn một chút khi cầm bằng một tay và nặng so với các bạn nữ nhưng vẫn có thể bỏ vào cặp xách hay balo để di chuyển bất cứ nơi đâu.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083931.jpg" alt=" " /><br>
<br>Thay đổi lớn nhất nằm ở màn hình mặt trước với viền mỏng ở các cạnh, bên trên có sự xuất hiện của chiếc notch tai thỏ mới. Trên thực tế macOS sẽ đưa thanh menu lên trên hai bên của phần notch, cho mình một không gian lớn hơn để làm việc. Nhưng vẫn chưa được tối ưu tốt nhất cho quá trình sử dụng, chiếc notch sẽ bị che đi bởi một dải đen khi mình mở ứng dụng toàn màn hình và chỉ hiển thị trở lại ở dạng cửa sổ.<br>
<br>Bên dưới màn hình cũng không còn logo "MacBook Pro" mang tính biểu tượng nữa, thay vào đó Apple đã đưa logo xuống dưới đáy máy. Thêm một chi tiết thiết kế nữa đã được loại bỏ chính là thanh Touch Bar, thay thế bằng một hàng 12 phím chức năng hữu ích hơn rất nhiều, Touch Bar trên thế hệ MacBook cũ cho mình trải nghiệm không thực sự ấn tượng, thường bị lỗi và mình cũng ít khi sử dụng đến, một công cụ có thể nói là "vô nghĩa" dành cho dân chuyên.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083945.jpg" alt=" " /><br>
<br>Magic Keyboard được thiết kế mới và loại bỏ được các khuyết điểm so với thế hệ trước khi có độ nảy cao với cơ chế cắt kéo, hành trình phím phù hợp, khoảng cách rộng rãi cộng thêm chiếu nghỉ tay kích thước lớn cho mình trải nghiệm gõ phím tốt với tốc độ nhanh, êm và chính xác. Bàn phím còn được trang bị thêm đèn nền có thể thay đổi mức độ sáng dựa theo ánh sáng của môi trường xung quanh, cho phép mình làm việc trong những điều kiện ánh sáng tối khác nhau.<br>
<br>Cảm biến Touch ID được tích hợp ở phím nguồn giúp mình mở khóa hay truy cập vào các ứng dụng có bảo mật nhanh chóng chỉ với một cái chạm nhẹ. Bàn di chuột Force Touch có kích thước rất lớn, cảm giác di vuốt mượt mà, thậm chí mình còn không cần đến chuột khi sử dụng, chỉ những khi cần chỉnh sửa nhiều chi tiết trong Photoshop mới cần dùng đến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083956.jpg" alt=" " /><br>
<br>MacBook Pro 16 M1 Pro 2021 xứng danh một chiếc laptop cao cấp - sang trọng khi sở hữu những thông số cấu hình hết sức hoàn hảo, chinh phục được mọi tác vụ từ đơn giản đến phức tạp, một sự lựa chọn lý tưởng dành cho các dân chuyên trong lĩnh vực sáng tạo.<br>',N'Xám','512GB');


INSERT INTO PRODUCT VALUES (40,'MacBook Pro 16 inch M1 Pro 2021', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Hiệu năng vượt trội, chinh phục mọi tác vụ</h2>
<br>MacBook Pro 16 inch sở hữu sức mạnh từ bộ vi xử lý M1 Pro tiên tiến được trang bị 10 nhân CPU (8 nhân hiệu suất cao + 2 nhân tiết kiệm điện) mang đến hiệu suất nhanh hơn tới 70% so với M1, cho khả năng xử lý mượt mà mọi tác vụ từ cơ bản đến khắt khe nhất như chỉnh sửa hình ảnh, dựng video độ phân giải cao,... Không những có thời gian phản hồi nhanh mà còn tối ưu tiết kiệm được đáng kể điện năng. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083928.jpg" alt=" " />
<br>Bên cạnh đó M1 Pro còn được tích hợp lên đến 16 lõi GPU để nâng cao khả năng đồ họa, xử lý hình ảnh chuyên nghiệp, cho mình thỏa sức sáng tạo nội dung, sử dụng mướt các thao tác như render video, dựng hình 3D,... trên các phần mềm thiết kế Photoshop, AI, Premiere,... phát trực tiếp cũng tuyệt vời không kém với độ nét cao lên đến 8K. Mình chỉ mất khoảng 45 giây để xuất một đoạn video ngắn đăng tải lên Tik Tok.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083942.jpg" alt=" " />			
<br>Bộ nhớ RAM 16 GB cho khả năng đa nhiệm cao, mình có thể mở cùng lúc nhiều cửa sổ hay các ứng dụng Adobe khác nhau, dễ dàng di chuyển qua lại mà không hề gặp tình trạng đứng máy hay giật màn hình, cũng như thoải mái bật nhiều layer cùng lúc mà máy vẫn chạy ổn định với hiệu năng cao.<br>
<br>Ổ cứng SSD 512 GB trên MacBook thì có tốc độ truy xuất dữ liệu vượt trội rồi, thời gian khởi động máy hoặc mở các phần mềm nặng chỉ trong vài giây, không gian đủ rộng cho phép mình lưu trữ các tài liệu trong công việc, hình ảnh,... một cách thuận tiện. <br>
<br>Màn hình MacBook Pro 16” có các cạnh viền rất mỏng chỉ 3,5mm đồng thời được làm bo tròn ở hai góc trên và có phần notch “tai thỏ” – vị trí chứa camera FaceTime của máy (1080p).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-13-768x512.webp" alt=" " />							
<h2>Hiệu năng mạnh mẽ từ M1 Pro và M1 Max</h2>
<br>M1 Pro và M1 Max là hai SoC rất mạnh mà Apple trang bị trên MacBook Pro – M1 Pro và M1 Max có 10 nhân CPU bao gồm 8 nhân mạnh và 2 nhân tiết kiệm, riêng M1 Max có tuỳ chọn lên đến 32 nhân GPU cho hiệu năng GPU mạnh hơn gấp 4 so với thông thường và băng thông bộ nhớ với tốc độ 4000GB/s – tức nhanh hơn 2 lần so với M1 Pro và 6 lần so với M1, tuỳ chọn bộ nhớ Unified Memory lên đến 64GB (có thể hiểu là RAM).<br>
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-15-768x512.webp" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />
<h2>Thiết kế hiện đại, thời thượng</h2>
<br>Laptop vẫn sở hữu lớp vỏ kim loại nguyên khối nhưng tổng thể thiết kế trông phẳng hơn, có cùng kích thước và chỉ dày hơn một chút so với mẫu Pro 16 inch chạy bộ vi xử lý Intel. Máy có khối lượng 2.1 kg và dày 16.8 mm sẽ hơi khó khăn một chút khi cầm bằng một tay và nặng so với các bạn nữ nhưng vẫn có thể bỏ vào cặp xách hay balo để di chuyển bất cứ nơi đâu.<br>							
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083931.jpg" alt=" " /><br>
<br>Thay đổi lớn nhất nằm ở màn hình mặt trước với viền mỏng ở các cạnh, bên trên có sự xuất hiện của chiếc notch tai thỏ mới. Trên thực tế macOS sẽ đưa thanh menu lên trên hai bên của phần notch, cho mình một không gian lớn hơn để làm việc. Nhưng vẫn chưa được tối ưu tốt nhất cho quá trình sử dụng, chiếc notch sẽ bị che đi bởi một dải đen khi mình mở ứng dụng toàn màn hình và chỉ hiển thị trở lại ở dạng cửa sổ.<br>
<br>Bên dưới màn hình cũng không còn logo "MacBook Pro" mang tính biểu tượng nữa, thay vào đó Apple đã đưa logo xuống dưới đáy máy. Thêm một chi tiết thiết kế nữa đã được loại bỏ chính là thanh Touch Bar, thay thế bằng một hàng 12 phím chức năng hữu ích hơn rất nhiều, Touch Bar trên thế hệ MacBook cũ cho mình trải nghiệm không thực sự ấn tượng, thường bị lỗi và mình cũng ít khi sử dụng đến, một công cụ có thể nói là "vô nghĩa" dành cho dân chuyên.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083945.jpg" alt=" " /><br>
<br>Magic Keyboard được thiết kế mới và loại bỏ được các khuyết điểm so với thế hệ trước khi có độ nảy cao với cơ chế cắt kéo, hành trình phím phù hợp, khoảng cách rộng rãi cộng thêm chiếu nghỉ tay kích thước lớn cho mình trải nghiệm gõ phím tốt với tốc độ nhanh, êm và chính xác. Bàn phím còn được trang bị thêm đèn nền có thể thay đổi mức độ sáng dựa theo ánh sáng của môi trường xung quanh, cho phép mình làm việc trong những điều kiện ánh sáng tối khác nhau.<br>
<br>Cảm biến Touch ID được tích hợp ở phím nguồn giúp mình mở khóa hay truy cập vào các ứng dụng có bảo mật nhanh chóng chỉ với một cái chạm nhẹ. Bàn di chuột Force Touch có kích thước rất lớn, cảm giác di vuốt mượt mà, thậm chí mình còn không cần đến chuột khi sử dụng, chỉ những khi cần chỉnh sửa nhiều chi tiết trong Photoshop mới cần dùng đến.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/44/253636/apple-pro-16-m1-pro-2021-10-core-cpu-061222-083956.jpg" alt=" " /><br>
<br>MacBook Pro 16 M1 Pro 2021 xứng danh một chiếc laptop cao cấp - sang trọng khi sở hữu những thông số cấu hình hết sức hoàn hảo, chinh phục được mọi tác vụ từ đơn giản đến phức tạp, một sự lựa chọn lý tưởng dành cho các dân chuyên trong lĩnh vực sáng tạo.<br>',N'Xám','1TB');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'CPU','Apple M1 Pro200GB/s');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'RAM','16GB inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Màn hình','16.2"Liquid Retina XDR display (3456 x 2234)120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Card màn hình','Card tích hợp16 nhân GPU');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Cổng kết nối','HDMI3 x Thunderbolt 4 USB-CJack tai nghe 3.5 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Pin','100Wh lithium-polymer battery');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Công nghệ màn hình','ProMotion <br> Wide color (P3)<br> True Tone Technology <br> 1 tỷ màu');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Công nghệ âm thanh','Wide stereo sound <br> Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,37,N'Webcam','1080p FaceTime HD camera');


INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'CPU','Apple M1 Pro200GB/s');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'RAM','16GB inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Màn hình','16.2"Liquid Retina XDR display (3456 x 2234)120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Card màn hình','Card tích hợp16 nhân GPU');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Cổng kết nối','HDMI3 x Thunderbolt 4 USB-CJack tai nghe 3.5 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Pin','100Wh lithium-polymer battery');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Công nghệ màn hình','ProMotion <br> Wide color (P3)<br> True Tone Technology <br> 1 tỷ màu');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Công nghệ âm thanh','Wide stereo sound <br> Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,38,N'Webcam','1080p FaceTime HD camera');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'CPU','Apple M1 Pro200GB/s');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'RAM','16GB inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Màn hình','16.2"Liquid Retina XDR display (3456 x 2234)120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Card màn hình','Card tích hợp16 nhân GPU');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Cổng kết nối','HDMI3 x Thunderbolt 4 USB-CJack tai nghe 3.5 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Pin','100Wh lithium-polymer battery');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Công nghệ màn hình','ProMotion <br> Wide color (P3)<br> True Tone Technology <br> 1 tỷ màu');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Công nghệ âm thanh','Wide stereo sound <br> Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,39,N'Webcam','1080p FaceTime HD camera');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'CPU','Apple M1 Pro200GB/s');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'RAM','16GB inch');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Màn hình','16.2"Liquid Retina XDR display (3456 x 2234)120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Card màn hình','Card tích hợp16 nhân GPU');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Cổng kết nối','HDMI3 x Thunderbolt 4 USB-CJack tai nghe 3.5 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Pin','100Wh lithium-polymer battery');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Công nghệ màn hình','ProMotion <br> Wide color (P3)<br> True Tone Technology <br> 1 tỷ màu');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Công nghệ âm thanh','Wide stereo sound <br> Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,40,N'Webcam','1080p FaceTime HD camera');




INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://goka.vn/wp-content/uploads/2022/09/macbook-pro-m1-2021-silver-161-1024x1024.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 16 inch M1 Pro 2021';


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://goka.vn/wp-content/uploads/2022/09/macbook-pro-m1-2021-silver-16-1024x1024.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 16 inch M1 Pro 2021';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://goka.vn/wp-content/uploads/2022/09/macbook-pro-m1-2021-silver-2-1-1024x786.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 16 inch M1 Pro 2021';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://goka.vn/wp-content/uploads/2022/09/macbook-pro-m1-2021-silver-2-1-1024x786.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 16 inch M1 Pro 2021';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://goka.vn/wp-content/uploads/2022/09/macbook-pro-m1-2021-space-gray-16-1024x1024.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 16 inch M1 Pro 2021';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://goka.vn/wp-content/uploads/2022/09/macbook-pro-m1-2021-space-gray-2-1-1024x786.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 16 inch M1 Pro 2021';

UPDATE PRODUCT SET price = 20000000 WHERE name LIKE 'Iphone 13 Pro Max';

UPDATE PRODUCT SET price = 25000000 WHERE storage LIKE '256GB';

UPDATE PRODUCT SET price = 30000000 WHERE storage LIKE '512GB';

UPDATE PRODUCT SET price = 26000000 WHERE name LIKE 'Iphone 14 Pro Max';


UPDATE PRODUCT_SYSTEM SET value = '256 GB' WHERE name LIKE N'HDD/SSD' AND id_product in (SELECT id FROM PRODUCT WHERE storage LIKE '256GB');

UPDATE PRODUCT_SYSTEM SET value = '512 GB' WHERE name LIKE N'HDD/SSD' AND id_product in (SELECT id FROM PRODUCT WHERE storage LIKE '512GB');

UPDATE PRODUCT_SYSTEM SET VALUE = N'Iphone 13 Pro Max' WHERE VALUE = N'iPhone 13 Pro Max';

UPDATE PRODUCT SET IMAGE = 'https://macone.vn/wp-content/uploads/2021/10/macbook-pro-16-inch-2021-gray-1024x853.png' WHERE NAME LIKE 'MacBook Pro 16 inch M1 Pro 2021' AND COLOR LIKE N'Xám'; 

UPDATE PRODUCT SET IMAGE = 'https://macone.vn/wp-content/uploads/2021/10/macbook-pro-16-inch-2021-silver.png' WHERE NAME LIKE 'MacBook Pro 16 inch M1 Pro 2021' AND COLOR LIKE N'Bạc'; 



--SAMSUNG GALAXY S23 ULTRA

INSERT INTO PRODUCT VALUES (41,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-den_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'Black','256B');


INSERT INTO PRODUCT VALUES (42,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-den_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'Black','512GB');

INSERT INTO PRODUCT VALUES (43,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-den_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'Black','1TB');



INSERT INTO PRODUCT VALUES (44,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-kem_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'White','256GB');


INSERT INTO PRODUCT VALUES (45,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-kem_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'White','512GB');


INSERT INTO PRODUCT VALUES (46,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-kem_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'White','1TB');



INSERT INTO PRODUCT VALUES (47,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-xanh_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'Green','256GB');


INSERT INTO PRODUCT VALUES (48,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-xanh_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'Green','512GB');

INSERT INTO PRODUCT VALUES (49,'Samsung Galaxy S23 Ultra', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/s/2/s23-ultra-xanh_1.png',10,26990000,'2023-05-29','Samsung',N'
<h2>Samsung Galaxy S23 Ultra: Sự lựa chọn mang tính hoàn hảo</h2>
Galaxy S23 Ultra 256GB là phiên bản bộ nhớ thấp nhất trong số 3 sự lựa chọn cấu hình ROM mà Samsung ra mắt trong năm nay. Vì sao lại gọi phiên bản này lại là sự lựa chọn hoàn hảo? Cùng mình khám phá nhé!<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke.jpg" alt=" " />
<h2>Thiết kế tinh chỉnh về cảm giác cầm nắm</h2>
<br>Khác với hai phiên bản tiêu chuẩn, Samsung S23 Ultra 256GB không có nhiều khác biệt về ngoại hình. Máy vẫn sẽ đi theo thiết kế của phiên bản trước với kích thước lớn và kiểu dáng vuông vức, góc cạnh. Phần mặt lưng của máy được làm từ chất liệu kính nhám. Với chất liệu này, mặt lưng máy có thể tạo ra các hiệu ứng ánh sáng đẹp mắt nhưng không làm mất đi tính sang trọng vốn có.<br>
<br>Samsung Galaxy S23 Ultra 256GB tiếp tục đi theo phong cách tối giản khi đặt trực tiếp các ống kính lên mặt lưng máy. Sau sự thành công của phiên bản Galaxy S22 Ultra, thiết kế này nhận được rất nhiều lời khen từ phía người dùng. Phần đông đều công nhận rằng ngoại hình này giúp chiếc smartphone tuy có kích thước lớn song vẫn rất tinh tế và đẳng cấp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-cau-hinh.jpg" alt=" " />
<br>Vì được giữ nguyên hình dáng của người tiền nhiệm nên vị trí các nút bấm không có sự thay đổi. Chúng ta sẽ có nút âm lượng và nút nguồn ở phía bên cạnh phải của máy. Phần cạnh dưới sẽ là nơi Samsung đặt khe cắm thẻ nhớ, cổng sạc Type-C, loa và cả khe cắm bút S-Pen. Năm nay, bút S-Pen cũng sẽ không thay đổi so với phiên bản trên Galaxy S22 Ultra: Đầu và thân làm từ nhựa nhám, trong khi đuôi bút được làm đồng màu với máy.<br>
<br>Hai điểm thay đổi duy nhất về thiết kế của Samsung S23 Ultra 256GB nằm ở phần khung máy và bảng màu. Về phía khung máy, chi tiết này trên sản phẩm được vạt phẳng đôi chút so với mẫu điện thoại tiền nhiệm. Điều này giúp máy trở nên vuông vức và sang trọng hơn, đồng thời không mang lại cảm giác cấn tay cho người dùng khi sử dụng. Ý tưởng cho sự thay đổi này được đồn đoán là bắt nguồn từ Galaxy Z Fold 4.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-thiet-ke.jpg" alt=" " /><br>
<br>Năm ngoái, Galaxy S22 Ultra có tất cả 7 phiên bản màu. Nhưng năm nay, số lượng màu sắc của Samsung S23 Ultra 256GB được tinh giản còn lại 4 sự lựa chọn là: Phantom Black, Botanic Green, Cotton Flower và Mystic Lilac. Sự tinh giản này là nhằm giúp người dùng dễ đưa ra quyết định hơn khi chọn lựa phiên bản sản phẩm.<br>
<h2>Màn hình vẫn luôn xuất sắc như thường lệ</h2>
<br>Sẽ là không sai khi nói Samsung đã giữ nguyên các thông số màn hình trên Samsung Galaxy S23 Ultra 256GB. Điều này là hoàn toàn dễ hiểu bởi những công nghệ hiển thị này đều đang là tiên tiến nhất hiện nay. Thiết bị vẫn sẽ duy trì màn hình kích thước 6.8 inch, được thiết kế tràn viền và sở hữu camera dạng đục lỗ. Cho đến nay, đây vẫn là thiết kế tối ưu nhất dành cho màn hình.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-man-hinh.jpg" alt=" " /><br>
<br>Tấm nền Dynamic AMOLED 2X vẫn sẽ tiếp tục được Samsung sử dụng cho dòng điện thoại Galaxy S cao cấp nhất của mình. Nguyên nhân là bởi đây là một tấm nền đặc biệt do chính hãng công nghệ Hàn Quốc chế tạo.<br>
<br>Ưu điểm lớn nhất của tấm nền này là giữ được độ sắc nét của hình ảnh ngay cả khi tần số quét màn hình đạt 120Hz. Kết hợp với độ phân giải hình ảnh lên đến 2K+, Galaxy S23 Ultra chắc chắn sẽ đem đến cho người dùng một trải nghiệm hình ảnh vô cùng mượt mà và sống động.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-cam-bien.jpg" alt=" " /><br>
<br>Một nâng cấp màn hình đáng chú ý khác đó là chiếc điện thoại sẽ sử dụng công nghệ bảo mật mới bằng sóng siêu thanh, có thể quét cùng lúc hai dấu vân tay ở mọi vị trí trên màn hình. Điều này không chỉ mang lại sự tiện lợi mà còn tăng cường tính bảo mật. Theo ước tính của Samsung, phương thức vân tay mới này có độ bảo mật cao hơn đến 10,000 lần so với công nghệ cũ năm ngoái.<br>
<h2>Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 2 bản đặc biệt</h2>
<br>Năm ngoái, Galaxy S22 Ultra đã phải sử dụng một phiên bản chip bị hạn chế hiệu năng để đảm bảo nhiệt độ. Tuy nhiên, mọi thứ đã thay đổi 180 độ trên Samsung S23 Ultra 256GB. Cụ thể, chiếc điện thoại được trang bị hẳn một phiên bản ép xung của con chip Snapdragon 8 Gen 2. Điều này đồng nghĩa với việc bộ vi xử lý mới này sẽ có tốc độ xử lý tác vụ nhanh hơn cả phiên bản được Qualcomm cho ra mắt trước đó.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/galaxy-s23-ultra-256gb-choi-game.jpg" alt=" " /><br>
<br>Không chỉ mạnh mẽ trong hiệu năng, Snapdragon 8 Gen 2 còn được chú ý bởi khả năng kiểm soát nhiệt tốt và có công suất tiêu thụ điện năng cao. Đây là lý do mà Galaxy S23 Ultra sẽ có thời gian sử dụng dài hơn, dù vẫn giữ nguyên mức pin 5000mAh.<br>
<br>Phiên bản Samsung Galaxy S23 Ultra 256GB sẽ được đi kèm với mức RAM 8GB. Điều này cho phép máy có khả năng đa nhiệm tốt và không gian lưu trữ rộng lớn.<br>
<br>Ở thời điểm hiện tại, mức ROM 256GB được chuyên gia đánh giá là hoàn hảo đối với người dùng thông thường. Bởi với mức dung lượng này, bạn sẽ thoải mái lưu trữ hình ảnh, game, video mà không cần quá bận tâm đến bộ nhớ. Nhưng đồng thời cũng sẽ không bị quá dư thừa như bản 512GB hay 1TB.<br>
<h2>Máy ảnh là nâng cấp quan trọng nhất</h2>
<br>Điểm đáng chú ý nhất trên Galaxy S23 Ultra 256GB chính là ống kính trước 200MP. Để có thể làm chủ được thông số này, Samsung đã phải trang bị cho flagship mới của mình những công nghệ xử lý hình ảnh tân tiến nhất. Theo như những thông tin được chia sẻ, hệ thống AI của máy sẽ nâng cấp khả năng xử lý hình ảnh, đặc biệt là ảnh chụp đêm. Đây có lẽ là điều được các Samfan mong đợi.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/samsung-galaxy-s23-ultra-256gb-chup-anh.jpg" alt=" " /><br>
<br>Ngoài ống kính chính, 3 ống kính phụ của máy gồm ống kính tele 3X 12MP, ống kính tele 10X 12MP và ống kính góc siêu rộng 12MP đều sẽ được trang bị cảm biến mới. Điều này hứa hẹn về một công nghệ zoom 100x hoàn hảo hơn so với phiên bản 2022. Tương tự, camera selfie của máy vẫn sẽ được giữ nguyên ở độ phân giải 40MP nhưng đi kèm nhiều công nghệ mới.<br>
<br>Sau cùng, Samsung đã nâng cấp khả năng quay phim 8K trên cả 3 phiên bản Galaxy S23 series. Cụ thể, tốc độ màn hình của chuẩn video được tăng từ 24fps lên thành 30fps. Điều này sẽ giúp độ mượt của các video 8K được tăng lên đáng kể, đồng thời giúp Samsung S23 Ultra 256GB tiệm cận việc trở thành một chiếc máy quay phim chuyên nghiệp.<br>
<br><img width = "100%" src="https://cdn.xtmobile.vn/vnt_upload/news/01_2023/11/Galaxy-S23-Ultra-256-gb-thiet-ke-camera.jpg" alt=" " /><br>
<br>Có thể thấy, Samsung Galaxy S23 Ultra 256GB thật sự là một chiếc máy cân bằng ở mọi khía cạnh, nếu không muốn nói là hoàn hảo. Và nếu bạn đang có dự định sở hữu sự hoàn hảo này, ghé ngay hệ thống cửa hàng FPTShop. Một mức giá ưu đãi nhất thị trường cùng nhiều quà tặng hấp dẫn khác đang chờ đợi bạn đấy!<br>',N'Green','1TB');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,41,N'Pin','5000 mAh');


INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,42,N'Pin','5000 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,43,N'Pin','5000 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,44,N'Pin','5000 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,45,N'Pin','5000 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,46,N'Pin','5000 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,47,N'Pin','5000 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,48,N'Pin','5000 mAh');


INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Trọng lượng','234 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Kích thước màn hình','6.8 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Công nghệ màn hình','Dynamic AMOLED 2X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Độ phân giải','1440 x 3088 pixels (QHD+)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Hệ điều hành','Android');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Tương thích','Bút S-Pen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Chất liệu mặt lưng','Kính');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Chất liệu khung viền','Nhôm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Kích thước','163.4 x 78.1 x 8.9 mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Model','Samsung Galaxy S23 Ultra');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'CPU Brand','Qualcomm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'CPU Series','Snapdragon 8 Gen 2 (4 nm)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Tần số quét','120Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Dung lượng RAM','8 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Kết nối','USB Type-C');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Camera sau','Camera siêu rộng: 12MP F2.2 (Dual Pixel AF) <br> Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)<br>Tele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS<br>Tele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Camera trước','12MP F2.2 (Dual Pixel AF)');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,49,N'Pin','5000 mAh');

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-s23-ultra/buy/kv_group_PC_v2.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy S23 Ultra';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://imgs.viettelstore.vn/Images/Product/ProductImage/dien-thoai/Samsung/1.%20Nam%202023/Galaxy%20S23%20Ultra/NewFolder/Galaxy-S23-Ultra-6.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy S23 Ultra';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://imgs.viettelstore.vn/Images/Product/ProductImage/dien-thoai/Samsung/1.%20Nam%202023/Galaxy%20S23%20Ultra/Galaxy-S23-Ultra-6.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy S23 Ultra';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://imgs.viettelstore.vn/Images/Product/ProductImage/dien-thoai/Samsung/1.%20Nam%202023/Galaxy%20S23%20Ultra/Galaxy-S23-Ultra-9.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy S23 Ultra';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-s23-ultra/images/galaxy-s23-ultra-highlights-online-exclusive-colors.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy S23 Ultra';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.samsung.com/vn/smartphones/galaxy-s23-ultra/images/galaxy-s23-ultra-highlights-spen.jpg', ID
FROM PRODUCT
WHERE name = 'Samsung Galaxy S23 Ultra';


UPDATE PRODUCT SET STORAGE = '256GB' WHERE STORAGE = '256B'

-- IPHONE 14

INSERT INTO PRODUCT VALUES (50,'Iphone 14', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-57_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Black','128GB');

INSERT INTO PRODUCT VALUES (51,'Iphone 14', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-57_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Black','256GB');

INSERT INTO PRODUCT VALUES (52,'Iphone 14', 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-57_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Black','512GB');

INSERT INTO PRODUCT VALUES (53,'Iphone 14', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-56_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Purple','128GB');

INSERT INTO PRODUCT VALUES (54,'Iphone 14', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-56_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Purple','256GB');

INSERT INTO PRODUCT VALUES (55,'Iphone 14', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-56_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Purple','512GB');

INSERT INTO PRODUCT VALUES (56,'Iphone 14', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-56_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Red','128GB');

INSERT INTO PRODUCT VALUES (57,'Iphone 14', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-56_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Red','256GB');

INSERT INTO PRODUCT VALUES (58,'Iphone 14', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-56_2.jpg',10,18990000,'10-29-2022','Iphone',N'
<h2>Thiết kế sang trọng, màn hình 6.1 inch sắc nét, sống động</h2>
<br>Từ dòng iPhone 12 Series, Apple đã mang đến cho iPhone kiểu dáng thiết kế sang trọng từ những góc cạnh vuông vức. Năm nay, dòng iPhone 14 Series có thiết kế không thay đổi quá nhiều. Phần lưng máy phẳng, các cạnh vuông mang phong cách của những chiếc iPhone 5 đời đầu. Máy có trọng lượng chỉ khoảng 172g và độ dày 7.8mm, tạo cảm giác thoải mái khi cầm trên tay sử dụng. iPhone 14 chính hãng VN/A ánh lên vẻ đẹp hiện đại, sang trọng từ mọi góc nhìn.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/22_637983373143243781.jpg" alt=" " /><br>
<br>Phiên bản iPhone 14 chính hãng VN/A tiêu chuẩn sẽ vẫn có thiết kế màn hình tương tự như iPhone 13. Màn hình của iPhone 14 chính hãng VN/A có kích thước 6.1 inch, độ phân giải 2532 x 1170 pixels. Tấm nền OLED được tích hợp công nghệ Super Retina XDR quen thuộc sẽ mang đến chất lượng hiển thị hình ảnh sắc nét, màu sắc rực rỡ. iPhone 14 cũng được tích hợp các dải màu P3, HRD10, và độ sáng tối đa lên tới 1200 nits. Nhờ đó, người dùng có thể làm việc, giải trí với từng khung hình rõ nét và chân thực. Độ tương phản màn hình cao giúp các hình ảnh hiển thị tự nhiên nhất trong mọi điều kiện ánh sáng dù ở trong nhà hay ngoài trời.<br>
<h2>Hiệu năng đỉnh cao với chip A15 Bionic, thời lượng pin cải thiện</h2>
<br>Hàng năm, bốn phiên bản trong dòng iPhone mới sẽ sở hữu cùng một con chip. Tuy nhiên năm nay, iPhone 14 chính hãng VN/A được trang bị con chip A15 Bionic. Nếu bạn nghĩ rằng nó không khác gì với chip A15 Bionic trên iPhone 13 thì không phải đâu. Con chip này được nâng cấp với 5 nhân, nhờ đó nó nâng cai hiệu suất xử lý cho điện thoại. Đồng thời, khả năng xử lý đồ họa trên iPhone 14 cũng sẽ được cải thiện đáng kể. Đối với iPhone 14 chính hãng VN/A, máy sẽ có ba tùy chọn dung lượng bộ nhớ 128GB, 256GB và 512GB. Điện thoại chạy trên hệ điều hành iOS 16 mới nhất.
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/33_637983373143243781.png" alt=" " /><br>
<br>Không chỉ có hiệu năng được nâng cấp, thời lượng pin của iPhone 14 chính hãng VN/A cũng được cải thiện đáng kể. Đây chính là điểm cộng cho Apple khi chiếc iPhone 14 chính hãng VN/A có thể sử dụng tối đa lên tới 20 giờ khi phát video. Apple cũng trang bị cho máy khả năng sạc nhanh tối đa 20W, người dùng có thể sạc đầy 50% viên pin chỉ trong vòng 30 phút. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể yên tâm xử lý các công việc trong suốt một ngày dài. Nếu điện thoại hết pin, bạn cũng không cần phải chờ đợi quá lâu để có thể tiếp tục sử dụng. Chiếc điện thoại iPhone 14 chính hãng VN/A vô cùng tiện lợi và phù hợp để hỗ trợ người dùng mọi lúc mọi nơi.<br>
<h2>Nhiếp ảnh chuyên nghiệp với camera kép 12MP mới</h2>
<br>Năm ngoái, Apple lần đầu giới thiệu đến người dùng kiểu thiết kế cụm camera xếp chéo vô cùng độc đáo. Chiếc iPhone 14 chính hãng VN/A năm nay vẫn giữ lại phong cách thiết kế của người tiền nhiệm. Mô-đun camera vuông ở mặt sau chứa cụm camera kép độ phân giải 12MP, khẩu độ f/1.5 giúp ổn định hình ảnh quang học. Trong khi đó, ống kính góc rộng còn lại có khẩu độ f/2.4, giúp người dùng có thể chụp được những bức ảnh với không gian được mở rộng lên tới 120 độ. Mặc dù trông có vẻ không có gì thay đổi nhưng các cảm biến trên iPhone 14 chính hãng VN/A lớn hơn, cải thiện khả năng chụp thiếu sáng lên tới 49%.<br>
<br><img width = "100%" src="https://admin.hoanghamobile.com/Uploads/2022/09/09/44.jpg" alt=" " />
<br>Với cụm camera kép này, iPhone 14 chính hãng VN/A có thể cải thiện chất lượng chụp hình ở mọi chế độ: chụp chân dung, xóa phông, zoom quang học 2x, hay thậm chí là khả năng chụp đêm cũng nhanh hơn gấp 2 lần. Điện thoại cũng có khả năng quay video với độ chi tiết tốt, ổn định, chất lượng 4K, HD 1080P,..., giúp người dùng ghi lại mọi khoảnh khắc đáng nhớ trong cuộc sống. Với chiếc iPhone 14 chính hãng VN/A, bạn có thể thỏa sức sáng tạo chụp những bức ảnh ở đa chế độ, hiệu ứng phong phú. Mặt trước của điện thoại là camera selfie 12MP, giúp người dùng chụp những bức ảnh “tự sướng” hoặc tham gia vào những cuộc họp trực tuyến, cuộc gọi video với chất lượng tốt nhất.<br>',N'Red','512GB');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,50,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,51,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,52,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,53,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,54,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,55,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,56,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,57,N'Pin','3279 mAh');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Trọng lượng','172 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Độ phân giải','2532 x 1170 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Hệ điều hành','iOS 16');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Kích thước','146.7 x 71.5 x 7.80mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Model','iPhone 14');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Camera sau','Camera góc rộng: 12MP<br> Camera góc siêu rộng: 12MP');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Camera trước','12MP, ƒ/1.9');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,58,N'Pin','3279 mAh');

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images2.thanhnien.vn/Uploaded/trungnq/2022_08_12/3788-2723.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 14';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/17/638043046532800707_iphone-14-mau-sac.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 14';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://www.apple.com/v/iphone-14/i/images/key-features/features/size/dd_size_oled__d0gtxtf5002u_small.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 14';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/17/638043046531691673_iphone-14-thiet-ke.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 14';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/17/638043046532331325_iphone-14-camera.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 14';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/17/638043046534363140_iphone-14-pin.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 14';

UPDATE PRODUCT SET IMAGE = 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-54_2.jpg' WHERE COLOR LIKE 'Red' AND NAME LIKE 'Iphone 14';



-- MacBook Pro 14 inch M2 Pro 2023

INSERT INTO PRODUCT VALUES (59,'MacBook Pro 14 inch M2 Pro 2023', 'https://macone.vn/wp-content/uploads/2023/01/8.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Xám','16GB - 512GB');


INSERT INTO PRODUCT VALUES (60,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Xám','32GB - 512GB');

INSERT INTO PRODUCT VALUES (61,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Xám','16GB - 1TB');

INSERT INTO PRODUCT VALUES (62,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Xám','32GB - 1TB');

INSERT INTO PRODUCT VALUES (63,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Bạc','16GB - 512GB');


INSERT INTO PRODUCT VALUES (64,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Bạc','32GB - 512GB');

INSERT INTO PRODUCT VALUES (65,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Bạc','16GB - 1TB');

INSERT INTO PRODUCT VALUES (66,'MacBook Pro 14 inch M2 Pro 2023', 'https://cdn.tgdd.vn/Products/Images/44/253636/apple-macbook-pro-16-m1-pro-2021-1.jpg',20,40000000,'2023-05-29','MacBook',N'
<h2>Thiết kế sang trọng, kích thước mỏng nhẹ</h2>
<br>Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.<br>
<br>Có thể tại phiên bản này, thương hiệu Apple mang lại cho người dùng phiên bản màu đậm hơn như dòng Macbook Air. Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.<br>

<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-9.jpg" alt=" " /><br>
<br>Thiết bị sở hữu kích thước gọn nhẹ: W31.26 x H1.55 x D22.12 (cm) và trọng lượng chỉ 1.60kg. Nhờ vậy, người dùng dễ dàng mang đi khắp mọi nơi để phục vụ cho công việc, học tập.<br>
<h2>Màn hình sắc nét, hiển thị chân thật</h2>
<br>Macbook Pro 14 inch 2023 sở hữu cho mình thiết kế màn hình kích thước rộng 14 inch vô cùng thoải mái, viền vô cùng mỏng. Giúp cho người dùng được trải nghiệm phần nhìn được tốt hơn, người dùng có thể sử dụng nhiều tác vụ cùng một lúc, tăng hiệu suất công việc, học tập.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-6.jpg" alt=" " /><br>
<br>Hỗ trợ True Tone cùng dải màu P3 giúp cho hình ảnh hiển thị vô cùng sắc nét, các màu sắc sáng, tối được thể hiện chi tiết hơn. Độ phân giải 3.024 x 1.964 cùng độ sáng tối đa là 1.600 nit, giúp cho mắt của chúng ta không bị quá khó chịu.<br>
<h2>Hiệu năng mạnh mẽ nhờ chip M2 Pro</h2>
<br>Apple đã cho ra mắt bộ vi xử lý là M1 Max và M1 Pro vào năm 2021, và tháng 6 năm 2022, thương hiệu “Quả Táo Khuyết” đã tiếp tục giới thiệu Chip M2 Pro và M2 Max cùng với MacBook Air và MacBook Pro 13 inch.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-4.jpg" alt=" " /><br>
<br>Chip M2 Pro 8 nhân mang lại cho người dùng hiệu suất tăng vượt trội, với hiệu suất CPU tăng 15%, hiệu suất đồ họa tăng 35%. Giúp xử lý nhiều tác vụ cùng một lúc và xử lý các phần mềm đồ họa một các mượt mà, không gặp độ trễ phản hồi quá lớn.<br>
<h2>Hỗ trợ dung lượng bộ nhớ lớn</h2>
<br>Với phiên bản Macbook Pro 14 inch 2023 M2 Pro, ta có được bộ nhớ RAM lên đến 16GB, hỗ trợ cho việc lưu trữ và tăng tốc độ xử lý dữ liệu. Bộ nhớ này còn có thể hỗ trợ nâng cấp tối đa lên đến 32GB, đáp ứng tốt nhu cầu người dùng.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-3.jpg" alt=" " /><br>
<br>Với dung lượng ổ cứng SSD 512GB cho khả năng lưu trữ dữ liệu, ứng dụng được thoải mái. Bạn tha hồ tải các ứng dụng game giải trí, phần mềm đồ họa, văn phòng, … mà không lo việc bị đầy bộ nhớ. Dung lượng này còn có thể được hỗ trợ nâng cấp tối đa lên tối đa 2TB.<br>
<h2>Dung lượng pin sử dụng tốt hơn</h2>
<br>Macbook Pro 14 inch M2 Pro 2023 với dung lượng pin 70Wh giúp cho người dùng có trải nghiệm sử dụng với thời lượng pin được lâu hơn. Duy trì thời gian sử dụng có thể kéo dài nhiều tiếng đồng hồ, theo bạn hỗ trợ học tập, làm việc xuyên suốt.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-7.jpg" alt=" " />	<br>
<br>Chỉ cần bạn sạc đầy là đã có thể mang Macbook Pro 14 2023 M2 Pro di chuyển sử dụng linh hoạt mà không cần phải nguồn sạc ngay lúc đó. Hỗ trợ sạc với công suất lớn, giúp cho laptop được đầy lại pin một cách nhanh chóng mà không cần chờ đợi quá lâu.<br>
<h2>Trang bị các tính năng mới</h2>
<br>Được hỗ trợ tính năng bảo mật Face ID, cho phép người dùng có thể mở khóa nhận diện bằng gương mặt. Tăng tính an toàn cho dữ liệu trong máy tính xách tay của người sử dụng. Dự kiến Macbook Pro 14 M2 Pro 2023 sẽ được hỗ trợ trợ lý ảo Siri, giúp bạn có thể vận hành laptop bằng cách lệnh giọng nói, mong rằng Apple sẽ tích hợp tính năng này.<br>
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/macbook/macbook-pro/2023/macbook-pro-14-inch-m2-pro-2023-5.jpg" alt=" " />
<br>Apple so sánh chip M1 Pro và M1 Max với lần lượt là 16 nhân và 32 nhân GPU với MacBook Pro 13 inch chip Intel thế hệ trước như sau:<br>
Tốc độ Render Final Cut Pro 4K nhanh hơn 9,2 lần so với M1 Pro và lên đến 13,4 lần với M1 Max<br>
Tốc độ xử lý Affinity Photonhanh hơn 5,6 lần với M1 Pro và 8,5 lần so với M1 Max.<br>
Tốc độ xử lý effect render trong Blackmagic Design Davinci Resolve Studio nhanh hơn 3,6 lần với M1 Pro và 5 lần với M1 Max.<br>
Với bộ xử lý Neural Engine 16 nhân mới, MacBook Pro 16” cũng cho các tác vụ máy học (ML) đều nhanh hơn rất nhiều. Cụ thể khi xử lý Final Cut Pro với các file nặng thì chip M1 Pro nhanh gấp 8,7 lần và chip M1 Max nhanh hơn 11,5 lần. Khi xử lý video ProRes 1080p trong Adobe Premiere Pro thì nhanh hơn 7,2 lần.<br>
<br>Về pin của MacBook Pro 16” mới theo Apple thì người dùng sẽ có dung lượng 100 Wh cho thời lượng pin 21 tiếng phát video (Apple TV app). Trong một thí dụ dễ hình dung, Apple nói rằng các lập trình viên code trên Macbook mới sẽ có thêm 4x thời gian trong khi người chỉnh hình ảnh bằng Lightroom sẽ thêm 2x thời lượng pin. Một điểm đáng chú ý khác, Macbook Pro vẫn có hiệu năng cao bất kể là máy đang cắm điện hay đang dùng pin.<br>							
<br><img width = "100%" src="https://goka.vn/wp-content/uploads/2022/09/macbookpro-16-percentage-22-goka-12-768x512.webp" alt=" " />',N'Bạc','32GB - 1TB');



INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,59,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,60,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,61,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,62,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,63,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,64,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,65,N'Kích thước','1.55 x 31.26 x 22.12 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'CPU','Apple M2 Pro chip');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Card màn hình','16 nhân GPU<br>16 nhân Neural Engine');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Màn hình','14.2 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Độ phân giải','3024 x 1964 pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Cổng kết nối','1 x 3.5mm<br>Cổng MagSafe<br>1x HDMI<br>1x SDXC');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Hệ điều hành','Mac OS');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Pin','70Wh Đi kèm sạc 67W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Thiết kế','Vỏ kim loại nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Kích thước, khối lượng','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'HDD/SSD','128 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Tần số quét','120 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Công nghệ màn hình','120Hz, Liquid Retina, Mini LED, XDR');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Webcam','1080p Camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Trọng lượng','1.6 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,66,N'Kích thước','1.55 x 31.26 x 22.12 cm');




INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/i/n/in_the_box_14_inch__cla7biqzxe6a_large_3.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 14 inch M2 Pro 2023';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/k/e/keyboard_14_inch__bjo3gj8bnogi_large_3.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 14 inch M2 Pro 2023';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/r/o/routers_compare__dg2f68dd3y0y_large_3.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 14 inch M2 Pro 2023';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/d/i/display_14_inch__f298e9zwj02m_large_3.jpg', ID
FROM PRODUCT
WHERE name = 'MacBook Pro 14 inch M2 Pro 2023';

UPDATE PRODUCT SET image = 'https://macone.vn/wp-content/uploads/2023/01/8.jpg' WHERE name like 'MacBook Pro 14 inch M2 Pro 2023' AND color like N'Xám';

UPDATE PRODUCT SET image = 'https://macone.vn/wp-content/uploads/2023/01/9.jpg' WHERE name like 'MacBook Pro 14 inch M2 Pro 2023' AND color like N'Bạc';

INSERT INTO PRODUCT VALUES (67,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-midnight-gallery1-202306-lon-1024x787.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Midnight','8GB - 256GB');

INSERT INTO PRODUCT VALUES (68,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-midnight-gallery1-202306-lon-1024x787.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Midnight','16GB - 512GB');

INSERT INTO PRODUCT VALUES (69,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-midnight-gallery1-202306-lon-1024x787.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Midnight','32GB - 1TB');

INSERT INTO PRODUCT VALUES (70,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-starlight-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Starlight','8GB - 256GB');

INSERT INTO PRODUCT VALUES (71,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-starlight-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Starlight','16GB - 512GB');

INSERT INTO PRODUCT VALUES (72,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-starlight-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Starlight','32GB - 1TB');

INSERT INTO PRODUCT VALUES (73,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-spacegray-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Gray','8GB - 256GB');

INSERT INTO PRODUCT VALUES (74,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-spacegray-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Gray','16GB - 512GB');

INSERT INTO PRODUCT VALUES (75,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-spacegray-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Gray','32GB - 1TB');

INSERT INTO PRODUCT VALUES (76,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-silver-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Silver','8GB - 256GB');

INSERT INTO PRODUCT VALUES (77,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-silver-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Silver','16GB - 512GB');


INSERT INTO PRODUCT VALUES (78,'Macbook Air 2023 15 inch Apple M2', 'https://macone.vn/wp-content/uploads/2023/06/mba15-silver-gallery1-202306-lon.jpeg',20,32490000,'2023-05-29','MacBook',N'
<h2>Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng</h2>
<br>Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg" alt=" " /><br>
<h2>Bốn lựa chọn màu sắc cao cấp và sang trọng</h2>							
<br>MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg" alt=" " /><br>
<h2>Tốc độ và thời lượng pin khiến bạn kinh ngạc</h2>
<br>Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg" alt=" " /><br>
<h2>Trải nghiệm hình ảnh mãn nhãn với Liquid Retina</h2>
<br>Màn hình 15 inch Liquid Retina với tiêu chuẩn độc quyền của Apple trên MacBook Air M2 2023 sẽ làm hài lòng những người dùng khó tính nhất về trải nghiệm hình ảnh. Sản phẩm có thể tái hiện tới 1 tỷ gam màu sống động, rực rỡ, đạt độ phân giải gấp đôi so với các dòng PC hoặc laptop có cùng kích cỡ hiển thị. Từng khuôn hình, văn bản, video trên chiếc MacBook này sẽ hiện lên sắc sảo tối đa trước tầm mắt bạn.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-g.jpg" alt=" " /><br>
<h2>Tối ưu trải nghiệm họp hành và học tập online</h2>
<br>MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg" alt=" " /><br>
<h2>Âm thanh Dolby Atmos sống động từng tiết tấu</h2>
<br>Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.<br>							
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg" alt=" " /><br>
<h2>Bàn phím Magic Keyboard tích hợp Touch ID</h2>				
<br>Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg" alt=" " /><br>
<h2>Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng</h2>							
<br>Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.<br>
<br><img width = "100%" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg" alt=" " /><br>
',N'Silver','32GB - 1TB');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,67,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,68,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,69,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,70,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,71,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,72,N'Kích thước','23.76 x 34.04 x 1.15 cm');


INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,73,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,74,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,75,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,76,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,77,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'CPU','Apple M2 8 - Core');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Card màn hình','Apple M2 GPU 10 nhân');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'RAM','16GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Ổ cứng','512 GB SSD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Màn hình','15,3 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Độ phân giải','2880 x 1800 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Cổng kết nối','2 Thunderbolt');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Đặc biệt','Có đèn bàn phím');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Hệ điều hành','Ventura');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Pin','Lithium polymer 35W');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Thiết kế','Nhôm nguyên khối');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Dung lượng RAM','6 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Màu sắc','Xám');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Tần số quét','60 Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Công nghệ màn hình','Màn hình Liquid Retina 15,3 inch với True Tone');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Công nghệ âm thanh','Hệ thống âm thanh 6 loa <br> 3 microphones <br> Dolby Atmos');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Webcam','1080p FaceTime HD camera');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Trọng lượng','1.51 kg');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,78,N'Kích thước','23.76 x 34.04 x 1.15 cm');

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-6.jpg', ID
FROM PRODUCT
WHERE name = 'Macbook Air 2023 15 inch Apple M2';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-7.jpg', ID
FROM PRODUCT
WHERE name = 'Macbook Air 2023 15 inch Apple M2';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-5.jpg', ID
FROM PRODUCT
WHERE name = 'Macbook Air 2023 15 inch Apple M2';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-12.jpg', ID
FROM PRODUCT
WHERE name = 'Macbook Air 2023 15 inch Apple M2';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-10.jpg', ID
FROM PRODUCT
WHERE name = 'Macbook Air 2023 15 inch Apple M2';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-3.jpg', ID
FROM PRODUCT
WHERE name = 'Macbook Air 2023 15 inch Apple M2';


INSERT INTO PRODUCT VALUES (79,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-den-didongviet.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Black','128GB');

INSERT INTO PRODUCT VALUES (80,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-den-didongviet.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Black','256GB');

INSERT INTO PRODUCT VALUES (81,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-den-didongviet.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Black','512GB');

INSERT INTO PRODUCT VALUES (82,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-didongviet.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Pink','128GB');

INSERT INTO PRODUCT VALUES (83,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-didongviet.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Pink','256GB');

INSERT INTO PRODUCT VALUES (84,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-didongviet.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Pink','512GB');

INSERT INTO PRODUCT VALUES (85,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-aar-xanh-la-didongviet_2.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Green','128GB');

INSERT INTO PRODUCT VALUES (86,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-aar-xanh-la-didongviet_2.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Green','256GB');

INSERT INTO PRODUCT VALUES (87,'Iphone 13 Pro', 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-aar-xanh-la-didongviet_2.jpg&w=1920&q=100',20,24390000,'10-29-2022','Iphone',N'
<h2>Thiết kế với nhiều đột phá</h2>
<br>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).<br>
<br>Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.<br>
<br>Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.<br>
<br>Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.<br>							
<br><img width = "100%" src="https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/apple/iphone-13-13.png" alt=" " /><br>
<h2>Màn hình màn hình Super Retina XDR độ sáng cao</h2>
<br>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.<br>
<br><img width = "100%" src="https://cdn-v2.didongviet.vn/files/media/A-iPhone-13/iPhone-13-128gb/iphone-13-red-2-didongviet.jpg" alt=" " /><br>
<br>Đây vẫn là màn hình OLED, hỗ trợ dải màu rộng, Apple cho rằng hình ảnh trên iPhone 13 cho cảm giác chân thực nhất, màu sắc chính xác nhất. Hỗ trợ công nghệ Super Renita XDR với mật độ điểm ảnh cao, cho hình ảnh luôn sắc nét. Điểm thay đổi lớn nhất khi tai thỏ rộng hơn (notch nhỏ hơn) giúp người dùng có thêm thông tin khi xem trên màn hình iPhone 13.<br>							
<h2>Phần cứng mạnh mẽ với A15 Bionic</h2>
<br>iPhone 13 128GB được trang bị con chip Apple A15 Bionic. Theo Apple, A15 Bionic nhanh hơn nhiều so với các đối thủ khác, mang lại hiệu năng cao hơn và tiết kiệm năng lượng tốt hơn, khiến mọi thứ trở nên trôi chảy hơn trong dòng sản phẩm iPhone 13. chip A15 mới (5nm) - 6 nhân CPU (2 nhận mạnh và 4 nhân tiết kiệm điện. CPU cho hiệu năng nhanh hơn 50%, GPU có 4 nhân, cho hiệu năng đồ hoạ nhanh hơn 30%.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg" alt=" " /><br>
<h2>Quay chụp đỉnh cao với camera Pro</h2>
<br>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg" alt=" " /><br>
<br>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg" alt=" " /><br>
<br>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. <br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg" alt=" " /><br>
<br>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg" alt=" " /><br>
<br>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...<br>
<br><img width = "100%" src="https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg" alt=" " /><br>
',N'Green','512GB');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,79,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,80,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,81,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,82,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,83,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,84,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,85,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,86,N'Pin','3095 mAh20 W');

INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Trọng lượng','164 g');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Kích thước màn hình','6.1 inches');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Công nghệ màn hình','OLED');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Độ phân giải','1170 x 2532 Pixels');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Hệ điều hành','iOS 15');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Kích thước','146.7 x 71.5 x 7.4mm');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Model','iPhone 13 Pro');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'CPU Brand','Apple');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'CPU Series','A15 Bionic');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Tần số quét','60Hz');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Dung lượng RAM','4 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'HDD/SSD','256 GB');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Màu sắc','Đen');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Kết nối','Lightning');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Camera sau','2 camera 12 MP<br>Đèn LED kép');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Camera trước','12 MP HDR, Quay video Full HD');
INSERT INTO PRODUCT_SYSTEM VALUES(DEFAULT,87,N'Pin','3095 mAh20 W');


INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-mau-xanh-la-pos-1-didongviet.jpg&w=1920&q=100', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro';
						
INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-mau-xanh-la-pos-2-didongviet.jpg&w=1920&q=100', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://didongviet.vn/_next/image?url=https%3A%2F%2Fcdn-v2.didongviet.vn%2Ffiles%2Fmedia%2Fcatalog%2Fproduct%2Fi%2Fp%2Fiphone-13-128gb-mau-xanh-la-pos-4-didongviet.jpg&w=1920&q=100', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro';

INSERT INTO PRODUCT_IMAGE (IMG_PATH, ID_PRODUCT)
SELECT 'https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-18.jpg', ID
FROM PRODUCT
WHERE name = 'Iphone 13 Pro';


DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://clickbuy.com.vn/uploads/2021/04/thumb_Note10_3.jpg';

DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/_/b_c_1_9.png';

DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859769705950103_iPhone%2013%20Promax%20(5).jpg';

DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/v/_/v_ng_18.png';

DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859769705950103_iPhone%2013%20Promax%20(1).jpg';

DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859769705793853_iPhone%2013%20Promax%20(3).jpg';

DELETE FROM PRODUCT_IMAGE WHERE IMG_PATH = 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/x/_/x_m_24.png';

UPDATE PRODUCT SET IMAGE ='https://cdn.nguyenkimmall.com/images/detailed/756/dien-thoai-iphone-13-pro-max-512gb-xam-1.jpg' WHERE IMAGE = 'https://clickbuy.com.vn/uploads/2022/04/avt-iphone-13-pro-max-gray.png'







