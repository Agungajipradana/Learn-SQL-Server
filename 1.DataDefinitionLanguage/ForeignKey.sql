/*
FOREIGN KEY (kunci asing) dalam SQL Server adalah konsep yang digunakan untuk menetapkan 
relasi antara dua tabel dalam sebuah basis data. Kunci asing menghubungkan kolom atau sekelompok kolom dalam 
satu tabel (tabel anak) ke kolom yang berfungsi sebagai primary key di tabel lain (tabel utama). 
Relasi ini memungkinkan tabel anak mengacu pada data dalam tabel utama, menciptakan ketergantungan dan 
integritas referensial antar tabel.

Berikut adalah sintaksis umum untuk membuat FOREIGN KEY pada SQL Server:

	CREATE TABLE Table1 (
		ID INT PRIMARY KEY,
		Name VARCHAR(50)
	);

	CREATE TABLE Table2 (
		ID INT PRIMARY KEY,
		Table1_ID INT FOREIGN KEY REFERENCES Table1(ID),
		Description VARCHAR(100)
	);

Dalam contoh di atas:

	- Table1 memiliki kolom ID sebagai primary key.
	- Table2 memiliki kolom ID sebagai primary key dan Table1_ID sebagai foreign key yang merujuk ke kolom ID di Table1.

Beberapa poin penting tentang FOREIGN KEY:

	1.Integritas Referensial: FOREIGN KEY membantu menjaga integritas referensial antar tabel. 
	Ini memastikan bahwa setiap nilai di kolom FOREIGN KEY di tabel anak merujuk ke nilai yang ada 
	di kolom PRIMARY KEY di tabel utama.

	2.Ketika Nilai di Tabel Utama Berubah atau Dihapus: Jika nilai di kolom PRIMARY KEY di tabel utama berubah atau dihapus, 
	DBMS dapat memberikan efek kaskade (CASCADE) ke tabel anak, yaitu memperbarui atau menghapus nilai-nilai yang sesuai di tabel anak.

	3.Tabel Anak Boleh Memiliki Nilai NULL: Kolom yang merupakan FOREIGN KEY di tabel anak dapat memiliki nilai NULL jika diizinkan, 
	yang berarti bahwa tidak ada referensi ke nilai tertentu di tabel utama.

	4.Tabel Anak Dapat Memiliki Lebih dari Satu FOREIGN KEY: Sebuah tabel anak dapat memiliki lebih dari satu FOREIGN KEY 
	yang merujuk ke tabel utama yang berbeda.

Contoh khusus dari penggunaan FOREIGN KEY adalah hubungan "many-to-one", di mana banyak baris di tabel anak merujuk ke 
satu baris di tabel utama.
*/

-- membuat table "barang2"
create table barang2(
	barang_id int identity primary key,
	barang_name varchar(50),
	jumlah int,
	harga money
)

-- mengganti nama column "harga" menjadi "price" pada table "barang2" 
EXEC sp_rename 'barang2.harga', 'price', 'column'

-- mengganti nama column "jumlah" menjadi "total" pada table "barang2" 
EXEC sp_rename 'barang2.jumlah', 'total', 'column'

select * from barang2

-- membuat table "penjualan2"
create table penjualan2(
	penjualan_id int identity primary key,
	transaction_date date,
	total_price money
)

-- membuat table "penjualan2_detail" yang memiliki 2 foreign key yaitu "barang_id" dan "penjualan_id".
-- terdapat 2 foreign key yaitu: 
		-- column "barang_id" berelasi pada tabel barang2 dengan column "barang_id" dan
		-- column "penjualan_id" berelasi pada tabel penjualan2 dengan column "penjualan_id"
create table penjualan2_detail(
	barang_id int,
	penjualan_id int,
	total int,
	price money,
	primary key (barang_id, penjualan_id),
	constraint fk_penjualan2_detail_barang2  foreign key (barang_id) references barang2(barang_id),
	constraint fk_penjualan2_detail_penjualan2 foreign key (penjualan_id) references penjualan2(penjualan_id)
)