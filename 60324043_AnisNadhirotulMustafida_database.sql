-- =========================================
-- TUGAS 2 - DESAIN DATABASE PERPUSTAKAAN
-- =========================================

-- 1. CREATE DATABASE
CREATE DATABASE perpustakaan_lengkap;
USE perpustakaan_lengkap;

-- =========================================
-- 2. TABEL KATEGORI BUKU
-- =========================================
CREATE TABLE kategori_buku (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL UNIQUE,
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- 3. TABEL PENERBIT
-- =========================================
CREATE TABLE penerbit (
    id_penerbit INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- 4. TABEL BUKU (RELASI)
-- =========================================
CREATE TABLE buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    kode_buku VARCHAR(20),
    judul VARCHAR(255),
    pengarang VARCHAR(100),
    tahun_terbit YEAR,
    isbn VARCHAR(20),
    harga DECIMAL(10,2),
    stok INT,
    id_kategori INT,
    id_penerbit INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_kategori) REFERENCES kategori_buku(id_kategori),
    FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit)
);

-- =========================================
-- 5. INSERT DATA KATEGORI (MIN 5)
-- =========================================
INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming', 'Buku pemrograman'),
('Database', 'Buku database'),
('Web Design', 'Desain web'),
('Networking', 'Jaringan komputer'),
('Data Science', 'Analisis data');

-- =========================================
-- 6. INSERT DATA PENERBIT (MIN 5)
-- =========================================
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika', 'Bandung', '0811111111', 'info@informatika.com'),
('Erlangga', 'Jakarta', '0822222222', 'info@erlangga.com'),
('Gramedia', 'Jakarta', '0833333333', 'info@gramedia.com'),
('Andi Offset', 'Yogyakarta', '0844444444', 'info@andi.com'),
('Graha Ilmu', 'Yogyakarta', '0855555555', 'info@grahailmu.com');

-- =========================================
-- 7. INSERT DATA BUKU (MIN 15)
-- =========================================
INSERT INTO buku (kode_buku, judul, pengarang, tahun_terbit, isbn, harga, stok, id_kategori, id_penerbit) VALUES
('BK001','Belajar PHP','Budi Raharjo',2023,'111',90000,10,1,1),
('BK002','Mastering MySQL','Andi Nugroho',2022,'222',120000,5,2,5),
('BK003','Laravel Advanced','Siti Amina',2024,'333',130000,7,1,1),
('BK004','HTML & CSS','Dedi Santoso',2023,'444',80000,15,3,4),
('BK005','Jaringan Dasar','Ahmad Yani',2021,'555',95000,8,4,2),
('BK006','Data Science Intro','Siti Amina',2023,'666',140000,6,5,3),
('BK007','React JS','Budi Raharjo',2024,'777',125000,9,1,1),
('BK008','Python Data','Andi Nugroho',2022,'888',135000,4,5,3),
('BK009','SQL Lengkap','Ahmad Yani',2023,'999',110000,12,2,5),
('BK010','UI/UX Design','Dedi Santoso',2024,'101',100000,11,3,4),
('BK011','Cyber Security','Ahmad Yani',2022,'102',150000,3,4,2),
('BK012','Machine Learning','Siti Amina',2024,'103',160000,5,5,3),
('BK013','NodeJS','Budi Raharjo',2023,'104',115000,7,1,1),
('BK014','Database Lanjut','Andi Nugroho',2023,'105',125000,6,2,5),
('BK015','Desain Modern','Dedi Santoso',2022,'106',95000,10,3,4);

-- =========================================
-- 8. QUERY JOIN
-- =========================================

-- Tampilkan buku + kategori + penerbit
SELECT b.judul, k.nama_kategori, p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- Jumlah buku per kategori
SELECT k.nama_kategori, COUNT(b.id_buku) AS jumlah_buku
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;

-- Jumlah buku per penerbit
SELECT p.nama_penerbit, COUNT(b.id_buku) AS jumlah_buku
FROM buku b
JOIN penerbit p ON b.id_penerbit = p.id_penerbit
GROUP BY p.nama_penerbit;

-- Detail lengkap buku
SELECT b.*, k.nama_kategori, p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;