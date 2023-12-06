/*
Unique Constraint pada SQL Server adalah aturan atau batasan yang diterapkan pada satu atau beberapa kolom dalam 
sebuah tabel untuk memastikan bahwa setiap nilai di kolom tersebut bersifat unik di antara semua baris dalam tabel. 
Dengan kata lain, Unique Constraint memastikan bahwa tidak ada duplikat nilai di kolom yang diindeks oleh constraint ini.

Berikut adalah sintaksis umum untuk membuat Unique Constraint pada SQL Server:

	CREATE TABLE nama_tabel (
		kolom1 tipe_data,
		kolom2 tipe_data,
		...
		CONSTRAINT nama_constraint UNIQUE (kolom1, kolom2, ...)
	);

Contoh penggunaan Unique Constraint:

	CREATE TABLE Product (
		ProductID INT PRIMARY KEY,
		ProductName VARCHAR(50) UNIQUE,
		Price DECIMAL(10, 2) UNIQUE
	);

Dalam contoh di atas:

	- Kolom ProductName memiliki Unique Constraint, sehingga memastikan bahwa setiap nilai di kolom ini bersifat unik di seluruh tabel.

	- Kolom Price juga memiliki Unique Constraint, sehingga memastikan bahwa tidak ada duplikat nilai di kolom ini.

Keuntungan Unique Constraint meliputi:

	1.Integritas Data: Memastikan bahwa data di dalam tabel memiliki nilai unik untuk kolom yang diindeks.

	2.Pencegahan Duplikasi: Mencegah duplikasi data yang tidak diinginkan dalam kolom tertentu.

	3.Pengindeksan Otomatis: Unique Constraint secara otomatis membuat indeks untuk kolom yang diindeks, 
	meningkatkan kinerja pencarian untuk nilai unik.

	4.Referensi dan Foreign Keys: Unique Constraint sering digunakan untuk membuat kunci asing (foreign keys) ke tabel lain, 
	memastikan bahwa nilai yang dirujuk adalah unik.

Penting untuk dicatat bahwa setiap tabel hanya dapat memiliki satu Primary Key, 
tetapi dapat memiliki beberapa Unique Constraints pada kolom yang berbeda.
Unique Constraint juga dapat diterapkan setelah tabel dibuat menggunakan perintah ALTER TABLE.
*/

-- membuat table "person3" dan terdapat column "email" di set sebagai Unique Constraint 
-- dan nama constraint di definisikan secara default
create table person3(
	person_id int identity primary key,
	name varchar(50),
	address varchar(50),
	email varchar(50) unique
)

-- menghapus table "person3"
drop table person3

-- membuat table "person3" dan terdapat column "email" di set sebagai Unique Constraint tetapi tidak didefinisikan secara inline 
-- seperti pada table "person3" yang pernah dibuat diatas dan nama constraint di definisikan secara default
create table person3(
	person_id int identity primary key,
	name varchar(50),
	address varchar(50),
	email varchar(50),
	unique(email)
)

-- membuat table "person3" dan terdapat column "email" di set sebagai Unique Constraint tetapi tidak didefinisikan secara inline 
-- seperti pada table "person3" yang pernah dibuat diatas tetapi nama constraint di definisikan dengan nama "email_tidak_sama"
create table person3(
	person_id int identity primary key,
	name varchar(50),
	address varchar(50),
	email varchar(50),
	constraint email_tidak_sama unique(email)
)

-- membuat table "person3" tetapi lupa menambahkan unique constraint pada column email dan table sudah terlanjut dibuat 
create table person3(
	person_id int identity primary key,
	name varchar(50),
	address varchar(50),
	email varchar(50),
)

-- maka unique constraint dapat ditambahkan dengan perintah "alter table" tanpa harus menghapus table yang sudah dibuat
alter table person3
add constraint email_tidak_sama unique(email)

-- memasukkan data ke dalam table "person3"
insert into person3(name, address, email)values('budi', 'jakarta', 'budi123@gmail.com')
insert into person3(name, address, email)values('budi', 'jakarta', 'budi123@gmail.com')

/*
Terdapat error ketika insert dengan email yang sama:
Violation of UNIQUE KEY constraint 'email_tidak_sama'. Cannot insert duplicate key in object 'dbo.person3'. 
The duplicate key value is (budi123@gmail.com).he statement has been terminated.

karna pada table "person3" pada column "email" bersifat constraint unique, 
dimana tidak boleh ada email yang sama atau duplicate didalam table "person3"
*/

-- menghapus unique constraint "email_tidak_sama"
alter table person3
drop constraint email_tidak_sama

-- ketika unique constraint dihapus maka column "email" tidak lagi bersifat unique dan boleh ada email yang sama
insert into person3(name, address, email)values('rusdi', 'bandung', 'rusdi123@gmail.com')
insert into person3(name, address, email)values('rusdi', 'bandung', 'rusdi123@gmail.com')
insert into person3(name, address, email)values('rusdi', 'bandung', 'rusdi123@gmail.com')


select * from person3