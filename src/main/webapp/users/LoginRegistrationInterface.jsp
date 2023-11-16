<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quản lý tài chính cá nhân</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            /*background-image: url("/users/hình-nền-ấn-tượng.jpg");*/
            background-color: #ffffff;
            height: 6400px;
        }

        .header {
            margin-top: 10px;
            width: 100%;
            height: 20px;
        }

        .logo {
            margin-left: 40px;
            width: 20%;
            height: 10%;
            float: left;
            display: flex;
            margin-top: 5px;
        }

        .menu {
            width: 50%;
            height: 10%;
            float: left;
        }

        .menu1 {
            /*margin-left: 17%;*/
            /*display: flex;*/
            margin-top: 20px;
            display: flex;
            justify-content: space-between;

        }

        .general {
            height: 80%;
        }

        .left {
            float: left;
            width: 20%;
            height: 100%;
        }

        .content {
            float: left;
            width: 60%;
            height: 100%;
            /*box-shadow: 0 0 6px 5px #646e6e;*/
        }

        .right {
            float: left;
            width: 20%;
            height: 100%;
        }

        .footer {
            background-color: #ffffff;
            width: 100%;
            height: 10%;
            /*border-radius: 10px 10px ;*/
            text-align: center;
            color: white;
        }

        p.footer {
            vertical-align: middle;
        }


        .headers {
            float: right;
            margin-right: 25px;
            margin-top: 10px;
        }

        button {
            border-radius: 20px;
        }


        li.dropdown {
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            min-width: 80px;
            z-index: 1;
            border-radius: 10px;
        }

        .dropdown-content a {
            color: #dccfcf;
            background-color: #ffffff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .dropdown-content a:hover {
            background-color: #ffffff;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content {
            overflow: auto;
            width: 100px;
            height: 200px;
        }

        ::-webkit-scrollbar {
            width: 0;
        }

        .centered-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #ffffff; /* Màu chữ */
            font-size: 30px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<div class="all">
    <div class="header">
        <div class="logo">
            <i class="fa-brands fa-wordpress" style="font-size: 60px; color: #8030c9"></i>
            <h5 style="margin-top: 6px">QUẢN LÝ<br>TÀI CHÍNH</h5>
        </div>
        <div class="headers">
            <button class="no-border login-button"
                    style="width: 120px; height: 35px;  background-color: #ffffff;margin-top: 5px">
                <a href="/users/list.jsp" style=" text-decoration: none; color: #000000">Đăng nhập</a></button>
            <button class="no-border login-button" style="width: 120px; height: 35px;  background-color: #ffffff">
                <a href="/users/Register.jsp" style=" text-decoration: none;color: #000000">Đăng ký</a></button>
        </div>
        <div class="menu">
            <div class="menu1">
                <div>
                    <a href="" style="color: #000000 ; text-decoration: none; ">Trang chủ</a>
                </div>
                <div class="w" style="margin-left: 20px">
                    <ul>
                        <li class="dropdown">
                            <a href="#" class="dropbtn" style="color: #000000 ; text-decoration: none">Ví </a>

                        </li>
                    </ul>
                </div>
                <div class="Category" style="margin-left: 20px">
                    <ul>
                        <li class="dropdown">
                            <a href="#" class="dropbtn" style="color: #000000 ; text-decoration: none">Thư mục </a>
                            <div class="dropdown-content">
                            </div>
                        </li>
                    </ul>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #000000; text-decoration: none">Lịch sử</a>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #000000 ; text-decoration: none">Ngân hàng</a>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #000000 ; text-decoration: none">Chi tiêu</a>
                </div>
            </div>
        </div>

    </div>
    <hr style="color: black; width: 65%; margin-left: 15%; margin-top: 35px">
    <div class="general">

        <img style=" position: relative;"
             src="https://ptas.edu.vn/Upload/News/11300/nhung-luu-y-nhap-canh-tai-singapore-cho-du-hoc-sinh-2.jpg"
             height="500px" width="100%">
        <div style="text-align: center;">
            <hr style="color: black; width: 30%; margin-left: auto; margin-right: auto; margin-top: 35px;">
        </div>
        <div class="centered-text">
            <p>Quản lý tài chính cá nhân là gì? 9 nguyên tắc và công cụ hỗ trợ quản lý phổ biến nhất</p>
        </div>
        <div class="left"></div>
        <div class="content">
            <div class="1"></div>
            <img style="margin-top: 30px" src="https://mcdn.coolmate.me/uploads/December2021/tiet-kiem-tien-bac-7.jpg"
                 height="600px" width="100%">
            <p>Quản lý tài chính cá nhân là cách sử dụng tiền sao cho hợp lý theo nhu cầu cần thiết, mục tiêu cá nhân,
                dự định tương lai… Và có một nguồn lập dự phòng khi có trường hợp rủi ro, khẩn cấp. Để quản lý tài chính
                hiệu quả, bạn phải nắm được các nguyên tắc cũng như cách thực hiện tốt mà Ngân hàng số Timo đề xuất dưới
                đây</p>
            <p style="font-size: 24px; font-weight: bold;">Tại sao cần phải quản lý dòng tiền tài chính cá nhân?</p>
            <p style="font-size: 15px; font-weight: bold;"> &middot; Quản lý tài chính cá nhân để hiểu về tiền của
                mình</p>
            <p> Quản lý tài chính cá nhân sẽ giúp bạn hiểu về dòng tiền và nhận thức rõ về tình hình tài chính của mình
                hơn. Nhờ đó, bạn sẽ biết được mình có cần thêm nguồn thu nhập hoặc phải giảm chi tiêu hay không, hoặc
                khoản đầu tư tài chính cá nhân nào phù hợp,… Bạn sẽ kiểm soát được cách thức hoạt động của đồng tiền của
                mình. Để thuận tiện và dễ dàng trong việc quản lý chi tiêu, bạn có thể sử dụng các app quản lý chi tiêu
                tài chính cá nhân miễn phí.</p>
            <p style="font-size: 15px; font-weight: bold; margin-top: 20px;">
                &middot; Đảm bảo tài chính ổn định
            </p>
            <p>Bên cạnh thu nhập từ việc đi làm kiếm tiền, hàng tháng bạn còn có những khoản chi tiêu. Do đó, để đảm bảo
                cân bằng về mặt tài chính, chi tiêu hợp lí và có thể tiết kiệm từ thu nhập, bạn nên biết cách quản lý
                tài chính cá nhân sao cho thật hiệu quả.</p>
            <div style="text-align: center;">
                <img src="https://timo.vn/wp-content/uploads/quan-ly-tai-chinh-ca-nhan.png" width="100%" height="450px"
                     style="display: inline-block; margin-top: 20px;">
            </div>
            <p style="font-style: italic;margin-top: 20px">Quản lý tài chính cá nhân <strong>rất quan trọng</strong> cho
                sự thành công mỗi người (Nguồn Internet)</p>
            <p style="font-size: 15px; font-weight: bold; margin-top: 20px;">
                &middot; Dễ dàng lập các mục tiêu tài chính cá nhân
            </p>
            <p>Khi am hiểu về quản lý tài chính, bạn có thể xây dựng được các mục tiêu tài chính trong tương lai như:
                mua nhà, mua xe, đầu tư tài chính cá nhân,… Bên cạnh đó bạn cũng biết được khả năng và thời gian đạt
                được của những mục tiêu này.</p>
            <p style="font-size: 15px; font-weight: bold; margin-top: 20px;">
                &middot; Chủ động tài chính trong mọi trường hợp
            </p>
            <p>Khoản dự phòng vô cùng quan trọng đối với cá nhân và gia đình bạn. Giúp bạn chủ động tài chính trong mọi
                trường hợp bất ngờ như tai nạn, bệnh tật,… Do đó, việc lập kế hoạch và quản lý tài chính vô cùng quan
                trọng, mang lại sự an tâm cho bạn và người thân.</p>
            <div style="text-align: center;">
                <img src="https://timo.vn/wp-content/uploads/quan-ly-tai-chinh-giup-chu-dong-trong-moi-truong-hop.png"
                     width="100%" height="450px style="display: inline-block; margin-top: 20px;">
            </div>
            <p style="font-style: italic;margin-top: 20px">Khoản dự phòng giúp chủ động tài chính trong mọi trường hợp
                bất ngờ (Nguồn Internet)</p>
            <p style="font-size: 15px; font-weight: bold; margin-top: 20px;">
                &middot; Quản lý và hạn chế các khoản nợ
            </p>
            <p>Các khoản nợ thật ra không phải là vấn đề nghiêm trọng, nhưng việc có quá nhiều khoản nợ và quản lý nợ
                không đúng cách sẽ ảnh hưởng đến tài chính của bạn. Để hạn chế điều đó, bạn áp dụng cách quản lý tài
                chính để tránh các khoản bội chi và có kế hoạch trả nợ hợp lý.</p>
            <p style="font-size: 15px; font-weight: bold; margin-top: 20px;">
                &middot; Gia tăng tài sản của bạn
            </p>
            <p>Việc am hiểu về tài chính và lập các mục tiêu tương lai mà quản lý tài chính cá nhân mang lại, sẽ giúp
                bạn phát triển tài sản của mình nhanh chóng. Giúp bạn đầu tư tài chính cá nhân đúng đắn, loại bỏ các
                khoản nợ không cần thiết, gia tăng khoản tiết kiệm.</p>
            <p style="font-size: 15px; font-weight: bold; margin-top: 20px;">
                &middot; Quản lý tài chính tốt giúp nâng cao mức sống
            </p>
            <p>Kết quả của việc quản lý tài chính cá nhân đúng đắn sẽ giúp bạn gia tăng tài sản, ổn định tài chính và có
                các khoản dự phòng bảo đảm cuộc sống an toàn. Từ đó bạn có các khoản dư dả để đầu tư vào bản thân, thỏa
                mãn các sở thích cá nhân như du lịch, mua sắm và nâng cao mức sống.</p>
            <div style="text-align: center;">
                <img src="https://timo.vn/wp-content/uploads/quy-dau-tu-feature-1.jpg" width="100%" height="450px
                     style="display: inline-block; margin-top: 20px;">
            </div>
            <p style="font-style: italic;margin-top: 20px">Áp dụng cách quản lý tài chính tốt giúp gia tăng tài sản của
                bạn (Nguồn: Internet)</p>
            <p style="font-size: 27px; font-weight: bold;">9 Nguyên tắc cải thiện kỹ năng quản lý tài chính cá nhân hiệu
                quả trong 30 ngày</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 1: Xác định nguồn ngân sách</p>
            <p>Việc đầu tiên khi bắt tay vào quản trị tài chính cá nhân đó chính là liệt kê ra tất cả các nguồn thu nhập
                định kỳ mà bạn có. Lưu ý là nên liệt kê càng chi tiết càng tốt. Điều này giúp bạn dễ tính toán và phân
                bổ các khoản chi một cách hợp lý nhất.</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 2: Kiểm soát chi tiêu và cắt giảm các khoản không
                quan trọng</p>
            <p>Nên hình thành thói quen kiểm soát chi tiêu theo ngày, tháng và năm, từ đó xác định các
                khoản chi tiêu cần thiết và các khoản có thể cắt giảm. Ví dụ, mỗi tháng bạn phải tốn một số tiền nhất
                định cho các nhu cầu cơ bản như ăn uống, nhà ở, đi lại,… Đó là những khoản chi tiêu không thể cắt giảm.
                Ngược lại, bạn có thể giảm bớt các khoản chi phí cho việc shopping, xem phim, tụ tập cùng bạn bè,…</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 3: Hạn chế lạm dụng thẻ tín dụng</p>
            <p>Thẻ tín dụng với các hạn mức tín dụng, ưu đãi thanh toán hấp dẫn và ít tạo áp lực chi tiêu hơn tiền mặt.
                Điều đó khiến bạn dễ chi tiêu quá tay và cuốn vào các đợt “flash sale” mua sắm. Điều này sẽ ảnh hưởng
                đến việc quản lý tài chính của bạn với các khoản bội chi cần thanh toán.</p>
            <div style="text-align: center;">
                <img src="https://timo.vn/wp-content/uploads/han-che-lam-dung-the-tin-dung.png" width="100%"
                     height="450px"
                     style="display: inline-block; margin-top: 20px;">
            </div>
            <p style="font-style: italic;margin-top: 20px">Hạn chế sử dụng thẻ tín dụng để tránh các khoản lãi suất bội
                chi (Nguồn: Internet)</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 4: Đầu tư sinh lời với số tiền nhàn rỗi</p>
            <p>Khoản dự phòng ngoài chức năng giải quyết các rủi ro trong tương lai, còn là khoản tiết kiệm mà bạn có
                thể đầu tư sinh lời. Tuy nhiên, bạn cần tìm hiểu và lựa chọn các kênh đầu tư tài chính phù hợp và an
                toàn như gửi tiết kiệm, tham gia các quỹ đầu tư tích lũy,…</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 5: Chi tiêu ít hơn số tiền kiếm được</p>
            <p>Bạn nên chi tiêu ít hơn số tiền mà bạn kiếm được, để có thể tích lũy lại một phần tiền để dùng cho tương
                lai hoặc đầu tư. “Không nên tiêu quá 10% số tiền bạn kiếm được” là một nguyên tắc tiêu dùng và quản lý
                tài sản mà nhiều chuyên gia khuyến nghị. Một ví dụ về tài chính cá nhân, nếu thu nhập của bạn là 15
                triệu đồng mỗi tháng, bạn không nên mua đôi giày có giá hơn 1,5 triệu đồng.</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 6: Tuân thủ, kiên nhẫn và linh hoạt khi quản lý
                chi tiêu</p>
            <p>Sự tuân thủ sẽ quyết định hiệu quả lẫn kết quả của việc quản lý chi tiêu. Bên cạnh đó, đây là một quá
                trình đòi hỏi sự kiên nhẫn và cần thực hiện lâu dài. Tỷ lệ của các khoản chi tiêu, thu nhập, cũng như
                nhu cầu của mỗi người là khác nhau. Cho nên bạn cần linh hoạt, cân chỉnh các con số sao cho phù hợp với
                bản thân nhất.</p>

            <div style="text-align: center;">
                <img src="https://timo.vn/wp-content/uploads/tuan-thu-kien-nhan-va-linh-hoat-khi-quan-ly-chi-tieu.png"
                     width="100%"
                     height="450px"
                     style="display: inline-block; margin-top: 20px;">
            </div>
            <p style="font-style: italic;margin-top: 20px">Quản lý tài chính cá nhân đòi hỏi sự kiên nhẫn và cần thực
                hiện lâu dài (Nguồn: Internet)</p>

            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 7: Trích 10-15% khoản thu nhập hàng tháng để tiết
                kiệm</p>
            <p>Tiết kiệm ít nhất từ 10 – 15% nguồn thu nhập hàng tháng là nguyên tắc cơ bản nhưng đem lại hiệu quả cực
                kỳ cao đối với người mới bắt đầu thực hiện quản trị tài chính cá nhân. Sau đó, bạn có thể nâng dần mức
                tiết kiệm tùy vào thu nhập hiện tại của bản thân.</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 8: Đầu tư vào bản thân bằng cách mua các quỹ phòng
                hộ hoặc bảo hiểm nhân thọ</p>
            <p>Hiện nay, các sản phẩm như bảo hiểm nhân thọ hoặc quỹ phòng hộ được mọi người cân nhắc lựa chọn đầu tư
                cho bản thân. Bởi vì nó không chỉ giúp bảo vệ tài chính của người tham gia trước các rủi ro trong cuộc
                sống mà còn kết hợp thêm các quyền lợi tích lũy và đầu tư. Điều này vừa giúp người tham gia rèn luyện
                thói quen quản lý chi tiêu hợp lý vừa có một nguồn tiền dư dả dành cho việc nghỉ hưu.</p>
            <p style="font-size: 20px; font-weight: bold;">Nguyên tắc 9: Tìm kiếm thêm các nguồn thu nhập khác</p>
            <p>Bạn có thể tìm thêm một số công việc làm ngoài giờ khác để tăng thu nhập thụ động tùy vào năng lực và sở
                thích của bản thân. Chẳng hạn như nếu có khả năng viết lách tốt, bạn có thể tìm kiếm các công việc liên
                quan đến phát triển nội dung, lên kịch bản,… Tuy nhiên, bạn cần biết cách sắp xếp và cân bằng thời gian
                hợp lý để có thể đảm bảo hoàn thành công việc một cách tốt nhất.</p>

        </div>
        <%--    <div class="1"></div>--%>
        <%--    <img src="https://mcdn.coolmate.me/uploads/December2021/tiet-kiem-tien-bac-7.jpg" height="100%" width="100%">--%>
        <%--    <p>Quản lý tài chính cá nhân là cách sử dụng tiền sao cho hợp lý theo nhu cầu cần thiết, mục tiêu cá nhân, dự định tương lai… Và có một nguồn lập dự phòng khi có trường hợp rủi ro, khẩn cấp. Để quản lý tài chính hiệu quả, bạn phải nắm được các nguyên tắc cũng như cách thực hiện tốt mà Ngân hàng số Timo đề xuất dưới đây</p>--%>
        <%--  </div>--%>
        <%--  <div class="1"></div>--%>
        <%--  <img src="https://mcdn.coolmate.me/uploads/December2021/tiet-kiem-tien-bac-7.jpg" height="100%" width="100%">--%>
        <%--  <p>Quản lý tài chính cá nhân là cách sử dụng tiền sao cho hợp lý theo nhu cầu cần thiết, mục tiêu cá nhân, dự định tương lai… Và có một nguồn lập dự phòng khi có trường hợp rủi ro, khẩn cấp. Để quản lý tài chính hiệu quả, bạn phải nắm được các nguyên tắc cũng như cách thực hiện tốt mà Ngân hàng số Timo đề xuất dưới đây</p>--%>
        <%--</div>--%>
        <div class="right"></div>

    </div>

    </div>

<div style="padding: 15px 0; height: 200px; width: 100%; background-color: #000000; margin: 1100px auto 0;">
    <p style="margin: 0; color: #ffffff; text-align: center;">HỖ TRỢ KHÁCH HÀNG / NHÀ PHÁT TRIỂN</p>
    <p style="margin: 0; color: #ffffff; text-align: center;">Hotline: 1800 6788                </p>
    <p style="margin: 0; color: #ffffff; text-align: center;">Email: care@timo.vn               </p>
    <p style="margin: 0; color: #ffffff; text-align: center;">Tổng đài CSKH:                    </p>
    <p style="margin: 0; color: #ffffff; text-align: center;">– Thứ 2 – Thứ 7: 08:00 – 22:00    </p>
    <p style="margin: 0; color: #ffffff; text-align: center;">– Chủ nhật: 08:00 – 20:00         </p>





</div>

</body>
</html>