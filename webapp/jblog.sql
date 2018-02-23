--------------------------------------------------------
--  ������ ������ - �ݿ���-2��-23-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BLOG
--------------------------------------------------------

  CREATE TABLE "JBLOG"."BLOG" 
   (	"USERNO" NUMBER, 
	"BLOGTITLE" VARCHAR2(200 BYTE), 
	"LOGOFILE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "JBLOG"."CATEGORY" 
   (	"CATENO" NUMBER, 
	"USERNO" NUMBER, 
	"CATENAME" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."COMMENTS" 
   (	"CMTNO" NUMBER, 
	"POSTNO" NUMBER, 
	"CMTCONTENT" VARCHAR2(1000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "JBLOG"."POST" 
   (	"POSTNO" NUMBER, 
	"CATENO" NUMBER, 
	"POSTTITLE" VARCHAR2(300 BYTE), 
	"POSTCONTENT" VARCHAR2(4000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UPLOADEDFILE
--------------------------------------------------------

  CREATE TABLE "JBLOG"."UPLOADEDFILE" 
   (	"NO" NUMBER, 
	"ORGNAME" VARCHAR2(100 BYTE), 
	"EXNAME" VARCHAR2(100 BYTE), 
	"SAVENAME" VARCHAR2(1000 BYTE), 
	"FILEPATH" VARCHAR2(1000 BYTE), 
	"FILESIZE" NUMBER, 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."USERS" 
   (	"USERNO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"USERNAME" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"JOINDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_CATEGORY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 44 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENTS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_COMMENTS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POST_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_POST_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UPLOADEDFILE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_UPLOADEDFILE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USERS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_USERS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE ;
REM INSERTING into JBLOG.BLOG
SET DEFINE OFF;
Insert into JBLOG.BLOG (USERNO,BLOGTITLE,LOGOFILE) values (16,'������','/jblog/upload/1519274893309a35f1e75-87f3-4e5c-9cbd-fd0a737084db.jpg');
Insert into JBLOG.BLOG (USERNO,BLOGTITLE,LOGOFILE) values (17,'superman','/jblog/assets/images/spring-logo.jpg');
Insert into JBLOG.BLOG (USERNO,BLOGTITLE,LOGOFILE) values (1,'������!!������','/jblog/upload/1519172888201b7318d68-4eb3-46bf-ae8d-2084cdc9ef86.png');
Insert into JBLOG.BLOG (USERNO,BLOGTITLE,LOGOFILE) values (14,'test1','/jblog/assets/images/spring-logo.jpg');
Insert into JBLOG.BLOG (USERNO,BLOGTITLE,LOGOFILE) values (15,'�Ѻ�','/jblog/upload/1519281965131c07138e6-778c-4c4d-be71-b2f4284bcfbf.jpg');
REM INSERTING into JBLOG.CATEGORY
SET DEFINE OFF;
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (1,1,'�̺з�','�⺻���� ��������� ī�װ��� �Դϴ�.',to_date('18/02/19','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (2,14,'�̺з�','�⺻���� ��������� ī�װ��� �Դϴ�.',to_date('18/02/19','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (3,15,'�̺з�','�⺻���� ��������� ī�װ��� �Դϴ�.',to_date('18/02/19','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (4,1,'123','1234',to_date('18/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (5,1,'444','555',to_date('18/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (43,1,'hihi','hihi',to_date('18/02/23','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (28,16,'dd','dd',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (30,17,'�̺з�','�⺻���� ��������� ī�װ��� �Դϴ�.',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (31,1,'�ȴ�','�ȳ��ϼ���',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (26,15,'������ �������?','������ �Ƹ� �Ƕ� �����ž�',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,USERNO,CATENAME,DESCRIPTION,REGDATE) values (27,16,'�̺з�','�⺻���� ��������� ī�װ��� �Դϴ�.',to_date('18/02/22','RR/MM/DD'));
REM INSERTING into JBLOG.COMMENTS
SET DEFINE OFF;
REM INSERTING into JBLOG.POST
SET DEFINE OFF;
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (2,4,'�̰��� 123 ī�׸����� ���� ���� �����̴�.','�̰��� 123 ī�׸����� ���� ���� �����̴�.',to_date('18/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (3,4,'�������� ����','������ ����',to_date('18/02/21','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (4,1,'dasdf','asdfasdfasd',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (5,1,'asdfasdfafw','e1212wefa',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (6,5,'444 title','444 content',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (7,3,'this is first post title wirtten by du ','this is first post content wirtten by du',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (8,3,'ddu bbi title','ddu bbi content',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (9,26,'������ ����...','�Ҳ��峭�� �ϰ������ž�
',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (10,27,'����','��������',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (11,28,'yreyery','reyeryery',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (12,26,'�����̶� �����ž�','�޴��� ���� �����ž�',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (13,26,'�� �����ӿ�','������ �����ž�',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (14,31,'�ȳ��� ����','�ȴ��� ����Ʈ',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (15,31,'���α� Ÿ��Ʋ ������ main-blog�� �̵��մϴ�~~','���α� Ÿ��Ʋ ������ main-blog�� �̵��մϴ�~~',to_date('18/02/23','RR/MM/DD'));
REM INSERTING into JBLOG.UPLOADEDFILE
SET DEFINE OFF;
Insert into JBLOG.UPLOADEDFILE (NO,ORGNAME,EXNAME,SAVENAME,FILEPATH,FILESIZE,REG_DATE) values (1,'hawai.jpg','.jpg','15191043714589af194c1-0a17-40a7-9e51-d389b9ceda17.jpg','D:\javaStudy\upload\15191043714589af194c1-0a17-40a7-9e51-d389b9ceda17.jpg',8061,to_date('18/02/20','RR/MM/DD'));
Insert into JBLOG.UPLOADEDFILE (NO,ORGNAME,EXNAME,SAVENAME,FILEPATH,FILESIZE,REG_DATE) values (2,'hawai.jpg','.jpg','15191057963688c48b7c2-09a3-4158-86ab-672b4890e23d.jpg','D:\javaStudy\upload\15191057963688c48b7c2-09a3-4158-86ab-672b4890e23d.jpg',8061,to_date('18/02/20','RR/MM/DD'));
Insert into JBLOG.UPLOADEDFILE (NO,ORGNAME,EXNAME,SAVENAME,FILEPATH,FILESIZE,REG_DATE) values (3,'profile.png','.png','1519172888201b7318d68-4eb3-46bf-ae8d-2084cdc9ef86.png','D:\javaStudy\upload\1519172888201b7318d68-4eb3-46bf-ae8d-2084cdc9ef86.png',128904,to_date('18/02/21','RR/MM/DD'));
Insert into JBLOG.UPLOADEDFILE (NO,ORGNAME,EXNAME,SAVENAME,FILEPATH,FILESIZE,REG_DATE) values (4,'������.jpg','.jpg','1519274893309a35f1e75-87f3-4e5c-9cbd-fd0a737084db.jpg','D:\javaStudy\upload\1519274893309a35f1e75-87f3-4e5c-9cbd-fd0a737084db.jpg',646426,to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.UPLOADEDFILE (NO,ORGNAME,EXNAME,SAVENAME,FILEPATH,FILESIZE,REG_DATE) values (5,'hawai.jpg','.jpg','1519281965131c07138e6-778c-4c4d-be71-b2f4284bcfbf.jpg','D:\javaStudy\upload\1519281965131c07138e6-778c-4c4d-be71-b2f4284bcfbf.jpg',8061,to_date('18/02/22','RR/MM/DD'));
REM INSERTING into JBLOG.USERS
SET DEFINE OFF;
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (1,'admin','������','1',to_date('18/02/13','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (16,'cho','������','1234',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (17,'super','superman','1234',to_date('18/02/22','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (14,'test2','test1','1234',to_date('18/02/19','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (15,'du','�Ѻ�','1',to_date('18/02/19','RR/MM/DD'));
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD PRIMARY KEY ("CMTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("CMTCONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD PRIMARY KEY ("CATENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("CATENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UPLOADEDFILE
--------------------------------------------------------

  ALTER TABLE "JBLOG"."UPLOADEDFILE" ADD PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD PRIMARY KEY ("POSTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."POST" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."POST" MODIFY ("POSTTITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."USERS" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" ADD PRIMARY KEY ("USERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" MODIFY ("JOINDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD PRIMARY KEY ("USERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."BLOG" MODIFY ("BLOGTITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD CONSTRAINT "C_BLOG_FK" FOREIGN KEY ("USERNO")
	  REFERENCES "JBLOG"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD CONSTRAINT "C_CATEGORY_FK" FOREIGN KEY ("USERNO")
	  REFERENCES "JBLOG"."BLOG" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD CONSTRAINT "C_COMMENTS_FK" FOREIGN KEY ("POSTNO")
	  REFERENCES "JBLOG"."POST" ("POSTNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD CONSTRAINT "C_POST_FK" FOREIGN KEY ("CATENO")
	  REFERENCES "JBLOG"."CATEGORY" ("CATENO") ENABLE;