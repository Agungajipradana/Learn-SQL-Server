/*
Perintah SELECT INTO pada SQL Server digunakan untuk membuat salinan dari hasil query dan menyimpannya ke dalam sebuah tabel baru. 
Dengan kata lain, perintah ini melakukan dua operasi sekaligus: memilih data dari satu atau lebih tabel atau view, dan menyimpan hasilnya 
ke dalam tabel baru yang dibuat secara dinamis.

Berikut adalah sintaksis umum dari perintah SELECT INTO:

	SELECT column1, column2, ...
	INTO new_table
	FROM source_table
	WHERE condition;

column1, column2, ...: Kolom-kolom yang ingin Anda pilih dari tabel sumber.

new_table: Nama tabel baru yang akan dibuat untuk menyimpan hasil query.

source_table: Tabel atau view sumber dari mana Anda ingin memilih data.

WHERE condition: (Opsional) Kondisi yang menentukan subset dari data yang akan dipilih.

Contoh penggunaan:

	-- Memilih kolom tertentu dari tabel 'Employees' dan menyimpannya ke dalam tabel baru 'EmployeeCopy'
	SELECT EmployeeID, FirstName, LastName
	INTO EmployeeCopy
	FROM Employees
	WHERE DepartmentID = 1;

Dalam contoh di atas, perintah SELECT INTO memilih kolom EmployeeID, FirstName, dan LastName dari tabel Employees 
dengan kondisi tertentu (DepartmentID = 1), dan hasilnya disalin ke dalam tabel baru yang disebut EmployeeCopy.

Penting untuk diingat bahwa tabel baru akan dibuat oleh SQL Server berdasarkan struktur kolom yang dihasilkan oleh query SELECT. 
Jadi, jika Anda ingin mengontrol struktur tabel baru secara lebih rinci, Anda mungkin perlu membuat tabel baru terlebih dahulu 
dan menggunakan perintah INSERT INTO untuk memasukkan data ke dalamnya.
*/

select * from person2

-- menyanlin semua data pada table "person2" dan disimpan ke dalam table baru yaitu "person3"
select * into person3 from person2

-- menampilkan semua data yang ada pada table "person3"
select * from person3

-- menghapus table "person3"
drop table person3

-- membuat table "barang"
create table barang(
	barang_id int primary key identity,
	barang_name varchar(200),
	jumlah int,
	category_id int
)

-- membuat table "category"
create table category(
	category_id int primary key identity,
	category_name varchar(100)
)

-- memasukkan data ke dalam table "category"
insert into category(category_name)values('electronic')
insert into category(category_name)values('food')

-- memasukkan data ke dalam table "barang"
insert into barang(barang_name,jumlah,category_id)values('Laptop',10,1)

select * from barang
select * from category

-- menampilkan data dengan inner join
select barang_name, jumlah, category_name 
from barang B inner join category C 
on (B.category_id=C.category_id)

-- membuat/menyalin column barang_name, jumlah, category_name ke dalam table baru "barang_category" yang diambil dari table "barang" dan "category"
-- dengan menggunakan select into dan inner join
select barang_name, jumlah, category_name into barang_category
from barang B inner join category C 
on (B.category_id=C.category_id)

-- menampilkan semua data yang ada pada table "barang_categoty"
select * from barang_category