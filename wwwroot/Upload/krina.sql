toc.dat                                                                                             0000600 0004000 0002000 00000276556 14561322555 0014474 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       '    	    	        |            HalloDoc    16.1    16.1    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         ]           1262    24592    HalloDoc    DATABASE     �   CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "HalloDoc";
                postgres    false         �            1259    24846    User    TABLE     )  CREATE TABLE public."User" (
    userid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    ismobile bit(1),
    street character varying(100),
    city character varying(100),
    state character varying(100),
    regionid integer,
    zipcode character varying(10),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    ip character varying(20),
    isrequestwithemail bit(1)
);
    DROP TABLE public."User";
       public         heap    postgres    false         �            1259    24845    User_userid_seq    SEQUENCE     �   CREATE SEQUENCE public."User_userid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."User_userid_seq";
       public          postgres    false    248         ^           0    0    User_userid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."User_userid_seq" OWNED BY public."User".userid;
          public          postgres    false    247         �            1259    24621    admin    TABLE     �  CREATE TABLE public.admin (
    adminid integer NOT NULL,
    aspnetuserid character varying(128) NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    roleid integer
);
    DROP TABLE public.admin;
       public         heap    postgres    false         �            1259    24620    admin_adminid_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_adminid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.admin_adminid_seq;
       public          postgres    false    219         _           0    0    admin_adminid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.admin_adminid_seq OWNED BY public.admin.adminid;
          public          postgres    false    218         �            1259    24637    adminregion    TABLE     �   CREATE TABLE public.adminregion (
    adminregionid integer NOT NULL,
    adminid integer NOT NULL,
    regionid integer NOT NULL
);
    DROP TABLE public.adminregion;
       public         heap    postgres    false         �            1259    24636    adminregion_adminregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.adminregion_adminregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.adminregion_adminregionid_seq;
       public          postgres    false    223         `           0    0    adminregion_adminregionid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.adminregion_adminregionid_seq OWNED BY public.adminregion.adminregionid;
          public          postgres    false    222         �            1259    24600    aspnetroles    TABLE     v   CREATE TABLE public.aspnetroles (
    id character varying(128) NOT NULL,
    name character varying(256) NOT NULL
);
    DROP TABLE public.aspnetroles;
       public         heap    postgres    false         �            1259    24605    aspnetuserroles    TABLE     �   CREATE TABLE public.aspnetuserroles (
    userid character varying(128) NOT NULL,
    roleid character varying(128) NOT NULL
);
 #   DROP TABLE public.aspnetuserroles;
       public         heap    postgres    false         �            1259    24593    aspnetusers    TABLE     p  CREATE TABLE public.aspnetusers (
    id character varying(128) NOT NULL,
    username character varying(256) NOT NULL,
    passwordhash character varying(255),
    email character varying(256),
    phonenumber character varying(20),
    "CreatedDate" timestamp without time zone NOT NULL,
    ip character varying(20),
    modifieddate timestamp without time zone
);
    DROP TABLE public.aspnetusers;
       public         heap    postgres    false         �            1259    24654    blockrequests    TABLE     `  CREATE TABLE public.blockrequests (
    blockrequestid integer NOT NULL,
    phonenumber character varying(50),
    email character varying(50),
    isactive bit(1),
    reason text,
    requestid character varying(50) NOT NULL,
    ip character varying(20),
    createddate timestamp without time zone,
    modifieddate timestamp without time zone
);
 !   DROP TABLE public.blockrequests;
       public         heap    postgres    false         �            1259    24653     blockrequests_blockrequestid_seq    SEQUENCE     �   CREATE SEQUENCE public.blockrequests_blockrequestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.blockrequests_blockrequestid_seq;
       public          postgres    false    225         a           0    0     blockrequests_blockrequestid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.blockrequests_blockrequestid_seq OWNED BY public.blockrequests.blockrequestid;
          public          postgres    false    224                    1259    25116    business    TABLE     n  CREATE TABLE public.business (
    businessid integer NOT NULL,
    name character varying(100) NOT NULL,
    address1 character varying(500),
    address2 character varying(500),
    city character varying(50),
    regionid integer,
    zipcode character varying(10),
    phonenumber character varying(20),
    faxnumber character varying(20),
    isregistered bit(1),
    createdby character varying(128),
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    ip character varying(20)
);
    DROP TABLE public.business;
       public         heap    postgres    false                    1259    25115    business_businessid_seq    SEQUENCE     �   CREATE SEQUENCE public.business_businessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.business_businessid_seq;
       public          postgres    false    278         b           0    0    business_businessid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.business_businessid_seq OWNED BY public.business.businessid;
          public          postgres    false    277         �            1259    24664    casetag    TABLE     i   CREATE TABLE public.casetag (
    casetagid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.casetag;
       public         heap    postgres    false         �            1259    24663    casetag_casetagid_seq    SEQUENCE     �   CREATE SEQUENCE public.casetag_casetagid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.casetag_casetagid_seq;
       public          postgres    false    227         c           0    0    casetag_casetagid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.casetag_casetagid_seq OWNED BY public.casetag.casetagid;
          public          postgres    false    226         �            1259    24671 	   concierge    TABLE     �  CREATE TABLE public.concierge (
    conciergeid integer NOT NULL,
    conciergename character varying(100) NOT NULL,
    address character varying(150),
    street character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    zipcode character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    regionid integer NOT NULL,
    ip character varying(20)
);
    DROP TABLE public.concierge;
       public         heap    postgres    false         �            1259    24670    concierge_conciergeid_seq    SEQUENCE     �   CREATE SEQUENCE public.concierge_conciergeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.concierge_conciergeid_seq;
       public          postgres    false    229         d           0    0    concierge_conciergeid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.concierge_conciergeid_seq OWNED BY public.concierge.conciergeid;
          public          postgres    false    228         �            1259    24682    emaillog    TABLE       CREATE TABLE public.emaillog (
    emaillogid numeric(9,0) NOT NULL,
    emailtemplate text NOT NULL,
    subjectname character varying(200) NOT NULL,
    emailid character varying(200) NOT NULL,
    confirmationnumber character varying(200),
    filepath text,
    roleid integer,
    requestid integer,
    adminid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    isemailsent bit(1),
    senttries integer,
    action integer
);
    DROP TABLE public.emaillog;
       public         heap    postgres    false         �            1259    24698    healthprofessionals    TABLE     i  CREATE TABLE public.healthprofessionals (
    vendorid integer NOT NULL,
    vendorname character varying(100) NOT NULL,
    profession integer,
    faxnumber character varying(50) NOT NULL,
    address character varying(150),
    city character varying(100),
    state character varying(50),
    zip character varying(50),
    regionid integer,
    createddate timestamp without time zone NOT NULL,
    modifieddate timestamp without time zone,
    phonenumber character varying(100),
    isdeleted bit(1),
    ip character varying(20),
    email character varying(50),
    businesscontact character varying(100)
);
 '   DROP TABLE public.healthprofessionals;
       public         heap    postgres    false         �            1259    24697     healthprofessionals_vendorid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionals_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.healthprofessionals_vendorid_seq;
       public          postgres    false    234         e           0    0     healthprofessionals_vendorid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.healthprofessionals_vendorid_seq OWNED BY public.healthprofessionals.vendorid;
          public          postgres    false    233         �            1259    24690    healthprofessionaltype    TABLE       CREATE TABLE public.healthprofessionaltype (
    healthprofessionalid integer NOT NULL,
    professionname character varying(50) NOT NULL,
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    isactive bit(1),
    isdeleted bit(1)
);
 *   DROP TABLE public.healthprofessionaltype;
       public         heap    postgres    false         �            1259    24689 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq;
       public          postgres    false    232         f           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq OWNED BY public.healthprofessionaltype.healthprofessionalid;
          public          postgres    false    231         �            1259    24712    menu    TABLE     �   CREATE TABLE public.menu (
    menuid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    sortorder integer
);
    DROP TABLE public.menu;
       public         heap    postgres    false         �            1259    24711    menu_menuid_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_menuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.menu_menuid_seq;
       public          postgres    false    236         g           0    0    menu_menuid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.menu_menuid_seq OWNED BY public.menu.menuid;
          public          postgres    false    235         �            1259    24719    orderdetails    TABLE     _  CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    vendorid integer,
    requestid integer,
    faxnumber character varying(50),
    email character varying(50),
    businesscontact character varying(100),
    prescription text,
    noofrefill integer,
    createddate timestamp without time zone,
    createdby character varying(100)
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false         �            1259    24718    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    238         h           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    237         �            1259    24774 	   physician    TABLE     �  CREATE TABLE public.physician (
    physicianid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    medicallicense character varying(500),
    photo character varying(100),
    adminnotes character varying(500),
    isagreementdoc bit(1),
    isbackgrounddoc bit(1),
    istrainingdoc bit(1),
    isnondisclosuredoc bit(1),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    businessname character varying(100) NOT NULL,
    businesswebsite character varying(200) NOT NULL,
    isdeleted bit(1),
    roleid integer,
    npinumber character varying(500),
    islicensedoc bit(1),
    signature character varying(100),
    iscredentialdoc bit(1),
    istokengenerate bit(1),
    syncemailaddress character varying(50)
);
    DROP TABLE public.physician;
       public         heap    postgres    false         �            1259    24773    physician_physicianid_seq    SEQUENCE     �   CREATE SEQUENCE public.physician_physicianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.physician_physicianid_seq;
       public          postgres    false    240         i           0    0    physician_physicianid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.physician_physicianid_seq OWNED BY public.physician.physicianid;
          public          postgres    false    239         �            1259    24803    physicianlocation    TABLE       CREATE TABLE public.physicianlocation (
    locationid integer NOT NULL,
    physicianid integer NOT NULL,
    latitude numeric(9,0),
    longitude numeric(9,0),
    createddate timestamp without time zone,
    physicianname character varying(50),
    address character varying(500)
);
 %   DROP TABLE public.physicianlocation;
       public         heap    postgres    false         �            1259    24802     physicianlocation_locationid_seq    SEQUENCE     �   CREATE SEQUENCE public.physicianlocation_locationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.physicianlocation_locationid_seq;
       public          postgres    false    242         j           0    0     physicianlocation_locationid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.physicianlocation_locationid_seq OWNED BY public.physicianlocation.locationid;
          public          postgres    false    241         �            1259    24817    physiciannotification    TABLE     �   CREATE TABLE public.physiciannotification (
    id integer NOT NULL,
    physicianid integer NOT NULL,
    isnotificationstopped bit(1) NOT NULL
);
 )   DROP TABLE public.physiciannotification;
       public         heap    postgres    false         �            1259    24816    physiciannotification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physiciannotification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.physiciannotification_id_seq;
       public          postgres    false    244         k           0    0    physiciannotification_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.physiciannotification_id_seq OWNED BY public.physiciannotification.id;
          public          postgres    false    243         �            1259    24829    physicianregion    TABLE     �   CREATE TABLE public.physicianregion (
    physicianregionid integer NOT NULL,
    physicianid integer NOT NULL,
    regionid integer NOT NULL
);
 #   DROP TABLE public.physicianregion;
       public         heap    postgres    false         �            1259    24828 %   physicianregion_physicianregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.physicianregion_physicianregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.physicianregion_physicianregionid_seq;
       public          postgres    false    246         l           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.physicianregion_physicianregionid_seq OWNED BY public.physicianregion.physicianregionid;
          public          postgres    false    245         �            1259    24630    region    TABLE     �   CREATE TABLE public.region (
    regionid integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(50)
);
    DROP TABLE public.region;
       public         heap    postgres    false         �            1259    24629    region_regionid_seq    SEQUENCE     �   CREATE SEQUENCE public.region_regionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.region_regionid_seq;
       public          postgres    false    221         m           0    0    region_regionid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.region_regionid_seq OWNED BY public.region.regionid;
          public          postgres    false    220         �            1259    24860    request    TABLE       CREATE TABLE public.request (
    requestid integer NOT NULL,
    requesttypeid integer NOT NULL,
    userid integer,
    firstname character varying(100),
    lastname character varying(100),
    phonenumber character varying(23),
    email character varying(50),
    status smallint NOT NULL,
    physicianid integer,
    confirmationnumber character varying(20),
    createddate timestamp without time zone NOT NULL,
    isdeleted bit(1),
    modifieddate timestamp without time zone,
    declinedby character varying(250),
    isurgentemailsent bit(1) NOT NULL,
    lastwellnessdate timestamp without time zone,
    ismobile bit(1),
    calltype smallint,
    completedbyphysician bit(1),
    lastreservationdate timestamp without time zone,
    accepteddate timestamp without time zone,
    relationname character varying(100),
    casenumber character varying(50),
    ip character varying(20),
    casetag character varying(50),
    casetagphysician character varying(50),
    patientaccountid character varying(128),
    createduserid integer
);
    DROP TABLE public.request;
       public         heap    postgres    false         �            1259    24859    request_requestid_seq    SEQUENCE     �   CREATE SEQUENCE public.request_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.request_requestid_seq;
       public          postgres    false    250         n           0    0    request_requestid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.request_requestid_seq OWNED BY public.request.requestid;
          public          postgres    false    249                    1259    25135    requestbusiness    TABLE     �   CREATE TABLE public.requestbusiness (
    requestbusinessid integer NOT NULL,
    requestid integer,
    businessid integer,
    ip character varying(20)
);
 #   DROP TABLE public.requestbusiness;
       public         heap    postgres    false                    1259    25134 %   requestbusiness_requestbusinessid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestbusiness_requestbusinessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestbusiness_requestbusinessid_seq;
       public          postgres    false    280         o           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestbusiness_requestbusinessid_seq OWNED BY public.requestbusiness.requestbusinessid;
          public          postgres    false    279         �            1259    24879    requestclient    TABLE     �  CREATE TABLE public.requestclient (
    requestclientid integer NOT NULL,
    requestid integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    phonenumber character varying(23),
    location character varying(100),
    address character varying(500),
    regionid integer,
    notimobile character varying(20),
    notiemail character varying(50),
    notes character varying(500),
    email character varying(50),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    ismobile bit(1),
    street character varying(100),
    city character varying(100),
    state character varying(100),
    zipcode character varying(10),
    communicationtype smallint,
    remindreservationcount smallint,
    remindhousecallcount smallint,
    issetfollowupsent smallint,
    ip character varying(20),
    isreservationremindersent smallint,
    latitude numeric(9,0),
    longitude numeric(9,0)
);
 !   DROP TABLE public.requestclient;
       public         heap    postgres    false         �            1259    24878 !   requestclient_requestclientid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclient_requestclientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclient_requestclientid_seq;
       public          postgres    false    252         p           0    0 !   requestclient_requestclientid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclient_requestclientid_seq OWNED BY public.requestclient.requestclientid;
          public          postgres    false    251                    1259    24959    requestclosed    TABLE        CREATE TABLE public.requestclosed (
    requestclosedid integer NOT NULL,
    requestid integer NOT NULL,
    requeststatuslogid integer NOT NULL,
    phynotes character varying(500),
    clientnotes character varying(500),
    ip character varying(20)
);
 !   DROP TABLE public.requestclosed;
       public         heap    postgres    false                    1259    24958 !   requestclosed_requestclosedid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclosed_requestclosedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclosed_requestclosedid_seq;
       public          postgres    false    260         q           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclosed_requestclosedid_seq OWNED BY public.requestclosed.requestclosedid;
          public          postgres    false    259         �            1259    24898    requestconcierge    TABLE     �   CREATE TABLE public.requestconcierge (
    id integer NOT NULL,
    requestid integer NOT NULL,
    conciergeid integer NOT NULL,
    ip character varying(20)
);
 $   DROP TABLE public.requestconcierge;
       public         heap    postgres    false         �            1259    24897    requestconcierge_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requestconcierge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.requestconcierge_id_seq;
       public          postgres    false    254         r           0    0    requestconcierge_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.requestconcierge_id_seq OWNED BY public.requestconcierge.id;
          public          postgres    false    253                     1259    24915    requestnotes    TABLE       CREATE TABLE public.requestnotes (
    requestnotesid integer NOT NULL,
    requestid integer NOT NULL,
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    physiciannotes character varying(500),
    adminnotes character varying(500),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    ip character varying(20),
    administrativenotes character varying(500)
);
     DROP TABLE public.requestnotes;
       public         heap    postgres    false         �            1259    24914    requestnotes_requestnotesid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestnotes_requestnotesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.requestnotes_requestnotesid_seq;
       public          postgres    false    256         s           0    0    requestnotes_requestnotesid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.requestnotes_requestnotesid_seq OWNED BY public.requestnotes.requestnotesid;
          public          postgres    false    255                    1259    24929    requeststatuslog    TABLE     m  CREATE TABLE public.requeststatuslog (
    requeststatuslogid integer NOT NULL,
    requestid integer NOT NULL,
    status smallint NOT NULL,
    physicianid integer,
    adminid integer,
    transtophysicianid integer,
    notes character varying(500),
    createddate timestamp without time zone NOT NULL,
    ip character varying(20),
    transtoadmin bit(1)
);
 $   DROP TABLE public.requeststatuslog;
       public         heap    postgres    false                    1259    24928 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE     �   CREATE SEQUENCE public.requeststatuslog_requeststatuslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.requeststatuslog_requeststatuslogid_seq;
       public          postgres    false    258         t           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.requeststatuslog_requeststatuslogid_seq OWNED BY public.requeststatuslog.requeststatuslogid;
          public          postgres    false    257                    1259    25002    requesttype    TABLE     q   CREATE TABLE public.requesttype (
    requesttypeid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.requesttype;
       public         heap    postgres    false                    1259    25001    requesttype_requesttypeid_seq    SEQUENCE     �   CREATE SEQUENCE public.requesttype_requesttypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.requesttype_requesttypeid_seq;
       public          postgres    false    264         u           0    0    requesttype_requesttypeid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.requesttype_requesttypeid_seq OWNED BY public.requesttype.requesttypeid;
          public          postgres    false    263                    1259    24978    requestwisefile    TABLE     �  CREATE TABLE public.requestwisefile (
    requestwisefileid integer NOT NULL,
    requestid integer NOT NULL,
    filename character varying(500) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    physicianid integer,
    adminid integer,
    doctype smallint,
    isfrontside bit(1),
    iscompensation bit(1),
    ip character varying(20),
    isfinalize bit(1),
    isdeleted bit(1),
    ispatientrecords bit(1)
);
 #   DROP TABLE public.requestwisefile;
       public         heap    postgres    false                    1259    24977 %   requestwisefile_requestwisefileid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestwisefile_requestwisefileid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestwisefile_requestwisefileid_seq;
       public          postgres    false    262         v           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestwisefile_requestwisefileid_seq OWNED BY public.requestwisefile.requestwisefileid;
          public          postgres    false    261         
           1259    25009    role    TABLE     }  CREATE TABLE public.role (
    roleid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    isdeleted bit(1) NOT NULL,
    ip character varying(20)
);
    DROP TABLE public.role;
       public         heap    postgres    false         	           1259    25008    role_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.role_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.role_roleid_seq;
       public          postgres    false    266         w           0    0    role_roleid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.role_roleid_seq OWNED BY public.role.roleid;
          public          postgres    false    265                    1259    25016    rolemenu    TABLE     |   CREATE TABLE public.rolemenu (
    rolemenuid integer NOT NULL,
    roleid integer NOT NULL,
    menuid integer NOT NULL
);
    DROP TABLE public.rolemenu;
       public         heap    postgres    false                    1259    25015    rolemenu_rolemenuid_seq    SEQUENCE     �   CREATE SEQUENCE public.rolemenu_rolemenuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.rolemenu_rolemenuid_seq;
       public          postgres    false    268         x           0    0    rolemenu_rolemenuid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.rolemenu_rolemenuid_seq OWNED BY public.rolemenu.rolemenuid;
          public          postgres    false    267                    1259    25033    shift    TABLE     O  CREATE TABLE public.shift (
    shiftid integer NOT NULL,
    physicianid integer NOT NULL,
    startdate date NOT NULL,
    isrepeat bit(1) NOT NULL,
    weekdays character(7),
    repeatupto integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    ip character varying(20)
);
    DROP TABLE public.shift;
       public         heap    postgres    false                    1259    25032    shift_shiftid_seq    SEQUENCE     �   CREATE SEQUENCE public.shift_shiftid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.shift_shiftid_seq;
       public          postgres    false    270         y           0    0    shift_shiftid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.shift_shiftid_seq OWNED BY public.shift.shiftid;
          public          postgres    false    269                    1259    25050    shiftdetail    TABLE       CREATE TABLE public.shiftdetail (
    shiftdetailid integer NOT NULL,
    shiftid integer NOT NULL,
    shiftdate timestamp without time zone NOT NULL,
    regionid integer,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    status smallint NOT NULL,
    isdeleted bit(1) NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    lastrunningdate timestamp without time zone,
    eventid character varying(100),
    issync bit(1)
);
    DROP TABLE public.shiftdetail;
       public         heap    postgres    false                    1259    25049    shiftdetail_shiftdetailid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetail_shiftdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.shiftdetail_shiftdetailid_seq;
       public          postgres    false    272         z           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.shiftdetail_shiftdetailid_seq OWNED BY public.shiftdetail.shiftdetailid;
          public          postgres    false    271                    1259    25067    shiftdetailregion    TABLE     �   CREATE TABLE public.shiftdetailregion (
    shiftdetailregionid integer NOT NULL,
    shiftdetailid integer NOT NULL,
    regionid integer NOT NULL,
    isdeleted bit(1)
);
 %   DROP TABLE public.shiftdetailregion;
       public         heap    postgres    false                    1259    25066 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq;
       public          postgres    false    274         {           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq OWNED BY public.shiftdetailregion.shiftdetailregionid;
          public          postgres    false    273                    1259    25084    smslog    TABLE     �  CREATE TABLE public.smslog (
    smslogid integer NOT NULL,
    smstemplate character varying(100),
    mobilenumber character varying(50) NOT NULL,
    confirmationnumber character varying(200),
    roleid integer,
    adminid integer,
    requestid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    issmssent bit(1),
    senttries integer NOT NULL,
    action integer
);
    DROP TABLE public.smslog;
       public         heap    postgres    false                    1259    25083    smslog_smslogid_seq    SEQUENCE     �   CREATE SEQUENCE public.smslog_smslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.smslog_smslogid_seq;
       public          postgres    false    276         |           0    0    smslog_smslogid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.smslog_smslogid_seq OWNED BY public.smslog.smslogid;
          public          postgres    false    275                    2604    24849    User userid    DEFAULT     n   ALTER TABLE ONLY public."User" ALTER COLUMN userid SET DEFAULT nextval('public."User_userid_seq"'::regclass);
 <   ALTER TABLE public."User" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    248    247    248         �           2604    24624    admin adminid    DEFAULT     n   ALTER TABLE ONLY public.admin ALTER COLUMN adminid SET DEFAULT nextval('public.admin_adminid_seq'::regclass);
 <   ALTER TABLE public.admin ALTER COLUMN adminid DROP DEFAULT;
       public          postgres    false    219    218    219         �           2604    24640    adminregion adminregionid    DEFAULT     �   ALTER TABLE ONLY public.adminregion ALTER COLUMN adminregionid SET DEFAULT nextval('public.adminregion_adminregionid_seq'::regclass);
 H   ALTER TABLE public.adminregion ALTER COLUMN adminregionid DROP DEFAULT;
       public          postgres    false    222    223    223         �           2604    24657    blockrequests blockrequestid    DEFAULT     �   ALTER TABLE ONLY public.blockrequests ALTER COLUMN blockrequestid SET DEFAULT nextval('public.blockrequests_blockrequestid_seq'::regclass);
 K   ALTER TABLE public.blockrequests ALTER COLUMN blockrequestid DROP DEFAULT;
       public          postgres    false    224    225    225                    2604    25119    business businessid    DEFAULT     z   ALTER TABLE ONLY public.business ALTER COLUMN businessid SET DEFAULT nextval('public.business_businessid_seq'::regclass);
 B   ALTER TABLE public.business ALTER COLUMN businessid DROP DEFAULT;
       public          postgres    false    277    278    278         �           2604    24667    casetag casetagid    DEFAULT     v   ALTER TABLE ONLY public.casetag ALTER COLUMN casetagid SET DEFAULT nextval('public.casetag_casetagid_seq'::regclass);
 @   ALTER TABLE public.casetag ALTER COLUMN casetagid DROP DEFAULT;
       public          postgres    false    226    227    227         �           2604    24674    concierge conciergeid    DEFAULT     ~   ALTER TABLE ONLY public.concierge ALTER COLUMN conciergeid SET DEFAULT nextval('public.concierge_conciergeid_seq'::regclass);
 D   ALTER TABLE public.concierge ALTER COLUMN conciergeid DROP DEFAULT;
       public          postgres    false    228    229    229         �           2604    24701    healthprofessionals vendorid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionals ALTER COLUMN vendorid SET DEFAULT nextval('public.healthprofessionals_vendorid_seq'::regclass);
 K   ALTER TABLE public.healthprofessionals ALTER COLUMN vendorid DROP DEFAULT;
       public          postgres    false    234    233    234         �           2604    24693 +   healthprofessionaltype healthprofessionalid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionaltype ALTER COLUMN healthprofessionalid SET DEFAULT nextval('public.healthprofessionaltype_healthprofessionalid_seq'::regclass);
 Z   ALTER TABLE public.healthprofessionaltype ALTER COLUMN healthprofessionalid DROP DEFAULT;
       public          postgres    false    232    231    232         �           2604    24715    menu menuid    DEFAULT     j   ALTER TABLE ONLY public.menu ALTER COLUMN menuid SET DEFAULT nextval('public.menu_menuid_seq'::regclass);
 :   ALTER TABLE public.menu ALTER COLUMN menuid DROP DEFAULT;
       public          postgres    false    235    236    236                     2604    24722    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238                    2604    24777    physician physicianid    DEFAULT     ~   ALTER TABLE ONLY public.physician ALTER COLUMN physicianid SET DEFAULT nextval('public.physician_physicianid_seq'::regclass);
 D   ALTER TABLE public.physician ALTER COLUMN physicianid DROP DEFAULT;
       public          postgres    false    240    239    240                    2604    24806    physicianlocation locationid    DEFAULT     �   ALTER TABLE ONLY public.physicianlocation ALTER COLUMN locationid SET DEFAULT nextval('public.physicianlocation_locationid_seq'::regclass);
 K   ALTER TABLE public.physicianlocation ALTER COLUMN locationid DROP DEFAULT;
       public          postgres    false    241    242    242                    2604    24820    physiciannotification id    DEFAULT     �   ALTER TABLE ONLY public.physiciannotification ALTER COLUMN id SET DEFAULT nextval('public.physiciannotification_id_seq'::regclass);
 G   ALTER TABLE public.physiciannotification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244                    2604    24832 !   physicianregion physicianregionid    DEFAULT     �   ALTER TABLE ONLY public.physicianregion ALTER COLUMN physicianregionid SET DEFAULT nextval('public.physicianregion_physicianregionid_seq'::regclass);
 P   ALTER TABLE public.physicianregion ALTER COLUMN physicianregionid DROP DEFAULT;
       public          postgres    false    246    245    246         �           2604    24633    region regionid    DEFAULT     r   ALTER TABLE ONLY public.region ALTER COLUMN regionid SET DEFAULT nextval('public.region_regionid_seq'::regclass);
 >   ALTER TABLE public.region ALTER COLUMN regionid DROP DEFAULT;
       public          postgres    false    221    220    221                    2604    24863    request requestid    DEFAULT     v   ALTER TABLE ONLY public.request ALTER COLUMN requestid SET DEFAULT nextval('public.request_requestid_seq'::regclass);
 @   ALTER TABLE public.request ALTER COLUMN requestid DROP DEFAULT;
       public          postgres    false    249    250    250                    2604    25138 !   requestbusiness requestbusinessid    DEFAULT     �   ALTER TABLE ONLY public.requestbusiness ALTER COLUMN requestbusinessid SET DEFAULT nextval('public.requestbusiness_requestbusinessid_seq'::regclass);
 P   ALTER TABLE public.requestbusiness ALTER COLUMN requestbusinessid DROP DEFAULT;
       public          postgres    false    280    279    280                    2604    24882    requestclient requestclientid    DEFAULT     �   ALTER TABLE ONLY public.requestclient ALTER COLUMN requestclientid SET DEFAULT nextval('public.requestclient_requestclientid_seq'::regclass);
 L   ALTER TABLE public.requestclient ALTER COLUMN requestclientid DROP DEFAULT;
       public          postgres    false    251    252    252                    2604    24962    requestclosed requestclosedid    DEFAULT     �   ALTER TABLE ONLY public.requestclosed ALTER COLUMN requestclosedid SET DEFAULT nextval('public.requestclosed_requestclosedid_seq'::regclass);
 L   ALTER TABLE public.requestclosed ALTER COLUMN requestclosedid DROP DEFAULT;
       public          postgres    false    260    259    260                    2604    24901    requestconcierge id    DEFAULT     z   ALTER TABLE ONLY public.requestconcierge ALTER COLUMN id SET DEFAULT nextval('public.requestconcierge_id_seq'::regclass);
 B   ALTER TABLE public.requestconcierge ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254         	           2604    24918    requestnotes requestnotesid    DEFAULT     �   ALTER TABLE ONLY public.requestnotes ALTER COLUMN requestnotesid SET DEFAULT nextval('public.requestnotes_requestnotesid_seq'::regclass);
 J   ALTER TABLE public.requestnotes ALTER COLUMN requestnotesid DROP DEFAULT;
       public          postgres    false    256    255    256         
           2604    24932 #   requeststatuslog requeststatuslogid    DEFAULT     �   ALTER TABLE ONLY public.requeststatuslog ALTER COLUMN requeststatuslogid SET DEFAULT nextval('public.requeststatuslog_requeststatuslogid_seq'::regclass);
 R   ALTER TABLE public.requeststatuslog ALTER COLUMN requeststatuslogid DROP DEFAULT;
       public          postgres    false    258    257    258                    2604    25005    requesttype requesttypeid    DEFAULT     �   ALTER TABLE ONLY public.requesttype ALTER COLUMN requesttypeid SET DEFAULT nextval('public.requesttype_requesttypeid_seq'::regclass);
 H   ALTER TABLE public.requesttype ALTER COLUMN requesttypeid DROP DEFAULT;
       public          postgres    false    263    264    264                    2604    24981 !   requestwisefile requestwisefileid    DEFAULT     �   ALTER TABLE ONLY public.requestwisefile ALTER COLUMN requestwisefileid SET DEFAULT nextval('public.requestwisefile_requestwisefileid_seq'::regclass);
 P   ALTER TABLE public.requestwisefile ALTER COLUMN requestwisefileid DROP DEFAULT;
       public          postgres    false    261    262    262                    2604    25012    role roleid    DEFAULT     j   ALTER TABLE ONLY public.role ALTER COLUMN roleid SET DEFAULT nextval('public.role_roleid_seq'::regclass);
 :   ALTER TABLE public.role ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    265    266    266                    2604    25019    rolemenu rolemenuid    DEFAULT     z   ALTER TABLE ONLY public.rolemenu ALTER COLUMN rolemenuid SET DEFAULT nextval('public.rolemenu_rolemenuid_seq'::regclass);
 B   ALTER TABLE public.rolemenu ALTER COLUMN rolemenuid DROP DEFAULT;
       public          postgres    false    268    267    268                    2604    25036    shift shiftid    DEFAULT     n   ALTER TABLE ONLY public.shift ALTER COLUMN shiftid SET DEFAULT nextval('public.shift_shiftid_seq'::regclass);
 <   ALTER TABLE public.shift ALTER COLUMN shiftid DROP DEFAULT;
       public          postgres    false    270    269    270                    2604    25053    shiftdetail shiftdetailid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetail ALTER COLUMN shiftdetailid SET DEFAULT nextval('public.shiftdetail_shiftdetailid_seq'::regclass);
 H   ALTER TABLE public.shiftdetail ALTER COLUMN shiftdetailid DROP DEFAULT;
       public          postgres    false    272    271    272                    2604    25070 %   shiftdetailregion shiftdetailregionid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetailregion ALTER COLUMN shiftdetailregionid SET DEFAULT nextval('public.shiftdetailregion_shiftdetailregionid_seq'::regclass);
 T   ALTER TABLE public.shiftdetailregion ALTER COLUMN shiftdetailregionid DROP DEFAULT;
       public          postgres    false    273    274    274                    2604    25087    smslog smslogid    DEFAULT     r   ALTER TABLE ONLY public.smslog ALTER COLUMN smslogid SET DEFAULT nextval('public.smslog_smslogid_seq'::regclass);
 >   ALTER TABLE public.smslog ALTER COLUMN smslogid DROP DEFAULT;
       public          postgres    false    275    276    276         7          0    24846    User 
   TABLE DATA             COPY public."User" (userid, aspnetuserid, firstname, lastname, email, mobile, ismobile, street, city, state, regionid, zipcode, strmonth, intyear, intdate, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip, isrequestwithemail) FROM stdin;
    public          postgres    false    248       5175.dat           0    24621    admin 
   TABLE DATA           �   COPY public.admin (adminid, aspnetuserid, firstname, lastname, email, mobile, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, isdeleted, roleid) FROM stdin;
    public          postgres    false    219       5146.dat           0    24637    adminregion 
   TABLE DATA           G   COPY public.adminregion (adminregionid, adminid, regionid) FROM stdin;
    public          postgres    false    223       5150.dat           0    24600    aspnetroles 
   TABLE DATA           /   COPY public.aspnetroles (id, name) FROM stdin;
    public          postgres    false    216       5143.dat           0    24605    aspnetuserroles 
   TABLE DATA           9   COPY public.aspnetuserroles (userid, roleid) FROM stdin;
    public          postgres    false    217       5144.dat           0    24593    aspnetusers 
   TABLE DATA           v   COPY public.aspnetusers (id, username, passwordhash, email, phonenumber, "CreatedDate", ip, modifieddate) FROM stdin;
    public          postgres    false    215       5142.dat            0    24654    blockrequests 
   TABLE DATA           �   COPY public.blockrequests (blockrequestid, phonenumber, email, isactive, reason, requestid, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    225       5152.dat U          0    25116    business 
   TABLE DATA           �   COPY public.business (businessid, name, address1, address2, city, regionid, zipcode, phonenumber, faxnumber, isregistered, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip) FROM stdin;
    public          postgres    false    278       5205.dat "          0    24664    casetag 
   TABLE DATA           2   COPY public.casetag (casetagid, name) FROM stdin;
    public          postgres    false    227       5154.dat $          0    24671 	   concierge 
   TABLE DATA           �   COPY public.concierge (conciergeid, conciergename, address, street, city, state, zipcode, createddate, regionid, ip) FROM stdin;
    public          postgres    false    229       5156.dat %          0    24682    emaillog 
   TABLE DATA           �   COPY public.emaillog (emaillogid, emailtemplate, subjectname, emailid, confirmationnumber, filepath, roleid, requestid, adminid, physicianid, createdate, sentdate, isemailsent, senttries, action) FROM stdin;
    public          postgres    false    230       5157.dat )          0    24698    healthprofessionals 
   TABLE DATA           �   COPY public.healthprofessionals (vendorid, vendorname, profession, faxnumber, address, city, state, zip, regionid, createddate, modifieddate, phonenumber, isdeleted, ip, email, businesscontact) FROM stdin;
    public          postgres    false    234       5161.dat '          0    24690    healthprofessionaltype 
   TABLE DATA           x   COPY public.healthprofessionaltype (healthprofessionalid, professionname, createddate, isactive, isdeleted) FROM stdin;
    public          postgres    false    232       5159.dat +          0    24712    menu 
   TABLE DATA           D   COPY public.menu (menuid, name, accounttype, sortorder) FROM stdin;
    public          postgres    false    236       5163.dat -          0    24719    orderdetails 
   TABLE DATA           �   COPY public.orderdetails (id, vendorid, requestid, faxnumber, email, businesscontact, prescription, noofrefill, createddate, createdby) FROM stdin;
    public          postgres    false    238       5165.dat /          0    24774 	   physician 
   TABLE DATA           �  COPY public.physician (physicianid, aspnetuserid, firstname, lastname, email, mobile, medicallicense, photo, adminnotes, isagreementdoc, isbackgrounddoc, istrainingdoc, isnondisclosuredoc, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, businessname, businesswebsite, isdeleted, roleid, npinumber, islicensedoc, signature, iscredentialdoc, istokengenerate, syncemailaddress) FROM stdin;
    public          postgres    false    240       5167.dat 1          0    24803    physicianlocation 
   TABLE DATA           ~   COPY public.physicianlocation (locationid, physicianid, latitude, longitude, createddate, physicianname, address) FROM stdin;
    public          postgres    false    242       5169.dat 3          0    24817    physiciannotification 
   TABLE DATA           W   COPY public.physiciannotification (id, physicianid, isnotificationstopped) FROM stdin;
    public          postgres    false    244       5171.dat 5          0    24829    physicianregion 
   TABLE DATA           S   COPY public.physicianregion (physicianregionid, physicianid, regionid) FROM stdin;
    public          postgres    false    246       5173.dat           0    24630    region 
   TABLE DATA           >   COPY public.region (regionid, name, abbreviation) FROM stdin;
    public          postgres    false    221       5148.dat 9          0    24860    request 
   TABLE DATA           �  COPY public.request (requestid, requesttypeid, userid, firstname, lastname, phonenumber, email, status, physicianid, confirmationnumber, createddate, isdeleted, modifieddate, declinedby, isurgentemailsent, lastwellnessdate, ismobile, calltype, completedbyphysician, lastreservationdate, accepteddate, relationname, casenumber, ip, casetag, casetagphysician, patientaccountid, createduserid) FROM stdin;
    public          postgres    false    250       5177.dat W          0    25135    requestbusiness 
   TABLE DATA           W   COPY public.requestbusiness (requestbusinessid, requestid, businessid, ip) FROM stdin;
    public          postgres    false    280       5207.dat ;          0    24879    requestclient 
   TABLE DATA           s  COPY public.requestclient (requestclientid, requestid, firstname, lastname, phonenumber, location, address, regionid, notimobile, notiemail, notes, email, strmonth, intyear, intdate, ismobile, street, city, state, zipcode, communicationtype, remindreservationcount, remindhousecallcount, issetfollowupsent, ip, isreservationremindersent, latitude, longitude) FROM stdin;
    public          postgres    false    252       5179.dat C          0    24959    requestclosed 
   TABLE DATA           r   COPY public.requestclosed (requestclosedid, requestid, requeststatuslogid, phynotes, clientnotes, ip) FROM stdin;
    public          postgres    false    260       5187.dat =          0    24898    requestconcierge 
   TABLE DATA           J   COPY public.requestconcierge (id, requestid, conciergeid, ip) FROM stdin;
    public          postgres    false    254       5181.dat ?          0    24915    requestnotes 
   TABLE DATA           �   COPY public.requestnotes (requestnotesid, requestid, strmonth, intyear, intdate, physiciannotes, adminnotes, createdby, createddate, modifiedby, modifieddate, ip, administrativenotes) FROM stdin;
    public          postgres    false    256       5183.dat A          0    24929    requeststatuslog 
   TABLE DATA           �   COPY public.requeststatuslog (requeststatuslogid, requestid, status, physicianid, adminid, transtophysicianid, notes, createddate, ip, transtoadmin) FROM stdin;
    public          postgres    false    258       5185.dat G          0    25002    requesttype 
   TABLE DATA           :   COPY public.requesttype (requesttypeid, name) FROM stdin;
    public          postgres    false    264       5191.dat E          0    24978    requestwisefile 
   TABLE DATA           �   COPY public.requestwisefile (requestwisefileid, requestid, filename, createddate, physicianid, adminid, doctype, isfrontside, iscompensation, ip, isfinalize, isdeleted, ispatientrecords) FROM stdin;
    public          postgres    false    262       5189.dat I          0    25009    role 
   TABLE DATA           z   COPY public.role (roleid, name, accounttype, createdby, createddate, modifiedby, modifieddate, isdeleted, ip) FROM stdin;
    public          postgres    false    266       5193.dat K          0    25016    rolemenu 
   TABLE DATA           >   COPY public.rolemenu (rolemenuid, roleid, menuid) FROM stdin;
    public          postgres    false    268       5195.dat M          0    25033    shift 
   TABLE DATA           |   COPY public.shift (shiftid, physicianid, startdate, isrepeat, weekdays, repeatupto, createdby, createddate, ip) FROM stdin;
    public          postgres    false    270       5197.dat O          0    25050    shiftdetail 
   TABLE DATA           �   COPY public.shiftdetail (shiftdetailid, shiftid, shiftdate, regionid, starttime, endtime, status, isdeleted, modifiedby, modifieddate, lastrunningdate, eventid, issync) FROM stdin;
    public          postgres    false    272       5199.dat Q          0    25067    shiftdetailregion 
   TABLE DATA           d   COPY public.shiftdetailregion (shiftdetailregionid, shiftdetailid, regionid, isdeleted) FROM stdin;
    public          postgres    false    274       5201.dat S          0    25084    smslog 
   TABLE DATA           �   COPY public.smslog (smslogid, smstemplate, mobilenumber, confirmationnumber, roleid, adminid, requestid, physicianid, createdate, sentdate, issmssent, senttries, action) FROM stdin;
    public          postgres    false    276       5203.dat }           0    0    User_userid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."User_userid_seq"', 10, true);
          public          postgres    false    247         ~           0    0    admin_adminid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.admin_adminid_seq', 5, true);
          public          postgres    false    218                    0    0    adminregion_adminregionid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.adminregion_adminregionid_seq', 5, true);
          public          postgres    false    222         �           0    0     blockrequests_blockrequestid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.blockrequests_blockrequestid_seq', 1, false);
          public          postgres    false    224         �           0    0    business_businessid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.business_businessid_seq', 3, true);
          public          postgres    false    277         �           0    0    casetag_casetagid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.casetag_casetagid_seq', 1, false);
          public          postgres    false    226         �           0    0    concierge_conciergeid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.concierge_conciergeid_seq', 1, true);
          public          postgres    false    228         �           0    0     healthprofessionals_vendorid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.healthprofessionals_vendorid_seq', 1, false);
          public          postgres    false    233         �           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.healthprofessionaltype_healthprofessionalid_seq', 1, false);
          public          postgres    false    231         �           0    0    menu_menuid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.menu_menuid_seq', 1, false);
          public          postgres    false    235         �           0    0    orderdetails_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orderdetails_id_seq', 1, false);
          public          postgres    false    237         �           0    0    physician_physicianid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.physician_physicianid_seq', 1, false);
          public          postgres    false    239         �           0    0     physicianlocation_locationid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.physicianlocation_locationid_seq', 1, false);
          public          postgres    false    241         �           0    0    physiciannotification_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.physiciannotification_id_seq', 1, false);
          public          postgres    false    243         �           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.physicianregion_physicianregionid_seq', 1, false);
          public          postgres    false    245         �           0    0    region_regionid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.region_regionid_seq', 5, true);
          public          postgres    false    220         �           0    0    request_requestid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.request_requestid_seq', 22, true);
          public          postgres    false    249         �           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.requestbusiness_requestbusinessid_seq', 3, true);
          public          postgres    false    279         �           0    0 !   requestclient_requestclientid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.requestclient_requestclientid_seq', 18, true);
          public          postgres    false    251         �           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.requestclosed_requestclosedid_seq', 1, false);
          public          postgres    false    259         �           0    0    requestconcierge_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.requestconcierge_id_seq', 1, true);
          public          postgres    false    253         �           0    0    requestnotes_requestnotesid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.requestnotes_requestnotesid_seq', 1, false);
          public          postgres    false    255         �           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.requeststatuslog_requeststatuslogid_seq', 1, false);
          public          postgres    false    257         �           0    0    requesttype_requesttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.requesttype_requesttypeid_seq', 1, false);
          public          postgres    false    263         �           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.requestwisefile_requestwisefileid_seq', 1, true);
          public          postgres    false    261         �           0    0    role_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.role_roleid_seq', 1, false);
          public          postgres    false    265         �           0    0    rolemenu_rolemenuid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.rolemenu_rolemenuid_seq', 1, false);
          public          postgres    false    267         �           0    0    shift_shiftid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shift_shiftid_seq', 1, false);
          public          postgres    false    269         �           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.shiftdetail_shiftdetailid_seq', 1, false);
          public          postgres    false    271         �           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.shiftdetailregion_shiftdetailregionid_seq', 1, false);
          public          postgres    false    273         �           0    0    smslog_smslogid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.smslog_smslogid_seq', 1, false);
          public          postgres    false    275         ;           2606    24853    User User_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (userid);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    248                    2606    24628    admin admin_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    219         !           2606    24642    adminregion adminregion_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_pkey PRIMARY KEY (adminregionid);
 F   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_pkey;
       public            postgres    false    223                    2606    24604    aspnetroles aspnetroles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetroles
    ADD CONSTRAINT aspnetroles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetroles DROP CONSTRAINT aspnetroles_pkey;
       public            postgres    false    216                    2606    24609 $   aspnetuserroles aspnetuserroles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_pkey PRIMARY KEY (userid, roleid);
 N   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_pkey;
       public            postgres    false    217    217                    2606    24599    aspnetusers aspnetusers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetusers
    ADD CONSTRAINT aspnetusers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetusers DROP CONSTRAINT aspnetusers_pkey;
       public            postgres    false    215         #           2606    24661     blockrequests blockrequests_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.blockrequests
    ADD CONSTRAINT blockrequests_pkey PRIMARY KEY (blockrequestid);
 J   ALTER TABLE ONLY public.blockrequests DROP CONSTRAINT blockrequests_pkey;
       public            postgres    false    225         Y           2606    25123    business business_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (businessid);
 @   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pkey;
       public            postgres    false    278         %           2606    24669    casetag casetag_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.casetag
    ADD CONSTRAINT casetag_pkey PRIMARY KEY (casetagid);
 >   ALTER TABLE ONLY public.casetag DROP CONSTRAINT casetag_pkey;
       public            postgres    false    227         '           2606    24676    concierge concierge_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_pkey PRIMARY KEY (conciergeid);
 B   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_pkey;
       public            postgres    false    229         )           2606    24688    emaillog emaillog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.emaillog
    ADD CONSTRAINT emaillog_pkey PRIMARY KEY (emaillogid);
 @   ALTER TABLE ONLY public.emaillog DROP CONSTRAINT emaillog_pkey;
       public            postgres    false    230         -           2606    24705 ,   healthprofessionals healthprofessionals_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_pkey PRIMARY KEY (vendorid);
 V   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_pkey;
       public            postgres    false    234         +           2606    24696 2   healthprofessionaltype healthprofessionaltype_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionaltype
    ADD CONSTRAINT healthprofessionaltype_pkey PRIMARY KEY (healthprofessionalid);
 \   ALTER TABLE ONLY public.healthprofessionaltype DROP CONSTRAINT healthprofessionaltype_pkey;
       public            postgres    false    232         /           2606    24717    menu menu_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menuid);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    236         1           2606    24726    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    238         3           2606    24781    physician physician_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physicianid);
 B   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_pkey;
       public            postgres    false    240         5           2606    24810 (   physicianlocation physicianlocation_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_pkey PRIMARY KEY (locationid);
 R   ALTER TABLE ONLY public.physicianlocation DROP CONSTRAINT physicianlocation_pkey;
       public            postgres    false    242         7           2606    24822 0   physiciannotification physiciannotification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_pkey;
       public            postgres    false    244         9           2606    24834 $   physicianregion physicianregion_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_pkey PRIMARY KEY (physicianregionid);
 N   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_pkey;
       public            postgres    false    246                    2606    24635    region region_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    221         =           2606    24867    request request_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (requestid);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public            postgres    false    250         [           2606    25140 $   requestbusiness requestbusiness_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_pkey PRIMARY KEY (requestbusinessid);
 N   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_pkey;
       public            postgres    false    280         ?           2606    24886     requestclient requestclient_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_pkey PRIMARY KEY (requestclientid);
 J   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_pkey;
       public            postgres    false    252         G           2606    24966     requestclosed requestclosed_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_pkey PRIMARY KEY (requestclosedid);
 J   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_pkey;
       public            postgres    false    260         A           2606    24903 &   requestconcierge requestconcierge_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_pkey;
       public            postgres    false    254         C           2606    24922    requestnotes requestnotes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_pkey PRIMARY KEY (requestnotesid);
 H   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_pkey;
       public            postgres    false    256         E           2606    24936 &   requeststatuslog requeststatuslog_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_pkey PRIMARY KEY (requeststatuslogid);
 P   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_pkey;
       public            postgres    false    258         K           2606    25007    requesttype requesttype_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.requesttype
    ADD CONSTRAINT requesttype_pkey PRIMARY KEY (requesttypeid);
 F   ALTER TABLE ONLY public.requesttype DROP CONSTRAINT requesttype_pkey;
       public            postgres    false    264         I           2606    24985 $   requestwisefile requestwisefile_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_pkey PRIMARY KEY (requestwisefileid);
 N   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_pkey;
       public            postgres    false    262         M           2606    25014    role role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    266         O           2606    25021    rolemenu rolemenu_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_pkey PRIMARY KEY (rolemenuid);
 @   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_pkey;
       public            postgres    false    268         Q           2606    25038    shift shift_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (shiftid);
 :   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_pkey;
       public            postgres    false    270         S           2606    25055    shiftdetail shiftdetail_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_pkey PRIMARY KEY (shiftdetailid);
 F   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_pkey;
       public            postgres    false    272         U           2606    25072 (   shiftdetailregion shiftdetailregion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_pkey PRIMARY KEY (shiftdetailregionid);
 R   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_pkey;
       public            postgres    false    274         W           2606    25089    smslog smslog_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.smslog
    ADD CONSTRAINT smslog_pkey PRIMARY KEY (smslogid);
 <   ALTER TABLE ONLY public.smslog DROP CONSTRAINT smslog_pkey;
       public            postgres    false    276         j           2606    24854    User User_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_aspnetuserid_fkey" FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 I   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_aspnetuserid_fkey";
       public          postgres    false    248    4887    215         ^           2606    24643 $   adminregion adminregion_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 N   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_adminid_fkey;
       public          postgres    false    219    4893    223         _           2606    24648 %   adminregion adminregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 O   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_regionid_fkey;
       public          postgres    false    4895    223    221         \           2606    24615 +   aspnetuserroles aspnetuserroles_roleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.aspnetroles(id);
 U   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_roleid_fkey;
       public          postgres    false    4889    216    217         ]           2606    24610 +   aspnetuserroles aspnetuserroles_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_userid_fkey FOREIGN KEY (userid) REFERENCES public.aspnetusers(id);
 U   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_userid_fkey;
       public          postgres    false    4887    215    217         �           2606    25124     business business_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);
 J   ALTER TABLE ONLY public.business DROP CONSTRAINT business_createdby_fkey;
       public          postgres    false    278    215    4887         �           2606    25129 !   business business_modifiedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);
 K   ALTER TABLE ONLY public.business DROP CONSTRAINT business_modifiedby_fkey;
       public          postgres    false    278    4887    215         `           2606    24677 !   concierge concierge_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 K   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_regionid_fkey;
       public          postgres    false    4895    229    221         a           2606    24706 7   healthprofessionals healthprofessionals_profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_profession_fkey FOREIGN KEY (profession) REFERENCES public.healthprofessionaltype(healthprofessionalid);
 a   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_profession_fkey;
       public          postgres    false    4907    234    232         b           2606    24782 %   physician physician_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 O   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_aspnetuserid_fkey;
       public          postgres    false    215    4887    240         c           2606    24792 "   physician physician_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);
 L   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_createdby_fkey;
       public          postgres    false    240    215    4887         d           2606    24797 #   physician physician_modifiedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);
 M   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_modifiedby_fkey;
       public          postgres    false    4887    215    240         e           2606    24787 !   physician physician_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 K   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_regionid_fkey;
       public          postgres    false    4895    221    240         f           2606    24811 4   physicianlocation physicianlocation_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 ^   ALTER TABLE ONLY public.physicianlocation DROP CONSTRAINT physicianlocation_physicianid_fkey;
       public          postgres    false    4915    240    242         g           2606    24823 <   physiciannotification physiciannotification_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 f   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_physicianid_fkey;
       public          postgres    false    244    4915    240         h           2606    24835 0   physicianregion physicianregion_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_physicianid_fkey;
       public          postgres    false    246    4915    240         i           2606    24840 -   physicianregion physicianregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 W   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_regionid_fkey;
       public          postgres    false    221    246    4895         k           2606    24873     request request_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 J   ALTER TABLE ONLY public.request DROP CONSTRAINT request_physicianid_fkey;
       public          postgres    false    240    250    4915         l           2606    24868    request request_userid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_userid_fkey FOREIGN KEY (userid) REFERENCES public."User"(userid);
 E   ALTER TABLE ONLY public.request DROP CONSTRAINT request_userid_fkey;
       public          postgres    false    4923    250    248         �           2606    25146 /   requestbusiness requestbusiness_businessid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_businessid_fkey FOREIGN KEY (businessid) REFERENCES public.business(businessid);
 Y   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_businessid_fkey;
       public          postgres    false    278    280    4953         �           2606    25141 .   requestbusiness requestbusiness_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_requestid_fkey;
       public          postgres    false    280    250    4925         m           2606    24892 )   requestclient requestclient_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 S   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_regionid_fkey;
       public          postgres    false    221    252    4895         n           2606    24887 *   requestclient requestclient_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_requestid_fkey;
       public          postgres    false    252    4925    250         v           2606    24967 *   requestclosed requestclosed_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requestid_fkey;
       public          postgres    false    4925    250    260         w           2606    24972 3   requestclosed requestclosed_requeststatuslogid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requeststatuslogid_fkey FOREIGN KEY (requeststatuslogid) REFERENCES public.requeststatuslog(requeststatuslogid);
 ]   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requeststatuslogid_fkey;
       public          postgres    false    4933    260    258         o           2606    24909 2   requestconcierge requestconcierge_conciergeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_conciergeid_fkey FOREIGN KEY (conciergeid) REFERENCES public.concierge(conciergeid);
 \   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_conciergeid_fkey;
       public          postgres    false    229    254    4903         p           2606    24904 0   requestconcierge requestconcierge_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_requestid_fkey;
       public          postgres    false    250    254    4925         q           2606    24923 (   requestnotes requestnotes_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 R   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_requestid_fkey;
       public          postgres    false    250    256    4925         r           2606    24947 .   requeststatuslog requeststatuslog_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 X   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_adminid_fkey;
       public          postgres    false    4893    258    219         s           2606    24942 2   requeststatuslog requeststatuslog_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 \   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_physicianid_fkey;
       public          postgres    false    258    240    4915         t           2606    24937 0   requeststatuslog requeststatuslog_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_requestid_fkey;
       public          postgres    false    250    258    4925         u           2606    24952 9   requeststatuslog requeststatuslog_transtophysicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_transtophysicianid_fkey FOREIGN KEY (transtophysicianid) REFERENCES public.physician(physicianid);
 c   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_transtophysicianid_fkey;
       public          postgres    false    240    4915    258         x           2606    24996 ,   requestwisefile requestwisefile_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_adminid_fkey;
       public          postgres    false    262    4893    219         y           2606    24991 0   requestwisefile requestwisefile_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_physicianid_fkey;
       public          postgres    false    240    4915    262         z           2606    24986 .   requestwisefile requestwisefile_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_requestid_fkey;
       public          postgres    false    250    4925    262         {           2606    25027    rolemenu rolemenu_menuid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_menuid_fkey FOREIGN KEY (menuid) REFERENCES public.menu(menuid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_menuid_fkey;
       public          postgres    false    268    4911    236         |           2606    25022    rolemenu rolemenu_roleid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_roleid_fkey;
       public          postgres    false    4941    268    266         }           2606    25044    shift shift_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);
 D   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_createdby_fkey;
       public          postgres    false    215    4887    270         ~           2606    25039    shift shift_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 F   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_physicianid_fkey;
       public          postgres    false    4915    240    270                    2606    25061 '   shiftdetail shiftdetail_modifiedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);
 Q   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_modifiedby_fkey;
       public          postgres    false    215    4887    272         �           2606    25056 $   shiftdetail shiftdetail_shiftid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_shiftid_fkey FOREIGN KEY (shiftid) REFERENCES public.shift(shiftid);
 N   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_shiftid_fkey;
       public          postgres    false    270    4945    272         �           2606    25078 1   shiftdetailregion shiftdetailregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 [   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_regionid_fkey;
       public          postgres    false    274    4895    221         �           2606    25073 6   shiftdetailregion shiftdetailregion_shiftdetailid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_shiftdetailid_fkey FOREIGN KEY (shiftdetailid) REFERENCES public.shiftdetail(shiftdetailid);
 `   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_shiftdetailid_fkey;
       public          postgres    false    274    4947    272                                                                                                                                                          5175.dat                                                                                            0000600 0004000 0002000 00000002021 14561322555 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	3	3	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2024-02-07 11:44:45.764762	\N	\N	\N	\N	\N	\N
2	5	5	5	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	2024-02-07 12:06:20.374976	\N	\N	\N	\N	\N	\N
3	7	7	7	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	2024-02-07 12:08:57.696137	\N	\N	\N	\N	\N	\N
4	8	8	8	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	2024-02-07 12:12:28.683379	\N	\N	\N	\N	\N	\N
5	41	14	14	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	41	2024-02-07 12:13:01.601098	\N	\N	\N	\N	\N	\N
6	452	452	452	452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	452	2024-02-07 13:07:11.220352	\N	\N	\N	\N	\N	\N
7	a2	as	as	yh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a2	2024-02-07 13:12:36.268856	\N	\N	\N	\N	\N	\N
8	himanshu	himanshu	babariya	himanshu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	himanshu	2024-02-07 13:17:44.93989	\N	\N	\N	\N	\N	\N
9	Shlok	Shlok	Shlok	Shlok	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Shlok	2024-02-07 15:55:45.910154	\N	\N	\N	\N	\N	\N
10	00000000-0000-0000-0000-000000000000	shreyans	shreyans	shreyans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	00000000-0000-0000-0000-000000000000	2024-02-08 11:41:35.049463	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               5146.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5150.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5143.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5144.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5142.dat                                                                                            0000600 0004000 0002000 00000001071 14561322555 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	3	3	\N	\N	2024-02-07 11:44:45.633819	\N	\N
5	5	5	\N	\N	2024-02-07 12:06:19.328429	\N	\N
7	7	7	\N	\N	2024-02-07 12:08:57.639173	\N	\N
8	8	8	\N	\N	2024-02-07 12:12:28.583601	\N	\N
41	14	14	\N	\N	2024-02-07 12:13:01.550078	\N	\N
452	452	452	\N	\N	2024-02-07 13:07:10.179524	\N	\N
a2	1	1	\N	\N	2024-02-07 13:12:36.168598	\N	\N
Shlok	Shlok	Shlok	\N	\N	2024-02-07 15:55:44.416352	\N	\N
himanshu	himanshu	himanshu	himanshu@gmail.com	\N	2024-02-07 13:17:44.738443	\N	\N
00000000-0000-0000-0000-000000000000	shreyans	shreyans	shreyans	\N	2024-02-08 11:41:34.808792	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                       5152.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5205.dat                                                                                            0000600 0004000 0002000 00000000363 14561322555 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-09 09:00:50.293558	\N	\N	\N	\N	\N
2	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-09 09:06:44.269679	\N	\N	\N	\N	\N
3	Business Business 	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-09 09:11:41.880594	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                             5154.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5156.dat                                                                                            0000600 0004000 0002000 00000000077 14561322555 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1Concierge 1	\N	1	1	1	1	2024-02-09 09:07:20.353357	1	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                 5157.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5161.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5159.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5163.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5165.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5167.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5169.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5171.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5173.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5148.dat                                                                                            0000600 0004000 0002000 00000000067 14561322555 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	North	N
2	South	S
3	East	E
4	West	W
5	Central	C
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         5177.dat                                                                                            0000600 0004000 0002000 00000004607 14561322555 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	3	7	7	7	7	0	\N	\N	2024-02-07 12:08:57.790336	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2	4	8	8	8	8	0	\N	\N	2024-02-07 12:12:28.772994	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	2	5	14	14	14	41	0	\N	\N	2024-02-07 12:13:01.603052	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	2	6	452	452	452	452	0	\N	\N	2024-02-07 13:07:11.316861	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	2	7	as	as	1	yh	0	\N	\N	2024-02-07 13:12:36.360876	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2	8	himanshu	babariya	123	himanshu	0	\N	\N	2024-02-07 13:17:44.944704	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	2	9	Shlok	Shlok	1	Shlok	0	\N	\N	2024-02-07 15:55:46.044969	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	2	10	shreyans	shreyans	2	shreyans	0	\N	\N	2024-02-08 11:41:35.283714	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	2	10	UserId	UserId	12	shreyans	0	\N	\N	2024-02-08 13:54:27.892367	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	2	10	Shreyans	padmani	21	shreyans	0	\N	\N	2024-02-08 14:18:00.31515	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	2	10	ges	eg	548	shreyans	0	\N	\N	2024-02-08 15:18:18.515315	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	2	10	tiyni	tiyni	123123	shreyans	0	\N	\N	2024-02-08 16:47:47.535456	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	2	8	tata	tata	123	himanshu@gmail.com	0	\N	\N	2024-02-08 16:50:48.803351	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	3	\N	\N	\N	\N	\N	1	\N	\N	2024-02-08 18:20:34.985666	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	3	\N	\N	\N	\N	\N	1	\N	\N	2024-02-08 18:22:06.890731	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	3	\N	\N	\N	\N	\N	1	\N	\N	2024-02-08 18:22:06.890731	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	3	\N	jntfyjhn	yhftj	135	cidet10203@seosnaps.com	1	\N	\N	2024-02-08 18:28:51.28195	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	3	\N	1	1	1	cidet10203@seosnaps.com	1	\N	\N	2024-02-09 09:00:51.420484	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	3	\N	1	1	1	cidet10203@seosnaps.com	1	\N	\N	2024-02-09 09:06:45.440761	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	3	\N	11Concierge 	1	1	cidet10203@seosnaps.com	1	\N	\N	2024-02-09 09:07:20.444241	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	3	\N	Business 	Business 	123	cidet10203@seosnaps.com	1	\N	\N	2024-02-09 09:11:41.892492	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                         5207.dat                                                                                            0000600 0004000 0002000 00000000043 14561322555 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	19	1	\N
2	20	2	\N
3	22	3	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             5179.dat                                                                                            0000600 0004000 0002000 00000002221 14561322555 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	8	shreyans	shreyans	2	\N	shreyans	\N	\N	\N	\N	shreyans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	10	UserId	UserId	12	\N	UserId	\N	\N	\N	\N	shreyans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	11	Shreyans	padmani	21	\N	sw	\N	\N	\N	\N	shreyans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	12	ges	eg	548	\N	tgj	\N	\N	\N	\N	shreyans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	13	tiyni	tiyni	123123	\N	surat	\N	\N	\N	\N	shreyans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	14	tata	tata	123	\N	himshu	\N	\N	\N	\N	himanshu@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	18	jntfyjhn	yhftj	135	\N	hyhry	\N	\N	\N	\N	cidet10203@seosnaps.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	19	1	1	1	\N	\N	\N	\N	\N	\N	cidet10203@seosnaps.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	20	1	1	1	\N	\N	\N	\N	\N	\N	cidet10203@seosnaps.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	21	11Concierge 	1	1	\N	\N	\N	\N	\N	\N	cidet10203@seosnaps.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	22	Business 	Business 	123	\N	\N	\N	\N	\N	\N	cidet10203@seosnaps.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                               5187.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5181.dat                                                                                            0000600 0004000 0002000 00000000017 14561322555 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	21	1	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 5183.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5185.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5191.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5189.dat                                                                                            0000600 0004000 0002000 00000000133 14561322555 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	14	~/Upload/Session 2 (1).txt	2024-02-08 16:50:49.063111	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                     5193.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5195.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5197.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5199.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5201.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5203.dat                                                                                            0000600 0004000 0002000 00000000005 14561322555 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000234163 14561322555 0015405 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "HalloDoc";
--
-- Name: HalloDoc; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "HalloDoc" OWNER TO postgres;

\connect "HalloDoc"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    userid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    ismobile bit(1),
    street character varying(100),
    city character varying(100),
    state character varying(100),
    regionid integer,
    zipcode character varying(10),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    ip character varying(20),
    isrequestwithemail bit(1)
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_userid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_userid_seq" OWNER TO postgres;

--
-- Name: User_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_userid_seq" OWNED BY public."User".userid;


--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    adminid integer NOT NULL,
    aspnetuserid character varying(128) NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    roleid integer
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_adminid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_adminid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_adminid_seq OWNER TO postgres;

--
-- Name: admin_adminid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_adminid_seq OWNED BY public.admin.adminid;


--
-- Name: adminregion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adminregion (
    adminregionid integer NOT NULL,
    adminid integer NOT NULL,
    regionid integer NOT NULL
);


ALTER TABLE public.adminregion OWNER TO postgres;

--
-- Name: adminregion_adminregionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adminregion_adminregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adminregion_adminregionid_seq OWNER TO postgres;

--
-- Name: adminregion_adminregionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adminregion_adminregionid_seq OWNED BY public.adminregion.adminregionid;


--
-- Name: aspnetroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aspnetroles (
    id character varying(128) NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE public.aspnetroles OWNER TO postgres;

--
-- Name: aspnetuserroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aspnetuserroles (
    userid character varying(128) NOT NULL,
    roleid character varying(128) NOT NULL
);


ALTER TABLE public.aspnetuserroles OWNER TO postgres;

--
-- Name: aspnetusers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aspnetusers (
    id character varying(128) NOT NULL,
    username character varying(256) NOT NULL,
    passwordhash character varying(255),
    email character varying(256),
    phonenumber character varying(20),
    "CreatedDate" timestamp without time zone NOT NULL,
    ip character varying(20),
    modifieddate timestamp without time zone
);


ALTER TABLE public.aspnetusers OWNER TO postgres;

--
-- Name: blockrequests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blockrequests (
    blockrequestid integer NOT NULL,
    phonenumber character varying(50),
    email character varying(50),
    isactive bit(1),
    reason text,
    requestid character varying(50) NOT NULL,
    ip character varying(20),
    createddate timestamp without time zone,
    modifieddate timestamp without time zone
);


ALTER TABLE public.blockrequests OWNER TO postgres;

--
-- Name: blockrequests_blockrequestid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blockrequests_blockrequestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blockrequests_blockrequestid_seq OWNER TO postgres;

--
-- Name: blockrequests_blockrequestid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blockrequests_blockrequestid_seq OWNED BY public.blockrequests.blockrequestid;


--
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    businessid integer NOT NULL,
    name character varying(100) NOT NULL,
    address1 character varying(500),
    address2 character varying(500),
    city character varying(50),
    regionid integer,
    zipcode character varying(10),
    phonenumber character varying(20),
    faxnumber character varying(20),
    isregistered bit(1),
    createdby character varying(128),
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    ip character varying(20)
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: business_businessid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_businessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_businessid_seq OWNER TO postgres;

--
-- Name: business_businessid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_businessid_seq OWNED BY public.business.businessid;


--
-- Name: casetag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.casetag (
    casetagid integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.casetag OWNER TO postgres;

--
-- Name: casetag_casetagid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.casetag_casetagid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casetag_casetagid_seq OWNER TO postgres;

--
-- Name: casetag_casetagid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.casetag_casetagid_seq OWNED BY public.casetag.casetagid;


--
-- Name: concierge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concierge (
    conciergeid integer NOT NULL,
    conciergename character varying(100) NOT NULL,
    address character varying(150),
    street character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    zipcode character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    regionid integer NOT NULL,
    ip character varying(20)
);


ALTER TABLE public.concierge OWNER TO postgres;

--
-- Name: concierge_conciergeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concierge_conciergeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concierge_conciergeid_seq OWNER TO postgres;

--
-- Name: concierge_conciergeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concierge_conciergeid_seq OWNED BY public.concierge.conciergeid;


--
-- Name: emaillog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emaillog (
    emaillogid numeric(9,0) NOT NULL,
    emailtemplate text NOT NULL,
    subjectname character varying(200) NOT NULL,
    emailid character varying(200) NOT NULL,
    confirmationnumber character varying(200),
    filepath text,
    roleid integer,
    requestid integer,
    adminid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    isemailsent bit(1),
    senttries integer,
    action integer
);


ALTER TABLE public.emaillog OWNER TO postgres;

--
-- Name: healthprofessionals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.healthprofessionals (
    vendorid integer NOT NULL,
    vendorname character varying(100) NOT NULL,
    profession integer,
    faxnumber character varying(50) NOT NULL,
    address character varying(150),
    city character varying(100),
    state character varying(50),
    zip character varying(50),
    regionid integer,
    createddate timestamp without time zone NOT NULL,
    modifieddate timestamp without time zone,
    phonenumber character varying(100),
    isdeleted bit(1),
    ip character varying(20),
    email character varying(50),
    businesscontact character varying(100)
);


ALTER TABLE public.healthprofessionals OWNER TO postgres;

--
-- Name: healthprofessionals_vendorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.healthprofessionals_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.healthprofessionals_vendorid_seq OWNER TO postgres;

--
-- Name: healthprofessionals_vendorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.healthprofessionals_vendorid_seq OWNED BY public.healthprofessionals.vendorid;


--
-- Name: healthprofessionaltype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.healthprofessionaltype (
    healthprofessionalid integer NOT NULL,
    professionname character varying(50) NOT NULL,
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    isactive bit(1),
    isdeleted bit(1)
);


ALTER TABLE public.healthprofessionaltype OWNER TO postgres;

--
-- Name: healthprofessionaltype_healthprofessionalid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq OWNER TO postgres;

--
-- Name: healthprofessionaltype_healthprofessionalid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq OWNED BY public.healthprofessionaltype.healthprofessionalid;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    menuid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    sortorder integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_menuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_menuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_menuid_seq OWNER TO postgres;

--
-- Name: menu_menuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_menuid_seq OWNED BY public.menu.menuid;


--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    vendorid integer,
    requestid integer,
    faxnumber character varying(50),
    email character varying(50),
    businesscontact character varying(100),
    prescription text,
    noofrefill integer,
    createddate timestamp without time zone,
    createdby character varying(100)
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- Name: orderdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetails_id_seq OWNER TO postgres;

--
-- Name: orderdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;


--
-- Name: physician; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physician (
    physicianid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    medicallicense character varying(500),
    photo character varying(100),
    adminnotes character varying(500),
    isagreementdoc bit(1),
    isbackgrounddoc bit(1),
    istrainingdoc bit(1),
    isnondisclosuredoc bit(1),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    businessname character varying(100) NOT NULL,
    businesswebsite character varying(200) NOT NULL,
    isdeleted bit(1),
    roleid integer,
    npinumber character varying(500),
    islicensedoc bit(1),
    signature character varying(100),
    iscredentialdoc bit(1),
    istokengenerate bit(1),
    syncemailaddress character varying(50)
);


ALTER TABLE public.physician OWNER TO postgres;

--
-- Name: physician_physicianid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physician_physicianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.physician_physicianid_seq OWNER TO postgres;

--
-- Name: physician_physicianid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physician_physicianid_seq OWNED BY public.physician.physicianid;


--
-- Name: physicianlocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physicianlocation (
    locationid integer NOT NULL,
    physicianid integer NOT NULL,
    latitude numeric(9,0),
    longitude numeric(9,0),
    createddate timestamp without time zone,
    physicianname character varying(50),
    address character varying(500)
);


ALTER TABLE public.physicianlocation OWNER TO postgres;

--
-- Name: physicianlocation_locationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physicianlocation_locationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.physicianlocation_locationid_seq OWNER TO postgres;

--
-- Name: physicianlocation_locationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physicianlocation_locationid_seq OWNED BY public.physicianlocation.locationid;


--
-- Name: physiciannotification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physiciannotification (
    id integer NOT NULL,
    physicianid integer NOT NULL,
    isnotificationstopped bit(1) NOT NULL
);


ALTER TABLE public.physiciannotification OWNER TO postgres;

--
-- Name: physiciannotification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physiciannotification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.physiciannotification_id_seq OWNER TO postgres;

--
-- Name: physiciannotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physiciannotification_id_seq OWNED BY public.physiciannotification.id;


--
-- Name: physicianregion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physicianregion (
    physicianregionid integer NOT NULL,
    physicianid integer NOT NULL,
    regionid integer NOT NULL
);


ALTER TABLE public.physicianregion OWNER TO postgres;

--
-- Name: physicianregion_physicianregionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physicianregion_physicianregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.physicianregion_physicianregionid_seq OWNER TO postgres;

--
-- Name: physicianregion_physicianregionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physicianregion_physicianregionid_seq OWNED BY public.physicianregion.physicianregionid;


--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    regionid integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(50)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_regionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_regionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.region_regionid_seq OWNER TO postgres;

--
-- Name: region_regionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_regionid_seq OWNED BY public.region.regionid;


--
-- Name: request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request (
    requestid integer NOT NULL,
    requesttypeid integer NOT NULL,
    userid integer,
    firstname character varying(100),
    lastname character varying(100),
    phonenumber character varying(23),
    email character varying(50),
    status smallint NOT NULL,
    physicianid integer,
    confirmationnumber character varying(20),
    createddate timestamp without time zone NOT NULL,
    isdeleted bit(1),
    modifieddate timestamp without time zone,
    declinedby character varying(250),
    isurgentemailsent bit(1) NOT NULL,
    lastwellnessdate timestamp without time zone,
    ismobile bit(1),
    calltype smallint,
    completedbyphysician bit(1),
    lastreservationdate timestamp without time zone,
    accepteddate timestamp without time zone,
    relationname character varying(100),
    casenumber character varying(50),
    ip character varying(20),
    casetag character varying(50),
    casetagphysician character varying(50),
    patientaccountid character varying(128),
    createduserid integer
);


ALTER TABLE public.request OWNER TO postgres;

--
-- Name: request_requestid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.request_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.request_requestid_seq OWNER TO postgres;

--
-- Name: request_requestid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.request_requestid_seq OWNED BY public.request.requestid;


--
-- Name: requestbusiness; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestbusiness (
    requestbusinessid integer NOT NULL,
    requestid integer,
    businessid integer,
    ip character varying(20)
);


ALTER TABLE public.requestbusiness OWNER TO postgres;

--
-- Name: requestbusiness_requestbusinessid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestbusiness_requestbusinessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestbusiness_requestbusinessid_seq OWNER TO postgres;

--
-- Name: requestbusiness_requestbusinessid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestbusiness_requestbusinessid_seq OWNED BY public.requestbusiness.requestbusinessid;


--
-- Name: requestclient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestclient (
    requestclientid integer NOT NULL,
    requestid integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    phonenumber character varying(23),
    location character varying(100),
    address character varying(500),
    regionid integer,
    notimobile character varying(20),
    notiemail character varying(50),
    notes character varying(500),
    email character varying(50),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    ismobile bit(1),
    street character varying(100),
    city character varying(100),
    state character varying(100),
    zipcode character varying(10),
    communicationtype smallint,
    remindreservationcount smallint,
    remindhousecallcount smallint,
    issetfollowupsent smallint,
    ip character varying(20),
    isreservationremindersent smallint,
    latitude numeric(9,0),
    longitude numeric(9,0)
);


ALTER TABLE public.requestclient OWNER TO postgres;

--
-- Name: requestclient_requestclientid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestclient_requestclientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestclient_requestclientid_seq OWNER TO postgres;

--
-- Name: requestclient_requestclientid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestclient_requestclientid_seq OWNED BY public.requestclient.requestclientid;


--
-- Name: requestclosed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestclosed (
    requestclosedid integer NOT NULL,
    requestid integer NOT NULL,
    requeststatuslogid integer NOT NULL,
    phynotes character varying(500),
    clientnotes character varying(500),
    ip character varying(20)
);


ALTER TABLE public.requestclosed OWNER TO postgres;

--
-- Name: requestclosed_requestclosedid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestclosed_requestclosedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestclosed_requestclosedid_seq OWNER TO postgres;

--
-- Name: requestclosed_requestclosedid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestclosed_requestclosedid_seq OWNED BY public.requestclosed.requestclosedid;


--
-- Name: requestconcierge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestconcierge (
    id integer NOT NULL,
    requestid integer NOT NULL,
    conciergeid integer NOT NULL,
    ip character varying(20)
);


ALTER TABLE public.requestconcierge OWNER TO postgres;

--
-- Name: requestconcierge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestconcierge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestconcierge_id_seq OWNER TO postgres;

--
-- Name: requestconcierge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestconcierge_id_seq OWNED BY public.requestconcierge.id;


--
-- Name: requestnotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestnotes (
    requestnotesid integer NOT NULL,
    requestid integer NOT NULL,
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    physiciannotes character varying(500),
    adminnotes character varying(500),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    ip character varying(20),
    administrativenotes character varying(500)
);


ALTER TABLE public.requestnotes OWNER TO postgres;

--
-- Name: requestnotes_requestnotesid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestnotes_requestnotesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestnotes_requestnotesid_seq OWNER TO postgres;

--
-- Name: requestnotes_requestnotesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestnotes_requestnotesid_seq OWNED BY public.requestnotes.requestnotesid;


--
-- Name: requeststatuslog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requeststatuslog (
    requeststatuslogid integer NOT NULL,
    requestid integer NOT NULL,
    status smallint NOT NULL,
    physicianid integer,
    adminid integer,
    transtophysicianid integer,
    notes character varying(500),
    createddate timestamp without time zone NOT NULL,
    ip character varying(20),
    transtoadmin bit(1)
);


ALTER TABLE public.requeststatuslog OWNER TO postgres;

--
-- Name: requeststatuslog_requeststatuslogid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requeststatuslog_requeststatuslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requeststatuslog_requeststatuslogid_seq OWNER TO postgres;

--
-- Name: requeststatuslog_requeststatuslogid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requeststatuslog_requeststatuslogid_seq OWNED BY public.requeststatuslog.requeststatuslogid;


--
-- Name: requesttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requesttype (
    requesttypeid integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.requesttype OWNER TO postgres;

--
-- Name: requesttype_requesttypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requesttype_requesttypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requesttype_requesttypeid_seq OWNER TO postgres;

--
-- Name: requesttype_requesttypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requesttype_requesttypeid_seq OWNED BY public.requesttype.requesttypeid;


--
-- Name: requestwisefile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requestwisefile (
    requestwisefileid integer NOT NULL,
    requestid integer NOT NULL,
    filename character varying(500) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    physicianid integer,
    adminid integer,
    doctype smallint,
    isfrontside bit(1),
    iscompensation bit(1),
    ip character varying(20),
    isfinalize bit(1),
    isdeleted bit(1),
    ispatientrecords bit(1)
);


ALTER TABLE public.requestwisefile OWNER TO postgres;

--
-- Name: requestwisefile_requestwisefileid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requestwisefile_requestwisefileid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requestwisefile_requestwisefileid_seq OWNER TO postgres;

--
-- Name: requestwisefile_requestwisefileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requestwisefile_requestwisefileid_seq OWNED BY public.requestwisefile.requestwisefileid;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    roleid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    isdeleted bit(1) NOT NULL,
    ip character varying(20)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_roleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_roleid_seq OWNER TO postgres;

--
-- Name: role_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_roleid_seq OWNED BY public.role.roleid;


--
-- Name: rolemenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolemenu (
    rolemenuid integer NOT NULL,
    roleid integer NOT NULL,
    menuid integer NOT NULL
);


ALTER TABLE public.rolemenu OWNER TO postgres;

--
-- Name: rolemenu_rolemenuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rolemenu_rolemenuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rolemenu_rolemenuid_seq OWNER TO postgres;

--
-- Name: rolemenu_rolemenuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rolemenu_rolemenuid_seq OWNED BY public.rolemenu.rolemenuid;


--
-- Name: shift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shift (
    shiftid integer NOT NULL,
    physicianid integer NOT NULL,
    startdate date NOT NULL,
    isrepeat bit(1) NOT NULL,
    weekdays character(7),
    repeatupto integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    ip character varying(20)
);


ALTER TABLE public.shift OWNER TO postgres;

--
-- Name: shift_shiftid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shift_shiftid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shift_shiftid_seq OWNER TO postgres;

--
-- Name: shift_shiftid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shift_shiftid_seq OWNED BY public.shift.shiftid;


--
-- Name: shiftdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shiftdetail (
    shiftdetailid integer NOT NULL,
    shiftid integer NOT NULL,
    shiftdate timestamp without time zone NOT NULL,
    regionid integer,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    status smallint NOT NULL,
    isdeleted bit(1) NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    lastrunningdate timestamp without time zone,
    eventid character varying(100),
    issync bit(1)
);


ALTER TABLE public.shiftdetail OWNER TO postgres;

--
-- Name: shiftdetail_shiftdetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shiftdetail_shiftdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shiftdetail_shiftdetailid_seq OWNER TO postgres;

--
-- Name: shiftdetail_shiftdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shiftdetail_shiftdetailid_seq OWNED BY public.shiftdetail.shiftdetailid;


--
-- Name: shiftdetailregion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shiftdetailregion (
    shiftdetailregionid integer NOT NULL,
    shiftdetailid integer NOT NULL,
    regionid integer NOT NULL,
    isdeleted bit(1)
);


ALTER TABLE public.shiftdetailregion OWNER TO postgres;

--
-- Name: shiftdetailregion_shiftdetailregionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq OWNER TO postgres;

--
-- Name: shiftdetailregion_shiftdetailregionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq OWNED BY public.shiftdetailregion.shiftdetailregionid;


--
-- Name: smslog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.smslog (
    smslogid integer NOT NULL,
    smstemplate character varying(100),
    mobilenumber character varying(50) NOT NULL,
    confirmationnumber character varying(200),
    roleid integer,
    adminid integer,
    requestid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    issmssent bit(1),
    senttries integer NOT NULL,
    action integer
);


ALTER TABLE public.smslog OWNER TO postgres;

--
-- Name: smslog_smslogid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.smslog_smslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.smslog_smslogid_seq OWNER TO postgres;

--
-- Name: smslog_smslogid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.smslog_smslogid_seq OWNED BY public.smslog.smslogid;


--
-- Name: User userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN userid SET DEFAULT nextval('public."User_userid_seq"'::regclass);


--
-- Name: admin adminid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN adminid SET DEFAULT nextval('public.admin_adminid_seq'::regclass);


--
-- Name: adminregion adminregionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminregion ALTER COLUMN adminregionid SET DEFAULT nextval('public.adminregion_adminregionid_seq'::regclass);


--
-- Name: blockrequests blockrequestid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockrequests ALTER COLUMN blockrequestid SET DEFAULT nextval('public.blockrequests_blockrequestid_seq'::regclass);


--
-- Name: business businessid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business ALTER COLUMN businessid SET DEFAULT nextval('public.business_businessid_seq'::regclass);


--
-- Name: casetag casetagid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casetag ALTER COLUMN casetagid SET DEFAULT nextval('public.casetag_casetagid_seq'::regclass);


--
-- Name: concierge conciergeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concierge ALTER COLUMN conciergeid SET DEFAULT nextval('public.concierge_conciergeid_seq'::regclass);


--
-- Name: healthprofessionals vendorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthprofessionals ALTER COLUMN vendorid SET DEFAULT nextval('public.healthprofessionals_vendorid_seq'::regclass);


--
-- Name: healthprofessionaltype healthprofessionalid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthprofessionaltype ALTER COLUMN healthprofessionalid SET DEFAULT nextval('public.healthprofessionaltype_healthprofessionalid_seq'::regclass);


--
-- Name: menu menuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN menuid SET DEFAULT nextval('public.menu_menuid_seq'::regclass);


--
-- Name: orderdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);


--
-- Name: physician physicianid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician ALTER COLUMN physicianid SET DEFAULT nextval('public.physician_physicianid_seq'::regclass);


--
-- Name: physicianlocation locationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianlocation ALTER COLUMN locationid SET DEFAULT nextval('public.physicianlocation_locationid_seq'::regclass);


--
-- Name: physiciannotification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiciannotification ALTER COLUMN id SET DEFAULT nextval('public.physiciannotification_id_seq'::regclass);


--
-- Name: physicianregion physicianregionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianregion ALTER COLUMN physicianregionid SET DEFAULT nextval('public.physicianregion_physicianregionid_seq'::regclass);


--
-- Name: region regionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN regionid SET DEFAULT nextval('public.region_regionid_seq'::regclass);


--
-- Name: request requestid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request ALTER COLUMN requestid SET DEFAULT nextval('public.request_requestid_seq'::regclass);


--
-- Name: requestbusiness requestbusinessid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestbusiness ALTER COLUMN requestbusinessid SET DEFAULT nextval('public.requestbusiness_requestbusinessid_seq'::regclass);


--
-- Name: requestclient requestclientid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclient ALTER COLUMN requestclientid SET DEFAULT nextval('public.requestclient_requestclientid_seq'::regclass);


--
-- Name: requestclosed requestclosedid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclosed ALTER COLUMN requestclosedid SET DEFAULT nextval('public.requestclosed_requestclosedid_seq'::regclass);


--
-- Name: requestconcierge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestconcierge ALTER COLUMN id SET DEFAULT nextval('public.requestconcierge_id_seq'::regclass);


--
-- Name: requestnotes requestnotesid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestnotes ALTER COLUMN requestnotesid SET DEFAULT nextval('public.requestnotes_requestnotesid_seq'::regclass);


--
-- Name: requeststatuslog requeststatuslogid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requeststatuslog ALTER COLUMN requeststatuslogid SET DEFAULT nextval('public.requeststatuslog_requeststatuslogid_seq'::regclass);


--
-- Name: requesttype requesttypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requesttype ALTER COLUMN requesttypeid SET DEFAULT nextval('public.requesttype_requesttypeid_seq'::regclass);


--
-- Name: requestwisefile requestwisefileid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestwisefile ALTER COLUMN requestwisefileid SET DEFAULT nextval('public.requestwisefile_requestwisefileid_seq'::regclass);


--
-- Name: role roleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN roleid SET DEFAULT nextval('public.role_roleid_seq'::regclass);


--
-- Name: rolemenu rolemenuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolemenu ALTER COLUMN rolemenuid SET DEFAULT nextval('public.rolemenu_rolemenuid_seq'::regclass);


--
-- Name: shift shiftid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shift ALTER COLUMN shiftid SET DEFAULT nextval('public.shift_shiftid_seq'::regclass);


--
-- Name: shiftdetail shiftdetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetail ALTER COLUMN shiftdetailid SET DEFAULT nextval('public.shiftdetail_shiftdetailid_seq'::regclass);


--
-- Name: shiftdetailregion shiftdetailregionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetailregion ALTER COLUMN shiftdetailregionid SET DEFAULT nextval('public.shiftdetailregion_shiftdetailregionid_seq'::regclass);


--
-- Name: smslog smslogid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.smslog ALTER COLUMN smslogid SET DEFAULT nextval('public.smslog_smslogid_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (userid, aspnetuserid, firstname, lastname, email, mobile, ismobile, street, city, state, regionid, zipcode, strmonth, intyear, intdate, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip, isrequestwithemail) FROM stdin;
\.
COPY public."User" (userid, aspnetuserid, firstname, lastname, email, mobile, ismobile, street, city, state, regionid, zipcode, strmonth, intyear, intdate, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip, isrequestwithemail) FROM '$$PATH$$/5175.dat';

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (adminid, aspnetuserid, firstname, lastname, email, mobile, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, isdeleted, roleid) FROM stdin;
\.
COPY public.admin (adminid, aspnetuserid, firstname, lastname, email, mobile, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, isdeleted, roleid) FROM '$$PATH$$/5146.dat';

--
-- Data for Name: adminregion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adminregion (adminregionid, adminid, regionid) FROM stdin;
\.
COPY public.adminregion (adminregionid, adminid, regionid) FROM '$$PATH$$/5150.dat';

--
-- Data for Name: aspnetroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aspnetroles (id, name) FROM stdin;
\.
COPY public.aspnetroles (id, name) FROM '$$PATH$$/5143.dat';

--
-- Data for Name: aspnetuserroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aspnetuserroles (userid, roleid) FROM stdin;
\.
COPY public.aspnetuserroles (userid, roleid) FROM '$$PATH$$/5144.dat';

--
-- Data for Name: aspnetusers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aspnetusers (id, username, passwordhash, email, phonenumber, "CreatedDate", ip, modifieddate) FROM stdin;
\.
COPY public.aspnetusers (id, username, passwordhash, email, phonenumber, "CreatedDate", ip, modifieddate) FROM '$$PATH$$/5142.dat';

--
-- Data for Name: blockrequests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockrequests (blockrequestid, phonenumber, email, isactive, reason, requestid, ip, createddate, modifieddate) FROM stdin;
\.
COPY public.blockrequests (blockrequestid, phonenumber, email, isactive, reason, requestid, ip, createddate, modifieddate) FROM '$$PATH$$/5152.dat';

--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (businessid, name, address1, address2, city, regionid, zipcode, phonenumber, faxnumber, isregistered, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip) FROM stdin;
\.
COPY public.business (businessid, name, address1, address2, city, regionid, zipcode, phonenumber, faxnumber, isregistered, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip) FROM '$$PATH$$/5205.dat';

--
-- Data for Name: casetag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.casetag (casetagid, name) FROM stdin;
\.
COPY public.casetag (casetagid, name) FROM '$$PATH$$/5154.dat';

--
-- Data for Name: concierge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concierge (conciergeid, conciergename, address, street, city, state, zipcode, createddate, regionid, ip) FROM stdin;
\.
COPY public.concierge (conciergeid, conciergename, address, street, city, state, zipcode, createddate, regionid, ip) FROM '$$PATH$$/5156.dat';

--
-- Data for Name: emaillog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emaillog (emaillogid, emailtemplate, subjectname, emailid, confirmationnumber, filepath, roleid, requestid, adminid, physicianid, createdate, sentdate, isemailsent, senttries, action) FROM stdin;
\.
COPY public.emaillog (emaillogid, emailtemplate, subjectname, emailid, confirmationnumber, filepath, roleid, requestid, adminid, physicianid, createdate, sentdate, isemailsent, senttries, action) FROM '$$PATH$$/5157.dat';

--
-- Data for Name: healthprofessionals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.healthprofessionals (vendorid, vendorname, profession, faxnumber, address, city, state, zip, regionid, createddate, modifieddate, phonenumber, isdeleted, ip, email, businesscontact) FROM stdin;
\.
COPY public.healthprofessionals (vendorid, vendorname, profession, faxnumber, address, city, state, zip, regionid, createddate, modifieddate, phonenumber, isdeleted, ip, email, businesscontact) FROM '$$PATH$$/5161.dat';

--
-- Data for Name: healthprofessionaltype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.healthprofessionaltype (healthprofessionalid, professionname, createddate, isactive, isdeleted) FROM stdin;
\.
COPY public.healthprofessionaltype (healthprofessionalid, professionname, createddate, isactive, isdeleted) FROM '$$PATH$$/5159.dat';

--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (menuid, name, accounttype, sortorder) FROM stdin;
\.
COPY public.menu (menuid, name, accounttype, sortorder) FROM '$$PATH$$/5163.dat';

--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (id, vendorid, requestid, faxnumber, email, businesscontact, prescription, noofrefill, createddate, createdby) FROM stdin;
\.
COPY public.orderdetails (id, vendorid, requestid, faxnumber, email, businesscontact, prescription, noofrefill, createddate, createdby) FROM '$$PATH$$/5165.dat';

--
-- Data for Name: physician; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physician (physicianid, aspnetuserid, firstname, lastname, email, mobile, medicallicense, photo, adminnotes, isagreementdoc, isbackgrounddoc, istrainingdoc, isnondisclosuredoc, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, businessname, businesswebsite, isdeleted, roleid, npinumber, islicensedoc, signature, iscredentialdoc, istokengenerate, syncemailaddress) FROM stdin;
\.
COPY public.physician (physicianid, aspnetuserid, firstname, lastname, email, mobile, medicallicense, photo, adminnotes, isagreementdoc, isbackgrounddoc, istrainingdoc, isnondisclosuredoc, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, businessname, businesswebsite, isdeleted, roleid, npinumber, islicensedoc, signature, iscredentialdoc, istokengenerate, syncemailaddress) FROM '$$PATH$$/5167.dat';

--
-- Data for Name: physicianlocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physicianlocation (locationid, physicianid, latitude, longitude, createddate, physicianname, address) FROM stdin;
\.
COPY public.physicianlocation (locationid, physicianid, latitude, longitude, createddate, physicianname, address) FROM '$$PATH$$/5169.dat';

--
-- Data for Name: physiciannotification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physiciannotification (id, physicianid, isnotificationstopped) FROM stdin;
\.
COPY public.physiciannotification (id, physicianid, isnotificationstopped) FROM '$$PATH$$/5171.dat';

--
-- Data for Name: physicianregion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physicianregion (physicianregionid, physicianid, regionid) FROM stdin;
\.
COPY public.physicianregion (physicianregionid, physicianid, regionid) FROM '$$PATH$$/5173.dat';

--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (regionid, name, abbreviation) FROM stdin;
\.
COPY public.region (regionid, name, abbreviation) FROM '$$PATH$$/5148.dat';

--
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request (requestid, requesttypeid, userid, firstname, lastname, phonenumber, email, status, physicianid, confirmationnumber, createddate, isdeleted, modifieddate, declinedby, isurgentemailsent, lastwellnessdate, ismobile, calltype, completedbyphysician, lastreservationdate, accepteddate, relationname, casenumber, ip, casetag, casetagphysician, patientaccountid, createduserid) FROM stdin;
\.
COPY public.request (requestid, requesttypeid, userid, firstname, lastname, phonenumber, email, status, physicianid, confirmationnumber, createddate, isdeleted, modifieddate, declinedby, isurgentemailsent, lastwellnessdate, ismobile, calltype, completedbyphysician, lastreservationdate, accepteddate, relationname, casenumber, ip, casetag, casetagphysician, patientaccountid, createduserid) FROM '$$PATH$$/5177.dat';

--
-- Data for Name: requestbusiness; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestbusiness (requestbusinessid, requestid, businessid, ip) FROM stdin;
\.
COPY public.requestbusiness (requestbusinessid, requestid, businessid, ip) FROM '$$PATH$$/5207.dat';

--
-- Data for Name: requestclient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestclient (requestclientid, requestid, firstname, lastname, phonenumber, location, address, regionid, notimobile, notiemail, notes, email, strmonth, intyear, intdate, ismobile, street, city, state, zipcode, communicationtype, remindreservationcount, remindhousecallcount, issetfollowupsent, ip, isreservationremindersent, latitude, longitude) FROM stdin;
\.
COPY public.requestclient (requestclientid, requestid, firstname, lastname, phonenumber, location, address, regionid, notimobile, notiemail, notes, email, strmonth, intyear, intdate, ismobile, street, city, state, zipcode, communicationtype, remindreservationcount, remindhousecallcount, issetfollowupsent, ip, isreservationremindersent, latitude, longitude) FROM '$$PATH$$/5179.dat';

--
-- Data for Name: requestclosed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestclosed (requestclosedid, requestid, requeststatuslogid, phynotes, clientnotes, ip) FROM stdin;
\.
COPY public.requestclosed (requestclosedid, requestid, requeststatuslogid, phynotes, clientnotes, ip) FROM '$$PATH$$/5187.dat';

--
-- Data for Name: requestconcierge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestconcierge (id, requestid, conciergeid, ip) FROM stdin;
\.
COPY public.requestconcierge (id, requestid, conciergeid, ip) FROM '$$PATH$$/5181.dat';

--
-- Data for Name: requestnotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestnotes (requestnotesid, requestid, strmonth, intyear, intdate, physiciannotes, adminnotes, createdby, createddate, modifiedby, modifieddate, ip, administrativenotes) FROM stdin;
\.
COPY public.requestnotes (requestnotesid, requestid, strmonth, intyear, intdate, physiciannotes, adminnotes, createdby, createddate, modifiedby, modifieddate, ip, administrativenotes) FROM '$$PATH$$/5183.dat';

--
-- Data for Name: requeststatuslog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requeststatuslog (requeststatuslogid, requestid, status, physicianid, adminid, transtophysicianid, notes, createddate, ip, transtoadmin) FROM stdin;
\.
COPY public.requeststatuslog (requeststatuslogid, requestid, status, physicianid, adminid, transtophysicianid, notes, createddate, ip, transtoadmin) FROM '$$PATH$$/5185.dat';

--
-- Data for Name: requesttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requesttype (requesttypeid, name) FROM stdin;
\.
COPY public.requesttype (requesttypeid, name) FROM '$$PATH$$/5191.dat';

--
-- Data for Name: requestwisefile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requestwisefile (requestwisefileid, requestid, filename, createddate, physicianid, adminid, doctype, isfrontside, iscompensation, ip, isfinalize, isdeleted, ispatientrecords) FROM stdin;
\.
COPY public.requestwisefile (requestwisefileid, requestid, filename, createddate, physicianid, adminid, doctype, isfrontside, iscompensation, ip, isfinalize, isdeleted, ispatientrecords) FROM '$$PATH$$/5189.dat';

--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (roleid, name, accounttype, createdby, createddate, modifiedby, modifieddate, isdeleted, ip) FROM stdin;
\.
COPY public.role (roleid, name, accounttype, createdby, createddate, modifiedby, modifieddate, isdeleted, ip) FROM '$$PATH$$/5193.dat';

--
-- Data for Name: rolemenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolemenu (rolemenuid, roleid, menuid) FROM stdin;
\.
COPY public.rolemenu (rolemenuid, roleid, menuid) FROM '$$PATH$$/5195.dat';

--
-- Data for Name: shift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shift (shiftid, physicianid, startdate, isrepeat, weekdays, repeatupto, createdby, createddate, ip) FROM stdin;
\.
COPY public.shift (shiftid, physicianid, startdate, isrepeat, weekdays, repeatupto, createdby, createddate, ip) FROM '$$PATH$$/5197.dat';

--
-- Data for Name: shiftdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shiftdetail (shiftdetailid, shiftid, shiftdate, regionid, starttime, endtime, status, isdeleted, modifiedby, modifieddate, lastrunningdate, eventid, issync) FROM stdin;
\.
COPY public.shiftdetail (shiftdetailid, shiftid, shiftdate, regionid, starttime, endtime, status, isdeleted, modifiedby, modifieddate, lastrunningdate, eventid, issync) FROM '$$PATH$$/5199.dat';

--
-- Data for Name: shiftdetailregion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shiftdetailregion (shiftdetailregionid, shiftdetailid, regionid, isdeleted) FROM stdin;
\.
COPY public.shiftdetailregion (shiftdetailregionid, shiftdetailid, regionid, isdeleted) FROM '$$PATH$$/5201.dat';

--
-- Data for Name: smslog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.smslog (smslogid, smstemplate, mobilenumber, confirmationnumber, roleid, adminid, requestid, physicianid, createdate, sentdate, issmssent, senttries, action) FROM stdin;
\.
COPY public.smslog (smslogid, smstemplate, mobilenumber, confirmationnumber, roleid, adminid, requestid, physicianid, createdate, sentdate, issmssent, senttries, action) FROM '$$PATH$$/5203.dat';

--
-- Name: User_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_userid_seq"', 10, true);


--
-- Name: admin_adminid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_adminid_seq', 5, true);


--
-- Name: adminregion_adminregionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adminregion_adminregionid_seq', 5, true);


--
-- Name: blockrequests_blockrequestid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blockrequests_blockrequestid_seq', 1, false);


--
-- Name: business_businessid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_businessid_seq', 3, true);


--
-- Name: casetag_casetagid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.casetag_casetagid_seq', 1, false);


--
-- Name: concierge_conciergeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concierge_conciergeid_seq', 1, true);


--
-- Name: healthprofessionals_vendorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.healthprofessionals_vendorid_seq', 1, false);


--
-- Name: healthprofessionaltype_healthprofessionalid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.healthprofessionaltype_healthprofessionalid_seq', 1, false);


--
-- Name: menu_menuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_menuid_seq', 1, false);


--
-- Name: orderdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderdetails_id_seq', 1, false);


--
-- Name: physician_physicianid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physician_physicianid_seq', 1, false);


--
-- Name: physicianlocation_locationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physicianlocation_locationid_seq', 1, false);


--
-- Name: physiciannotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physiciannotification_id_seq', 1, false);


--
-- Name: physicianregion_physicianregionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physicianregion_physicianregionid_seq', 1, false);


--
-- Name: region_regionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_regionid_seq', 5, true);


--
-- Name: request_requestid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_requestid_seq', 22, true);


--
-- Name: requestbusiness_requestbusinessid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestbusiness_requestbusinessid_seq', 3, true);


--
-- Name: requestclient_requestclientid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestclient_requestclientid_seq', 18, true);


--
-- Name: requestclosed_requestclosedid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestclosed_requestclosedid_seq', 1, false);


--
-- Name: requestconcierge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestconcierge_id_seq', 1, true);


--
-- Name: requestnotes_requestnotesid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestnotes_requestnotesid_seq', 1, false);


--
-- Name: requeststatuslog_requeststatuslogid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requeststatuslog_requeststatuslogid_seq', 1, false);


--
-- Name: requesttype_requesttypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requesttype_requesttypeid_seq', 1, false);


--
-- Name: requestwisefile_requestwisefileid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requestwisefile_requestwisefileid_seq', 1, true);


--
-- Name: role_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_roleid_seq', 1, false);


--
-- Name: rolemenu_rolemenuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rolemenu_rolemenuid_seq', 1, false);


--
-- Name: shift_shiftid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shift_shiftid_seq', 1, false);


--
-- Name: shiftdetail_shiftdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shiftdetail_shiftdetailid_seq', 1, false);


--
-- Name: shiftdetailregion_shiftdetailregionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shiftdetailregion_shiftdetailregionid_seq', 1, false);


--
-- Name: smslog_smslogid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.smslog_smslogid_seq', 1, false);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (userid);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);


--
-- Name: adminregion adminregion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_pkey PRIMARY KEY (adminregionid);


--
-- Name: aspnetroles aspnetroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspnetroles
    ADD CONSTRAINT aspnetroles_pkey PRIMARY KEY (id);


--
-- Name: aspnetuserroles aspnetuserroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_pkey PRIMARY KEY (userid, roleid);


--
-- Name: aspnetusers aspnetusers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspnetusers
    ADD CONSTRAINT aspnetusers_pkey PRIMARY KEY (id);


--
-- Name: blockrequests blockrequests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockrequests
    ADD CONSTRAINT blockrequests_pkey PRIMARY KEY (blockrequestid);


--
-- Name: business business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (businessid);


--
-- Name: casetag casetag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casetag
    ADD CONSTRAINT casetag_pkey PRIMARY KEY (casetagid);


--
-- Name: concierge concierge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_pkey PRIMARY KEY (conciergeid);


--
-- Name: emaillog emaillog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emaillog
    ADD CONSTRAINT emaillog_pkey PRIMARY KEY (emaillogid);


--
-- Name: healthprofessionals healthprofessionals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_pkey PRIMARY KEY (vendorid);


--
-- Name: healthprofessionaltype healthprofessionaltype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthprofessionaltype
    ADD CONSTRAINT healthprofessionaltype_pkey PRIMARY KEY (healthprofessionalid);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menuid);


--
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);


--
-- Name: physician physician_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physicianid);


--
-- Name: physicianlocation physicianlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_pkey PRIMARY KEY (locationid);


--
-- Name: physiciannotification physiciannotification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_pkey PRIMARY KEY (id);


--
-- Name: physicianregion physicianregion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_pkey PRIMARY KEY (physicianregionid);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);


--
-- Name: request request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (requestid);


--
-- Name: requestbusiness requestbusiness_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_pkey PRIMARY KEY (requestbusinessid);


--
-- Name: requestclient requestclient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_pkey PRIMARY KEY (requestclientid);


--
-- Name: requestclosed requestclosed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_pkey PRIMARY KEY (requestclosedid);


--
-- Name: requestconcierge requestconcierge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_pkey PRIMARY KEY (id);


--
-- Name: requestnotes requestnotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_pkey PRIMARY KEY (requestnotesid);


--
-- Name: requeststatuslog requeststatuslog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_pkey PRIMARY KEY (requeststatuslogid);


--
-- Name: requesttype requesttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requesttype
    ADD CONSTRAINT requesttype_pkey PRIMARY KEY (requesttypeid);


--
-- Name: requestwisefile requestwisefile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_pkey PRIMARY KEY (requestwisefileid);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);


--
-- Name: rolemenu rolemenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_pkey PRIMARY KEY (rolemenuid);


--
-- Name: shift shift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (shiftid);


--
-- Name: shiftdetail shiftdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_pkey PRIMARY KEY (shiftdetailid);


--
-- Name: shiftdetailregion shiftdetailregion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_pkey PRIMARY KEY (shiftdetailregionid);


--
-- Name: smslog smslog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.smslog
    ADD CONSTRAINT smslog_pkey PRIMARY KEY (smslogid);


--
-- Name: User User_aspnetuserid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_aspnetuserid_fkey" FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);


--
-- Name: adminregion adminregion_adminid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);


--
-- Name: adminregion adminregion_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);


--
-- Name: aspnetuserroles aspnetuserroles_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.aspnetroles(id);


--
-- Name: aspnetuserroles aspnetuserroles_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_userid_fkey FOREIGN KEY (userid) REFERENCES public.aspnetusers(id);


--
-- Name: business business_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);


--
-- Name: business business_modifiedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);


--
-- Name: concierge concierge_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);


--
-- Name: healthprofessionals healthprofessionals_profession_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_profession_fkey FOREIGN KEY (profession) REFERENCES public.healthprofessionaltype(healthprofessionalid);


--
-- Name: physician physician_aspnetuserid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);


--
-- Name: physician physician_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);


--
-- Name: physician physician_modifiedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);


--
-- Name: physician physician_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);


--
-- Name: physicianlocation physicianlocation_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: physiciannotification physiciannotification_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: physicianregion physicianregion_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: physicianregion physicianregion_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);


--
-- Name: request request_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: request request_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_userid_fkey FOREIGN KEY (userid) REFERENCES public."User"(userid);


--
-- Name: requestbusiness requestbusiness_businessid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_businessid_fkey FOREIGN KEY (businessid) REFERENCES public.business(businessid);


--
-- Name: requestbusiness requestbusiness_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: requestclient requestclient_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);


--
-- Name: requestclient requestclient_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: requestclosed requestclosed_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: requestclosed requestclosed_requeststatuslogid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requeststatuslogid_fkey FOREIGN KEY (requeststatuslogid) REFERENCES public.requeststatuslog(requeststatuslogid);


--
-- Name: requestconcierge requestconcierge_conciergeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_conciergeid_fkey FOREIGN KEY (conciergeid) REFERENCES public.concierge(conciergeid);


--
-- Name: requestconcierge requestconcierge_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: requestnotes requestnotes_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: requeststatuslog requeststatuslog_adminid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);


--
-- Name: requeststatuslog requeststatuslog_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: requeststatuslog requeststatuslog_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: requeststatuslog requeststatuslog_transtophysicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_transtophysicianid_fkey FOREIGN KEY (transtophysicianid) REFERENCES public.physician(physicianid);


--
-- Name: requestwisefile requestwisefile_adminid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);


--
-- Name: requestwisefile requestwisefile_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: requestwisefile requestwisefile_requestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);


--
-- Name: rolemenu rolemenu_menuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_menuid_fkey FOREIGN KEY (menuid) REFERENCES public.menu(menuid);


--
-- Name: rolemenu rolemenu_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.role(roleid);


--
-- Name: shift shift_createdby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);


--
-- Name: shift shift_physicianid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);


--
-- Name: shiftdetail shiftdetail_modifiedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);


--
-- Name: shiftdetail shiftdetail_shiftid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_shiftid_fkey FOREIGN KEY (shiftid) REFERENCES public.shift(shiftid);


--
-- Name: shiftdetailregion shiftdetailregion_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);


--
-- Name: shiftdetailregion shiftdetailregion_shiftdetailid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_shiftdetailid_fkey FOREIGN KEY (shiftdetailid) REFERENCES public.shiftdetail(shiftdetailid);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             