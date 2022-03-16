# Commerce
 
 # Một vài nét
 
- Dự án website E-Commerce Shopping-cart ứng dụng các kiến thức đã học về Spring framework
- Trang web với hai quyền chính là ROLE_ADMIN, ROLE_USER sử dụng spring security để xác thực và phân quyền
- Sử dụng OAUTH-2 để đăng nhập bằng tài khoản Facebook và Google
- Sử dụng mã OTP gửi qua mail cho các bad-request(Xác định bằng Google RECAPTCHA v2)
- Cơ sở dữ liệu MySQL kết nối bằng Hibernate, Spring Data JPA
- Sử dụng session để lưu giỏ hàng, cập nhật giá tiền và số lượng mỗi khi có giao dịch mới
- Có trang admin để quản lí sản phẩm, comment, categories, blog, bill và chỉ có admin mới có thể truy cập.
- User có thể cập nhật thay đổi thông tin, thực hiện mua hàng, đọc blog, gửi email phản hồi.


# Giao diện chức năng website

https://imgur.com/gallery/d1fz03x


# Cách khởi chạy ứng dụng với DOCKER

  ### + Lệnh build image  
  
  ```sh docker build -t commerce-spring . ```
  
  ### + Lệnh khởi chạy docker-compose với image vừa build
  
  ```sh docker-compose up -d ```
  
  ### + Truy cập 
  
  http://localhost:8005/
  
  
---
[![github](https://cloud.githubusercontent.com/assets/17016297/18839843/0e06a67a-83d2-11e6-993a-b35a182500e0.png)][1][![facebook](https://cloud.githubusercontent.com/assets/17016297/18839836/0a06deb4-83d2-11e6-8078-1d0974af0f63.png)][2][![linkedin](https://cloud.githubusercontent.com/assets/17016297/18839848/0fc7e74e-83d2-11e6-8c6a-277fc9d6e067.png)][3]
---

[1]: https://github.com/ngocbach99
[2]: https://www.linkedin.com/in/b%C3%A1ch-nguy%E1%BB%85n-ng%E1%BB%8Dc-711a46234/
[3]: https://www.facebook.com/sao.choi.568847
 
