-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 06:05 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ayurvedha`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tbl_ doctor', 7, 'add_tbl_doctor'),
(26, 'Can change tbl_ doctor', 7, 'change_tbl_doctor'),
(27, 'Can delete tbl_ doctor', 7, 'delete_tbl_doctor'),
(28, 'Can view tbl_ doctor', 7, 'view_tbl_doctor'),
(29, 'Can add tbl_ product', 8, 'add_tbl_product'),
(30, 'Can change tbl_ product', 8, 'change_tbl_product'),
(31, 'Can delete tbl_ product', 8, 'delete_tbl_product'),
(32, 'Can view tbl_ product', 8, 'view_tbl_product'),
(33, 'Can add tbl_ shops', 9, 'add_tbl_shops'),
(34, 'Can change tbl_ shops', 9, 'change_tbl_shops'),
(35, 'Can delete tbl_ shops', 9, 'delete_tbl_shops'),
(36, 'Can view tbl_ shops', 9, 'view_tbl_shops'),
(37, 'Can add tbl_ user', 10, 'add_tbl_user'),
(38, 'Can change tbl_ user', 10, 'change_tbl_user'),
(39, 'Can delete tbl_ user', 10, 'delete_tbl_user'),
(40, 'Can view tbl_ user', 10, 'view_tbl_user'),
(41, 'Can add tbl_ staff', 11, 'add_tbl_staff'),
(42, 'Can change tbl_ staff', 11, 'change_tbl_staff'),
(43, 'Can delete tbl_ staff', 11, 'delete_tbl_staff'),
(44, 'Can view tbl_ staff', 11, 'view_tbl_staff'),
(45, 'Can add tbl_ order', 12, 'add_tbl_order'),
(46, 'Can change tbl_ order', 12, 'change_tbl_order'),
(47, 'Can delete tbl_ order', 12, 'delete_tbl_order'),
(48, 'Can view tbl_ order', 12, 'view_tbl_order'),
(49, 'Can add tbl_ appointment', 13, 'add_tbl_appointment'),
(50, 'Can change tbl_ appointment', 13, 'change_tbl_appointment'),
(51, 'Can delete tbl_ appointment', 13, 'delete_tbl_appointment'),
(52, 'Can view tbl_ appointment', 13, 'view_tbl_appointment'),
(53, 'Can add tbl_ enquiry', 14, 'add_tbl_enquiry'),
(54, 'Can change tbl_ enquiry', 14, 'change_tbl_enquiry'),
(55, 'Can delete tbl_ enquiry', 14, 'delete_tbl_enquiry'),
(56, 'Can view tbl_ enquiry', 14, 'view_tbl_enquiry'),
(57, 'Can add order_tb', 15, 'add_order_tb'),
(58, 'Can change order_tb', 15, 'change_order_tb'),
(59, 'Can delete order_tb', 15, 'delete_order_tb'),
(60, 'Can view order_tb', 15, 'view_order_tb'),
(61, 'Can add tbl_cart', 16, 'add_tbl_cart'),
(62, 'Can change tbl_cart', 16, 'change_tbl_cart'),
(63, 'Can delete tbl_cart', 16, 'delete_tbl_cart'),
(64, 'Can view tbl_cart', 16, 'view_tbl_cart'),
(65, 'Can add order_item_tb', 17, 'add_order_item_tb'),
(66, 'Can change order_item_tb', 17, 'change_order_item_tb'),
(67, 'Can delete order_item_tb', 17, 'delete_order_item_tb'),
(68, 'Can view order_item_tb', 17, 'view_order_item_tb'),
(69, 'Can add tbl_ list', 18, 'add_tbl_list'),
(70, 'Can change tbl_ list', 18, 'change_tbl_list'),
(71, 'Can delete tbl_ list', 18, 'delete_tbl_list'),
(72, 'Can view tbl_ list', 18, 'view_tbl_list');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_order_item_tb`
--

CREATE TABLE `ayurvedhaapp_order_item_tb` (
  `id` bigint(20) NOT NULL,
  `total` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `worker_email` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `cart_id_id` bigint(20) NOT NULL,
  `order_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `unit_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_order_item_tb`
--

INSERT INTO `ayurvedhaapp_order_item_tb` (`id`, `total`, `date`, `time`, `payment_status`, `worker_email`, `status`, `cart_id_id`, `order_id_id`, `product_id_id`, `unit_id_id`, `user_id_id`) VALUES
(9, '450', '2022-01-22', '14:03:36', 'paid', '', 'pending', 12, 5, 2, 1, 7),
(10, '250', '2022-01-22', '14:09:53', 'paid', '', 'pending', 13, 6, 1, 1, 7),
(11, '250', '2022-01-22', '15:52:23', 'paid', '', 'pending', 14, 7, 1, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_order_tb`
--

CREATE TABLE `ayurvedhaapp_order_tb` (
  `id` bigint(20) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `payment` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `total` varchar(30) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `cart_id` varchar(30) NOT NULL,
  `unit_id` varchar(30) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_order_tb`
--

INSERT INTO `ayurvedhaapp_order_tb` (`id`, `product_id`, `payment`, `date`, `time`, `total`, `payment_status`, `status`, `cart_id`, `unit_id`, `user_id_id`) VALUES
(1, '[1, 1, 1, 2]', '1250', '2022-01-22', '10:52:43', '', 'paid', 'pending', '[1, 2, 3, 4]', '[1, 1, 1, 1]', 7),
(2, '[1, 1, 1, 2]', '1250', '2022-01-22', '10:53:22', '', 'paid', 'pending', '[1, 2, 3, 4]', '[1, 1, 1, 1]', 7),
(3, '[1]', '250', '2022-01-22', '12:36:17', '', 'paid', 'pending', '[6]', '[1]', 7),
(4, '[1, 1, 1]', '650', '2022-01-22', '13:37:14', '', 'paid', 'pending', '[7, 8, 9]', '[1, 1, 1]', 7),
(5, '[2]', '450', '2022-01-22', '14:03:36', '', 'paid', 'pending', '[12]', '[1]', 7),
(6, '[1]', '250', '2022-01-22', '14:09:53', '', 'paid', 'pending', '[13]', '[1]', 7),
(7, '[1]', '250', '2022-01-22', '15:52:23', '', 'paid', 'pending', '[14]', '[1]', 7);

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_appointment`
--

CREATE TABLE `ayurvedhaapp_tbl_appointment` (
  `id` bigint(20) NOT NULL,
  `App_Time` varchar(300) NOT NULL,
  `App_Date` varchar(300) NOT NULL,
  `App_Link` varchar(300) NOT NULL,
  `App_Status` varchar(300) NOT NULL,
  `App_Doctor_ID_id` bigint(20) DEFAULT NULL,
  `App_User_ID_id` bigint(20) DEFAULT NULL,
  `App_List` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_appointment`
--

INSERT INTO `ayurvedhaapp_tbl_appointment` (`id`, `App_Time`, `App_Date`, `App_Link`, `App_Status`, `App_Doctor_ID_id`, `App_User_ID_id`, `App_List`) VALUES
(1, '10.00AM-11.00AM', '29-01-2021', '', 'Completed', 1, 2, 'userss/aa.jpg'),
(2, '9.00AM-10.00AM', '2021/10/21', '', 'Not Availabe', 1, 2, 'userss/bank2.jpg'),
(9, '3.00PM-4.00PM', '2022-01-26', 'https://meet.google.com/seh-xpzk-xcr', 'Completed', 4, 5, 'userss/apple_XvMynMg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_cart`
--

CREATE TABLE `ayurvedhaapp_tbl_cart` (
  `id` bigint(20) NOT NULL,
  `quantity` varchar(300) NOT NULL,
  `total` varchar(300) NOT NULL,
  `status` varchar(300) NOT NULL,
  `art_id_id` bigint(20) DEFAULT NULL,
  `buyer_id_id` bigint(20) DEFAULT NULL,
  `seller_id_id` bigint(20) DEFAULT NULL,
  `Order_Date` varchar(300) NOT NULL,
  `Order_Price` varchar(300) NOT NULL,
  `Order_Status` varchar(300) NOT NULL,
  `Staff_Email` varchar(300) NOT NULL,
  `Order_Payment_Status` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_cart`
--

INSERT INTO `ayurvedhaapp_tbl_cart` (`id`, `quantity`, `total`, `status`, `art_id_id`, `buyer_id_id`, `seller_id_id`, `Order_Date`, `Order_Price`, `Order_Status`, `Staff_Email`, `Order_Payment_Status`) VALUES
(9, '1', '200', 'paid', 1, 7, 1, '22 January 2022', '', 'finished', 'vinduja@ociuz.com', 'Pending'),
(12, '2', '400', 'paid', 2, 7, 1, '22 January 2022', '', 'finished', 'vinduja@ociuz.com', 'Pending'),
(13, '1', '200', 'paid', 1, 7, 1, '22 January 2022', '', 'Ordered', '', 'Pending'),
(14, '1', '200', 'paid', 1, 7, 1, '22 January 2022', '', 'Ordered', '', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_doctor`
--

CREATE TABLE `ayurvedhaapp_tbl_doctor` (
  `id` bigint(20) NOT NULL,
  `Dctr_Name` varchar(300) NOT NULL,
  `Dctr_Password` varchar(50) NOT NULL,
  `Dctr_Email` varchar(300) NOT NULL,
  `Dctr_Phone` varchar(300) NOT NULL,
  `Dctr_Department` varchar(300) NOT NULL,
  `Dctr_Place` varchar(300) NOT NULL,
  `Dctr_Photo` varchar(100) NOT NULL,
  `Dctr_Fee` varchar(300) NOT NULL,
  `Type` varchar(300) NOT NULL,
  `Dctr_Time` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_doctor`
--

INSERT INTO `ayurvedhaapp_tbl_doctor` (`id`, `Dctr_Name`, `Dctr_Password`, `Dctr_Email`, `Dctr_Phone`, `Dctr_Department`, `Dctr_Place`, `Dctr_Photo`, `Dctr_Fee`, `Type`, `Dctr_Time`) VALUES
(1, 'aiswarya', '123', 'aiswaryaas101@gmail.com', '9878474887', 'ortho', 'idukki', 'images/Capture1_WILnu0M.JPG', '250', 'Doctor', '10.00AM-11.00AM'),
(3, 'vinduja', '123', 'vinduja@gmail.com', '9847070320', 'ortho', 'kannur', 'images/Capture1_oa9F3Os.JPG', '200', 'Doctor', '11.30'),
(4, 'riya', '123', 'riya@gmail.com', '9847070320', 'ryrty', 'palakkad', 'images/Capture1_OMOLq7v.JPG', '200', 'Doctor', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_enquiry`
--

CREATE TABLE `ayurvedhaapp_tbl_enquiry` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(300) NOT NULL,
  `MobileNumber` varchar(50) NOT NULL,
  `Email` varchar(300) NOT NULL,
  `Message` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_enquiry`
--

INSERT INTO `ayurvedhaapp_tbl_enquiry` (`id`, `Name`, `MobileNumber`, `Email`, `Message`) VALUES
(1, 'fdfd', 'fdfdfd', 'gff@gmail.com', 'fdfdfd');

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_product`
--

CREATE TABLE `ayurvedhaapp_tbl_product` (
  `id` bigint(20) NOT NULL,
  `Pro_Name` varchar(300) NOT NULL,
  `Pro_Code` varchar(300) NOT NULL,
  `Pro_Description` varchar(300) NOT NULL,
  `Pro_Image` varchar(100) NOT NULL,
  `Pro_Price` varchar(300) NOT NULL,
  `Pro_Qty` varchar(300) NOT NULL,
  `Pro_Shop_ID_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_product`
--

INSERT INTO `ayurvedhaapp_tbl_product` (`id`, `Pro_Name`, `Pro_Code`, `Pro_Description`, `Pro_Image`, `Pro_Price`, `Pro_Qty`, `Pro_Shop_ID_id`) VALUES
(1, 'ashokarishtam', '9098', 'good for health', 'product/ab_PMaw0zj.jpg', '200', '30', 1),
(2, 'choornam', '125', 'good for fdhfhdfgd ', 'product/ab_PMaw0zj.jpg', '200', '25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_shops`
--

CREATE TABLE `ayurvedhaapp_tbl_shops` (
  `id` bigint(20) NOT NULL,
  `Shop_Name` varchar(300) NOT NULL,
  `Shop_Password` varchar(50) NOT NULL,
  `Shop_Email` varchar(300) NOT NULL,
  `Shop_Phone` varchar(300) NOT NULL,
  `Shop_License` varchar(300) NOT NULL,
  `Shop_Status` varchar(300) NOT NULL,
  `Shop_Place` varchar(300) NOT NULL,
  `Shop_Type` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_shops`
--

INSERT INTO `ayurvedhaapp_tbl_shops` (`id`, `Shop_Name`, `Shop_Password`, `Shop_Email`, `Shop_Phone`, `Shop_License`, `Shop_Status`, `Shop_Place`, `Shop_Type`) VALUES
(1, 'Kottakkal', '123', 'ociuztest@gmail.com', '9847070320', 'jhh12', 'Approved', 'thrissur', 'Shops');

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_staff`
--

CREATE TABLE `ayurvedhaapp_tbl_staff` (
  `id` bigint(20) NOT NULL,
  `Staff_Name` varchar(300) NOT NULL,
  `Staff_Password` varchar(50) NOT NULL,
  `Staff_Email` varchar(300) NOT NULL,
  `Staff_Phone` varchar(300) NOT NULL,
  `Staff_Type` varchar(300) NOT NULL,
  `Staff_Product_ID_id` bigint(20) DEFAULT NULL,
  `Staff_Shop_ID_id` bigint(20) DEFAULT NULL,
  `Staff_User_ID_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_staff`
--

INSERT INTO `ayurvedhaapp_tbl_staff` (`id`, `Staff_Name`, `Staff_Password`, `Staff_Email`, `Staff_Phone`, `Staff_Type`, `Staff_Product_ID_id`, `Staff_Shop_ID_id`, `Staff_User_ID_id`) VALUES
(1, 'h', '123', 'vinduja@ociuz.com', '9544981728', 'Staff', NULL, 1, NULL),
(2, 'fgtgert', '123', 'aa@gmail.com', 'trertetet', '', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ayurvedhaapp_tbl_user`
--

CREATE TABLE `ayurvedhaapp_tbl_user` (
  `id` bigint(20) NOT NULL,
  `User_Name` varchar(300) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `User_Email` varchar(300) NOT NULL,
  `User_Address` varchar(300) NOT NULL,
  `User_District` varchar(20) NOT NULL,
  `User_Phone` varchar(20) NOT NULL,
  `User_Type` varchar(20) NOT NULL,
  `User_Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ayurvedhaapp_tbl_user`
--

INSERT INTO `ayurvedhaapp_tbl_user` (`id`, `User_Name`, `User_Password`, `User_Email`, `User_Address`, `User_District`, `User_Phone`, `User_Type`, `User_Status`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', 'adminadmin', '', '', 'Admin', ''),
(2, 'anjali', '123', 'anj@gmail.com', 'rose villa', 'Thrissur', '9847070320', 'User', ''),
(3, 'vinduja ', '1234', 'v@gmail.com', 'rose villa', 'thrissur ', '6464946494', 'User', 'True'),
(5, 'vindu', '1234', 'vindu@gmail.com', 'Rose Villa', 'Thrissur', '9847070320', 'User', 'True'),
(6, 'vinduja ', '1234', 'hsh@gmail.com', 'sjs', 'hshsj', '9767679679', 'User', 'True'),
(7, 'vinduja', '1234', 'vindujavijayakumar333@gmail.com', 'hfhdh', 'thrissue', '9544985855', 'User', ''),
(8, 'vinduja', '123', 'vvvv@gmail.com', 'gdsgsdg', 'thrissue', '9544985855', 'User', '');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(17, 'ayurvedhaApp', 'order_item_tb'),
(15, 'ayurvedhaApp', 'order_tb'),
(13, 'ayurvedhaApp', 'tbl_appointment'),
(16, 'ayurvedhaApp', 'tbl_cart'),
(7, 'ayurvedhaApp', 'tbl_doctor'),
(14, 'ayurvedhaApp', 'tbl_enquiry'),
(18, 'ayurvedhaApp', 'tbl_list'),
(12, 'ayurvedhaApp', 'tbl_order'),
(8, 'ayurvedhaApp', 'tbl_product'),
(9, 'ayurvedhaApp', 'tbl_shops'),
(11, 'ayurvedhaApp', 'tbl_staff'),
(10, 'ayurvedhaApp', 'tbl_user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-12 05:49:26.786500'),
(2, 'auth', '0001_initial', '2021-10-12 05:49:41.884363'),
(3, 'admin', '0001_initial', '2021-10-12 05:49:47.450682'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-12 05:49:47.486684'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-12 05:49:47.520686'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-12 05:49:48.383735'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-12 05:49:48.769757'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-12 05:49:48.836761'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-12 05:49:48.854762'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-12 05:49:49.172780'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-12 05:49:49.216783'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-12 05:49:49.241784'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-12 05:49:49.349790'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-12 05:49:49.461797'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-10-12 05:49:49.746813'),
(16, 'auth', '0011_update_proxy_permissions', '2021-10-12 05:49:49.988827'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-10-12 05:49:50.151836'),
(18, 'ayurvedhaApp', '0001_initial', '2021-10-12 05:50:04.571661'),
(19, 'sessions', '0001_initial', '2021-10-12 05:50:06.643780'),
(20, 'ayurvedhaApp', '0002_remove_tbl_order_order_time', '2021-10-12 08:13:12.041836'),
(21, 'ayurvedhaApp', '0003_tbl_order_staff_email', '2021-10-12 10:27:00.541040'),
(22, 'ayurvedhaApp', '0004_tbl_enquiry', '2021-10-14 05:53:30.093845'),
(23, 'ayurvedhaApp', '0005_order_item_tb_order_tb_tbl_cart', '2022-01-22 04:29:04.519310'),
(24, 'ayurvedhaApp', '0006_auto_20220122_1348', '2022-01-22 08:18:48.692715'),
(25, 'ayurvedhaApp', '0007_auto_20220122_1400', '2022-01-22 08:31:09.829106'),
(26, 'ayurvedhaApp', '0008_tbl_cart_order_payment_status', '2022-01-22 08:39:26.631521'),
(27, 'ayurvedhaApp', '0009_remove_tbl_appointment_app_list', '2022-01-22 11:32:41.729087'),
(28, 'ayurvedhaApp', '0010_tbl_appointment_app_list', '2022-01-22 11:33:31.409928'),
(29, 'ayurvedhaApp', '0011_tbl_list', '2022-01-25 03:56:18.951862'),
(30, 'ayurvedhaApp', '0012_delete_tbl_list', '2022-01-25 04:04:07.317651'),
(31, 'ayurvedhaApp', '0013_remove_tbl_appointment_app_list', '2022-01-25 04:04:45.158816'),
(32, 'ayurvedhaApp', '0002_tbl_appointment_app_list', '2022-01-25 04:13:37.381257');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1qq2mnz6ez2r636eccuw5qwch17utluo', 'eyJpZCI6MX0:1md7XO:j1sJqZhgCfolUSP4ZNj4GSuzmLoLKBm2nZ--2JMk3aM', '2021-11-03 09:05:30.273726'),
('6y81cnd4vwhfn6ppowi8cifa2qhavjjh', 'e30:1mfJNT:Bbx-BaiOqUqbdlmci2-ZUSuU_3OtZRxocmp_Ud7BsgI', '2021-11-09 10:08:19.787330'),
('9bjyrjo8j4wuj93dilkywhv7crar76mm', 'e30:1mavlb:aTdkboex2DTSnB4k24gQifWB7pjxRAuFTsDe-M71G_Q', '2021-10-28 08:07:07.283402'),
('9qkza30j8sjdayhbihb66ggm89qdc064', 'e30:1nBDZi:G4JrTNlEOns8npVUA-CCxtGicBrPZe739B2rP5kpYFE', '2022-02-05 10:24:50.930250'),
('ciej0im5o2pqic2ky3hqqwd7b3iysa8u', 'eyJpZCI6MX0:1miXTL:3Z2ZqmJzSh-6grsDbXIc7EEXGsvfi1TFVIolfuonSWA', '2021-11-18 07:47:43.152980'),
('dl49olo2lbbrcx7jwda113vfu0sb6b4b', 'eyJpZCI6N30:1nA2gU:7RlHsAnYYeuB3dAtonYlGPEqh0_bf-_GpnOq__q5EAI', '2022-02-02 04:34:58.432223'),
('i7e1dho865hys06g45daql6xomdb1h4y', 'eyJpZCI6N30:1nB8Bf:D-uvZKxsDSnrx7Y5tutApuHR7BBBXngsa3-Tz_k1AIU', '2022-02-05 04:39:39.492734'),
('jnywqgt8l0d5mbiuon4z79gypbf5xdtc', 'e30:1n52Mr:5oEWKVc5x_YIuAAsQ8CWA5LZXuPdw7sbismpyixnibI', '2022-01-19 09:14:01.724393'),
('mps71nypy4zhcgeyjapod95putlylavg', 'eyJpZCI6MX0:1meEnV:wm8qKW9wt3MBw74AEe_SbXpZjhODN5FIynhFVUZDa64', '2021-11-06 11:02:45.731846'),
('nu69qyeo9vfgo8dnnbdhdnbr77d2c9h3', 'eyJpZCI6MX0:1mdomI:Twekjl3ugjMPWxhT4s-aUtzs4-JYxoB9_Y0nZ6ZRjAQ', '2021-11-05 07:15:46.969645'),
('uza39eliikqtwk93h5jztu3u3rqb2jd7', 'eyJpZCI6MX0:1mfIaQ:Jnd6Pp1f5SnhNuAQ2ZgbxmPKqXUOGO6suZEayEBeiEs', '2021-11-09 09:17:38.180360'),
('x8nzrc48kgvgvbar9izcqfta86lyv1xz', 'e30:1n7x95:VrYP9Aw_zuQ1E0Dztn-525Al2l_S9r7e1KioZ8iTNpo', '2022-01-27 10:15:51.826133'),
('xzq3qi41awq6x03h4kt164l0f0h4rd5p', 'eyJpZCI6MX0:1nBEeq:m89jSd1kxbReuT_W42CXoAqloUhWjoy8l_2_PYxi4V8', '2022-02-05 11:34:12.683289'),
('ypb2xe3og2w1u3q80w9vebkkv7tuy4p2', 'e30:1nCDyp:oHqULpjYa6qx-lCCKHYudXvxT4aeZ3Lg-xTOlaVLjOY', '2022-02-08 05:02:55.361860');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `ayurvedhaapp_order_item_tb`
--
ALTER TABLE `ayurvedhaapp_order_item_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ayurvedhaApp_order_i_cart_id_id_9d9c5e59_fk_ayurvedha` (`cart_id_id`),
  ADD KEY `ayurvedhaApp_order_i_order_id_id_c842e303_fk_ayurvedha` (`order_id_id`),
  ADD KEY `ayurvedhaApp_order_i_product_id_id_0dd8aee7_fk_ayurvedha` (`product_id_id`),
  ADD KEY `ayurvedhaApp_order_i_unit_id_id_ac70bd7a_fk_ayurvedha` (`unit_id_id`),
  ADD KEY `ayurvedhaApp_order_i_user_id_id_acd57469_fk_ayurvedha` (`user_id_id`);

--
-- Indexes for table `ayurvedhaapp_order_tb`
--
ALTER TABLE `ayurvedhaapp_order_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ayurvedhaApp_order_t_user_id_id_fab9aceb_fk_ayurvedha` (`user_id_id`);

--
-- Indexes for table `ayurvedhaapp_tbl_appointment`
--
ALTER TABLE `ayurvedhaapp_tbl_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ayurvedhaApp_tbl_app_App_Doctor_ID_id_f5ddf184_fk_ayurvedha` (`App_Doctor_ID_id`),
  ADD KEY `ayurvedhaApp_tbl_app_App_User_ID_id_06a8bb67_fk_ayurvedha` (`App_User_ID_id`);

--
-- Indexes for table `ayurvedhaapp_tbl_cart`
--
ALTER TABLE `ayurvedhaapp_tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ayurvedhaApp_tbl_car_art_id_id_8abcd506_fk_ayurvedha` (`art_id_id`),
  ADD KEY `ayurvedhaApp_tbl_car_buyer_id_id_612095b6_fk_ayurvedha` (`buyer_id_id`),
  ADD KEY `ayurvedhaApp_tbl_car_seller_id_id_de4193cf_fk_ayurvedha` (`seller_id_id`);

--
-- Indexes for table `ayurvedhaapp_tbl_doctor`
--
ALTER TABLE `ayurvedhaapp_tbl_doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ayurvedhaapp_tbl_enquiry`
--
ALTER TABLE `ayurvedhaapp_tbl_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ayurvedhaapp_tbl_product`
--
ALTER TABLE `ayurvedhaapp_tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ayurvedhaApp_tbl_pro_Pro_Shop_ID_id_9f876e58_fk_ayurvedha` (`Pro_Shop_ID_id`);

--
-- Indexes for table `ayurvedhaapp_tbl_shops`
--
ALTER TABLE `ayurvedhaapp_tbl_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ayurvedhaapp_tbl_staff`
--
ALTER TABLE `ayurvedhaapp_tbl_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ayurvedhaApp_tbl_sta_Staff_Product_ID_id_82fb95ff_fk_ayurvedha` (`Staff_Product_ID_id`),
  ADD KEY `ayurvedhaApp_tbl_sta_Staff_Shop_ID_id_ee9e1d42_fk_ayurvedha` (`Staff_Shop_ID_id`),
  ADD KEY `ayurvedhaApp_tbl_sta_Staff_User_ID_id_4b6fc6a6_fk_ayurvedha` (`Staff_User_ID_id`);

--
-- Indexes for table `ayurvedhaapp_tbl_user`
--
ALTER TABLE `ayurvedhaapp_tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_order_item_tb`
--
ALTER TABLE `ayurvedhaapp_order_item_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_order_tb`
--
ALTER TABLE `ayurvedhaapp_order_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_appointment`
--
ALTER TABLE `ayurvedhaapp_tbl_appointment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_cart`
--
ALTER TABLE `ayurvedhaapp_tbl_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_doctor`
--
ALTER TABLE `ayurvedhaapp_tbl_doctor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_enquiry`
--
ALTER TABLE `ayurvedhaapp_tbl_enquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_product`
--
ALTER TABLE `ayurvedhaapp_tbl_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_shops`
--
ALTER TABLE `ayurvedhaapp_tbl_shops`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_staff`
--
ALTER TABLE `ayurvedhaapp_tbl_staff`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ayurvedhaapp_tbl_user`
--
ALTER TABLE `ayurvedhaapp_tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ayurvedhaapp_order_item_tb`
--
ALTER TABLE `ayurvedhaapp_order_item_tb`
  ADD CONSTRAINT `ayurvedhaApp_order_i_cart_id_id_9d9c5e59_fk_ayurvedha` FOREIGN KEY (`cart_id_id`) REFERENCES `ayurvedhaapp_tbl_cart` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_order_i_order_id_id_c842e303_fk_ayurvedha` FOREIGN KEY (`order_id_id`) REFERENCES `ayurvedhaapp_order_tb` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_order_i_product_id_id_0dd8aee7_fk_ayurvedha` FOREIGN KEY (`product_id_id`) REFERENCES `ayurvedhaapp_tbl_product` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_order_i_unit_id_id_ac70bd7a_fk_ayurvedha` FOREIGN KEY (`unit_id_id`) REFERENCES `ayurvedhaapp_tbl_shops` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_order_i_user_id_id_acd57469_fk_ayurvedha` FOREIGN KEY (`user_id_id`) REFERENCES `ayurvedhaapp_tbl_user` (`id`);

--
-- Constraints for table `ayurvedhaapp_order_tb`
--
ALTER TABLE `ayurvedhaapp_order_tb`
  ADD CONSTRAINT `ayurvedhaApp_order_t_user_id_id_fab9aceb_fk_ayurvedha` FOREIGN KEY (`user_id_id`) REFERENCES `ayurvedhaapp_tbl_user` (`id`);

--
-- Constraints for table `ayurvedhaapp_tbl_appointment`
--
ALTER TABLE `ayurvedhaapp_tbl_appointment`
  ADD CONSTRAINT `ayurvedhaApp_tbl_app_App_Doctor_ID_id_f5ddf184_fk_ayurvedha` FOREIGN KEY (`App_Doctor_ID_id`) REFERENCES `ayurvedhaapp_tbl_doctor` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_tbl_app_App_User_ID_id_06a8bb67_fk_ayurvedha` FOREIGN KEY (`App_User_ID_id`) REFERENCES `ayurvedhaapp_tbl_user` (`id`);

--
-- Constraints for table `ayurvedhaapp_tbl_cart`
--
ALTER TABLE `ayurvedhaapp_tbl_cart`
  ADD CONSTRAINT `ayurvedhaApp_tbl_car_art_id_id_8abcd506_fk_ayurvedha` FOREIGN KEY (`art_id_id`) REFERENCES `ayurvedhaapp_tbl_product` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_tbl_car_buyer_id_id_612095b6_fk_ayurvedha` FOREIGN KEY (`buyer_id_id`) REFERENCES `ayurvedhaapp_tbl_user` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_tbl_car_seller_id_id_de4193cf_fk_ayurvedha` FOREIGN KEY (`seller_id_id`) REFERENCES `ayurvedhaapp_tbl_shops` (`id`);

--
-- Constraints for table `ayurvedhaapp_tbl_product`
--
ALTER TABLE `ayurvedhaapp_tbl_product`
  ADD CONSTRAINT `ayurvedhaApp_tbl_pro_Pro_Shop_ID_id_9f876e58_fk_ayurvedha` FOREIGN KEY (`Pro_Shop_ID_id`) REFERENCES `ayurvedhaapp_tbl_shops` (`id`);

--
-- Constraints for table `ayurvedhaapp_tbl_staff`
--
ALTER TABLE `ayurvedhaapp_tbl_staff`
  ADD CONSTRAINT `ayurvedhaApp_tbl_sta_Staff_Product_ID_id_82fb95ff_fk_ayurvedha` FOREIGN KEY (`Staff_Product_ID_id`) REFERENCES `ayurvedhaapp_tbl_product` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_tbl_sta_Staff_Shop_ID_id_ee9e1d42_fk_ayurvedha` FOREIGN KEY (`Staff_Shop_ID_id`) REFERENCES `ayurvedhaapp_tbl_shops` (`id`),
  ADD CONSTRAINT `ayurvedhaApp_tbl_sta_Staff_User_ID_id_4b6fc6a6_fk_ayurvedha` FOREIGN KEY (`Staff_User_ID_id`) REFERENCES `ayurvedhaapp_tbl_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
