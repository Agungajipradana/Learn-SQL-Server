/*
Pada SQL Server, klausa LIKE digunakan untuk melakukan pencarian pola string dalam nilai kolom. Klausa ini sering digunakan dalam 
pernyataan WHERE untuk memfilter baris yang memiliki nilai yang cocok dengan pola tertentu.

Sintaksis umum LIKE adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table_name
	WHERE column_name LIKE pattern;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- column_name: Kolom yang akan diuji untuk mencocokkan pola.
	- pattern: Pola yang akan dicocokkan dengan nilai kolom. Pola dapat mencakup karakter khusus seperti % 
	(mewakili nol atau lebih karakter) dan _ (mewakili satu karakter).

Contoh penggunaan LIKE:

	SELECT * FROM products
	WHERE product_name LIKE 'Apple%';

Contoh di atas akan mengambil semua baris dari tabel "products" di mana nilai kolom "product_name" dimulai dengan kata "Apple".

Beberapa contoh pola LIKE yang umum:

	- %value%: Cocokkan nilai yang mengandung "value" di mana saja dalam string.
	- value%: Cocokkan nilai yang dimulai dengan "value".
	- %value: Cocokkan nilai yang diakhiri dengan "value".
	- value%value: Cocokkan nilai yang dimulai dengan "value" dan diikuti oleh setiap karakter dan akhirnya diakhiri dengan "value".
	- _value% : Cocokkan nilai yang dimulai dengan satu karakter apa pun, diikuti oleh "value", dan diikuti oleh setiap karakter.
	- [value]% : Cocokkan nilai yang dimulai dengan satu karakter yang sama dengan "value" dan diikuti oleh setiap karakter.
	- [value-value]% : Cocokkan nilai yang dimulai dengan satu karakter dalam rentang antara "value" dan "value", 
	dan diikuti oleh setiap karakter.
	- [^value-value]% : Cocokkan nilai yang dimulai dengan satu karakter yang BUKAN dalam rentang antara "value" dan "value", 
	dan diikuti oleh setiap karakter.
	- %value!%%" ESCAPE "I" : Cocokkan nilai yang mengandung substring "value%", dan karakter "!" dianggap sebagai karakter pelarian 
	(escape character). Oleh karena itu, karakter "I" digunakan sebagai karakter pelarian.
	- _: Cocokkan satu karakter.
	- []: Cocokkan karakter dalam kisaran tertentu.
	- 

Pola-pola ini dapat dikombinasikan dan disesuaikan sesuai dengan kebutuhan pencarian Anda.
*/

select * from employee

-- memasukkan data ke dalam table "employee"
insert into employee (name, address, phone) values ('Riswan Saputra', 'Jakarta', '082124308451')
insert into employee (name, address, phone) values ('Budi Hartono', 'Bandung', '082124308452')
insert into employee (name, address, phone) values ('Isyana Susanti', 'Jakarta', '082124308453')
insert into employee (name, address, phone) values ('Riska', 'Surabaya', '082124308454')
insert into employee (name, address, phone) values ('Sholeh', 'Malang', '082124308455')
insert into employee (name, address, phone) values ('Datu Miguel', 'Bali', '082124308456')
insert into employee (name, address, phone) values ('Roman Artisan', 'Jakarta', '082124308457')
insert into employee (name, address, phone) values ('Robert Junior', 'Bandung', '082124308458')
insert into employee (name, address, phone) values ('Kiki Nurmala', 'Yogyakarta', '082124308459')
insert into employee (name, address, phone) values ('Jody Susanto', 'Bali', '082124308410')
insert into employee (name, address, phone) values ('Reni Scolastica', 'Malang', '082124308411')
insert into employee (name, address, phone) values ('Indah Cantika', 'Bandung', '082124308412')
insert into employee (name, address, phone) values ('Riki Ruswandi', 'Bekasi', '082124308413')
insert into employee (name, address, phone) values ('Raka Iskandar', 'Malang', '082124308414')
insert into employee (name, address, phone) values ('Rina Abigel', 'Surabaya', '082124308415')
insert into employee (name, address, phone) values ('Zaenal Arifin', 'Yogyakarta', '082124308416')
insert into employee (name, address, phone) values ('Sukma Iin', 'Malang', '082124308417')
insert into employee (name, address, phone) values ('Ratna Satin', 'Malang', '082124308418')
insert into employee (name, address, phone) values ('Rudi Salihin', 'Bekasi', '082124308419')
insert into employee (name, address, phone) values ('Anissa Larasati', 'Magelang', '082124308420')
insert into employee (name, address, phone) values ('Aji Santoso', 'Pemalang', '08212430842')
insert into employee (name, address, phone) values ('Bunga Mawar', 'Tangerang', '08212430843')

--------------------------------- %value%: Cocokkan nilai yang mengandung "value" di mana saja dalam string ---------------------------

-- menampilkan semua data pada table "employee" dimana pada column "name" like '%NA%'
-- akan menampilkan nilai yang mengandung "NA" di mana saja dalam column "name" 
select * from employee where name like '%NA%'

---------------------------------------- value%: Cocokkan nilai yang dimulai dengan "value" -------------------------------------------

-- menampilkan semua data pada table "employee" dimana pada column "name" like 'RI%'
-- akan menampilkan nilai yang dimulai dengan "RI" dalam column "name" 
select * from employee where name like 'RI%'

--------------------------------------- %value: Cocokkan nilai yang diakhiri dengan "value" -------------------------------------------

-- menampilkan semua data pada table "employee" dimana pada column "name" like '%IN'
-- akan menampilkan nilai yang diakhiri dengan "IN" dalam column "name" 
select * from employee where name like '%IN'

--------------------------------------------------- value%value: ----------------------------------------------------------------------
---------- Cocokkan nilai yang dimulai dengan "value" dan diikuti oleh setiap karakter dan akhirnya diakhiri dengan "value". -----------

-- menampilkan semua data pada table "employee" dimana pada column "name" like 'R%N'
-- akan menampilkan nilai dimulai dengan "R" dan diakhiri dengan "N" dalam column "name" 
select * from employee where name like 'R%N'

------------------------------------------------------ _value% : ----------------------------------------------------------------------- 
---------- Cocokkan nilai yang dimulai dengan satu karakter apa pun, diikuti oleh "value", dan diikuti oleh setiap karakter. -----------

-- menampilkan semua data pada table "employee" dimana pada column "name" like '_U%'
-- akan menampilkan nilai yang dimulai dengan satu karakter apa pun, diikuti oleh "U", dan diikuti oleh setiap karakter
-- dalam column "name" 
select * from employee where name like '_U%'

------------------------------------------------------ [value]% : --------------------------------------------------------------------- 
------------- Cocokkan nilai yang dimulai dengan satu karakter yang sama dengan "value" dan diikuti oleh setiap karakter. -------------

-- menampilkan semua data pada table "employee" dimana pada column "name" like '[AB]%'
-- akan menampilkan nilai yang dimulai dengan "A" dan nilai yang dimulai dengan "B" dalam column "name" 
select * from employee where name like '[AB]%'

----------------------------------------------------- [value-value]% : ----------------------------------------------------------------
----- Cocokkan nilai yang dimulai dengan satu karakter dalam rentang antara "value" dan "value", dan diikuti oleh setiap karakter. -----

-- menampilkan semua data pada table "employee" dimana pada column "name" like '[A-D]%'
-- akan menampilkan nilai yang dimulai dengan "A" sampai nilai yang dimulai dengan "D" dalam column "name" 
select * from employee where name like '[A-D]%'

----------------------------------------------------- [^value-value]% : --------------------------------------------------------------- 
------------- Cocokkan nilai yang dimulai dengan satu karakter yang BUKAN dalam rentang antara "value" dan "value", -------------------
------------------------------------------- dan diikuti oleh setiap karakter. ---------------------------------------------------------

-- menampilkan semua data pada table "employee" dimana pada column "name" like '[^A-X]%'
-- akan menampilkan nilai dimulai dengan satu karakter yang BUKAN dalam rentang antara "A" sampai "X" dalam column "name" 
select * from employee where name like '[^A-X]%'

--------------------------------------------------- %value!%%" ESCAPE "I" : -----------------------------------------------------------
-------------- Cocokkan nilai yang mengandung substring "value%", dan karakter "!" dianggap sebagai karakter pelarian -----------------
----------------- (escape character). Oleh karena itu, karakter "I" digunakan sebagai karakter pelarian. ------------------------------
select * from employee where name like '%30!%%' escape 'I'