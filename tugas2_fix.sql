/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     30/03/2024 13:41:20                          */
/*==============================================================*/


alter table AKTA 
   drop foreign key FK_AKTA_IBU_ANGGOTA;

alter table AKTA 
   drop foreign key FK_AKTA_RELATIONS_PEJABAT;

alter table AKTA 
   drop foreign key FK_AKTA_RELATIONS_ANGGOTA;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_CITIZENSH_WARGANEG;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_GENDER_JENISKEL;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_GOLONGAN__GOLONGAN;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_JOB_PEKERJAA;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_MARRIED_STATUSPE;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_PASPORT2_PASPOR;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_PENDIDIKA_PENDIDIK;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KTP;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_HUBUNGAN;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_DUSUN;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KITAS_KI;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KARTUKEL;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KABUPATE;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELIGION_AGAMA;

alter table DUSUN 
   drop foreign key FK_DUSUN_RELATIONS_KELURAHA;

alter table JABATAN 
   drop foreign key FK_JABATAN_RELATIONS_PEJABAT;

alter table KABUPATEN 
   drop foreign key FK_KABUPATE_1PROV_MKA_PROVINSI;

alter table KARTUKELUARGA 
   drop foreign key FK_KARTUKEL_RELATIONS_HUBUNGAN;

alter table KARTUKELUARGA 
   drop foreign key FK_KARTUKEL_RELATIONS_PEJABAT;

alter table KARTUKELUARGA 
   drop foreign key FK_KARTUKEL_RELATIONS_DUSUN;

alter table KECAMATAN 
   drop foreign key FK_KECAMATA_1KAB_MKEC_KABUPATE;

alter table KELURAHAN 
   drop foreign key FK_KELURAHA_1KEC_MKEL_KECAMATA;

alter table KITAS_KITAP 
   drop foreign key FK_KITAS_KI_RELATIONS_ANGGOTA;

alter table KTP 
   drop foreign key FK_KTP_RELATIONS_ANGGOTA;

alter table PASPOR 
   drop foreign key FK_PASPOR_PASPORT_ANGGOTA;

drop table if exists AGAMA;


alter table AKTA 
   drop foreign key FK_AKTA_IBU_ANGGOTA;

alter table AKTA 
   drop foreign key FK_AKTA_RELATIONS_PEJABAT;

alter table AKTA 
   drop foreign key FK_AKTA_RELATIONS_ANGGOTA;

drop table if exists AKTA;


alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_GENDER_JENISKEL;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELIGION_AGAMA;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_PENDIDIKA_PENDIDIK;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_JOB_PEKERJAA;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_MARRIED_STATUSPE;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_CITIZENSH_WARGANEG;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_GOLONGAN__GOLONGAN;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KTP;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_HUBUNGAN;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_DUSUN;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_PASPORT2_PASPOR;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KITAS_KI;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KARTUKEL;

alter table ANGGOTA 
   drop foreign key FK_ANGGOTA_RELATIONS_KABUPATE;

drop table if exists ANGGOTA;


alter table DUSUN 
   drop foreign key FK_DUSUN_RELATIONS_KELURAHA;

drop table if exists DUSUN;

drop table if exists GOLONGANDARAH;

drop table if exists HUBUNGAN;


alter table JABATAN 
   drop foreign key FK_JABATAN_RELATIONS_PEJABAT;

drop table if exists JABATAN;

drop table if exists JENISKELAMIN;


alter table KABUPATEN 
   drop foreign key FK_KABUPATE_1PROV_MKA_PROVINSI;

drop table if exists KABUPATEN;


alter table KARTUKELUARGA 
   drop foreign key FK_KARTUKEL_RELATIONS_HUBUNGAN;

alter table KARTUKELUARGA 
   drop foreign key FK_KARTUKEL_RELATIONS_PEJABAT;

alter table KARTUKELUARGA 
   drop foreign key FK_KARTUKEL_RELATIONS_DUSUN;

drop table if exists KARTUKELUARGA;


alter table KECAMATAN 
   drop foreign key FK_KECAMATA_1KAB_MKEC_KABUPATE;

drop table if exists KECAMATAN;


alter table KELURAHAN 
   drop foreign key FK_KELURAHA_1KEC_MKEL_KECAMATA;

drop table if exists KELURAHAN;


alter table KITAS_KITAP 
   drop foreign key FK_KITAS_KI_RELATIONS_ANGGOTA;

drop table if exists KITAS_KITAP;


alter table KTP 
   drop foreign key FK_KTP_RELATIONS_ANGGOTA;

drop table if exists KTP;


alter table PASPOR 
   drop foreign key FK_PASPOR_PASPORT_ANGGOTA;

drop table if exists PASPOR;

drop table if exists PEJABAT;

drop table if exists PEKERJAAN;

drop table if exists PENDIDIKAN;

drop table if exists PROVINSI;

drop table if exists STATUSPERNIKAHAN;

drop table if exists WARGANEGARA;

/*==============================================================*/
/* Table: AGAMA                                                 */
/*==============================================================*/
create table AGAMA
(
   KODEAGAMA            char(2) not null  comment '',
   NAMAAGAMA            varchar(16) not null  comment '',
   primary key (KODEAGAMA)
);

/*==============================================================*/
/* Table: AKTA                                                  */
/*==============================================================*/
create table AKTA
(
   NOAKTA               char(16) not null  comment '',
   NIK                  char(16)  comment '',
   NIP                  char(18)  comment '',
   ANG_NIK              char(16)  comment '',
   TANGGALKELUAR        date not null  comment '',
   ANAK_KE              char(2)  comment '',
   NO_AL                char(10)  comment '',
   NO_REG               char(10)  comment '',
   primary key (NOAKTA)
);

/*==============================================================*/
/* Table: ANGGOTA                                               */
/*==============================================================*/
create table ANGGOTA
(
   NIK                  char(16) not null  comment '',
   NOKTP                char(16)  comment '',
   KODEGOLONGANDARAH    char(6)  comment '',
   KODEPENDIDIKAN       char(3)  comment '',
   NO_KITAS_KITAP       char(11)  comment '',
   KODEWARGANEGARA      char(4)  comment '',
   KODEJENISKELAMIN     char(1)  comment '',
   KODEPROVINSI         char(3)  comment '',
   DUS_KODEKABUPATEN    char(4)  comment '',
   KODEKECAMATAN        char(6)  comment '',
   KODEKELURAHAN        char(8)  comment '',
   IDDUSUN              char(10)  comment '',
   KODEPEKERJAAN        char(6)  comment '',
   ID_PASPOR            char(9)  comment '',
   NOKK                 char(16)  comment '',
   KAB_KODEPROVINSI     char(3)  comment '',
   KODEKABUPATEN        char(4)  comment '',
   KODEAGAMA            char(2)  comment '',
   IDSTATUSHUBUNGAN     char(2)  comment '',
   KODEPERNIKAHAN       char(1)  comment '',
   NAMA                 varchar(54) not null  comment '',
   TANGGALL             date not null  comment '',
   primary key (NIK)
);

/*==============================================================*/
/* Table: DUSUN                                                 */
/*==============================================================*/
create table DUSUN
(
   KODEPROVINSI         char(3) not null  comment '',
   KODEKABUPATEN        char(4) not null  comment '',
   KODEKECAMATAN        char(6) not null  comment '',
   KODEKELURAHAN        char(8) not null  comment '',
   IDDUSUN              char(10) not null  comment '',
   NAMADUSUN            varchar(30)  comment '',
   primary key (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN, IDDUSUN)
);

/*==============================================================*/
/* Table: GOLONGANDARAH                                         */
/*==============================================================*/
create table GOLONGANDARAH
(
   KODEGOLONGANDARAH    char(6) not null  comment '',
   JENISGOLONGANDARAH   varchar(8)  comment '',
   primary key (KODEGOLONGANDARAH)
);

/*==============================================================*/
/* Table: HUBUNGAN                                              */
/*==============================================================*/
create table HUBUNGAN
(
   IDSTATUSHUBUNGAN     char(2) not null  comment '',
   STATUSHUBUNGAN       varchar(8) not null  comment '',
   primary key (IDSTATUSHUBUNGAN)
);

/*==============================================================*/
/* Table: JABATAN                                               */
/*==============================================================*/
create table JABATAN
(
   NIP                  char(18)  comment '',
   KODEJABATAN          char(5)  comment '',
   NAMAJABATAN          varchar(200)  comment ''
);

/*==============================================================*/
/* Table: JENISKELAMIN                                          */
/*==============================================================*/
create table JENISKELAMIN
(
   KODEJENISKELAMIN     char(1) not null  comment '',
   NAMAJENISKELAMIN     varchar(12) not null  comment '',
   primary key (KODEJENISKELAMIN)
);

/*==============================================================*/
/* Table: KABUPATEN                                             */
/*==============================================================*/
create table KABUPATEN
(
   KODEPROVINSI         char(3) not null  comment '',
   KODEKABUPATEN        char(4) not null  comment '',
   NAMAKABUPATEN        varchar(32) not null  comment '',
   primary key (KODEPROVINSI, KODEKABUPATEN)
);

/*==============================================================*/
/* Table: KARTUKELUARGA                                         */
/*==============================================================*/
create table KARTUKELUARGA
(
   NOKK                 char(16) not null  comment '',
   NIP                  char(18)  comment '',
   KODEPROVINSI         char(3)  comment '',
   KODEKABUPATEN        char(4)  comment '',
   KODEKECAMATAN        char(6)  comment '',
   KODEKELURAHAN        char(8)  comment '',
   IDDUSUN              char(10)  comment '',
   IDSTATUSHUBUNGAN     char(2)  comment '',
   ALAMAT               varchar(32) not null  comment '',
   TANGGALKELUAR        date not null  comment '',
   RT                   char(3)  comment '',
   RW                   char(3)  comment '',
   primary key (NOKK)
);

/*==============================================================*/
/* Table: KECAMATAN                                             */
/*==============================================================*/
create table KECAMATAN
(
   KODEPROVINSI         char(3) not null  comment '',
   KODEKABUPATEN        char(4) not null  comment '',
   KODEKECAMATAN        char(6) not null  comment '',
   NAMAKECAMATAN        varchar(32) not null  comment '',
   KODEPOS              char(5) not null  comment '',
   primary key (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN)
);

/*==============================================================*/
/* Table: KELURAHAN                                             */
/*==============================================================*/
create table KELURAHAN
(
   KODEPROVINSI         char(3) not null  comment '',
   KODEKABUPATEN        char(4) not null  comment '',
   KODEKECAMATAN        char(6) not null  comment '',
   KODEKELURAHAN        char(8) not null  comment '',
   NAMAKELURAHAN        varchar(32) not null  comment '',
   primary key (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN)
);

/*==============================================================*/
/* Table: KITAS_KITAP                                           */
/*==============================================================*/
create table KITAS_KITAP
(
   NO_KITAS_KITAP       char(11) not null  comment '',
   NIK                  char(16)  comment '',
   DETIL_KITAS_KITAP    varchar(20)  comment '',
   primary key (NO_KITAS_KITAP)
);

/*==============================================================*/
/* Table: KTP                                                   */
/*==============================================================*/
create table KTP
(
   NOKTP                char(16) not null  comment '',
   NIK                  char(16)  comment '',
   FOTOKTP              longblob not null  comment '',
   TANGGALPEMBUATAN     date not null  comment '',
   MASABERLAKU          varchar(16) not null  comment '',
   TANDATANGAN          longblob not null  comment '',
   primary key (NOKTP)
);

/*==============================================================*/
/* Table: PASPOR                                                */
/*==============================================================*/
create table PASPOR
(
   ID_PASPOR            char(9) not null  comment '',
   NIK                  char(16)  comment '',
   DETIL_PASPOR         varchar(20)  comment '',
   primary key (ID_PASPOR)
);

/*==============================================================*/
/* Table: PEJABAT                                               */
/*==============================================================*/
create table PEJABAT
(
   NIP                  char(18) not null  comment '',
   NAMAPEJABAT          varchar(54) not null  comment '',
   MULAIMENJABATL       date  comment '',
   SELESAIMENJABAT      date  comment '',
   primary key (NIP)
);

/*==============================================================*/
/* Table: PEKERJAAN                                             */
/*==============================================================*/
create table PEKERJAAN
(
   KODEPEKERJAAN        char(6) not null  comment '',
   NAMAPEKERJAAN        varchar(16) not null  comment '',
   primary key (KODEPEKERJAAN)
);

/*==============================================================*/
/* Table: PENDIDIKAN                                            */
/*==============================================================*/
create table PENDIDIKAN
(
   KODEPENDIDIKAN       char(3) not null  comment '',
   NAMAPENDIDIKAN       varchar(16) not null  comment '',
   primary key (KODEPENDIDIKAN)
);

/*==============================================================*/
/* Table: PROVINSI                                              */
/*==============================================================*/
create table PROVINSI
(
   KODEPROVINSI         char(3) not null  comment '',
   NAMAPROVINSI         varchar(32) not null  comment '',
   primary key (KODEPROVINSI)
);

/*==============================================================*/
/* Table: STATUSPERNIKAHAN                                      */
/*==============================================================*/
create table STATUSPERNIKAHAN
(
   KODEPERNIKAHAN       char(1) not null  comment '',
   TANGGALPERNIKAHAN    date  comment '',
   STATUS               varchar(8) not null  comment '',
   primary key (KODEPERNIKAHAN)
);

/*==============================================================*/
/* Table: WARGANEGARA                                           */
/*==============================================================*/
create table WARGANEGARA
(
   KODEWARGANEGARA      char(4) not null  comment '',
   STATUSWARGANEGARA    varchar(8) not null  comment '',
   primary key (KODEWARGANEGARA)
);

alter table AKTA add constraint FK_AKTA_IBU_ANGGOTA foreign key (ANG_NIK)
      references ANGGOTA (NIK) on delete restrict on update restrict;

alter table AKTA add constraint FK_AKTA_RELATIONS_PEJABAT foreign key (NIP)
      references PEJABAT (NIP) on delete restrict on update restrict;

alter table AKTA add constraint FK_AKTA_RELATIONS_ANGGOTA foreign key (NIK)
      references ANGGOTA (NIK) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_CITIZENSH_WARGANEG foreign key (KODEWARGANEGARA)
      references WARGANEGARA (KODEWARGANEGARA) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_GENDER_JENISKEL foreign key (KODEJENISKELAMIN)
      references JENISKELAMIN (KODEJENISKELAMIN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_GOLONGAN__GOLONGAN foreign key (KODEGOLONGANDARAH)
      references GOLONGANDARAH (KODEGOLONGANDARAH) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_JOB_PEKERJAA foreign key (KODEPEKERJAAN)
      references PEKERJAAN (KODEPEKERJAAN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_MARRIED_STATUSPE foreign key (KODEPERNIKAHAN)
      references STATUSPERNIKAHAN (KODEPERNIKAHAN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_PASPORT2_PASPOR foreign key (ID_PASPOR)
      references PASPOR (ID_PASPOR) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_PENDIDIKA_PENDIDIK foreign key (KODEPENDIDIKAN)
      references PENDIDIKAN (KODEPENDIDIKAN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELATIONS_KTP foreign key (NOKTP)
      references KTP (NOKTP) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELATIONS_HUBUNGAN foreign key (IDSTATUSHUBUNGAN)
      references HUBUNGAN (IDSTATUSHUBUNGAN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELATIONS_DUSUN foreign key (KODEPROVINSI, DUS_KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN, IDDUSUN)
      references DUSUN (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN, IDDUSUN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELATIONS_KITAS_KI foreign key (NO_KITAS_KITAP)
      references KITAS_KITAP (NO_KITAS_KITAP) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELATIONS_KARTUKEL foreign key (NOKK)
      references KARTUKELUARGA (NOKK) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELATIONS_KABUPATE foreign key (KAB_KODEPROVINSI, KODEKABUPATEN)
      references KABUPATEN (KODEPROVINSI, KODEKABUPATEN) on delete restrict on update restrict;

alter table ANGGOTA add constraint FK_ANGGOTA_RELIGION_AGAMA foreign key (KODEAGAMA)
      references AGAMA (KODEAGAMA) on delete restrict on update restrict;

alter table DUSUN add constraint FK_DUSUN_RELATIONS_KELURAHA foreign key (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN)
      references KELURAHAN (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN) on delete restrict on update restrict;

alter table JABATAN add constraint FK_JABATAN_RELATIONS_PEJABAT foreign key (NIP)
      references PEJABAT (NIP) on delete restrict on update restrict;

alter table KABUPATEN add constraint FK_KABUPATE_1PROV_MKA_PROVINSI foreign key (KODEPROVINSI)
      references PROVINSI (KODEPROVINSI) on delete restrict on update restrict;

alter table KARTUKELUARGA add constraint FK_KARTUKEL_RELATIONS_HUBUNGAN foreign key (IDSTATUSHUBUNGAN)
      references HUBUNGAN (IDSTATUSHUBUNGAN) on delete restrict on update restrict;

alter table KARTUKELUARGA add constraint FK_KARTUKEL_RELATIONS_PEJABAT foreign key (NIP)
      references PEJABAT (NIP) on delete restrict on update restrict;

alter table KARTUKELUARGA add constraint FK_KARTUKEL_RELATIONS_DUSUN foreign key (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN, IDDUSUN)
      references DUSUN (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN, KODEKELURAHAN, IDDUSUN) on delete restrict on update restrict;

alter table KECAMATAN add constraint FK_KECAMATA_1KAB_MKEC_KABUPATE foreign key (KODEPROVINSI, KODEKABUPATEN)
      references KABUPATEN (KODEPROVINSI, KODEKABUPATEN) on delete restrict on update restrict;

alter table KELURAHAN add constraint FK_KELURAHA_1KEC_MKEL_KECAMATA foreign key (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN)
      references KECAMATAN (KODEPROVINSI, KODEKABUPATEN, KODEKECAMATAN) on delete restrict on update restrict;

alter table KITAS_KITAP add constraint FK_KITAS_KI_RELATIONS_ANGGOTA foreign key (NIK)
      references ANGGOTA (NIK) on delete restrict on update restrict;

alter table KTP add constraint FK_KTP_RELATIONS_ANGGOTA foreign key (NIK)
      references ANGGOTA (NIK) on delete restrict on update restrict;

alter table PASPOR add constraint FK_PASPOR_PASPORT_ANGGOTA foreign key (NIK)
      references ANGGOTA (NIK) on delete restrict on update restrict;

