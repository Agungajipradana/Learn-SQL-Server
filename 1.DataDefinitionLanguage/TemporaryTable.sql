/*
Temporary table (tabel sementara) dalam SQL Server adalah tabel yang hanya ada dalam sesi atau koneksi yang membuatnya. 
Tabel sementara digunakan untuk menyimpan sementara data selama eksekusi prosedur atau query tertentu. 
Mereka berguna ketika Anda perlu menyimpan hasil perhitungan atau set data sementara yang tidak perlu disimpan secara permanen di dalam database.

Ada dua jenis temporary table dalam SQL Server:

	1.Local Temporary Table (#table):
		Tabel sementara lokal hanya terlihat dan dapat diakses dalam sesi atau koneksi yang membuatnya.
		Tabel ini akan dihapus secara otomatis ketika sesi atau koneksi yang membuatnya ditutup.
		Nama tabel diawali dengan tanda pagar #.

	Contoh pembuatan dan penggunaan local temporary table:

		CREATE TABLE #TempTable (
			ID INT,
			Name VARCHAR(50)
		);

		INSERT INTO #TempTable (ID, Name)
		VALUES (1, 'John'), (2, 'Jane');

		SELECT * FROM #TempTable;

	-- Tabel akan dihapus secara otomatis ketika sesi ditutup.

	2.Global Temporary Table (##table):

		Tabel sementara global dapat diakses oleh semua sesi atau koneksi dalam satu instance SQL Server.
		Tabel ini akan dihapus secara otomatis ketika sesi yang membuatnya ditutup, atau jika tidak ada sesi yang menggunakan tabel tersebut.
		Nama tabel diawali dengan dua tanda pagar ##.


	Contoh pembuatan dan penggunaan global temporary table:

		CREATE TABLE ##TempTable (
		ID INT,
		Name VARCHAR(50)
		);

		INSERT INTO ##TempTable (ID, Name)
		VALUES (1, 'John'), (2, 'Jane');

		SELECT * FROM ##TempTable;

	-- Tabel akan dihapus secara otomatis ketika sesi yang membuatnya ditutup, atau jika tidak ada sesi yang menggunakan tabel tersebut.
*/

------------------------------------------------------ Local Temporary Table (#table) ------------------------------------------------------------------

-- membuat Local Temporary Table "#employee"
create table #employee(
	employee_id int identity primary key,
	name varchar(100)
)

select * from #employee

-- memasukan data ke dalam Local Temporary Table "#employee"
insert into #employee (name)values('budi susanto')

-- SELECT INTO yang digunakan untuk membuat dan mengisi data ke dalam sebuah temporary table. 
-- Dalam contoh ini, temporary table bernama #person3 akan dibuat dan diisi dengan seluruh data dari tabel person.
select * into #person3 from person

-- menampilkan seluruh data yang berada pada Local Temporary Table "#person3"
select * from #person3

-- untuk mendapatkan informasi mengenai tabel-tabel yang ada di dalam basis data. 
select * from INFORMATION_SCHEMA.TABLES

------------------------------------------------------ Global Temporary Table (##table) ----------------------------------------------------------------

-- SELECT INTO yang digunakan untuk membuat dan mengisi data ke dalam sebuah temporary table. 
-- Dalam contoh ini, temporary table bernama ##person4 akan dibuat dan diisi dengan seluruh data dari tabel person
select * into ##person4 from person

-- menampilkan seluruh data yang berada pada Global Temporary Tablee "##person4"
select * from ##person4


