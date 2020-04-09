---Ch?nh s?a l?n 1---

CREATE TABLE BAOCAO (
  [MABC] int NOT NULL,
  [NGAYLAP] date DEFAULT NULL,
  [TUNGAY] date DEFAULT NULL,
  [DENNGAY] date DEFAULT NULL,
  [MANV] int DEFAULT NULL,
  [TONGDOANHTHU] decimal(38,0) DEFAULT NULL,
  [NOIDUNG] varchar(255) DEFAULT NULL,
  [CHUTHICH] varchar(255) DEFAULT NULL
);

INSERT INTO baocao ([MABC], [NGAYLAP], [TUNGAY], [DENNGAY], [MANV], [TONGDOANHTHU], [NOIDUNG], [CHUTHICH]) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

CREATE TABLE CACHIEU (
  [MACC] int NOT NULL,
  [NGAYCHIEU] date DEFAULT NULL,
  [GIOBD] time(0) DEFAULT NULL,
  [GIOKT] time(0) DEFAULT NULL,
  [MAPHIM] int DEFAULT NULL,
  [MAPC] int DEFAULT NULL
);


INSERT INTO cachieu ([MACC], [NGAYCHIEU], [GIOBD], [GIOKT], [MAPHIM], [MAPC]) VALUES
(6, '2019-06-24', '13:37:34', '15:17:34', 3, 1),
(7, '2019-06-23', '16:37:54', '19:37:54', 4, 2),
(8, '2019-06-23', '18:38:21', '20:18:21', 5, 3),
(9, '2019-06-23', '08:38:36', '10:38:36', 6, 2),
(10, '2019-06-23', '05:38:48', '07:28:48', 7, 1),
(11, '2019-06-23', '19:39:09', '22:09:09', 8, 2),
(12, '2019-06-23', '10:39:21', '00:29:21', 9, 2),
(13, '2019-06-23', '22:39:36', '00:19:36', 10, 2),
(14, '2019-06-23', '21:39:49', '23:39:49', 11, 1),
(15, '2019-07-10', '11:42:49', '13:45:49', 2, 1),
(16, '2019-07-08', '10:19:37', '00:22:37', 2, 3);

-- --------------------------------------------------------



CREATE TABLE CTSP (
  [SOHD] int NOT NULL,
  [MASP] int NOT NULL,
  [SL] int DEFAULT NULL,
  [TONGGIA] decimal(38,0) DEFAULT NULL,
  [MAKM] int DEFAULT NULL
);



INSERT INTO ctsp ([SOHD], [MASP], [SL], [TONGGIA], [MAKM]) VALUES
(3, 3, 2, '100000', NULL),
(4, 2, 1, '45000', NULL),
(4, 3, 1, '50000', NULL),
(5, 3, 1, '50000', NULL),
(6, 3, 1, '50000', NULL),
(6, 4, 1, '20000', NULL),
(7, 3, 1, '50000', NULL),
(8, 3, 1, '25000', 2),
(8, 4, 1, '10000', 2);

--
----Ch?a th�m v�o
--
CREATE TRIGGER [Delete_CTSP] ON [ctsp] AFTER DELETE  AS UPDATE HOADON SET hoadon.TONGTIEN = hoadon.TONGTIEN - OLD.TONGGIA WHERE hoadon.SOHD = OLD.SOHD
$$
CREATE TRIGGER [insert_CTSP] ON [ctsp] AFTER INSERT  AS UPDATE HOADON SET hoadon.TONGTIEN = hoadon.TONGTIEN + NEw.TongGia WHERE hoadon.SOHD = NEW.SOHD
$$

-- --------------------------------------------------------

CREATE TABLE CTTB (
  [MATB] int NOT NULL,
  [MAPC] int NOT NULL,
  [SL] int DEFAULT NULL
)   ;


INSERT INTO CTTB ([MATB], [MAPC], [SL]) VALUES
(1, 2, 125);

-- --------------------------------------------------------

CREATE TABLE CTVE (
  [SOHD] int NOT NULL,
  [MACC] int NOT NULL,
  [MAGHE] varchar(10) NOT NULL,
  [MAKM] int DEFAULT NULL,
  [TRIGIA] decimal(38,0) NOT NULL
);

--

INSERT INTO ctve ([SOHD], [MACC], [MAGHE], [MAKM], [TRIGIA]) VALUES
(3, 6, '1G5', NULL, '45000'),
(3, 6, '1G7', NULL, '45000'),
(4, 6, '1F8', NULL, '45000'),
(4, 6, '1G9', NULL, '45000'),
(5, 6, '1H8', NULL, '45000'),
(5, 6, '1J9', NULL, '45000'),
(6, 6, '1G8', NULL, '45000'),
(7, 6, '1H7', NULL, '45000'),
(7, 6, '1I7', NULL, '45000'),
(8, 6, '1I6', 2, '22500');

--
-----Ch?a th�m
--
CREATE TRIGGER [Delete_CTVE] ON [ctve] AFTER DELETE  AS UPDATE HOADON SET hoadon.TONGTIEN = hoadon.TONGTIEN - OLD.TRIGIA WHERE hoadon.SOHD = OLD.SOHD
$$
CREATE TRIGGER [INS_CTVE] ON [ctve] INSTEAD OF INSERT  AS UPDATE HOADON SET  hoadon.TONGTIEN = hoadon.TONGTIEN + NEW.TRIGIA WHERE hoadon.SOHD = NEW.SOHD
$$

-- --------------------------------------------------------


CREATE TABLE GHE (
  [MAGHE] varchar(10) NOT NULL,
  [HANG] varchar(2) DEFAULT NULL,
  [COT] varchar(2) DEFAULT NULL,
  [MAPC] int DEFAULT NULL,
  [GIA] int DEFAULT NULL,
  [LOAIGHE] varchar(10) DEFAULT NULL
) ;

INSERT INTO ghe ([MAGHE], [HANG], [COT], [MAPC], [GIA], [LOAIGHE]) VALUES
('1A0', 'A', '0', 1, 45000, 'Th??ng'),
('1A1', 'A', '1', 1, 45000, 'Th??ng'),
('1A2', 'A', '2', 1, 45000, 'Th??ng'),
('1A3', 'A', '3', 1, 45000, 'Th??ng'),
('1A4', 'A', '4', 1, 45000, 'Th??ng'),
('1A5', 'A', '5', 1, 45000, 'Th??ng'),
('1A6', 'A', '6', 1, 45000, 'Th??ng'),
('1A7', 'A', '7', 1, 45000, 'Th??ng'),
('1A8', 'A', '8', 1, 45000, 'Th??ng'),
('1A9', 'A', '9', 1, 45000, 'Th??ng'),
('1B0', 'B', '0', 1, 45000, 'Th??ng'),
('1B1', 'B', '1', 1, 45000, 'Th??ng'),
('1B2', 'B', '2', 1, 45000, 'Th??ng'),
('1B3', 'B', '3', 1, 45000, 'Th??ng'),
('1B4', 'B', '4', 1, 45000, 'Th??ng'),
('1B5', 'B', '5', 1, 45000, 'Th??ng'),
('1B6', 'B', '6', 1, 45000, 'Th??ng'),
('1B7', 'B', '7', 1, 45000, 'Th??ng'),
('1B8', 'B', '8', 1, 45000, 'Th??ngg'),
('1B9', 'B', '9', 1, 45000, 'Th??ng'),
('1C0', 'C', '0', 1, 45000, 'Th??ng'),
('1C1', 'C', '1', 1, 45000, 'Th??ng'),
('1C2', 'C', '2', 1, 45000, 'Th??ng'),
('1C3', 'C', '3', 1, 45000, 'Th??ng'),
('1C4', 'C', '4', 1, 45000, 'Th??ng'),
('1C5', 'C', '5', 1, 45000, 'Th??ng'),
('1C6', 'C', '6', 1, 45000, 'Th??ng'),
('1C7', 'C', '7', 1, 45000, 'Th??ng'),
('1C8', 'C', '8', 1, 45000, 'Th??ng'),
('1C9', 'C', '9', 1, 45000, 'Th??ng'),
('1D0', 'D', '0', 1, 45000, 'Th??ng'),
('1D1', 'D', '1', 1, 45000, 'Th??ng'),
('1D2', 'D', '2', 1, 45000, 'Th??ng'),
('1D3', 'D', '3', 1, 45000, 'Th??ng'),
('1D4', 'D', '4', 1, 45000, 'Th??ng'),
('1D5', 'D', '5', 1, 45000, 'Th??ng'),
('1D6', 'D', '6', 1, 45000, 'Th??ng'),
('1D7', 'D', '7', 1, 45000, 'Th??ng'),
('1D8', 'D', '8', 1, 45000, 'Th??ng'),
('1D9', 'D', '9', 1, 45000, 'Th??ng'),
('1E0', 'E', '0', 1, 45000, 'Th??ng'),
('1E1', 'E', '1', 1, 45000, 'Th??ng'),
('1E2', 'E', '2', 1, 45000, 'Th??ng'),
('1E3', 'E', '3', 1, 45000, 'Th??ng'),
('1E4', 'E', '4', 1, 45000, 'Th??ng'),
('1E5', 'E', '5', 1, 45000, 'Thường'),
('1E6', 'E', '6', 1, 45000, 'Thường'),
('1E7', 'E', '7', 1, 45000, 'Thường'),
('1E8', 'E', '8', 1, 45000, 'Thường'),
('1E9', 'E', '9', 1, 45000, 'Thường'),
('1F0', 'F', '0', 1, 45000, 'Thường'),
('1F1', 'F', '1', 1, 45000, 'Thường'),
('1F2', 'F', '2', 1, 45000, 'Thường'),
('1F3', 'F', '3', 1, 45000, 'Thường'),
('1F4', 'F', '4', 1, 45000, 'Thường'),
('1F5', 'F', '5', 1, 45000, 'Thường'),
('1F6', 'F', '6', 1, 45000, 'Thường'),
('1F7', 'F', '7', 1, 45000, 'Thường'),
('1F8', 'F', '8', 1, 45000, 'Thường'),
('1F9', 'F', '9', 1, 45000, 'Thường'),
('1G0', 'G', '0', 1, 45000, 'Thường'),
('1G1', 'G', '1', 1, 45000, 'Thường'),
('1G2', 'G', '2', 1, 45000, 'Thường'),
('1G3', 'G', '3', 1, 45000, 'Thường'),
('1G4', 'G', '4', 1, 45000, 'Thường'),
('1G5', 'G', '5', 1, 45000, 'Thường'),
('1G6', 'G', '6', 1, 45000, 'Thường'),
('1G7', 'G', '7', 1, 45000, 'Thường'),
('1G8', 'G', '8', 1, 45000, 'Thường'),
('1G9', 'G', '9', 1, 45000, 'Thường'),
('1H0', 'H', '0', 1, 45000, 'Thường'),
('1H1', 'H', '1', 1, 45000, 'Thường'),
('1H2', 'H', '2', 1, 45000, 'Thường'),
('1H3', 'H', '3', 1, 45000, 'Thường'),
('1H4', 'H', '4', 1, 45000, 'Thường'),
('1H5', 'H', '5', 1, 45000, 'Thường'),
('1H6', 'H', '6', 1, 45000, 'Thường'),
('1H7', 'H', '7', 1, 45000, 'Thường'),
('1H8', 'H', '8', 1, 45000, 'Thường'),
('1H9', 'H', '9', 1, 45000, 'Thường'),
('1I0', 'I', '0', 1, 45000, 'Thường'),
('1I1', 'I', '1', 1, 45000, 'Thường'),
('1I2', 'I', '2', 1, 45000, 'Thường'),
('1I3', 'I', '3', 1, 45000, 'Thường'),
('1I4', 'I', '4', 1, 45000, 'Thường'),
('1I5', 'I', '5', 1, 45000, 'Thường'),
('1I6', 'I', '6', 1, 45000, 'Thường'),
('1I7', 'I', '7', 1, 45000, 'Thường'),
('1I8', 'I', '8', 1, 45000, 'Thường'),
('1I9', 'I', '9', 1, 45000, 'Thường'),
('1J0', 'J', '0', 1, 45000, 'Thường'),
('1J1', 'J', '1', 1, 45000, 'Thường'),
('1J2', 'J', '2', 1, 45000, 'Thường'),
('1J3', 'J', '3', 1, 45000, 'Thường'),
('1J4', 'J', '4', 1, 45000, 'Thường'),
('1J5', 'J', '5', 1, 45000, 'Thường'),
('1J6', 'J', '6', 1, 45000, 'Thường'),
('1J7', 'J', '7', 1, 45000, 'Thường'),
('1J8', 'J', '8', 1, 45000, 'Thường'),
('1J9', 'J', '9', 1, 45000, 'Thường'),
('2A0', 'A', '0', 2, 45000, 'Thường'),
('2A1', 'A', '1', 2, 45000, 'Thường'),
('2A2', 'A', '2', 2, 45000, 'Thường'),
('2A3', 'A', '3', 2, 45000, 'Thường'),
('2A4', 'A', '4', 2, 45000, 'Thường'),
('2A5', 'A', '5', 2, 45000, 'Thường'),
('2A6', 'A', '6', 2, 45000, 'Thường'),
('2A7', 'A', '7', 2, 45000, 'Thường'),
('2A8', 'A', '8', 2, 45000, 'Thường'),
('2A9', 'A', '9', 2, 45000, 'Thường'),
('2B0', 'B', '0', 2, 45000, 'Thường'),
('2B1', 'B', '1', 2, 45000, 'Thường'),
('2B2', 'B', '2', 2, 45000, 'Thường'),
('2B3', 'B', '3', 2, 45000, 'Thường'),
('2B4', 'B', '4', 2, 45000, 'Thường'),
('2B5', 'B', '5', 2, 45000, 'Thường'),
('2B6', 'B', '6', 2, 45000, 'Thường'),
('2B7', 'B', '7', 2, 45000, 'Thường'),
('2B8', 'B', '8', 2, 45000, 'Thường'),
('2B9', 'B', '9', 2, 45000, 'Thường'),
('2C0', 'C', '0', 2, 45000, 'Thường'),
('2C1', 'C', '1', 2, 45000, 'Thường'),
('2C2', 'C', '2', 2, 45000, 'Thường'),
('2C3', 'C', '3', 2, 45000, 'Thường'),
('2C4', 'C', '4', 2, 45000, 'Thường'),
('2C5', 'C', '5', 2, 45000, 'Thường'),
('2C6', 'C', '6', 2, 45000, 'Thường'),
('2C7', 'C', '7', 2, 45000, 'Thường'),
('2C8', 'C', '8', 2, 45000, 'Thường'),
('2C9', 'C', '9', 2, 45000, 'Thường'),
('2D0', 'D', '0', 2, 45000, 'Thường'),
('2D1', 'D', '1', 2, 45000, 'Thường'),
('2D2', 'D', '2', 2, 45000, 'Thường'),
('2D3', 'D', '3', 2, 45000, 'Thường'),
('2D4', 'D', '4', 2, 45000, 'Thường'),
('2D5', 'D', '5', 2, 45000, 'Thường'),
('2D6', 'D', '6', 2, 45000, 'Thường'),
('2D7', 'D', '7', 2, 45000, 'Thường'),
('2D8', 'D', '8', 2, 45000, 'Thường'),
('2D9', 'D', '9', 2, 45000, 'Thường'),
('2E0', 'E', '0', 2, 45000, 'Thường'),
('2E1', 'E', '1', 2, 45000, 'Thường'),
('2E2', 'E', '2', 2, 45000, 'Thường'),
('2E3', 'E', '3', 2, 45000, 'Thường'),
('2E4', 'E', '4', 2, 45000, 'Thường'),
('2E5', 'E', '5', 2, 45000, 'Thường'),
('2E6', 'E', '6', 2, 45000, 'Thường'),
('2E7', 'E', '7', 2, 45000, 'Thường'),
('2E8', 'E', '8', 2, 45000, 'Thường'),
('2E9', 'E', '9', 2, 45000, 'Thường'),
('2F0', 'F', '0', 2, 45000, 'Thường'),
('2F1', 'F', '1', 2, 45000, 'Thường'),
('2F2', 'F', '2', 2, 45000, 'Thường'),
('2F3', 'F', '3', 2, 45000, 'Thường'),
('2F4', 'F', '4', 2, 45000, 'Thường'),
('2F5', 'F', '5', 2, 45000, 'Thường'),
('2F6', 'F', '6', 2, 45000, 'Thường'),
('2F7', 'F', '7', 2, 45000, 'Thường'),
('2F8', 'F', '8', 2, 45000, 'Thường'),
('2F9', 'F', '9', 2, 45000, 'Thường'),
('2G0', 'G', '0', 2, 45000, 'Thường'),
('2G1', 'G', '1', 2, 45000, 'Thường'),
('2G2', 'G', '2', 2, 45000, 'Thường'),
('2G3', 'G', '3', 2, 45000, 'Thường'),
('2G4', 'G', '4', 2, 45000, 'Thường'),
('2G5', 'G', '5', 2, 45000, 'Thường'),
('2G6', 'G', '6', 2, 45000, 'Thường'),
('2G7', 'G', '7', 2, 45000, 'Thường'),
('2G8', 'G', '8', 2, 45000, 'Thường'),
('2G9', 'G', '9', 2, 45000, 'Thường'),
('2H0', 'H', '0', 2, 45000, 'Thường'),
('2H1', 'H', '1', 2, 45000, 'Thường'),
('2H2', 'H', '2', 2, 45000, 'Thường'),
('2H3', 'H', '3', 2, 45000, 'Thường'),
('2H4', 'H', '4', 2, 45000, 'Thường'),
('2H5', 'H', '5', 2, 45000, 'Thường'),
('2H6', 'H', '6', 2, 45000, 'Thường'),
('2H7', 'H', '7', 2, 45000, 'Thường'),
('2H8', 'H', '8', 2, 45000, 'Thường'),
('2H9', 'H', '9', 2, 45000, 'Thường'),
('2I0', 'I', '0', 2, 45000, 'Thường'),
('2I1', 'I', '1', 2, 45000, 'Thường'),
('2I2', 'I', '2', 2, 45000, 'Thường'),
('2I3', 'I', '3', 2, 45000, 'Thường'),
('2I4', 'I', '4', 2, 45000, 'Thường'),
('2I5', 'I', '5', 2, 45000, 'Thường'),
('2I6', 'I', '6', 2, 45000, 'Thường'),
('2I7', 'I', '7', 2, 45000, 'Thường'),
('2I8', 'I', '8', 2, 45000, 'Thường'),
('2I9', 'I', '9', 2, 45000, 'Thường'),
('2J0', 'J', '0', 2, 45000, 'Thường'),
('2J1', 'J', '1', 2, 45000, 'Thường'),
('2J2', 'J', '2', 2, 45000, 'Thường'),
('2J3', 'J', '3', 2, 45000, 'Thường'),
('2J4', 'J', '4', 2, 45000, 'Thường'),
('2J5', 'J', '5', 2, 45000, 'Thường'),
('2J6', 'J', '6', 2, 45000, 'Thường'),
('2J7', 'J', '7', 2, 45000, 'Thường'),
('2J8', 'J', '8', 2, 45000, 'Thường'),
('2J9', 'J', '9', 2, 45000, 'Thường'),
('3A0', 'A', '0', 3, 45000, 'Thường'),
('3A1', 'A', '1', 3, 45000, 'Thường'),
('3A2', 'A', '2', 3, 45000, 'Thường'),
('3A3', 'A', '3', 3, 45000, 'Thường'),
('3A4', 'A', '4', 3, 45000, 'Thường'),
('3A5', 'A', '5', 3, 45000, 'Thường'),
('3A6', 'A', '6', 3, 45000, 'Thường'),
('3A7', 'A', '7', 3, 45000, 'Thường'),
('3A8', 'A', '8', 3, 45000, 'Thường'),
('3A9', 'A', '9', 3, 45000, 'Thường'),
('3B0', 'B', '0', 3, 45000, 'Thường'),
('3B1', 'B', '1', 3, 45000, 'Thường'),
('3B2', 'B', '2', 3, 45000, 'Thường'),
('3B3', 'B', '3', 3, 45000, 'Thường'),
('3B4', 'B', '4', 3, 45000, 'Thường'),
('3B5', 'B', '5', 3, 45000, 'Thường'),
('3B6', 'B', '6', 3, 45000, 'Thường'),
('3B7', 'B', '7', 3, 45000, 'Thường'),
('3B8', 'B', '8', 3, 45000, 'Thường'),
('3B9', 'B', '9', 3, 45000, 'Thường'),
('3C0', 'C', '0', 3, 45000, 'Thường'),
('3C1', 'C', '1', 3, 45000, 'Thường'),
('3C2', 'C', '2', 3, 45000, 'Thường'),
('3C3', 'C', '3', 3, 45000, 'Thường'),
('3C4', 'C', '4', 3, 45000, 'Thường'),
('3C5', 'C', '5', 3, 45000, 'Thường'),
('3C6', 'C', '6', 3, 45000, 'Thường'),
('3C7', 'C', '7', 3, 45000, 'Thường'),
('3C8', 'C', '8', 3, 45000, 'Thường'),
('3C9', 'C', '9', 3, 45000, 'Thường'),
('3D0', 'D', '0', 3, 45000, 'Thường'),
('3D1', 'D', '1', 3, 45000, 'Thường'),
('3D2', 'D', '2', 3, 45000, 'Thường'),
('3D3', 'D', '3', 3, 45000, 'Thường'),
('3D4', 'D', '4', 3, 45000, 'Thường'),
('3D5', 'D', '5', 3, 45000, 'Thường'),
('3D6', 'D', '6', 3, 45000, 'Thường'),
('3D7', 'D', '7', 3, 45000, 'Thường'),
('3D8', 'D', '8', 3, 45000, 'Thường'),
('3D9', 'D', '9', 3, 45000, 'Thường'),
('3E0', 'E', '0', 3, 45000, 'Thường'),
('3E1', 'E', '1', 3, 45000, 'Thường'),
('3E2', 'E', '2', 3, 45000, 'Thường'),
('3E3', 'E', '3', 3, 45000, 'Thường'),
('3E4', 'E', '4', 3, 45000, 'Thường'),
('3E5', 'E', '5', 3, 45000, 'Thường'),
('3E6', 'E', '6', 3, 45000, 'Thường'),
('3E7', 'E', '7', 3, 45000, 'Thường'),
('3E8', 'E', '8', 3, 45000, 'Thường'),
('3E9', 'E', '9', 3, 45000, 'Thường'),
('3F0', 'F', '0', 3, 45000, 'Thường'),
('3F1', 'F', '1', 3, 45000, 'Thường'),
('3F2', 'F', '2', 3, 45000, 'Thường'),
('3F3', 'F', '3', 3, 45000, 'Thường'),
('3F4', 'F', '4', 3, 45000, 'Thường'),
('3F5', 'F', '5', 3, 45000, 'Thường'),
('3F6', 'F', '6', 3, 45000, 'Thường'),
('3F7', 'F', '7', 3, 45000, 'Thường'),
('3F8', 'F', '8', 3, 45000, 'Thường'),
('3F9', 'F', '9', 3, 45000, 'Thường'),
('3G0', 'G', '0', 3, 45000, 'Thường'),
('3G1', 'G', '1', 3, 45000, 'Thường'),
('3G2', 'G', '2', 3, 45000, 'Thường'),
('3G3', 'G', '3', 3, 45000, 'Thường'),
('3G4', 'G', '4', 3, 45000, 'Thường'),
('3G5', 'G', '5', 3, 45000, 'Thường'),
('3G6', 'G', '6', 3, 45000, 'Thường'),
('3G7', 'G', '7', 3, 45000, 'Thường'),
('3G8', 'G', '8', 3, 45000, 'Thường'),
('3G9', 'G', '9', 3, 45000, 'Thường'),
('3H0', 'H', '0', 3, 45000, 'Thường'),
('3H1', 'H', '1', 3, 45000, 'Thường'),
('3H2', 'H', '2', 3, 45000, 'Thường'),
('3H3', 'H', '3', 3, 45000, 'Thường'),
('3H4', 'H', '4', 3, 45000, 'Thường'),
('3H5', 'H', '5', 3, 45000, 'Thường'),
('3H6', 'H', '6', 3, 45000, 'Thường'),
('3H7', 'H', '7', 3, 45000, 'Thường'),
('3H8', 'H', '8', 3, 45000, 'Thường'),
('3H9', 'H', '9', 3, 45000, 'Thường'),
('3I0', 'I', '0', 3, 45000, 'Thường'),
('3I1', 'I', '1', 3, 45000, 'Thường'),
('3I2', 'I', '2', 3, 45000, 'Thường'),
('3I3', 'I', '3', 3, 45000, 'Thường'),
('3I4', 'I', '4', 3, 45000, 'Thường'),
('3I5', 'I', '5', 3, 45000, 'Thường'),
('3I6', 'I', '6', 3, 45000, 'Thường'),
('3I7', 'I', '7', 3, 45000, 'Thường'),
('3I8', 'I', '8', 3, 45000, 'Thường'),
('3I9', 'I', '9', 3, 45000, 'Thường'),
('3J0', 'J', '0', 3, 45000, 'Thường'),
('3J1', 'J', '1', 3, 45000, 'Thường'),
('3J2', 'J', '2', 3, 45000, 'Thường'),
('3J3', 'J', '3', 3, 45000, 'Thường'),
('3J4', 'J', '4', 3, 45000, 'Thường'),
('3J5', 'J', '5', 3, 45000, 'Thường'),
('3J6', 'J', '6', 3, 45000, 'Thường'),
('3J7', 'J', '7', 3, 45000, 'Thường'),
('3J8', 'J', '8', 3, 45000, 'Thường'),
('3J9', 'J', '9', 3, 45000, 'Thường');

-- --------------------------------------------------------
--

CREATE TABLE HOADON (
  [SOHD] int NOT NULL,
  [NGAYHD] datetime2(0) DEFAULT NULL,
  [MAKH] int DEFAULT NULL,
  [MANV] int DEFAULT NULL,
  [TONGTIEN] int DEFAULT NULL
)   ;

--

INSERT INTO hoadon ([SOHD], [NGAYHD], [MAKH], [MANV], [TONGTIEN]) VALUES
(1, NULL, NULL, NULL, NULL),
(2, '2019-06-24 00:00:00', NULL, 1, 55000),
(3, '2019-06-24 00:00:00', NULL, 1, 46000),
(4, '2019-06-24 00:00:00', NULL, 1, NULL),
(5, '2019-06-24 00:00:00', NULL, 1, NULL),
(6, '2019-06-24 00:00:00', NULL, 1, -25000),
(7, '2019-06-24 00:00:00', NULL, 1, 40000),
(8, '2019-06-24 00:00:00', NULL, 1, 57500),
(9, '2019-07-07 00:00:00', NULL, 1, 0),
(10, '2019-07-07 00:00:00', NULL, 1, 0);

-- --------------------------------------------------------

--

CREATE TABLE KHACHHANG (
  [MAKH] int NOT NULL,
  [TENKH] varchar(30) DEFAULT NULL,
  [GIOITINH] varchar(3) DEFAULT NULL,
  [NGAYSINH] date DEFAULT NULL,
  [DIACHI] varchar(50) DEFAULT NULL,
  [DIENTHOAI] varchar(20) DEFAULT NULL,
  [CMND] varchar(12) DEFAULT NULL,
  [NGAYDK] date DEFAULT NULL,
  [DIEMTICHLUY] varchar(30) DEFAULT NULL,
  [MALKH] int DEFAULT NULL
)   ;

--

INSERT INTO khachhang ([MAKH], [TENKH], [GIOITINH], [NGAYSINH], [DIACHI], [DIENTHOAI], [CMND], [NGAYDK], [DIEMTICHLUY], [MALKH]) VALUES
(1, 'L� T?ng C�', 'Nam', '1999-08-16', 'Qu?ng Ng�i', '123', '0332858127', '2019-06-12', '0', 2),
(2, 'Tr??ng Th? M? Linh', 'N?', '1999-11-16', 'Qu?ng Nam', '0355085340', '123214214', '2019-06-20', '0', 3),
(3, 'Nguy?n V?n A', 'Nam', '2019-06-21', 'a', 'a', 'a', '2019-06-06', '0', 2),
(4, 'Nguy?n V?n C', 'Nam', '2019-06-22', 'a', 'a', 'a', '2019-06-13', '0', 2);

select *from KHACHHANG;
-- --------------------------------------------------------

CREATE TABLE KHUYENMAI (
  [MAKM] int NOT NULL,
  [TENKM] varchar(50) DEFAULT NULL,
  [TYLEKM] float DEFAULT NULL,
  [MASK] int DEFAULT NULL
)   ;



INSERT INTO khuyenmai ([MAKM], [TENKM], [TYLEKM], [MASK]) VALUES
(2, 'KM1', 0.5, 1),
(3, 'KM2', 0.2, 1),
(4, 'KM3', 0.4, 1);

-- --------------------------------------------------------


CREATE TABLE LOAIKH (
  [MALKH] int NOT NULL,
  [TENLKH] varchar(50) DEFAULT NULL,
  [DIEMTHANGHANG] int DEFAULT NULL
)   ;

--

INSERT INTO loaikh ([MALKH], [TENLKH], [DIEMTHANGHANG]) VALUES
(2, 'Normal', 10),
(3, 'VIP', 100),
(4, 'VIP', 200),
(6, 'VIP', 100);

-- --------------------------------------------------------

--

CREATE TABLE NHANVIEN (
  [MANV] int NOT NULL,
  [TENNV] varchar(50) DEFAULT NULL,
  [GIOITINH] varchar(3) DEFAULT NULL,
  [NGAYSINH] date DEFAULT NULL,
  [DIACHI] varchar(50) DEFAULT NULL,
  [DIENTHOAI] varchar(20) DEFAULT NULL,
  [CMND] varchar(12) DEFAULT NULL,
  [NGAYVL] date DEFAULT NULL
)   ;



INSERT INTO nhanvien ([MANV], [TENNV], [GIOITINH], [NGAYSINH], [DIACHI], [DIENTHOAI], [CMND], [NGAYVL]) VALUES
(1, 'Nguyen Thi D', 'Nu', '1999-06-13', '12312321', '12313', '123123', '2019-06-15'),
(2, 'Nguyen Thi E', 'Nu', '1998-06-06', '123123', '412421321', '123123', '2019-06-21'),
(3, 'Le Van A', 'Nam', '1999-06-06', '12312', '12312', '1231', '2019-06-14'),
(4, 'Le Van B', 'Nam', '1997-07-17', 'a', 'a', 'a', '2019-07-12');

-- --------------------------------------------------------



CREATE TABLE PHIM (
  [MAPHIM] int NOT NULL,
  [TENPHIM] varchar(100) DEFAULT NULL,
  [THOILUONG] int DEFAULT NULL,
  [DAODIEN] varchar(255) DEFAULT NULL,
  [DIENVIEN] varchar(255) DEFAULT NULL,
  [PHUDE] varchar(255) DEFAULT NULL,
  [NGAYCONGCHIEU] date DEFAULT NULL,
  [DOTUOI] int DEFAULT NULL,
  [THELOAI] varchar(255) DEFAULT NULL,
  [LinkAnh] varchar(100) NOT NULL
)   ;

--

INSERT INTO phim ([MAPHIM], [TENPHIM], [THOILUONG], [DAODIEN], [DIENVIEN], [PHUDE], [NGAYCONGCHIEU], [DOTUOI], [THELOAI], [LinkAnh]) VALUES
(2, 'Aladdin', 123, 'a', 'a', 'a', '2019-06-06', 13, 'a', 'D:\PosterPhim\Aladdin.PNG'),
(3, 'Captain', 100, 'Abc', 'abc', 'Tiếng Việt', '2019-06-19', 13, 'Hành động', 'D:\PosterPhim\Captain.PNG'),
(4, 'Chúa tể Godzilla', 180, 'abc', 'abc', 'Tiếng Việt', '2019-06-20', 16, 'Hành động', 'D:\PosterPhim\Chúa tể Godzilla.PNG'),
(5, 'HellBoy', 100, 'abc', 'abc', 'Tiếng Việt', '2019-06-10', 18, 'Hành động', 'D:\PosterPhim\HellBoy.PNG'),
(6, 'Ngôi đền kỳ quái', 120, 'abc', 'abc', 'Tiếng Việt', '2019-06-11', 18, 'Kinh dị', 'D:\PosterPhim\Ngôi đền kỳ quái.PNG'),
(7, 'Nụ hôn ma quái', 110, 'abc', 'abc', 'Thái Lan', '2019-06-04', 18, 'Kinh dị', 'D:\PosterPhim\Nụ hôn ma quái.PNG'),
(8, 'Sát thủ', 150, 'abc', 'abc', 'Tiếng Anh', '2019-06-11', 18, 'Hành động', 'D:\PosterPhim\Sát thủ.PNG'),
(9, 'Thám tử pikachu', 110, 'abc', 'abc', 'Tiếng nhật', '2019-06-04', 18, 'Hoạt hình', 'D:\PosterPhim\Thám tử pikachu.PNG'),
(10, 'Thằng em lý tưởng', 100, 'abc', 'abc', 'Tiếng Hàn', '2019-06-03', 13, 'Hài', 'D:\PosterPhim\Thằng em lý tưởng.PNG'),
(11, 'Vua khủng long', 120, 'ab', 'abc', 'Tiếng Việt', '2019-06-10', 13, 'Hoạt hình', 'D:\PosterPhim\Vua khủng long.PNG'),
(12, 'X-men', 150, 'abc', 'abc', 'Tiếng anh', '2019-06-19', 18, 'Hành động', 'D:\PosterPhim\X-men.PNG'),
(13, 'Ước hẹn mùa thu', 111, 'abc', 'abc', 'Tiếng Việt', '2019-06-03', 18, 'Tình cảm', 'D:\PosterPhim\Ước hẹn mùa thu1.PNG');

-- --------------------------------------------------------

CREATE TABLE PHONGCHIEU (
  [MAPC] int NOT NULL,
  [TENPC] varchar(30) DEFAULT NULL,
  [DIENTICH] int DEFAULT NULL
);



INSERT INTO phongchieu ([MAPC], [TENPC], [DIENTICH]) VALUES
(1, 'Phong chieu 1', 100),
(2, 'Phong chieu 2', 100),
(3, 'Phong chieu 3', 100);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quyen`
--

CREATE TABLE QUYEN (
  [MAPQ] int NOT NULL,
  [TenQuyen] varchar(50) DEFAULT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `quyen`
--

INSERT INTO quyen ([MAPQ], [TenQuyen]) VALUES
(1, 'Quản trị viên'),
(2, 'Quản lý thanh toán'),
(3, 'Quản lý khuyến mãi'),
(4, 'Quản lý lịch chiếu'),
(5, 'Quản lý phim'),
(6, 'Quản lý CSVC'),
(7, 'Quản lý khách hàng'),
(8, 'Quản lý sản phẩm ');

-- --------------------------------------------------------


CREATE TABLE SANPHAM (
  [MASP] int NOT NULL,
  [TENSP] varchar(50) DEFAULT NULL,
  [GIA] int DEFAULT NULL,
  [DOIVITINH] varchar(50) DEFAULT NULL,
  [XUATXU] varchar(50) DEFAULT NULL,
  [NGAYNHAP] date DEFAULT NULL,
  [HSD] date DEFAULT NULL,
  [LinkAnh] varchar(100) NOT NULL
);



INSERT INTO sanpham ([MASP], [TENSP], [GIA], [DOIVITINH], [XUATXU], [NGAYNHAP], [HSD], [LinkAnh]) VALUES
(1, '7up', 400000, 'Lon', 'Việt Nam', '2019-06-01', '2019-06-07', 'D:SanPham7up.PNG'),
(2, 'Bắp caramen', 45000, 'Phần', 'Việt Nam', '2019-06-01', '2019-06-30', 'D:\SanPham\Bắp caramen.PNG'),
(3, 'Bắp phô mai', 50000, 'Phần', 'Việt Nam', '2019-06-01', '2019-06-30', 'D:\SanPham\Bắp phô mai.PNG'),
(4, 'fanta', 20000, 'Lon', 'Việt Nam', '2019-06-01', '2019-06-29', 'D:\SanPham\fanta.PNG'),
(5, 'Milo', 20000, 'Lon', 'Việt Nam', '2019-06-08', '2019-06-29', 'D:\SanPham\Milo.PNG'),
(7, 'Pepsi', 20000, 'Lon', 'Việt Nam', '2019-06-01', '2019-06-29', 'D:\SanPham\Pepsi.PNG'),
(8, 'Rong biển', 30000, 'Gói', 'Việt Nam', '2019-06-01', '2019-06-29', 'D:\SanPham\Rong biển.PNG'),
(9, 'Snack', 1000, 'Gói', 'Việt Nam', '2019-06-01', '2019-06-29', 'D:\SanPham\Snack.PNG');

-- --------------------------------------------------------
--

CREATE TABLE SUKIEN (
  [MASK] int NOT NULL,
  [TENSK] varchar(50) DEFAULT NULL,
  [TGBD] date DEFAULT NULL,
  [TGKT] date DEFAULT NULL,
  [ANPHAMTT] varchar(50) DEFAULT NULL,
  [DOITUONG] varchar(10) DEFAULT NULL,
  [PHANLOAI] varchar(50) DEFAULT NULL,
  [MANV] int DEFAULT NULL,
  [MOTA] varchar(255) DEFAULT NULL
)   ;

--
-- Đang đổ dữ liệu cho bảng `sukien`
--

INSERT INTO sukien ([MASK], [TENSK], [TGBD], [TGKT], [ANPHAMTT], [DOITUONG], [PHANLOAI], [MANV], [MOTA]) VALUES
(1, 'B', '2019-06-06', '2019-06-15', 'a', 'a', 'a', 1, 'a'),
(2, 'Thứ 2 đầu tháng', '2019-06-01', '2019-06-30', 'poster', 'HSSV', 'Sự kiện hàng tháng', 1, 'a');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE TAIKHOAN (
  [MATK] int NOT NULL,
  [MANV] int DEFAULT NULL,
  [TenDN] varchar(12) DEFAULT NULL,
  [PASSWORD] varchar(12) DEFAULT NULL,
  [MAPQ] int DEFAULT NULL,
  [VITRI] varchar(50) DEFAULT NULL
)   ;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO taikhoan ([MATK], [MANV], [TenDN], [PASSWORD], [MAPQ], [VITRI]) VALUES
(1, 1, 'admin1', 'admin', 1, 'Quản trị viên'),
(2, 2, 'hong1', '123', 2, 'Quản lý thanh toán'),
(3, 3, 'phi1', '123', 3, 'Quản lý khuyến mãi'),
(4, 4, 'hieu123', '123', 5, 'Quản lý phim');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thietbi`
--

CREATE TABLE THIETBI (
  [MATB] int NOT NULL,
  [TENTB] varchar(50) DEFAULT NULL,
  [SL] int DEFAULT NULL,
  [HANGSX] varchar(50) DEFAULT NULL
)   ;

--
--

INSERT INTO thietbi ([MATB], [TENTB], [SL], [HANGSX]) VALUES
(1, 'Máy lạnh', 12, 'Toshiba'),
(2, 'Máy chiếu', 2, 'Sony'),
(3, 'Màn hình', 3, 'Samsung');

---Th?c hi?n th�m kh�a ch�nh kh�a ngo?i v� c�c r�ng bu?c c� ?i?u ki?n
--- Table LoaiKH v� KHACH HANG ---
alter table LOAIKH add primary key (MALKH);
alter table KHACHHANG add primary key (MAKH);
alter table KHACHHANG add foreign key (MALKH) references LOAIKH(MALKH);
--- Table THIETBI v� CTTB v� PHONGCHIEU---
alter table CTTB add primary key (MATB,MAPC); 
alter table THIETBI add primary key (MATB);
alter table CTTB add foreign key (MATB) references THIETBI(MATB);
---TABLE PHONGCHIEU---
alter table PHONGCHIEU add primary key(MAPC);
---T?o kh�a ngo?i PHONGCHIEU v� CTTB---
alter table CTTB add foreign key (MAPC) references PHONGCHIEU(MAPC);
---table PHIM v� CACHIEU v� PHONGCHIEU---
alter table PHIM ADD PRIMARY KEY (MAPHIM);
alter table CACHIEU add primary key(MACC);
alter table CACHIEU add foreign key (MAPHIM) references PHIM(MAPHIM);
alter table CACHIEU add foreign key (MAPC) references PHONGCHIEU(MAPC);
---table SANPHAM--
alter table SANPHAM add primary key(MASP);
---table CTSP
alter table CTSP add primary key (SOHD,MASP);
alter table CTSP add foreign key (MASP) references SANPHAM(MASP);
---table KHUYENMAI v� CTSP---
alter table KHUYENMAI ADD PRIMARY KEY(MAKM);
alter table CTSP add foreign key (MAKM) REFERENCES KHUYENMAI(MAKM);
---table GHE v� PHONGCHIEU---
alter table GHE ADD PRIMARY KEY (MAGHE);
alter table GHE add foreign key (MAPC) REFERENCES PHONGCHIEU(MAPC);
---table CTVE v� CACHIEU v� GHE v� KHUYENMAI---
alter table CTVE ADD PRIMARY KEY(SOHD,MACC,MAGHE);
alter table CTVE add foreign key (MACC) REFERENCES CACHIEU(MACC);
alter table CTVE add foreign key(MAGHE) REFERENCES GHE(MAGHE);
alter table CTVE add foreign key(MAKM) REFERENCES KHUYENMAI(MAKM);
---table SUKIEN v� KHUYENMAI---
alter table SUKIEN add primary key (MASK);
alter table KHUYENMAI add foreign key(MASK) references SUKIEN(MASK);
---table HOADON V� CTSP v� KHACHHANG v� CTVE---
alter table HOADON add primary key(SOHD);
alter table CTSP ADD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD);
alter table HOADON add foreign key (MAKH) REFERENCES KHACHHANG(MAKH);
alter table CTVE ADD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD);
---table NHANVIEN v� SUKIEN v� HOADON---
alter table NHANVIEN add primary key(MANV);
alter table SUKIEN ADD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV);
alter table HOADON add foreign key (MANV) references NHANVIEN(MANV);
---table BAOCAO v� NHANVIEN---
alter table BAOCAO add primary key (MABC);
alter table BAOCAO add foreign key (MANV) REFERENCES NHANVIEN(MANV);
---table QUYEN v� TAIKHOAN v� NHANVIEN---
alter table QUYEN add primary key(MAPQ);
alter table TAIKHOAN add primary key(MATK);
alter table TAIKHOAN add foreign key (MAPQ) REFERENCES QUYEN(MAPQ);
alter table TAIKHOAN add foreign key (MANV) references NHANVIEN(MANV);









--////Ch?a th�m
ALTER TABLE [baocao]
  ADD PRIMARY KEY ([MABC]),
  ADD KEY `PK3_manv` ([MANV]) USING BTREE;

--
-- Chỉ mục cho bảng `cachieu`
--
ALTER TABLE [cachieu]
  ADD PRIMARY KEY ([MACC]),
  ADD KEY `PK1_maphim` ([MAPHIM]) USING BTREE,
  ADD KEY `PK_mapc` ([MAPC]) USING BTREE;

--
-- Chỉ mục cho bảng `ctsp`
--
ALTER TABLE [ctsp]
  ADD PRIMARY KEY ([SOHD],[MASP]),
  ADD KEY `PK1_makm` ([MAKM]) USING BTREE,
  ADD KEY `PK1_masp` ([MASP]) USING BTREE;

--
-- Chỉ mục cho bảng `cttb`
--
ALTER TABLE [cttb]
  ADD PRIMARY KEY ([MATB],[MAPC]),
  ADD KEY `PK2_mapc` ([MAPC]) USING BTREE;

--
-- Chỉ mục cho bảng `ctve`
--
ALTER TABLE [ctve]
  ADD PRIMARY KEY ([SOHD],[MACC],[MAGHE]),
  ADD KEY `mag` ([MAGHE]) USING BTREE,
  ADD KEY `malc` ([MAKM]) USING BTREE,
  ADD KEY `PK1_macc` ([MACC]) USING BTREE;

--
-- Chỉ mục cho bảng `ghe`
--
ALTER TABLE [ghe]
  ADD PRIMARY KEY ([MAGHE]),
  ADD KEY `PK1_mapc` ([MAPC]) USING BTREE;

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE [hoadon]
  ADD PRIMARY KEY ([SOHD]),
  ADD KEY `makh2` ([MAKH]) USING BTREE,
  ADD KEY `manv3` ([MANV]) USING BTREE;

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE [khachhang]
  ADD PRIMARY KEY ([MAKH]),
  ADD KEY `malkh` ([MALKH]) USING BTREE;

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE [khuyenmai]
  ADD PRIMARY KEY ([MAKM]),
  ADD KEY `PK_mask` ([MASK]) USING BTREE;

--
-- Chỉ mục cho bảng `loaikh`
--
ALTER TABLE [loaikh]
  ADD PRIMARY KEY ([MALKH]),
  ADD KEY `malkh` ([MALKH]) USING BTREE;

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE [nhanvien]
  ADD PRIMARY KEY ([MANV]);

--
-- Chỉ mục cho bảng `phim`
--
ALTER TABLE [phim]
  ADD PRIMARY KEY ([MAPHIM]),
  ADD KEY `tenphim` ([TENPHIM]) USING BTREE;

--
-- Chỉ mục cho bảng `phongchieu`
--
ALTER TABLE [phongchieu]
  ADD PRIMARY KEY ([MAPC]);

--
-- Chỉ mục cho bảng `quyen`
--
ALTER TABLE [quyen]
  ADD PRIMARY KEY ([MAPQ]);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE [sanpham]
  ADD PRIMARY KEY ([MASP]);

--
-- Chỉ mục cho bảng `sukien`
--
ALTER TABLE [sukien]
  ADD PRIMARY KEY ([MASK]),
  ADD KEY `PK_manv` ([MANV]) USING BTREE;

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE [taikhoan]
  ADD PRIMARY KEY ([MATK]),
  ADD UNIQUE KEY `TenDN` ([TenDN]),
  ADD KEY `PK_MANV1` ([MANV]) USING BTREE,
  ADD KEY `PK_MAPQ1` ([MAPQ]) USING BTREE;

--
-- Chỉ mục cho bảng `thietbi`
--
ALTER TABLE [thietbi]
  ADD PRIMARY KEY ([MATB]);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baocao`
--
ALTER TABLE [baocao]
  MODIFY [MABC] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cachieu`
--
ALTER TABLE [cachieu]
  MODIFY [MACC] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE [hoadon]
  MODIFY [SOHD] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE [khachhang]
  MODIFY [MAKH] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE [khuyenmai]
  MODIFY [MAKM] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `loaikh`
--
ALTER TABLE [loaikh]
  MODIFY [MALKH] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE [nhanvien]
  MODIFY [MANV] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `phim`
--
ALTER TABLE [phim]
  MODIFY [MAPHIM] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `phongchieu`
--
ALTER TABLE [phongchieu]
  MODIFY [MAPC] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `quyen`
--
ALTER TABLE [quyen]
  MODIFY [MAPQ] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE [sanpham]
  MODIFY [MASP] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `sukien`
--
ALTER TABLE [sukien]
  MODIFY [MASK] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE [taikhoan]
  MODIFY [MATK] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `thietbi`
--
ALTER TABLE [thietbi]
  MODIFY [MATB] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baocao`
--
ALTER TABLE [baocao]
  ADD CONSTRAINT [PK3_manv] FOREIGN KEY ([MANV]) REFERENCES nhanvien ([MANV]);

--
-- Các ràng buộc cho bảng `cachieu`
--
ALTER TABLE [cachieu]
  ADD CONSTRAINT [PK1_maphim] FOREIGN KEY ([MAPHIM]) REFERENCES phim ([MAPHIM]),
  ADD CONSTRAINT [PK_mapc] FOREIGN KEY ([MAPC]) REFERENCES `phongchieu` ([MAPC]);

--
-- Các ràng buộc cho bảng `ctsp`
--
ALTER TABLE [ctsp]
  ADD CONSTRAINT [PK1_makm] FOREIGN KEY ([MAKM]) REFERENCES khuyenmai ([MAKM]),
  ADD CONSTRAINT [PK1_masp] FOREIGN KEY ([MASP]) REFERENCES `sanpham` ([MASP]),
  ADD CONSTRAINT [PK3_sohd] FOREIGN KEY ([SOHD]) REFERENCES `hoadon` ([SOHD]);

--
-- Các ràng buộc cho bảng `cttb`
--
ALTER TABLE [cttb]
  ADD CONSTRAINT [PK1_matb] FOREIGN KEY ([MATB]) REFERENCES thietbi ([MATB]),
  ADD CONSTRAINT [PK2_mapc] FOREIGN KEY ([MAPC]) REFERENCES `phongchieu` ([MAPC]);

--
-- Các ràng buộc cho bảng `ctve`
--
ALTER TABLE [ctve]
  ADD CONSTRAINT [PK1_macc] FOREIGN KEY ([MACC]) REFERENCES cachieu ([MACC]),
  ADD CONSTRAINT [PK1_mag] FOREIGN KEY ([MAGHE]) REFERENCES `ghe` ([MAGHE]),
  ADD CONSTRAINT [PK1_sohd] FOREIGN KEY ([SOHD]) REFERENCES `hoadon` ([SOHD]),
  ADD CONSTRAINT [PK2_makh] FOREIGN KEY ([MAKM]) REFERENCES `khuyenmai` ([MAKM]);

--
-- Các ràng buộc cho bảng `ghe`
--
ALTER TABLE [ghe]
  ADD CONSTRAINT [PK1_mapc] FOREIGN KEY ([MAPC]) REFERENCES phongchieu ([MAPC]);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE [hoadon]
  ADD CONSTRAINT [PK1_makh] FOREIGN KEY ([MAKH]) REFERENCES khachhang ([MAKH]),
  ADD CONSTRAINT [PK1_manv] FOREIGN KEY ([MANV]) REFERENCES `nhanvien` ([MANV]);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE [khachhang]
  ADD CONSTRAINT [PK_malkh] FOREIGN KEY ([MALKH]) REFERENCES loaikh ([MALKH]);

--
-- Các ràng buộc cho bảng `khuyenmai`
--
ALTER TABLE [khuyenmai]
  ADD CONSTRAINT [PK_mask] FOREIGN KEY ([MASK]) REFERENCES sukien ([MASK]);

--
-- Các ràng buộc cho bảng `sukien`
--
ALTER TABLE [sukien]
  ADD CONSTRAINT [PK_manv] FOREIGN KEY ([MANV]) REFERENCES nhanvien ([MANV]);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE [taikhoan]
  ADD CONSTRAINT [PK_MANV1] FOREIGN KEY ([MANV]) REFERENCES nhanvien ([MANV]),
  ADD CONSTRAINT [PK_MAPQ1] FOREIGN KEY ([MAPQ]) REFERENCES `quyen` ([MAPQ]);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
