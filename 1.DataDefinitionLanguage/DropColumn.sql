/*
Perintah DROP COLUMN pada SQL Server digunakan untuk menghapus sebuah kolom dari sebuah tabel. 
Pada saat menghapus kolom, semua data yang terkait dengan kolom tersebut juga akan dihapus. Sebagai contoh, perhatikan sintaksisnya:

	ALTER TABLE nama_tabel
	DROP COLUMN nama_kolom;

Di mana:

	nama_tabel: Merupakan nama tabel yang berisi kolom yang ingin dihapus.
	nama_kolom: Merupakan nama kolom yang akan dihapus dari tabel.

Contoh penggunaan:
	-- Menghapus kolom 'keterangan' dari tabel 'transaksi'

	ALTER TABLE transaksi
	DROP COLUMN keterangan;
*/

select * from pembelian

-- menambahkan kolom "price" pada tabel "pembelian" dengan constraint ck_positive_only agar bilangan tersebut harus positive
alter table pembelian 
add price decimal(10,2) constraint ck_positive_only check (price >= 0)

-- menghapus kolom "information" pada tabel "pembelian"
alter table pembelian
drop column information

-- menghapus constraint "ck_positive_only" pada tabel "pembelian"
alter table pembelian
drop constraint ck_positive_only