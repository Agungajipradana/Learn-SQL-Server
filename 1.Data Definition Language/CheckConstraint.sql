/*
CHECK CONSTRAINT pada SQL Server adalah aturan yang diterapkan pada kolom dalam sebuah tabel. 
Aturan ini memastikan bahwa nilai yang dimasukkan ke dalam kolom memenuhi suatu kondisi atau kriteria tertentu. 
Dengan kata lain, CHECK CONSTRAINT digunakan untuk memastikan bahwa data yang dimasukkan ke dalam tabel memenuhi 
persyaratan tertentu yang telah ditetapkan.

Berikut adalah sintaksis umum untuk membuat CHECK CONSTRAINT pada SQL Server:

	CREATE TABLE nama_tabel (
		kolom1 tipe_data,
		kolom2 tipe_data,
		kolom3 tipe_data CHECK (kondisi),
		...
	);

Contoh penggunaan CHECK CONSTRAINT:

	CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10, 2) CHECK (Salary >= 0)
	);

Dalam contoh di atas:

	- Kolom Age memiliki CHECK CONSTRAINT yang memastikan bahwa nilai Age harus lebih besar atau sama dengan 18.

	- Kolom Salary memiliki CHECK CONSTRAINT yang memastikan bahwa nilai Salary harus lebih besar atau sama dengan 0.

Keuntungan CHECK CONSTRAINT meliputi:

	1.Integritas Data: Mencegah data yang tidak valid dimasukkan ke dalam tabel, memastikan bahwa data yang ada 
	memenuhi kriteria tertentu.

	2.Validasi Nilai: Memungkinkan validasi nilai kolom berdasarkan kondisi yang ditetapkan, 
	seperti rentang nilai tertentu atau aturan bisnis lainnya.

	3.Peringatan Kesalahan: Memberikan peringatan atau kesalahan jika upaya dimasukkan yang tidak memenuhi kondisi CHECK CONSTRAINT.

	4.Kendali Aturan Bisnis: Dapat digunakan untuk menerapkan aturan bisnis atau kebijakan perusahaan terkait data yang dimasukkan.

Penting untuk diingat bahwa CHECK CONSTRAINT tidak hanya dapat diterapkan pada kolom tunggal, 
tetapi juga pada beberapa kolom atau keseluruhan baris (baris-level). Selain itu, CHECK CONSTRAINT dapat diterapkan 
setelah tabel dibuat dengan perintah ALTER TABLE.
*/

-- membuat table "barang3" dengan 2 check constraint, yaitu:
	-- check constraint yang tidak didefinisikan nama constraintnya "price money check(price > 0)" dan akan dinamakan secara default
	-- check constraint yang didefinisikan nama constraintnya :
			-- discount money,
			-- constraint ck_discount_barang3 check(discount > 0)
create table barang3(
	barang_id int identity primary key,
	barang_name varchar(50),
	total int,
	price money check(price > 0),
	discount money,
	constraint ck_discount_barang3 check(discount > 0)
)

select * from barang3

-- membuat table "barang4" dengan 2 check constraint, yaitu:
	-- check constraint yang tidak didefinisikan nama constraintnya "price money check(price > 0)" dan akan dinamakan secara default
	-- check constraint yang didefinisikan nama constraintnya dan kondisi lebih dari 1 :
			-- discount money,
			-- constraint ck_discount_barang4 check(discount > 0 and discount < price)
create table barang4(
	barang_id int identity primary key,
	barang_name varchar(50),
	total int,
	price money check(price > 0),
	discount money,
	constraint ck_discount_barang4 check(discount > 0 and discount < price)
)

select * from barang4

-- membuat table "barang5" dengan 1 check constraint tetapi seharusnya 2 dan table sudah terlanjut dibuat 
create table barang5(
	barang_id int identity primary key,
	barang_name varchar(50),
	total int,
	price money check(price > 0),
	discount money,
)

-- maka check constraint dapat ditambahkan dengan perintah "alter table" tanpa harus menghapus table yang sudah dibuat
alter table barang5
add constraint ck_discount_barang5 check(discount > 0 and discount < price)

-- memasukkan data ke dalam table "barang5" dengan memasukkan data "price" lebih kecil dari "discount"
insert into barang5(barang_name,total,price,discount)values('Laptop', 10, 100000, 500000)

/*
pada insert diatas terdapat error:
The INSERT statement conflicted with the CHECK constraint "ck_discount_barang5". 
The conflict occurred in database "latihan1", table "dbo.barang5".The statement has been terminated.

karna pada table "barang5" pada column "discount" terdapat check constraint "(discount > 0 and discount < price)", dimana
"discount" harus lebih kecil dari "price"
*/

-- memasukkan data ke dalam table "barang5" dengan memasukkan data "price" lebih besar dari "discount"
insert into barang5(barang_name,total,price,discount)values('Laptop', 10, 1000000, 500000)

select * from barang5