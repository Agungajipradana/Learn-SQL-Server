/*
NOT NULL CONSTRAINT pada SQL Server adalah aturan atau pembatasan yang diterapkan pada sebuah kolom dalam sebuah tabel 
untuk memastikan bahwa setiap baris harus memiliki nilai yang tidak boleh NULL (kosong) di kolom tersebut. 
Dengan kata lain, NOT NULL CONSTRAINT memastikan bahwa kolom yang diindeks oleh constraint ini harus diisi dengan nilai 
pada setiap baris.

Berikut adalah sintaksis umum untuk menambahkan NOT NULL CONSTRAINT pada kolom dalam SQL Server:

	CREATE TABLE nama_tabel (
		kolom1 tipe_data NOT NULL,
		kolom2 tipe_data NOT NULL,
		...
	);

Contoh penggunaan NOT NULL CONSTRAINT:

	CREATE TABLE Customer (
		CustomerID INT PRIMARY KEY,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Email VARCHAR(100) NOT NULL,
		Birthdate DATE NOT NULL
	);

Dalam contoh di atas:

	- Kolom FirstName, LastName, Email, dan Birthdate semuanya memiliki NOT NULL CONSTRAINT, 
	yang berarti bahwa setiap baris dalam tabel Customer harus memiliki nilai yang tidak boleh NULL di kolom-kolom ini.

Keuntungan NOT NULL CONSTRAINT meliputi:

	1.Integritas Data: Memastikan bahwa data di dalam tabel memiliki nilai yang valid dan tidak boleh NULL di kolom tertentu.

	2.Pencegahan Kesalahan: Mencegah penambahan baris dengan nilai NULL yang tidak diinginkan ke dalam tabel.

	3.Ketertelusuran: Membuat struktur tabel lebih jelas dan memudahkan untuk memahami persyaratan data.

Penting untuk diingat bahwa NOT NULL CONSTRAINT tidak hanya dapat diterapkan pada kolom yang bukan primary key, 
tetapi juga dapat diterapkan pada kolom yang tidak bersifat unik. NOT NULL CONSTRAINT juga dapat ditambahkan setelah 
tabel dibuat menggunakan perintah ALTER TABLE.
*/

-- membuat table "person4" dengan not null constraint pada column "name" dan "email"
create table person4(
	person_id int identity primary key,
	name varchar(50) not null,
	address varchar(50),
	email varchar(50) not null
)

-- memasukkan data ke dalam tabel "person4" 
-- tetapi pada column "email" tidak dimasukkan data yang dimana column "email" bersifat not null constraint
insert into person4(name, address, email)values('budi', null, null)
insert into person4(name, address)values('budi', null)

/*
pada insert diatas terdapat pesan error:
Cannot insert the value NULL into column 'email', table 'latihan1.dbo.person4'; column does not allow nulls. INSERT fails.

karena pada column "email" bersifat not null constraint, dimana column "email" tidak boleh kosong/null
*/

-- memasukkan data ke dalam tabel "person4" 
insert into person4(name, address, email)values('budi', 'jakarta', 'budi123@gmail.com')
insert into person4(name, address, email)values('budi', null, 'budi123@gmail.com')
insert into person4(name, address, email)values('budi', null, '')

-- menampilkan data pada tabel "person4" dimana pada column "address" tidak memiliki isi/null
select * from person4 where address is null

-- menampilkan semua data pada tabel "person4"
select * from person4

