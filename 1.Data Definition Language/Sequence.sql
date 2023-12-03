/*
Dalam konteks sistem manajemen basis data relasional (RDBMS) seperti SQL Server, "sequence" umumnya merujuk pada objek database 
yang menyediakan serangkaian nilai numerik yang unik dan berturut-turut. Di SQL Server, objek ini disebut sebagai "IDENTITY" atau "SEQUENCE." 
Mari kita bahas keduanya:

1.IDENTITY Columns:

	Kegunaan: Kolom IDENTITY digunakan untuk menyediakan nilai numerik yang unik dan bertambah otomatis setiap kali baris baru 
	dimasukkan ke dalam tabel.
	Cara Penggunaan: Saat Anda mendefinisikan kolom dengan IDENTITY, setiap kali Anda menyisipkan baris baru tanpa memberikan nilai 
	untuk kolom tersebut, SQL Server secara otomatis memberikan nilai yang unik dan bertambah satu.

	Contoh:
	CREATE TABLE ExampleTable (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
	);

2.SEQUENCE Objects:

	Kegunaan: Sequence adalah objek database yang independen dan menyediakan serangkaian nilai numerik yang unik dan 
	bertambah sesuai dengan aturan yang Anda tentukan.
	Cara Penggunaan: Sequence dapat digunakan untuk menyediakan nilai unik di seluruh database, tidak terbatas pada satu tabel tertentu.

	Contoh:
	CREATE SEQUENCE ExampleSequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 1000
    CYCLE;

	Kemudian, sequence ini bisa digunakan dalam pernyataan INSERT untuk menyediakan nilai unik:

	INSERT INTO ExampleTable (ID, Name)
	VALUES (NEXT VALUE FOR ExampleSequence, 'John Doe');

	Dengan menggunakan IDENTITY atau SEQUENCE, Anda dapat dengan mudah menyediakan nilai unik yang bertambah secara otomatis untuk 
	mengidentifikasi setiap baris dalam tabel Anda. Penggunaan ini umumnya berguna untuk menghindari konflik dan menyederhanakan 
	manajemen identitas dalam basis data Anda.
*/

/*
CREATE SEQUENCE [schema_name.] sequence_name
	[ AS integer_type ]
	[ START WITH start_value ]
	[ INCREMENT BY increment_value ]
	[ { MINVALUE [ min_value ] } | { NO MINVALUE } ]
	[ { MAXVALUE [ max_value ] } | { NO MAXVALUE } ]
	[ CYCLE | { NO CYCLE } ]
	[ { CACHE [ cache_size ] } | { NO CACHE } ]
*/

-- membuat sequence dengan schema secara default yang nanti akan tersimpan di schema dbo
create sequence counter_item 
	as int
	start with 1
	increment by 1

-- memanggil sequence "counter_item"
select next value for counter_item

-- membuat table penjualan dengan schema secara default
create table penjualan (
order_id int,
order_date date,
)

-- membuat table pembelian dengan schema secara default
create table pembelian (
order_id int,
order_date date,
)

-- memasukan data ke dalam table "penjualan"
insert into penjualan(order_id,order_date)values(next value for counter_item,getdate())

-- memasukan data ke dalam table "pembelian"
insert into pembelian(order_id,order_date)values(next value for counter_item,getdate())

select * from penjualan
select * from pembelian