-- mengakses schemas
select * from INFORMATION_SCHEMA.TABLES

-- membuat schemas baru
create schema penjualan;
create schema pembelian;

-- membuat table di schema penjualan
create table penjualan.barang(
barang_id int primary key identity(1,1),
nama varchar(100));

-- mengakses schemas penjualan
select * from penjualan.barang;

-- menghapus table pada schema penjualan
drop table penjualan.barang;

-- menghapus schema penjualan
drop schema penjualan;

-- Note: Untuk menghapus sebuah schema, harus menghapus dulu table yang berada pada schema tersebut

-- menghapus schema pembelian
drop schema pembelian;