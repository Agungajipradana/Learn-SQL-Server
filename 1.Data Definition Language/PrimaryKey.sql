/*
Primary key (kunci primer) dalam SQL Server adalah kolom atau sekelompok kolom yang secara unik mengidentifikasi setiap baris dalam tabel. 
Primary key digunakan untuk memastikan bahwa setiap baris memiliki nilai yang unik dan tidak dapat memiliki nilai NULL. 
Kunci primer berperan penting dalam menjaga integritas data dan memudahkan referensi dan pengaitan antar tabel dalam sebuah basis data.

Beberapa karakteristik kunci primer:

	1.Unik: Setiap nilai di dalam kolom atau kombinasi kolom kunci primer harus unik untuk setiap baris dalam tabel. 
	Ini memastikan bahwa setiap baris dapat diidentifikasi secara unik.

	2.Tidak Dapat NULL: Kolom atau kolom-kolom yang membentuk kunci primer tidak diizinkan memiliki nilai NULL. 
	Ini memastikan bahwa setiap baris memiliki nilai yang valid dan dapat diidentifikasi.

	3.Mengidentifikasi Secara Unik: Kunci primer digunakan untuk mengidentifikasi secara unik setiap baris dalam tabel. 
	Ini dapat digunakan sebagai referensi dalam pembuatan relasi antar tabel (foreign key).

	4.Digunakan untuk Kaitan Antar Tabel: Kunci primer biasanya digunakan dalam pembuatan relasi antar tabel. 
	Ketika kunci primer suatu tabel menjadi kunci asing di tabel lain, ini membentuk relasi antar tabel yang penting untuk 
	menjaga integritas referensial.

Contoh pembuatan kunci primer pada sebuah tabel:

	CREATE TABLE ExampleTable (
		ID INT PRIMARY KEY,
		Name VARCHAR(50),
		Age INT
	);

Dalam contoh di atas, kolom ID diatur sebagai kunci primer. Ini berarti setiap nilai di dalam kolom ID harus unik dan tidak dapat NULL. 
Kunci primer dapat terdiri dari satu kolom atau kombinasi dari beberapa kolom, tergantung pada kebutuhan desain tabel.
*/

-- membuat table "employee" dengan 1 primary key
create table employee(
	emp_id int identity primary key,
	name varchar(100),
	address varchar(200),
	phone varchar(15)
)

-- membuat table "penjualan" dengan 1 primary key
create table penjualan (
	penjualan_id int identity primary key,
	jumlah int,
	harga money
)

-- membuat table "penjualan_detail" dengan 2 primary key
create table penjualan_detail(
	penjualan_id int,
	barang_id int,
	jumlah int,
	harga money,
	primary key(penjualan_id, barang_id)
)
