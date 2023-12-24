/*
INSERT INTO SELECT adalah pernyataan SQL Server yang memungkinkan Anda menyisipkan data dari satu atau beberapa kolom tabel 
ke dalam tabel lain. Pernyataan ini sangat berguna ketika Anda ingin menggandakan atau memindahkan data antar tabel. 
Berikut adalah sintaks umumnya:

	INSERT INTO target_table (column1, column2, ..., columnN)
	SELECT expression1, expression2, ..., expressionN
	FROM source_table
	WHERE condition;

Penjelasan elemen-elemen tersebut:

	- target_table: Nama tabel yang akan menerima data baru.
	- (column1, column2, ..., columnN): Daftar kolom dalam tabel target yang akan diisi dengan nilai baru.
	- SELECT expression1, expression2, ..., expressionN: Pernyataan SELECT yang menentukan data yang akan disisipkan ke 
	dalam tabel target.
	- FROM source_table: Nama tabel atau hasil subquery yang menyediakan data yang akan disisipkan.
	- WHERE condition: Opsional. Kondisi yang dapat digunakan untuk memfilter data yang akan disisipkan.

Contoh penggunaan:

	INSERT INTO target_table (column1, column2, column3)
	SELECT columnA, columnB, columnC
	FROM source_table
	WHERE condition;

Dalam contoh ini, data dari columnA, columnB, dan columnC dalam source_table akan disisipkan ke dalam target_table pada column1, 
column2, dan column3.

Pastikan bahwa struktur kolom dan tipe data di tabel target sesuai dengan data yang dipilih dari tabel sumber. Juga, 
pastikan bahwa jumlah dan urutan kolom dalam SELECT sesuai dengan jumlah dan urutan kolom dalam INSERT INTO.
*/

SELECT * FROM barang6
SELECT * FROM barang6_backup

-- Membuat table "barang6_backup"
CREATE TABLE barang6_backup (
	id			INT PRIMARY KEY IDENTITY(1,1),
	barang_name VARCHAR(50),
	total		INT,
	price		MONEY
)

/*
Query SQL di bawah menggunakan pernyataan INSERT INTO SELECT untuk menyalin data dari tabel barang6 ke tabel barang6_backup. 
Mari kita jelaskan langkah-langkahnya:

	- INSERT INTO barang6_backup (barang_name, total, price):
		Menunjukkan bahwa kita akan menyisipkan data ke dalam tabel barang6_backup dan menentukan kolom-kolom yang akan 
		diisi dengan nilai baru. Kolom-kolom yang diisi adalah barang_name, total, dan price.

	- SELECT barang_name, total, price FROM barang6:
		Pernyataan SELECT yang menentukan data yang akan disisipkan. Data ini diambil dari tabel barang6.

	- Semua Baris Data:
		Semua baris data dari barang6 akan disalin ke dalam tabel barang6_backup. Setiap baris data mencakup nilai untuk kolom 
		barang_name, total, dan price.

Dengan menjalankan query ini, Anda akan membuat salinan data dari tabel barang6 ke dalam tabel barang6_backup untuk kolom yang 
ditentukan. Pastikan bahwa struktur kolom dan tipe data di kedua tabel sesuai agar tidak ada kesalahan saat menjalankan query ini.
*/
INSERT INTO barang6_backup (barang_name, total, price) 
SELECT barang_name, total, price FROM barang6

/*
Query SQL TRUNCATE TABLE barang6_backup digunakan untuk menghapus semua data (mereset) dari tabel barang6_backup. 
Berbeda dengan pernyataan DELETE, yang dapat diatur dengan kondisi dan menghapus sebagian data, pernyataan TRUNCATE TABLE 
menghapus semua baris dari tabel tanpa memerlukan kondisi. 
*/
TRUNCATE TABLE barang6_backup

/*
Query SQL ALTER TABLE barang6_backup ADD category_name VARCHAR(50), brand_name VARCHAR(50) digunakan untuk menambahkan dua 
kolom baru, yaitu category_name dan brand_name, ke dalam tabel barang6_backup. Berikut adalah penjelasan langkah-langkahnya:

	- ALTER TABLE barang6_backup:
		
		- Menunjukkan bahwa kita akan melakukan operasi perubahan pada struktur tabel barang6_backup.

	- ADD category_name VARCHAR(50), brand_name VARCHAR(50):

		- Menunjukkan bahwa kita akan menambahkan dua kolom baru ke tabel.
		- category_name adalah kolom dengan tipe data VARCHAR(50).
		- brand_name adalah kolom dengan tipe data VARCHAR(50).

Dengan menjalankan query ini, dua kolom baru akan ditambahkan ke akhir tabel barang6_backup. Pastikan bahwa perubahan ini sesuai 
dengan kebutuhan dan tidak mengganggu data yang sudah ada dalam tabel tersebut. Jika diperlukan, Anda dapat menyesuaikan tipe data 
dan panjang karakter sesuai dengan kebutuhan aplikasi atau desain basis data.
*/
ALTER TABLE barang6_backup
ADD 
	category_name VARCHAR(50),
	brand_name VARCHAR(50)

/*
Query SQL di bawah menggunakan pernyataan INSERT INTO SELECT untuk menyalin data dari beberapa tabel 
(barang6, barang6_category, dan barang6_brand) ke dalam tabel barang6_backup. Mari kita jelaskan langkah-langkahnya:

	- INSERT INTO barang6_backup (barang_name, total, price, category_name, brand_name):

		- Menunjukkan bahwa kita akan menyisipkan data ke dalam tabel barang6_backup dan menentukan kolom-kolom yang akan 
		diisi dengan nilai baru.

	- SELECT barang_name, total, price, category_name, brand_name FROM barang6 AS A 
	INNER JOIN barang6_category AS B ON A.category_id = B.category_id INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id:

		- Pernyataan SELECT yang menentukan data yang akan disisipkan.
		- Data diambil dari tabel barang6 (diberi alias A) dan dilakukan INNER JOIN dengan tabel barang6_category (diberi alias B) 
		dan tabel barang6_brand (diberi alias C) berdasarkan kunci hubung yang sesuai.

Dengan menjalankan query ini, Anda akan menyalin data dari tabel-tabel tersebut ke dalam tabel barang6_backup dengan 
mempertahankan relasi antar tabel tersebut. Pastikan bahwa struktur kolom dan tipe data di kedua tabel sesuai agar tidak ada 
kesalahan saat menjalankan query ini.
*/
INSERT INTO barang6_backup (barang_name, total, price, category_name, brand_name) 
SELECT 
	barang_name, 
	total, 
	price,
	category_name,
	brand_name
FROM barang6 AS A 
INNER JOIN barang6_category AS B ON A.category_id = B.category_id
INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id

-- Melakukan TRUNCATE 
TRUNCATE TABLE barang6_backup

/*

Query SQL di atas menggunakan pernyataan INSERT INTO SELECT untuk menyalin data dari beberapa tabel 
(barang6, barang6_category, dan barang6_brand) ke dalam tabel barang6_backup. Selain itu, 
menggunakan TOP 3 untuk membatasi jumlah baris yang disalin menjadi tiga baris pertama. Mari kita jelaskan langkah-langkahnya:

	- INSERT INTO barang6_backup (barang_name, total, price, category_name, brand_name):

		- Menunjukkan bahwa kita akan menyisipkan data ke dalam tabel barang6_backup dan menentukan kolom-kolom yang akan 
		diisi dengan nilai baru.

	- SELECT TOP 3 barang_name, total, price, category_name, brand_name FROM barang6 AS A 
	INNER JOIN barang6_category AS B ON A.category_id = B.category_id INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id:

		- Pernyataan SELECT yang menentukan data yang akan disisipkan.
		- Data diambil dari tabel barang6 (diberi alias A) dan dilakukan INNER JOIN dengan tabel barang6_category (diberi alias B) 
		dan tabel barang6_brand (diberi alias C) berdasarkan kunci hubung yang sesuai.
		- TOP 3 digunakan untuk membatasi jumlah baris yang akan disalin menjadi tiga baris pertama (berdasarkan urutan default).

Dengan menjalankan query ini, Anda akan menyalin tiga baris pertama dari tabel-tabel tersebut ke dalam tabel barang6_backup 
dengan mempertahankan relasi antar tabel tersebut. Pastikan bahwa struktur kolom dan tipe data di kedua tabel sesuai agar tidak 
ada kesalahan saat menjalankan query ini.
*/
INSERT INTO barang6_backup (barang_name, total, price, category_name, brand_name) 
SELECT TOP 3
	barang_name, 
	total, 
	price,
	category_name,
	brand_name
FROM barang6 AS A 
INNER JOIN barang6_category AS B ON A.category_id = B.category_id
INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id