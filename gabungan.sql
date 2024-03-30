-- Membuat table kitas atau kitap
CREATE TABLE IF NOT EXISTS kitas (
    noKitas CHAR(11) PRIMARY KEY NOT NULL,
    detailKitas VARCHAR(20)
);


create table if not exists paspor (
    noPaspor Char(9) primary key not null,
    detailPaspor Varchar(20)
);

create table if not exists gender(
    idGender Char(1) primary key not null,
    nameGender Varchar(20)
);

create table if not exists agama(
    idAgama Char(1) primary key not null,
    nameAgama Varchar(20)
);

create table if not exists pendidikan(
    idPendidikan Char(1) primary key not null,
    namePendidikan Varchar(20)
);

create table if not exists maried(
    idMaried Char(1) primary key not null,
    dateMaried Date,
    StatusMaried Varchar(20)
);

create table if not exists citizenship(
    idCitizenship Char(1) primary key not null,
    nameCitizenship Varchar(20)
);

create table if not exists pekerjaan(
    idPekerjaan Char(2) primary key not null,
    namePekerjaan Varchar(20)
);

create table if not exists blood(
    idBlood Char(2) primary key not null,
    nameBlood Varchar(20)
);

-- table di bawah ini untuk data wilayah

create table if not exists provinsi(
    idProvinsi Char(2) primary key not null,
    nameProvinsi Varchar(20)
);

create table if not exists kabupaten(
    idKabupaten Char(4) primary key not null,
    nameKabupaten Varchar(20)
);

create table if not exists kecamatan(
    idKecamatan Char(6) primary key not null,
    nameKecamatan Varchar(20),
    kodePos Char(5)
);

create table if not exists kelurahan(
    idKelurahan Char(8) primary key not null,
    nameKelurahan Varchar(20)
);

create table if not exists dusun(
    idDusun Char(10) primary key not null,
    nameDusun Varchar(20)
);

-- table di bawah ini untuk pejabat, akta, ktp

create table if not exists jabatan(
    idJabatan Char(5) primary key not null,
    nameJabatan Varchar(20)
);

create table if not exists pejabat(
    NIP Char(18) primary key not null,
    namePejabat Varchar(50),
    startMenjabat Date,
    endMenjabat Date
);

create table if not exists akta(
    idAkta Char(16) primary key not null,
    tanggalKeluar Date,
    anakKe Char(2),
    noAl Char(10),
    noReg Char(10)
);

create table if not exists ktp(
    noKTP Char(16) primary key not null,
    tanggalPembuatan Date,
    tandaTangan blob,
    fotoKtp blob
);

-- table di bawah ini untuk kartu keluarga

create table if not exists kartuKeluarga(
    noKK Char(16) primary key not null,
    alamat Varchar(50),
    tanggalKeluar Date,
    rt Char(3),
    rw Char(3)
);

create table if not exists anggotaKeluarga(
    NIK Char(16) primary key not null,
    namaAnggota Varchar(50),
    tanggalLahir Date
);

create table if not exists hubunganKeluarga(
    idHubungan Char(2) primary key not null,
    nameHubungan Varchar(20)
);


-- kode di bawah ini untuk menghubungkan semua table wilayah dengan relasi
alter table kabupaten
add idProvinsi Char(2),
add constraint FK_1PROV_MKAB foreign key (idProvinsi) references provinsi (idProvinsi) on delete restrict on update cascade;

alter table kecamatan
add idProvinsi Char(2),
add idKabupaten Char(4),
add constraint FK_1KAB_MKEC foreign key (idKabupaten) references kabupaten (idKabupaten) on delete restrict on update cascade,
add constraint FK_1PROV_MKEC foreign key (idProvinsi) references provinsi (idProvinsi) on delete restrict on update cascade;

alter table kelurahan
add idProvinsi Char(2),
add idKabupaten Char(4),
add idKecamatan Char(6),
add constraint FK_1PROV_MKEL foreign key (idProvinsi) references provinsi (idProvinsi) on delete restrict on update cascade,
add constraint FK_1KAB_MKEL foreign key (idKabupaten) references kabupaten (idKabupaten) on delete restrict on update cascade,
add constraint FK_1KEC_MKEL foreign key (idKecamatan) references kecamatan (idKecamatan) on delete restrict on update cascade;

alter table dusun
add idProvinsi Char(2),
add idKabupaten Char(4),
add idKecamatan Char(6),
add idKelurahan Char(8),
add constraint FK_1PROV_MDUS foreign key (idProvinsi) references provinsi (idProvinsi) on delete restrict on update cascade,
add constraint FK_1KAB_MDUS foreign key (idKabupaten) references kabupaten (idKabupaten) on delete restrict on update cascade,
add constraint FK_1KEC_MDUS foreign key (idKecamatan) references kecamatan (idKecamatan) on delete restrict on update cascade,
add constraint FK_1KEL_MDUS foreign key (idKelurahan) references kelurahan (idKelurahan) on delete restrict on update cascade;

-- alter table jabatan 
alter table jabatan 
add NIP Char(18),
add constraint FK_1NIP_MJAB foreign key (NIP) references pejabat (NIP) on delete restrict on update cascade;

-- alter table ktp 
alter table ktp
add NIK Char(16),
add constraint FK_1NIK_1KTP foreign key (NIK) references anggotaKeluarga (NIK) on delete restrict on update restrict;

-- alter table akta
alter table akta 
add NIK Char(16),
add NIP Char(18),
add ang_NIK Char(16),
add constraint FK_1NIP_MAKTA foreign key (NIP) references pejabat (NIP) on delete restrict on update cascade,
add constraint FK_1NIK_MAKTA foreign key (ang_NIK) references anggotaKeluarga (ang_NIK) on delete restrict on update restrict,
add constraint FK_1NIK_MAKTA foreign key (NIK) references anggotaKeluarga (NIK) on delete restrict on update restrict,

-- Alter table kartuKeluarga
ALTER TABLE kartuKeluarga
ADD COLUMN NIP2 CHAR(18),
ADD COLUMN idProvinsi CHAR(2),
ADD COLUMN idKabupaten CHAR(4),
ADD COLUMN idKecamatan CHAR(6),
ADD COLUMN idKelurahan CHAR(8),
ADD COLUMN idDusun CHAR(10),
ADD COLUMN idHubungan CHAR(2),
ADD CONSTRAINT FK_1NIP_MKK FOREIGN KEY (NIP2) REFERENCES pejabat (NIP) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1PROV_MKK FOREIGN KEY (idProvinsi) REFERENCES provinsi (idProvinsi) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KAB_MKK FOREIGN KEY (idKabupaten) REFERENCES kabupaten (idKabupaten) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KEC_MKK FOREIGN KEY (idKecamatan) REFERENCES kecamatan (idKecamatan) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KEL_MKK FOREIGN KEY (idKelurahan) REFERENCES kelurahan (idKelurahan) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1DUS_MKK FOREIGN KEY (idDusun) REFERENCES dusun (idDusun) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1HUB_MKK FOREIGN KEY (idHubungan) REFERENCES hubunganKeluarga (idHubungan) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table anggotaKeluarga
alter table anggotaKeluarga
add noKTP Char(16),
add idBlood Char(2),
add idPendidikan Char(1),
add noKitas Char(11),
add idCitizenship Char(1),
add idGender Char(1),
add idPekerjaan Char(2),
add idAgama Char(1),
add idMaried Char(1),
add idDusun Char(10),
add idKelurahan Char(8),
add idKecamatan Char(6),
add idKabupaten Char(4),
add idProvinsi Char(2),
add idHubungan Char(2),
add noPaspor Char(9),
add noKK Char(16),
add dusKabupaten Char(4),
add kabProvinsi Char(2),
add constraint FK_1KTP_1AK foreign key (noKTP) references ktp (noKTP) on delete restrict on update restrict,
add constraint FK_AK_1BLOOD foreign key (idBlood) references blood (idBlood) on delete restrict on update restrict,
add constraint FK_1AK_MPEND foreign key (idPendidikan) references pendidikan (idPendidikan) on delete restrict on update restrict,
add constraint FK_1KITAS_1AK foreign key (noKitas) references kitas (noKitas) on delete restrict on update restrict,
add constraint FK_1AK_1CITIZEN foreign key (idCitizenship) references citizenship (idCitizenship) on delete restrict on update restrict,
add constraint FK_1AK_1GENDER foreign key (idGender) references gender (idGender) on delete restrict on update restrict,
add constraint FK_1AK_1PEKERJAAN foreign key (idPekerjaan) references pekerjaan (idPekerjaan) on delete restrict on update restrict,
add constraint FK_1AK_1AGAMA foreign key (idAgama) references agama (idAgama) on delete restrict on update restrict,
add constraint FK_1AK_1MARIED foreign key (idMaried) references maried (idMaried) on delete restrict on update restrict,
add constraint FK_1AK_1DUSUN foreign key (idDusun, idKelurahan, idKecamatan, idKabupaten, idProvinsi, dusKabupaten) references dusun (idDusun, idKelurahan, idKecamatan, idKabupaten, idProvinsi) on delete restrict on update cascade,
-- add constraint FK_1AK_1KEL foreign key (idKelurahan) references kelurahan (idKelurahan) on delete restrict on update cascade
-- add constraint FK_1AK_1KEC foreign key (idKecamatan) references kecamatan (idKecamatan) on delete restrict on update cascade
-- add constraint FK_1AK_1KAB foreign key (idKabupaten) references kabupaten (idKabupaten) on delete restrict on update cascade
-- add constraint FK_1AK_1PROV foreign key (idProvinsi) references provinsi (idProvinsi) on delete restrict on update cascade
add constraint FK_1AK_1KabProv foreign key (idProvinsi, kabProvinsi) references kabupaten (idProvinsi, idKabupaten) on delete restrict on update cascade,
add constraint FK_1AK_1HUBUNGAN foreign key (idHubungan) references hubunganKeluarga (idHubungan) on delete restrict on update restrict,
add constraint FK_1PASPOR_1AK foreign key (noPaspor) references paspor (noPaspor) on delete restrict on update restrict,
add constraint FK_1KK_1AK foreign key (noKK) references kartuKeluarga (noKK) on delete restrict on update restrict;