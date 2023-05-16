-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 11, 2023 lúc 06:17 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ntstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2023_03_23_021819_create_tbl_admin_table', 1),
(18, '2023_03_25_014049_create_tbl_category_product', 1),
(19, '2023_03_25_025438_create_tbl_brand_product', 1),
(20, '2023_03_25_030707_create_tbl_producer', 1),
(21, '2023_03_26_020338_create_tbl_product', 1),
(22, '2023_03_30_013227_create_tbl_user', 1),
(23, '2023_03_30_013544_create_tbl_shipping', 1),
(24, '2023_03_30_013723_create_tbl_payment', 1),
(25, '2023_03_30_013920_create_tbl_order', 1),
(26, '2023_03_30_014113_create_tbl_order_details', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl-brand`
--

CREATE TABLE `tbl-brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_desc` text NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl-brand`
--

INSERT INTO `tbl-brand` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(1, 'Dell', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(2, 'Samsung', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(3, 'LG', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(4, 'Apple', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(5, 'Panasonic', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(6, 'SunHouse', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(7, 'Khác', '<p>kh&ocirc;ng</p>', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(2, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Sâm', '0123456789', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_desc` text NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(2, 'Smart Tivi', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(3, 'Tủ Lạnh', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(4, 'Điều Hòa', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(5, 'Máy Giặt', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(6, 'Máy In', '<p>kh&ocirc;ng</p>', 1, NULL, NULL),
(7, 'Sản Phẩm Khác', '<p>kh&ocirc;ng</p>', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_total` varchar(50) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `order_total`, `order_status`, `user_id`, `shipping_id`, `payment_id`, `created_at`, `updated_at`) VALUES
(3, '56490000', '1', 1, 1, 3, '2023-04-10 03:51:17', NULL),
(4, '17430000', '1', 1, 2, 4, '2023-03-10 03:54:27', NULL),
(5, '32917500', '2', 3, 3, 5, '2023-02-10 03:55:58', NULL),
(9, '39060000', '2', 6, 7, 10, '2023-01-14 03:11:15', NULL),
(10, '2572500', '2', 6, 8, 13, '2023-02-14 07:29:26', NULL),
(11, '26250000', '1', 2, 9, 15, '2023-03-15 02:07:48', NULL),
(12, '31500000', '4', 1, 10, 16, '2023-02-16 08:47:05', NULL),
(13, '15120000', '1', 3, 14, 17, '2023-04-25 02:41:44', NULL),
(15, '18060000', '1', 1, 16, 19, '2023-05-02 04:41:30', NULL),
(16, '16537500', '1', 1, 17, 20, '2023-05-03 13:27:03', NULL),
(17, '39060000', '1', 1, 18, 21, '2023-05-04 08:47:21', NULL),
(24, '75390000', '1', 8, 23, 28, '2023-05-05 03:20:16', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'MacBook Air M1 (2020)', '37200000', 1, NULL, NULL),
(2, 1, 10, 'Laptop Dell Latitude 3520', '16600000', 1, NULL, NULL),
(3, 2, 1, 'MacBook Air M1 (2020)', '37200000', 1, NULL, NULL),
(4, 2, 10, 'Laptop Dell Latitude 3520', '16600000', 1, NULL, NULL),
(5, 3, 1, 'MacBook Air M1 (2020)', '37200000', 1, NULL, NULL),
(6, 3, 10, 'Laptop Dell Latitude 3520', '16600000', 1, NULL, NULL),
(7, 4, 14, 'Máy lạnh đứng di động FUJIHOME', '3400000', 2, NULL, NULL),
(8, 4, 8, 'Tủ lạnh LG Inverter 209 lít', '9800000', 1, NULL, NULL),
(9, 5, 7, 'Máy in canon LBP 226dw', '2450000', 3, NULL, NULL),
(10, 5, 21, 'Dell Laitude E7390', '24000000', 1, NULL, NULL),
(11, 6, 20, 'Remote LG Giọng Nói', '160000', 3, NULL, NULL),
(12, 6, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(13, 6, 14, 'Máy lạnh đứng di động FUJIHOME', '3400000', 3, NULL, NULL),
(14, 7, 4, 'Máy giặt cửa trước Samsung', '6500000', 2, NULL, NULL),
(15, 8, 8, 'Tủ lạnh LG Inverter 209 lít', '9800000', 1, NULL, NULL),
(16, 8, 5, 'Điều hòa Panasonic 2 chiều', '7200000', 2, NULL, NULL),
(17, 9, 1, 'MacBook Air M1 (2020)', '37200000', 1, NULL, NULL),
(18, 10, 7, 'Máy in canon LBP 226dw', '2450000', 1, NULL, NULL),
(19, 11, 2, 'Tủ Lạnh Panasonic 167L Inverter', '12500000', 2, NULL, NULL),
(20, 12, 16, 'Máy ảnh LG Nikon Fujifilm', '15000000', 2, NULL, NULL),
(21, 13, 5, 'Điều hòa Panasonic 2 chiều', '7200000', 2, NULL, NULL),
(22, 14, 1, 'MacBook Air M1 (2020)', '37200000', 2, NULL, NULL),
(23, 15, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(24, 16, 11, 'Loa Mini', '250000', 3, NULL, NULL),
(25, 16, 16, 'Máy ảnh LG Nikon Fujifilm', '15000000', 1, NULL, NULL),
(26, 17, 1, 'MacBook Air M1 (2020)', '37200000', 1, NULL, NULL),
(27, 18, 6, 'Smart Tivi Samsung Crystal UHD', '16700000', 2, NULL, NULL),
(28, 18, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(29, 19, 6, 'Smart Tivi Samsung Crystal UHD', '16700000', 2, NULL, NULL),
(30, 19, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(31, 20, 6, 'Smart Tivi Samsung Crystal UHD', '16700000', 2, NULL, NULL),
(32, 20, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(33, 21, 6, 'Smart Tivi Samsung Crystal UHD', '16700000', 2, NULL, NULL),
(34, 21, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(35, 22, 6, 'Smart Tivi Samsung Crystal UHD', '16700000', 2, NULL, NULL),
(36, 22, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(37, 23, 6, 'Smart Tivi Samsung Crystal UHD', '16700000', 2, NULL, NULL),
(38, 23, 3, 'Smart Tivi TCL 43 inch', '8600000', 2, NULL, NULL),
(39, 24, 3, 'Smart Tivi TCL 43 inch', '8600000', 3, NULL, NULL),
(40, 24, 17, 'Macbook Air M2 (2022)', '46000000', 1, NULL, NULL),
(41, 25, 3, 'Smart Tivi TCL 43 inch', '8600000', 3, NULL, NULL),
(42, 25, 17, 'Macbook Air M2 (2022)', '46000000', 1, NULL, NULL),
(43, 26, 3, 'Smart Tivi TCL 43 inch', '8600000', 3, NULL, NULL),
(44, 26, 17, 'Macbook Air M2 (2022)', '46000000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, '2', 'Đang chờ xử lý!', NULL, NULL),
(2, '2', 'Đang chờ xử lý!', NULL, NULL),
(3, '2', 'Đang chờ xử lý!', NULL, NULL),
(4, '2', 'Đang chờ xử lý!', NULL, NULL),
(5, '2', 'Đang chờ xử lý!', NULL, NULL),
(6, '2', 'Đang chờ xử lý!', NULL, NULL),
(7, '2', 'Đang chờ xử lý!', NULL, NULL),
(8, '2', 'Đang chờ xử lý!', NULL, NULL),
(9, '2', '2', NULL, NULL),
(10, '2', 'Đang chờ xử lý!', NULL, NULL),
(11, '2', 'Đang chờ xử lý!', NULL, NULL),
(12, '2', 'Đang chờ xử lý!', NULL, NULL),
(13, '2', 'Đang chờ xử lý!', NULL, NULL),
(14, '2', 'Đang chờ xử lý!', NULL, NULL),
(15, '2', 'Đang chờ xử lý!', NULL, NULL),
(16, '2', 'Đang chờ xử lý!', NULL, NULL),
(17, '2', 'Đang chờ xử lý!', NULL, NULL),
(18, '2', 'Đang chờ xử lý!', NULL, NULL),
(19, '2', 'Đang chờ xử lý!', NULL, NULL),
(20, '2', 'Đang chờ xử lý!', NULL, NULL),
(21, '2', 'Đang chờ xử lý!', NULL, NULL),
(22, '2', 'Đang chờ xử lý!', NULL, NULL),
(23, '2', 'Đang chờ xử lý!', NULL, NULL),
(24, '2', 'Đang chờ xử lý!', NULL, NULL),
(25, '2', 'Đang chờ xử lý!', NULL, NULL),
(26, '2', 'Đang chờ xử lý!', NULL, NULL),
(27, '2', 'Đang chờ xử lý!', NULL, NULL),
(28, '2', 'Đang chờ xử lý!', NULL, NULL),
(29, '2', 'Đang chờ xử lý!', NULL, NULL),
(30, '2', 'Đang chờ xử lý!', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_producer`
--

CREATE TABLE `tbl_producer` (
  `producer_id` int(10) UNSIGNED NOT NULL,
  `producer_name` varchar(255) NOT NULL,
  `producer_address` varchar(255) NOT NULL,
  `producer_phone` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_producer`
--

INSERT INTO `tbl_producer` (`producer_id`, `producer_name`, `producer_address`, `producer_phone`, `created_at`, `updated_at`) VALUES
(1, 'Công ty TNHH FC Việt Nam', 'Cầu Giấy - Hà Nội', '0987345522', NULL, NULL),
(2, 'Công ty TNHH GENESISTEK VINA', 'Đống Đa - Hà Nội', '0923472366', NULL, NULL),
(3, 'Công Ty ABECO', 'Ái Nghĩa - Đà Nẵng', '0243875454', NULL, NULL),
(4, 'Autotronics NguyenPhi JSC', 'Duy Tiên - Hà Nam', '0349726732', NULL, NULL),
(5, 'Công Ty TNHH Kỹ Thuật Điện Tử TH', 'Thuận Thành, Bắc Ninh', '0349726732', NULL, NULL),
(6, 'Công Ty TNHH SI YUAN TECH', 'Tp. Hồ Chí Minh', '0876565433', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_status` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `product_image`, `product_quantity`, `product_desc`, `product_price`, `product_status`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'MacBook Air M1 (2020)', 'a193.jpg', 20, '<p>H&atilde;ng sản xuất: Apple</p>\r\n\r\n<p>K&iacute;ch thước: 1.61 cm x 30.41 cm x 21.24 cm</p>\r\n\r\n<p>Trọng lượng: 1.29 kg</p>\r\n\r\n<p>Loại m&agrave;n h&igrave;nh: 13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display, Wide color (P3), True Tone technology K&iacute;ch thước m&agrave;n h&igrave;nh: 13.3 inches</p>\r\n\r\n<p>Độ ph&acirc;n giải m&agrave;n h&igrave;nh: 2560 x 1600 pixels</p>\r\n\r\n<p>Hệ điều h&agrave;nh: MacOS</p>', '37200000', 1, 1, 4, NULL, NULL),
(2, 'Tủ Lạnh Panasonic 167L Inverter', 'a169.png', 10, '<p>Tủ Lạnh Panasonic Inverter 420 L&iacute;t NR-BX471WGKV</p>\r\n\r\n<p>👉 H&agrave;ng mẫu NEW Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 2 năm</p>\r\n\r\n<p>Gi&aacute; b&aacute;n : 15T. Sthi b&aacute;n : 20T900K ☎️ 0938933133 MẶT GƯƠNG - NGĂN CẤP Đ&Ocirc;NG MỀM CAO CẤP .</p>\r\n\r\n<p>SI&Ecirc;U TIẾT KIỆM ĐIỆN</p>', '12500000', 1, 3, 5, NULL, NULL),
(3, 'Smart Tivi TCL 43 inch', 'a251.jpg', 15, '<p>------TV th&ocirc;ng minh 55 inch-----</p>\r\n\r\n<p>Phi&ecirc;n bản Android: Android 9.0</p>\r\n\r\n<p>-----Th&ocirc;ng số hiển thị-----</p>\r\n\r\n<p>Độ ph&acirc;n giải: 3840*2160</p>\r\n\r\n<p>G&oacute;c nh&igrave;n: 89/89/89/89</p>\r\n\r\n<p>Tỷ lệ khung h&igrave;nh: 16: 9</p>', '8600000', 1, 2, 3, NULL, NULL),
(4, 'Máy giặt cửa trước Samsung', 'a24.png', 20, '<p>Loại m&aacute;y giặt: Cửa ngang</p>\r\n\r\n<p>Lồng giặt: Lồng ngang</p>\r\n\r\n<p>Khối lượng giặt: 9 Kg</p>\r\n\r\n<p>Số người sử dụng: Từ 3 - 5 người</p>\r\n\r\n<p>Inverter: C&oacute; Inverter</p>\r\n\r\n<p>Kiểu động cơ: Truyền động trực tiếp bền &amp; &ecirc;m</p>\r\n\r\n<p>C&ocirc;ng nghệ giặt: Giặt 6 chuyển động</p>', '6500000', 1, 5, 2, NULL, NULL),
(5, 'Điều hòa Panasonic 2 chiều', 'a334.jpg', 100, '<p>BLDC INVERTER - TIẾT KIỆM ĐẾN 62% ĐIỆN NĂNG</p>\r\n\r\n<p>Điều h&ograve;a Nagakawa Inverter R2H12 sử dụng m&aacute;y n&eacute;n BLDC với động cơ biến tần một chiều kh&ocirc;ng chổi than c&oacute; nam ch&acirc;m tăng mạnh từ t&iacute;nh, gi&uacute;p tăng hiệu suất hoạt động cao hơn so với c&aacute;c m&aacute;y n&eacute;n thường.</p>\r\n\r\n<p>Với dải c&ocirc;ng suất hoạt động linh hoạt từ 18% - 128%, m&aacute;y sẽ điều tiết độ lạnh trong ph&ograve;ng bằng c&aacute;ch tăng dần c&ocirc;ng suất hoạt động của m&aacute;y n&eacute;n tới khi nhiệt độ đạt mức c&agrave;i đặt y&ecirc;u cầu sẽ tự giảm tốc độ chứ kh&ocirc;ng dừng hẳn. Từ đ&oacute;, hạn chế thất hoạt điện năng khi khởi động lại như c&aacute;c d&ograve;ng điều h&ograve;a mono.</p>', '7200000', 1, 4, 5, NULL, NULL),
(6, 'Smart Tivi Samsung Crystal UHD', 'a455.jpg', 22, '<p>Th&ocirc;ng tin chung</p>\r\n\r\n<p>Loại Tivi: Smart Tivi</p>\r\n\r\n<p>K&iacute;ch cỡ m&agrave;n h&igrave;nh: 50 inch</p>\r\n\r\n<p>Độ ph&acirc;n giải: 4K (Ultra HD)</p>', '16700000', 1, 2, 2, NULL, NULL),
(7, 'Máy in canon LBP 226dw', 'a780.jpg', 30, '<p>- Khổ giấy: A4/A5</p>\r\n\r\n<p>- In đảo mặt: Kh&ocirc;ng</p>\r\n\r\n<p>- Cổng giao tiếp: USB2.0</p>\r\n\r\n<p>- Dùng mực: HP 107A Blk Original Laser Toner Crtg_W1107A ~1000 bản in theo ti&ecirc;u chu&acirc;̉n Hãng Máy in laser đen trắng HP 107A - 4ZB77A</p>', '2450000', 1, 6, 7, NULL, NULL),
(8, 'Tủ lạnh LG Inverter 209 lít', 'a688.jpg', 17, '<p>✳️Ở Đ&Acirc;Y CH&Uacute;NG T&Ocirc;I B&Aacute;N GI&Aacute; TRỊ SỬ DỤNG, KH&Ocirc;NG B&Aacute;N GI&Aacute; TRỊ SẢN PHẨM!✳️</p>\r\n\r\n<p>Tổng kho h&agrave;ng điện tử lớn nhất miền bắc, uy t&iacute;n được x&acirc;y dựng trong 15 năm trong nghề nhập khẩu! Uy t&iacute;n đ&atilde; được đảm bảo qua h&agrave;ng vạn đơn h&agrave;ng tr&ecirc;n khắp cả nước</p>\r\n\r\n<p>Cam kết h&agrave;ng ch&iacute;nh h&atilde;ng loại 1 - Bảo h&agrave;nh - Lỗi 1 đổi 1 (Freeship đổi trả to&agrave;n quốc)</p>', '9800000', 1, 3, 3, NULL, NULL),
(9, 'Điều hòa 2 chiều', 'a591.jpg', 45, '<p>✅TH&Ocirc;NG SỐ KỸ THUẬT</p>\r\n\r\n<p>QUẠT TH&Aacute;P KH&Ocirc;NG C&Aacute;NH SD3</p>\r\n\r\n<p>- C&ocirc;ng suất: 80W</p>\r\n\r\n<p>- Điện &aacute;p: 220V/50Hz</p>\r\n\r\n<p>- Mức độ: 3 mức</p>\r\n\r\n<p>- Hẹn giờ: 12h</p>', '8700000', 1, 4, 5, NULL, NULL),
(10, 'Laptop Dell Latitude 3520', 'a943.jpg', 25, '<p>Th&ocirc;ng tin chung:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Series laptop Latitude\\nPart-number: L3420I5SSD</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>M&agrave;u sắc X&aacute;m</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thế hệ CPU: Core i5 , Intel Core thế hệ thứ 11</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>CPU: Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nh&acirc;n, 8 luồng )</p>', '16600000', 1, 1, 1, NULL, NULL),
(11, 'Loa Mini', 'a1132.jpg', 60, '<p>Sản phẩm Loa Bluetooth ch&iacute;nh h&atilde;ng 100% ️</p>\r\n\r\n<p>Bảo h&agrave;nh 1 năm, bao test , lỗi 1 đổi 1 l&ecirc;n tới 30 ng&agrave;y ️</p>\r\n\r\n<p>Miễn ph&iacute; đổi trả, bảo h&agrave;nh ph&aacute;t sinh nếu sản phẩm c&oacute; lỗi từ nh&agrave; sản xuất ️</p>\r\n\r\n<p>Hỗ trợ kỹ thuật trọn đời, tư vấn 24/7 nhanh ch&oacute;ng ️</p>\r\n\r\n<p>Miễn ph&iacute; vận chuyển - giao h&agrave;ng tận nh&agrave; to&agrave;n quốc</p>', '250000', 1, 7, 7, NULL, NULL),
(12, 'Máy Giặt Cửa Trên Panasonic', 'a1217.jpg', 32, '<p>1 . Ti&ecirc;u chuẩn ( Rửa sạch xả nước vắt kh&ocirc; ho&agrave;n to&agrave;n ) &ndash; Bấm CHƯƠNG TR&Igrave;NH m&agrave;n h&igrave;nh hiện số 1</p>\r\n\r\n<p>2. Nh&uacute;ng ( giặt v&agrave; xả ho&agrave;n to&agrave;n ) &ndash; Bấm CHƯƠNG TR&Igrave;NH m&agrave;n h&igrave;nh hiện số 2</p>\r\n\r\n<p>3. Giặt nhẹ - Bấm CHƯƠNG TR&Igrave;NH m&agrave;n h&igrave;nh hiện số 3.</p>\r\n\r\n<p>4. Giặt nhanh &ndash; Bấm CHƯƠNG TR&Igrave;NH m&agrave;n h&igrave;nh hiện số 4.</p>', '4500000', 1, 5, 5, NULL, NULL),
(13, 'Tủ lạnh SunHouse Inverter', 'a100.jpg', 40, '<p>Tủ lạnh chỉ tạo ra tiếng ồn 36 decibel, tương đối thấp, c&oacute; cửa mở 90 độ v&agrave; c&oacute; thể kết nối với ứng dụng Mijia c&oacute; hỗ trợ trợ l&yacute; ảo Xiao AI.</p>\r\n\r\n<p>Đ&uacute;ng như t&ecirc;n gọi, Tủ lạnh Mijia Side-by-side 610L c&oacute; dung t&iacute;ch 610 l&iacute;t, bao gồm ngăn đ&aacute; 227L v&agrave; ngăn lạnh 383L. C&oacute; tổng cộng 20 kệ, cộng với 4 kệ cho mỗi cửa đi.</p>', '6800000', 1, 3, 6, NULL, NULL),
(14, 'Máy lạnh đứng di động FUJIHOME', 'a843.jpg', 100, '<p>M&Aacute;Y LẠNH ĐỨNG DI ĐỘNG 4 TRONG 1 FUJIHOME PAC07, PAC09</p>\r\n\r\n<p>[L&agrave;m lạnh s&acirc;u - Lắp đặt dễ d&agrave;ng- Đầy đủ phụ kiện]</p>\r\n\r\n<p>✅ BẢO H&Agrave;NH H&Atilde;NG 24 TH&Aacute;NG TO&Agrave;N QUỐC✅</p>\r\n\r\n<p>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Diện t&iacute;ch sử dụng 20m2 &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</p>', '3400000', 1, 4, 7, NULL, NULL),
(15, 'Máy In Samsung ml1640', 'a1333.jpg', 77, '<p>*M&aacute;y in đơn h&agrave;ng TMĐT SP46 của Shoptida - Nhanh hơn in laser 7 lần, tiết kiệm hơn 30%</p>\r\n\r\n<p>Tặng k&egrave;m khay đựng trong m&aacute;y</p>', '4400000', 1, 6, 2, NULL, NULL),
(16, 'Máy ảnh LG Nikon Fujifilm', 'a1451.jpg', 33, '<p>&hearts;&hearts;M&ocirc; tả sản phẩm:</p>\r\n\r\n<p>1. T&ecirc;n: M&aacute;y ảnh phim chống thấm nước</p>\r\n\r\n<p>2. Chất liệu: nhựa ABS</p>\r\n\r\n<p>3. Ống k&iacute;nh: F / 8 28mm</p>\r\n\r\n<p>4. K&iacute;ch thước: 100 * 65 * 35mm</p>\r\n\r\n<p>5. M&agrave;n h&igrave;nh: 1/100 gi&acirc;y</p>\r\n\r\n<p>6. Trọng lượng: 145g</p>', '15000000', 1, 7, 7, NULL, NULL),
(17, 'Macbook Air M2 (2022)', 'a1535.jpg', 20, '<p>T&iacute;nh năng nổi bật</p>\r\n\r\n<p>&bull; Chip M2 do Apple thiết kế tạo ra một c&uacute; nhảy vọt về hiệu năng m&aacute;y học, CPU v&agrave; GPU</p>\r\n\r\n<p>&bull; Tăng thời gian sử dụng với thời lượng pin l&ecirc;n đến 18 giờ (1)</p>\r\n\r\n<p>&bull; CPU 8 l&otilde;i cho tốc độ nhanh hơn đến 3.5x, xử l&yacute; c&ocirc;ng việc nhanh ch&oacute;ng hơn bao giờ hết (2)</p>\r\n\r\n<p>&bull; GPU l&ecirc;n đến 7 l&otilde;i với tốc độ xử l&yacute; đồ họa nhanh hơn đến 5x cho c&aacute;c ứng dụng v&agrave; game đồ họa khủng (2)</p>', '46000000', 1, 1, 4, NULL, NULL),
(18, 'BẾP ĐÔI ĐIỆN TỪ HỒNG NGOẠI', 'a1699.jpg', 15, '<p>Th&ocirc;ng tin sản phẩm</p>\r\n\r\n<p>Th&ocirc;ng số kỹ thuật</p>\r\n\r\n<p>C&ocirc;ng suất 2200W&nbsp;</p>\r\n\r\n<p>&nbsp;Booster c&ocirc;ng suất cực đại 2200W</p>\r\n\r\n<p>&nbsp;Điện &aacute;p 220VAC&nbsp;</p>\r\n\r\n<p>Trọng lượng 5.98 kg&nbsp;</p>', '6600000', 1, 7, 6, NULL, NULL),
(19, 'Smart Tivi Xiaomi', 'a1754.jpg', 56, '<p>Th&ocirc;ng tin chung</p>\r\n\r\n<p>Loại Tivi: Smart Tivi</p>\r\n\r\n<p>K&iacute;ch cỡ m&agrave;n h&igrave;nh: 50 inch</p>\r\n\r\n<p>Độ ph&acirc;n giải: 4K (Ultra HD)</p>', '12200000', 1, 2, 7, NULL, NULL),
(20, 'Remote LG Giọng Nói', 'a1887.jpg', 120, '<p>K&iacute;ch thước: 15x4x1.2 cm</p>\r\n\r\n<p>C&acirc;n nặng: 90gram</p>\r\n\r\n<p>Pin AAA</p>\r\n\r\n<p>Khoảng c&aacute;ch sử dụng 10-12 M&eacute;t</p>', '160000', 1, 2, 3, NULL, NULL),
(21, 'Dell Laitude E7390', 'a1966.jpg', 55, '<p>M&agrave;u sắc nhất qu&aacute;n, rực rỡ: C&oacute; được độ phủ m&agrave;u rộng 100% sRGB, 100% Rec.709 v&agrave; 85% DCI-P3.</p>\r\n\r\n<p>C&ocirc;ng nghệ chuyển mạch trong mặt phẳng: Xem chất lượng h&igrave;nh ảnh v&agrave; m&agrave;u sắc nhất qu&aacute;n tr&ecirc;n g&oacute;c nh&igrave;n rộng 178/178 độ.</p>\r\n\r\n<p>Xem th&ecirc;m chi tiết: Trải nghiệm m&agrave;n h&igrave;nh r&otilde; n&eacute;t tuyệt đỉnh với độ ph&acirc;n giải Full HD 1920x1080 tr&ecirc;n m&agrave;n h&igrave;nh 15 inch n&agrave;y.</p>', '24000000', 1, 1, 1, NULL, NULL),
(22, 'Máy in Canon LBP 6200d', 'a2037.jpg', 28, '<p>🎯 SẢN PHẨM ĐƯỢC BẢO H&Agrave;NH TO&Agrave;N DIỆN TỪ HP VIỆT NAM</p>\r\n\r\n<p>- Tổng đ&agrave;i hỗ trợ kh&aacute;ch h&agrave;ng 24/7 : 1800588868</p>\r\n\r\n<p>- Bảo h&agrave;nh tận nh&agrave; miến ph&iacute; Giao &amp; Nhận (qu&yacute; kh&aacute;ch li&ecirc;n hệ Tổng đ&agrave;i để được tư vấn chi tiết)</p>\r\n\r\n<p>- Bảo h&agrave;nh cấp tốc Nhận lại ng&agrave;y kế tiếp (qu&yacute; kh&aacute;ch li&ecirc;n hệ Tổng đ&agrave;i để được tư vấn chi tiết)</p>\r\n\r\n<p>- Bảo h&agrave;nh VIP chỉ 30 ph&uacute;t (Qu&yacute; kh&aacute;ch li&ecirc;n hệ tổng đ&agrave;i để được tư vấn chi tiết)</p>', '7150000', 1, 6, 7, NULL, NULL),
(23, 'Máy lọc nước SunHouse', 'a2414.jpg', 46, '<p>&ndash; B&igrave;nh &aacute;p: Dung t&iacute;ch l&ecirc;n tới 8.5 l&iacute;t dự trữ lượng nước lớn lu&ocirc;n c&oacute; sẵn</p>\r\n\r\n<p>&ndash; Bơm h&uacute;t đẩy c&oacute; thể h&uacute;t bể &acirc;m độ s&acirc;u 2m v&agrave; đẩy khỏe 120-135 PSI gi&uacute;p cho qu&aacute; tr&igrave;nh lọc diễn ra nhanh hơn đạt hiệu quả cao hơn.</p>\r\n\r\n<p>&ndash; M&agrave;ng RO Dow nhập khẩu Ch&iacute;nh h&atilde;ng: Đối với 1 chiếc bơm khỏe th&igrave; cần phải c&oacute; một m&agrave;ng lọc tốt c&acirc;n xứng, M&agrave;ng RO đạt c&ocirc;ng xuất lọc 15L/H gấp đ&ocirc;i so với c&aacute;c m&aacute;y lọc th&ocirc;ng thường kh&aacute;c.</p>', '2200000', 1, 7, 6, NULL, NULL),
(24, 'Smart Tivi QLED Samsung', 'a2598.jpg', 34, '<p>Loại Tivi: Smart Tivi QLED</p>\r\n\r\n<p>K&iacute;ch cỡ m&agrave;n h&igrave;nh: 55 inch</p>\r\n\r\n<p>Độ ph&acirc;n giải: 4K (Ultra HD)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Loại m&agrave;n h&igrave;nh: LED nền (Full Array LED), VA LCD</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Tizen&trade;</p>', '19900000', 1, 2, 2, NULL, NULL),
(25, 'Máy giặt thông minh SunHouse', 'a2249.jpg', 14, '<p>M&aacute;y giặt mini b&aacute;n tự động, Dung t&iacute;ch 7L giặt nhanh sạch kh&ocirc;ng tốn điện nước.</p>\r\n\r\n<p>BẢO H&Agrave;NH 2 NĂM Gọn nhẹ để trong gia đ&igrave;nh, ph&ugrave; hợp với gia đ&igrave;nh c&oacute; trẻ nhỏ M&ocirc; phỏng động t&aacute;c giặt tay, nước xo&aacute;y đ&aacute;nh bật vết bẩn cứng đầu</p>', '3990000', 1, 5, 6, NULL, NULL),
(26, 'Quạt điều hòa Sunhouse', 'a2182.jpg', 72, '<p>Th&ocirc;ng số kỹ thuật</p>\r\n\r\n<p>- Điện &aacute;p: 220V-50Hz</p>\r\n\r\n<p>- C&ocirc;ng suất ti&ecirc;u thụ điện: 90W - 130W (tiết kiệm điện điện)</p>\r\n\r\n<p>- Lưu lượng gi&oacute;: 4500m3/h - Mortor Đồng</p>\r\n\r\n<p>- K&iacute;ch thước: 0.3 x 0.43 x 0.96 m; Khối lượng: 12 kg.</p>\r\n\r\n<p>- Thể t&iacute;ch b&igrave;nh chứa nước: 45L. (c&oacute; thể sử dụng đ&aacute; kh&ocirc; thay thế nước)</p>', '3200000', 1, 4, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_phone` varchar(255) NOT NULL,
  `shipping_email` varchar(255) NOT NULL,
  `shipping_notes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_notes`, `created_at`, `updated_at`) VALUES
(1, 'Phạm Ngọc Sâm', 'Hưng Yên', '0923473654', 'sam@gmail.com', 'giao hàng cẩn thận', NULL, NULL),
(2, 'Phạm Ngọc Sâm', 'Hưng Yên', '0923473654', 'sam@gmail.com', 'giao hàng cẩn thận', NULL, NULL),
(3, 'Phức', 'Ân Thi', '0238478268', 'phuc@gmail.com', 'hàng dễ vỡ', NULL, NULL),
(4, 'Phức', 'Ân Thi', '0238478268', 'phuc@gmail.com', 'giao hàng cẩn thận', NULL, NULL),
(5, 'Tùng', 'Ninh Bình', '0378628234', 'tung@gmail.com', 'không', NULL, NULL),
(6, 'Tùng', 'Ninh Bình', '0378628234', 'tung@gmail.com', 'không', NULL, NULL),
(7, 'Oanh', 'Bắc Giang', '0863645323', 'oanh@gmail.com', 'không', NULL, NULL),
(8, 'Oanh', 'Bắc Giang', '0863645323', 'oanh@gmail.com', 'k', NULL, NULL),
(9, 'Tùng', 'Ninh Bình', '0238478268', 'tung@gmail.com', 'không', NULL, NULL),
(10, 'Sâm', 'Hưng Yên', '0923473654', 'sam@gmail.com', 'không', NULL, NULL),
(11, 'Sam', 'Hung Yen', '0923473654', 'sam@gmail.com', 'dè', NULL, NULL),
(12, 'Tung', 'Ninh Binh', '0923473654', 'sam@gmail.com', 'j', NULL, NULL),
(13, 's', 's', 's', 's', 's', NULL, NULL),
(14, 'Phức', 'Hưng Yên', '0378628234', 'phuc@gmail.com', 'không', NULL, NULL),
(15, 'Sâm', 'Hưng Yên', '0378628234', 'sam@gmail.com', 'không', NULL, NULL),
(16, 'Sâm', 'Hưng Yên', '0923473654', 'sam@gmail.com', 'không', NULL, NULL),
(17, 'Sâm', 'Hưng Yên', '0923473654', 'sam@gmail.com', 'không', NULL, NULL),
(18, 'Sâm', 'Hung Yen', '0238478268', 'sam@gmail.com', 'd', NULL, NULL),
(19, 'Phức', 'Hưng Yên', '0378628234', 'phuc@gmail.com', 'khoong', NULL, NULL),
(20, 'Phức', 'Hưng Yên', '0923473654', 'phuc@gmail.com', 'khong', NULL, NULL),
(21, 'Phức', 'Hưng Yên', '0923473654', 'phuc@gmail.com', 'khong', NULL, NULL),
(22, 'Tình', 'Hà Nam', '0863645323', 'tinh@gmail.com', 'không', NULL, NULL),
(23, 'Tình', 'Hà Nam', '0863645323', 'tinh@gmail.com', 'không', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_address`, `user_phone`, `user_email`, `user_password`, `created_at`, `updated_at`) VALUES
(1, 'Sâm', 'Hưng Yên', '0327868622', 'sam@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(2, 'Tùng', 'Ninh Bình', '0123456789', 'tung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(3, 'Phức', 'Ân Thi', '0937468633', 'phuc@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(4, 'Nam', 'Hà Nội', '0465762344', 'nam@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(5, 'Tài', 'Nam Định', '0988775782', 'tai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(6, 'Oanh', 'Bắc Giang', '0978465733', 'oanh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(7, 'Tâm', 'Bắc Giang', '0123456789', 'tam@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(8, 'Tình', 'Hà Nam', '0678544555', 'tinh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_visitors`
--

CREATE TABLE `tbl_visitors` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `visit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_visitors`
--

INSERT INTO `tbl_visitors` (`id`, `ip_address`, `visit_date`) VALUES
(18, '::1', '2023-04-25 02:03:07'),
(19, '::1', '2023-04-25 02:03:08'),
(20, '::1', '2023-04-25 02:04:48'),
(21, '::1', '2023-04-25 02:04:49'),
(22, '::1', '2023-04-25 02:04:54'),
(23, '::1', '2023-04-25 02:04:55'),
(24, '::1', '2023-04-25 02:06:50'),
(25, '::1', '2023-04-25 02:06:50'),
(26, '::1', '2023-04-25 02:06:57'),
(27, '::1', '2023-04-25 02:06:57'),
(28, '::1', '2023-04-25 02:06:59'),
(29, '::1', '2023-04-25 02:07:00'),
(30, '::1', '2023-04-25 02:07:02'),
(31, '::1', '2023-04-25 02:07:03'),
(32, '::1', '2023-04-25 02:07:03'),
(33, '::1', '2023-04-25 02:07:03'),
(34, '::1', '2023-04-25 02:07:06'),
(35, '::1', '2023-04-25 02:07:06'),
(36, '::1', '2023-04-25 02:07:07'),
(37, '::1', '2023-04-25 02:07:07'),
(38, '::1', '2023-04-25 02:07:08'),
(39, '::1', '2023-04-25 02:07:08'),
(40, '::1', '2023-04-25 02:07:08'),
(41, '::1', '2023-04-25 02:07:09'),
(42, '::1', '2023-04-25 02:07:11'),
(43, '::1', '2023-04-25 02:07:11'),
(44, '::1', '2023-04-25 02:07:12'),
(45, '::1', '2023-04-25 02:07:12'),
(46, '::1', '2023-04-25 02:08:12'),
(47, '::1', '2023-04-25 02:08:13'),
(48, '::1', '2023-04-25 02:08:15'),
(49, '::1', '2023-04-25 02:08:16'),
(50, '::1', '2023-04-25 02:08:17'),
(51, '::1', '2023-04-25 02:08:17'),
(52, '::1', '2023-04-25 02:26:08'),
(53, '::1', '2023-04-25 02:26:09'),
(54, '::1', '2023-04-25 02:26:34'),
(55, '::1', '2023-04-25 02:26:35'),
(56, '::1', '2023-04-25 02:26:43'),
(57, '::1', '2023-04-25 02:26:44'),
(58, '::1', '2023-04-25 02:26:51'),
(59, '::1', '2023-04-25 02:26:52'),
(60, '::1', '2023-04-25 02:27:08'),
(61, '::1', '2023-04-25 02:27:09'),
(62, '::1', '2023-04-25 02:28:29'),
(63, '::1', '2023-04-25 02:28:29'),
(64, '::1', '2023-04-25 02:53:06'),
(65, '::1', '2023-04-25 02:53:07'),
(66, '::1', '2023-04-26 08:05:26'),
(67, '::1', '2023-04-26 08:05:27'),
(68, '::1', '2023-04-26 08:17:14'),
(69, '::1', '2023-04-26 08:17:16'),
(70, '::1', '2023-04-26 08:34:32'),
(71, '::1', '2023-04-26 08:34:33'),
(72, '::1', '2023-04-26 08:41:15'),
(73, '::1', '2023-04-26 08:41:16'),
(74, '::1', '2023-04-26 08:41:59'),
(75, '::1', '2023-04-26 08:42:01'),
(76, '::1', '2023-04-26 08:47:20'),
(77, '::1', '2023-04-26 08:47:21'),
(78, '::1', '2023-04-26 08:48:23'),
(79, '::1', '2023-04-26 08:48:25'),
(80, '::1', '2023-04-26 08:48:41'),
(81, '::1', '2023-04-26 08:48:42'),
(82, '::1', '2023-04-26 09:05:00'),
(83, '::1', '2023-04-26 09:05:01'),
(84, '::1', '2023-04-26 09:06:22'),
(85, '::1', '2023-04-26 09:06:46'),
(86, '::1', '2023-04-26 09:07:43'),
(87, '::1', '2023-04-26 09:07:45'),
(88, '::1', '2023-04-26 09:08:57'),
(89, '::1', '2023-04-26 09:08:58'),
(90, '::1', '2023-04-26 09:12:31'),
(91, '::1', '2023-04-26 09:12:32'),
(92, '::1', '2023-04-26 09:17:13'),
(93, '::1', '2023-04-26 09:17:14'),
(94, '::1', '2023-04-26 09:17:17'),
(95, '::1', '2023-04-26 09:17:18'),
(96, '::1', '2023-04-26 09:18:20'),
(97, '::1', '2023-04-26 09:18:22'),
(98, '::1', '2023-04-26 09:19:57'),
(99, '::1', '2023-04-26 09:19:59'),
(100, '::1', '2023-04-26 09:20:18'),
(101, '::1', '2023-04-26 09:20:19'),
(102, '::1', '2023-04-26 09:21:16'),
(103, '::1', '2023-04-26 09:21:17'),
(104, '::1', '2023-04-26 09:21:25'),
(105, '::1', '2023-04-26 09:21:26'),
(106, '::1', '2023-04-26 09:22:07'),
(107, '::1', '2023-04-26 09:22:08'),
(108, '::1', '2023-04-26 09:22:14'),
(109, '::1', '2023-04-26 09:22:15'),
(110, '::1', '2023-04-26 09:25:04'),
(111, '::1', '2023-04-26 09:25:05'),
(112, '::1', '2023-04-26 09:26:26'),
(113, '::1', '2023-04-26 09:26:27'),
(114, '::1', '2023-04-26 09:34:50'),
(115, '::1', '2023-04-26 09:34:51'),
(116, '::1', '2023-04-26 09:38:23'),
(117, '::1', '2023-04-26 09:38:25'),
(118, '::1', '2023-04-26 09:38:46'),
(119, '::1', '2023-04-26 09:38:48'),
(120, '::1', '2023-04-26 09:39:28'),
(121, '::1', '2023-04-26 09:39:30'),
(122, '::1', '2023-04-26 09:41:00'),
(123, '::1', '2023-04-26 09:41:02'),
(124, '::1', '2023-04-26 09:41:35'),
(125, '::1', '2023-04-26 09:41:36'),
(126, '::1', '2023-04-26 09:42:17'),
(127, '::1', '2023-04-26 09:42:19'),
(128, '::1', '2023-04-26 09:43:24'),
(129, '::1', '2023-04-26 09:43:26'),
(130, '::1', '2023-04-26 09:44:06'),
(131, '::1', '2023-04-26 09:44:08'),
(132, '::1', '2023-04-26 09:45:31'),
(133, '::1', '2023-04-26 09:45:32'),
(134, '::1', '2023-04-26 09:47:02'),
(135, '::1', '2023-04-26 09:47:03'),
(136, '::1', '2023-04-26 09:57:52'),
(137, '::1', '2023-04-26 09:57:53'),
(138, '::1', '2023-04-26 09:58:41'),
(139, '::1', '2023-04-26 09:58:42'),
(140, '::1', '2023-04-26 15:44:36'),
(141, '::1', '2023-04-26 15:44:37'),
(142, '::1', '2023-04-29 01:42:18'),
(143, '::1', '2023-04-29 01:42:19'),
(144, '::1', '2023-04-29 07:05:02'),
(145, '::1', '2023-04-29 07:05:03'),
(146, '::1', '2023-04-29 07:47:48'),
(147, '::1', '2023-04-29 07:47:48'),
(148, '::1', '2023-04-30 01:22:00'),
(149, '::1', '2023-04-30 01:22:00'),
(150, '::1', '2023-05-02 04:41:42'),
(151, '::1', '2023-05-02 04:41:43'),
(152, '::1', '2023-05-02 04:45:20'),
(153, '::1', '2023-05-02 04:45:21'),
(154, '::1', '2023-05-03 13:04:57'),
(155, '::1', '2023-05-03 13:04:58'),
(156, '::1', '2023-05-03 13:25:29'),
(157, '::1', '2023-05-03 13:25:30'),
(158, '::1', '2023-05-03 13:33:18'),
(159, '::1', '2023-05-03 13:33:19'),
(160, '::1', '2023-05-04 08:26:34'),
(161, '::1', '2023-05-04 08:26:35'),
(162, '::1', '2023-05-04 08:45:06'),
(163, '::1', '2023-05-04 08:45:07'),
(164, '::1', '2023-05-04 08:48:16'),
(165, '::1', '2023-05-04 08:48:17'),
(166, '::1', '2023-05-05 01:35:02'),
(167, '::1', '2023-05-05 01:35:03'),
(168, '::1', '2023-05-05 01:37:52'),
(169, '::1', '2023-05-05 01:37:52'),
(170, '::1', '2023-05-05 01:58:14'),
(171, '::1', '2023-05-05 01:58:15'),
(172, '::1', '2023-05-05 02:49:02'),
(173, '::1', '2023-05-05 02:49:03'),
(174, '::1', '2023-05-05 03:16:21'),
(175, '::1', '2023-05-05 03:16:21'),
(176, '::1', '2023-05-05 03:20:08'),
(177, '::1', '2023-05-05 03:20:09'),
(178, '::1', '2023-05-05 03:20:30'),
(179, '::1', '2023-05-05 03:20:31'),
(180, '::1', '2023-05-05 03:20:41'),
(181, '::1', '2023-05-05 03:20:42'),
(182, '::1', '2023-05-05 03:21:47'),
(183, '::1', '2023-05-05 03:21:48'),
(184, '::1', '2023-05-05 03:24:40'),
(185, '::1', '2023-05-05 03:24:41'),
(186, '::1', '2023-05-05 03:25:33'),
(187, '::1', '2023-05-05 03:25:34'),
(188, '::1', '2023-05-05 03:26:27'),
(189, '::1', '2023-05-05 03:26:28'),
(190, '::1', '2023-05-07 11:35:27'),
(191, '::1', '2023-05-07 11:35:28'),
(192, '::1', '2023-05-07 11:36:41'),
(193, '::1', '2023-05-07 11:36:42'),
(194, '::1', '2023-05-07 11:37:18'),
(195, '::1', '2023-05-07 11:37:19'),
(196, '::1', '2023-05-07 11:38:09'),
(197, '::1', '2023-05-07 11:38:10'),
(198, '::1', '2023-05-07 11:38:50'),
(199, '::1', '2023-05-07 11:38:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `tbl-brand`
--
ALTER TABLE `tbl-brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_producer`
--
ALTER TABLE `tbl_producer`
  ADD PRIMARY KEY (`producer_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl-brand`
--
ALTER TABLE `tbl-brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `tbl_producer`
--
ALTER TABLE `tbl_producer`
  MODIFY `producer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
