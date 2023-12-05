/*
Dengan perintah ALTER COLUMN pada SQL Server, Anda dapat melakukan beberapa perubahan pada definisi kolom. 
Beberapa perubahan yang dapat Anda lakukan melalui ALTER COLUMN termasuk:

1.Perubahan Tipe Data:
	Anda dapat mengubah tipe data dari kolom, misalnya, dari VARCHAR menjadi INT.

	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom TipeDataBaru;

2.Mengubah Kekonstrainan NOT NULL:
	Anda dapat menambah atau menghapus kekonstrainan NOT NULL pada kolom.

	-- Menambahkan NOT NULL
	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom TipeData NOT NULL;

	-- Menghapus NOT NULL
	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom TipeData NULL;

3.Mengubah Default Value:
	Anda dapat mengubah nilai default yang akan digunakan untuk kolom.

	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom SET DEFAULT NilaiDefaultBaru;

4.Mengubah Klausa COMPUTED PERSISTED:
	Jika kolom memiliki klausa COMPUTED PERSISTED, Anda dapat mengubah ekspresi perhitungan atau menghapusnya.

	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom ADD COMPUTED PERSISTED;

5.Mengubah Klausa IDENTITY:
	Jika kolom adalah IDENTITY, Anda dapat menonaktifkan IDENTITY atau mengubah seed dan increment.

	-- Menonaktifkan IDENTITY
	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom DROP IDENTITY;

	-- Mengubah seed dan increment
	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom IDENTITY (SeedBaru, IncrementBaru);

6.Mengubah COLLATION:
	Anda dapat mengubah urutan penyusunan karakter (collation) pada kolom.

	ALTER TABLE nama_tabel
	ALTER COLUMN nama_kolom TipeData COLLATE UrutanPenyusunanBaru;
*/

select * from pembelian

-- merubah tipe data kolom "total" pada tabel "pembelian" yang tadinya tipe data "money" menjadi "int" (integer). 
alter table pembelian
alter column total int

-- merubah size pada kolom "information" pada tabel "pembelian" yang tadinya "varchar(100)" menjadi "varchar(50)"
alter table pembelian
alter column information varchar(50)

-- merubah constraint pada kolom "order_date" pada tabel "pembelian" yang tadinya "null" menjadi "not null"
alter table pembelian
alter column order_date date not null

-- merubah collate pada kolom "information" pada tabel "pembelian" 
alter table pembelian
alter column information varchar(50) collate sql_latin1_general_cp1_ci_as

-- untuk mendapatkan informasi tentang urutan penyusunan karakter yang tersedia di server SQL Server
select name, description
from fn_helpcollations()

-- untuk mendapatkan informasi tentang default collate
select name, collation_name dbcolattion
from sys.databases