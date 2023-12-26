/*
SQL TRANSACTION adalah sebuah konsep dalam SQL Server yang digunakan untuk memastikan bahwa serangkaian pernyataan SQL dijalankan 
secara atomik atau sepenuhnya. Transaksi digunakan untuk mengelompokkan satu atau lebih pernyataan SQL sehingga entah semuanya 
berhasil dijalankan atau tidak ada yang dijalankan sama sekali. Jika satu pernyataan dalam transaksi gagal, 
maka seluruh transaksi dapat dibatalkan (rollback), sehingga database tetap konsisten.

Beberapa sifat dasar transaksi adalah sebagai berikut:

1. Atomicity (Atomik):

	- Transaksi dianggap sebagai unit kerja atomik, yang berarti semua pernyataan dalam transaksi entah dijalankan sepenuhnya 
	atau tidak dijalankan sama sekali. Jika satu pernyataan gagal, maka transaksi dibatalkan.

2. Consistency (Konsisten):

	- Transaksi harus menjaga konsistensi database. Ini berarti database harus tetap dalam keadaan konsisten sebelum dan 
	setelah transaksi.

3. Isolation (Isolasi):

	- Transaksi yang satu tidak boleh terpengaruh oleh transaksi lain yang sedang berlangsung secara simultan. 
	Meskipun beberapa transaksi mungkin berjalan secara bersamaan, hasilnya seolah-olah mereka berjalan secara terpisah (isolasi).

4. Durability (Daya Tahan):
	- Hasil dari transaksi yang berhasil harus permanen dan tahan terhadap kegagalan sistem atau kekuatan luar lainnya.

Contoh sederhana penggunaan transaksi adalah sebagai berikut:

	BEGIN TRANSACTION; -- Memulai transaksi

-- Pernyataan-pernyataan SQL di sini
-- (INSERT, UPDATE, DELETE, dll.)

	IF (suatu_kondisi) 
	BEGIN
		COMMIT; -- Jika berhasil, simpan perubahan ke database
	END
	ELSE
	BEGIN
		ROLLBACK; -- Jika gagal, batalkan perubahan
	END

Dengan menggunakan transaksi, kita dapat memastikan integritas dan konsistensi data dalam database, 
bahkan jika terjadi kegagalan di tengah-tengah operasi yang melibatkan perubahan data.
*/

SELECT * FROM barang2
SELECT * FROM penjualan2
SELECT * FROM penjualan2_detail

SET IDENTITY_INSERT latihan1.dbo.penjualan OFF;

-- Menghapus data dari tabel
DELETE FROM penjualan2;
DELETE FROM penjualan2_detail;

-- Memasukkan data ke table "barang2"
INSERT INTO barang2 (barang_name, total, price) 
VALUES	('Laptop Acer Aspire 5', 10, 10000000),
		('HP Android Samsung S21', 10, 20000000),
		('AC Samsung 2 PK', 10, 6500000),
		('Camera Canon DSLR', 7, 8000000),
		('Speaker JBL Mini', 5, 750000)

-- 
DELETE FROM barang2
TRUNCATE TABLE barang2

/*
Query SQL Server di bawah menggunakan transaksi (BEGIN TRANSACTION dan ROLLBACK) dan mencoba mengaktifkan IDENTITY_INSERT pada 
tabel penjualan2. Setelah menyisipkan data ke dalam tabel penjualan2 dan penjualan2_detail, perintah ROLLBACK digunakan untuk 
membatalkan seluruh transaksi.

Berikut adalah penjelasan langkah-langkahnya:

1.BEGIN TRANSACTION: 
	Perintah ini memulai sebuah transaksi di SQL Server. Transaksi ini dapat mencakup satu atau lebih pernyataan SQL, 
	dan perubahan yang dilakukan dalam transaksi tersebut dapat dibatalkan (roll back) jika diperlukan.

2. SET IDENTITY_INSERT penjualan2 ON: 
	Pernyataan ini mengaktifkan opsi IDENTITY_INSERT untuk tabel penjualan2. Opsi ini memungkinkan Anda untuk memasukkan nilai ke 
	dalam kolom identitas (kolom yang memiliki sifat auto-increment) secara eksplisit. Namun, perlu diingat bahwa ketika opsi ini 
	diaktifkan, Anda harus menyediakan nilai yang unik untuk kolom identitas.

3. INSERT INTO penjualan2: 
	Menyisipkan data ke dalam tabel penjualan2 dengan memberikan nilai eksplisit untuk kolom identitas.

4. INSERT INTO penjualan2_detail: 
	Menyisipkan data ke dalam tabel penjualan2_detail dengan memberikan nilai eksplisit untuk kolom identitas 
	(barang_id dan penjualan_id).

5. ROLLBACK: 
	Perintah ini membatalkan seluruh transaksi yang dimulai sejak pernyataan BEGIN TRANSACTION. Sebagai hasilnya, 
	perubahan yang dilakukan oleh pernyataan INSERT akan dibatalkan, dan data yang baru dimasukkan tidak akan disimpan secara 
	permanen di dalam database.

Dengan menggunakan ROLLBACK, data yang telah dimasukkan ke dalam tabel akan dihapus, dan tabel akan dikembalikan ke keadaan 
sebelum transaksi dimulai. Namun, perlu diingat bahwa penggunaan ROLLBACK akan membatalkan semua perubahan yang terjadi dalam 
transaksi, termasuk pengaktifan IDENTITY_INSERT.
*/
BEGIN TRANSACTION
SET IDENTITY_INSERT penjualan2 ON
INSERT INTO penjualan2 (penjualan_id, transaction_date, total_price)
VALUES (1, '2022-08-20', 300000)
INSERT INTO penjualan2_detail (barang_id, penjualan_id, total, price)
VALUES	(4, 1, 1, 8000000),
		(5, 1, 1, 750000);
ROLLBACK


/*
Query SQL Server di bawah ini melakukan operasi transaksi yang melibatkan dua tabel, penjualan2 dan penjualan2_detail. 
Tabel penjualan2 memiliki kolom identitas (IDENTITY column), dan penggunaan SET IDENTITY_INSERT diaktifkan untuk memungkinkan 
penge-set-an nilai kolom identitas.

Penjelasan langkah-langkahnya adalah sebagai berikut:

1. BEGIN TRANSACTION: 
	Membuka transaksi untuk memulai serangkaian operasi yang bersifat atomik.

2. SET IDENTITY_INSERT penjualan2 ON: 
	Mengaktifkan IDENTITY_INSERT untuk tabel 'penjualan2', yang memungkinkan penggunaan nilai tertentu untuk kolom identitas.

3. INSERT INTO penjualan2: 
	Menyisipkan data ke dalam tabel 'penjualan2' dengan menggunakan nilai yang telah ditentukan untuk kolom identitas.

4. INSERT INTO penjualan2_detail: 
	Menyisipkan data ke dalam tabel 'penjualan2_detail'.

5.COMMIT: 
	Menyimpan perubahan ke dalam database, menyelesaikan transaksi.

Dengan menggunakan COMMIT, perubahan yang dilakukan dalam transaksi tersebut akan diaplikasikan ke dalam database. 
Pastikan bahwa transaksi telah selesai dengan benar sebelum melakukan COMMIT untuk menghindari terjadinya ketidaksesuaian atau 
ketidaksempurnaan data.
*/
BEGIN TRANSACTION
SET IDENTITY_INSERT penjualan2 ON
INSERT INTO penjualan2 (penjualan_id, transaction_date, total_price)
VALUES (1, '2022-08-20', 300000)
INSERT INTO penjualan2_detail (barang_id, penjualan_id, total, price)
VALUES	(4, 1, 1, 8000000),
		(5, 1, 1, 750000);
COMMIT

/*
Dalam query SQL Server di bawah ini, sebuah transaksi dimulai dengan deklarasi variabel @InsertData yang menentukan apakah 
akan disisipkan data atau tidak. Kemudian, terdapat struktur IF-ELSE yang mengecek nilai variabel tersebut. 
Jika nilai variabel adalah 1, maka perubahan akan dicommit ke database; jika tidak, perubahan akan di-rollback untuk 
membatalkannya.

Penjelasan:

	- BEGIN TRANSACTION: 
		Memulai transaksi.

	- SET IDENTITY_INSERT penjualan2 ON: 
		Mengaktifkan opsi IDENTITY_INSERT agar nilai penjualan_id dapat disisipkan secara eksplisit.

	- INSERT INTO penjualan2: 
		Menyisipkan data ke tabel penjualan2.

	- INSERT INTO penjualan2_detail: 
		Menyisipkan data ke tabel penjualan2_detail.
	
	- COMMIT: 
		Jika variabel @InsertData adalah 1, maka simpan perubahan ke database.

	- ROLLBACK: 
		Jika variabel @InsertData bukan 1, maka batalkan perubahan.
*/
DECLARE @InsertData BIT = 1 -- Set nilai 1 jika ingin menyisipkan data, 0 jika tidak

BEGIN TRANSACTION

-- Memeriksa kondisi sebelum menyisipkan data ke tabel 'penjualan2'
IF @InsertData = 1
BEGIN
    SET IDENTITY_INSERT penjualan2 ON

    -- Menyisipkan data ke dalam tabel 'penjualan2'
    INSERT INTO penjualan2 (penjualan_id, transaction_date, total_price)
    VALUES (1, '2022-08-20', 300000)

    -- Menyisipkan data ke dalam tabel 'penjualan2_detail'
    INSERT INTO penjualan2_detail (barang_id, penjualan_id, total, price)
    VALUES (4, 1, 1, 8000000),
           (5, 1, 1, 750000);

    -- Jika berhasil, simpan perubahan ke database
    COMMIT;
END
ELSE
BEGIN
    -- Jika gagal, batalkan perubahan
    ROLLBACK;
END