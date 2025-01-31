PGDMP     7                	    z            fontur    14.5    14.5 )    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    16402    fontur    DATABASE     e   CREATE DATABASE fontur WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE fontur;
                postgres    false            i           1247    16574    hotel_estrellas    TYPE     �   CREATE TYPE public.hotel_estrellas AS ENUM (
    '1 estrella',
    '2 estrellas',
    '3 estrellas',
    '4 estrellas',
    '5 estrellas'
);
 "   DROP TYPE public.hotel_estrellas;
       public          postgres    false            f           1247    16562    res_categoria    TYPE     �   CREATE TYPE public.res_categoria AS ENUM (
    'Restaurante de lujo',
    'Restaurante de primera clase',
    'Restaurante de segunda clase',
    'Restaurante de tercera clase',
    'Restaurante de cuarta clase'
);
     DROP TYPE public.res_categoria;
       public          postgres    false            ]           1247    16510    tipo_hab    TYPE     O  CREATE TYPE public.tipo_hab AS ENUM (
    'Sala de estudio',
    'Duplex',
    'Habitacion de lujo',
    'Habitacion contigua',
    'Habitacion estilo aparatamento',
    'Suite',
    'Suite Junior',
    'Suite presidencial',
    'Suite Atico',
    'Suite nupcial',
    'Suite Luna de miel',
    'Cabaña',
    'Villa',
    'Normal'
);
    DROP TYPE public.tipo_hab;
       public          postgres    false            Z           1247    16484 
   tipo_hotel    TYPE     Y  CREATE TYPE public.tipo_hotel AS ENUM (
    'Hoteles spa',
    'Hoteles boutique',
    'Hoteles de lujo',
    'Hoteles familiares',
    'Hoteles tematicas',
    'Hoteles urbanos',
    'Hoteles de aventura',
    'Hoteles gastronomicos',
    'Hoteles para adultos',
    'Hoteles resort',
    'Hoteles todo incluido',
    'Hoteles para eventos'
);
    DROP TYPE public.tipo_hotel;
       public          postgres    false            E           1247    16420    tipo_id    TYPE     n   CREATE TYPE public.tipo_id AS ENUM (
    'cedula de ciudadania',
    'cedula_extranjeria',
    'pasaporte'
);
    DROP TYPE public.tipo_id;
       public          postgres    false            B           1247    16412    tipo_identificacion    TYPE     z   CREATE TYPE public.tipo_identificacion AS ENUM (
    'cedula de ciudadania',
    'cedula_extranjeria',
    'pasaporte'
);
 &   DROP TYPE public.tipo_identificacion;
       public          postgres    false            c           1247    16547    tipo_res    TYPE     �   CREATE TYPE public.tipo_res AS ENUM (
    'Gourmet',
    'De especialidad',
    'Familiar',
    'Buffet',
    'Comida rapida',
    'Tematica',
    'Para llevar'
);
    DROP TYPE public.tipo_res;
       public          postgres    false            N           1247    16455    tipo_ser    TYPE     q   CREATE TYPE public.tipo_ser AS ENUM (
    'hoteles',
    'alimentacion',
    'transporte',
    'experiencias'
);
    DROP TYPE public.tipo_ser;
       public          postgres    false            l           1247    16594    tipo_tranporte    TYPE     �   CREATE TYPE public.tipo_tranporte AS ENUM (
    'Autobus',
    'Moto',
    'Carro particular',
    'Taxi publico',
    'Uber',
    'Avioneta',
    'Helicoptero'
);
 !   DROP TYPE public.tipo_tranporte;
       public          postgres    false            �            1259    16585    alimentacion    TABLE     �  CREATE TABLE public.alimentacion (
    id_alimentacion integer DEFAULT 0 NOT NULL,
    nombre_restaurante character varying(255) NOT NULL,
    tipo_restaurante public.tipo_res NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(14) NOT NULL,
    menu_virtual character varying(255),
    ubicacion character varying NOT NULL,
    categoria public.res_categoria NOT NULL
);
     DROP TABLE public.alimentacion;
       public         heap    postgres    false    867    870            �            1259    16478    estadisticas    TABLE     >  CREATE TABLE public.estadisticas (
    id_admin integer NOT NULL,
    visitas_web integer NOT NULL,
    porcentaje_usuarios real NOT NULL,
    ventas integer NOT NULL,
    comision real NOT NULL,
    puntuaciones integer NOT NULL,
    qr character varying NOT NULL,
    registros_pasados character varying NOT NULL
);
     DROP TABLE public.estadisticas;
       public         heap    postgres    false            �            1259    16617    experiencias    TABLE     S  CREATE TABLE public.experiencias (
    id_experiencia integer DEFAULT 0 NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying NOT NULL,
    ubicacion character varying NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(14) NOT NULL,
    costos double precision NOT NULL
);
     DROP TABLE public.experiencias;
       public         heap    postgres    false            �            1259    16539    hoteles    TABLE     �  CREATE TABLE public.hoteles (
    id_hotel integer NOT NULL,
    nom_hotel character varying(60) NOT NULL,
    ubicacion character varying NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(14) NOT NULL,
    tipo public.tipo_hotel NOT NULL,
    costos double precision NOT NULL,
    habitaciones integer NOT NULL,
    tipo_habitaciones public.tipo_hab NOT NULL,
    estrellas public.hotel_estrellas NOT NULL
);
    DROP TABLE public.hoteles;
       public         heap    postgres    false    858    873    861            �            1259    16467    servicio    TABLE     j  CREATE TABLE public.servicio (
    id_servicio integer DEFAULT 0 NOT NULL,
    paquetes character varying(255) DEFAULT ''::character varying NOT NULL,
    id_servi_hoteles integer DEFAULT 0 NOT NULL,
    id_servi_alimentacion integer DEFAULT 0 NOT NULL,
    id_servi_transporte integer DEFAULT 0 NOT NULL,
    id_servi_experiencias integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.servicio;
       public         heap    postgres    false            �            1259    16609 
   transporte    TABLE     X  CREATE TABLE public.transporte (
    id_transporte integer DEFAULT 0 NOT NULL,
    nom_empresa character varying(255) NOT NULL,
    puestos integer NOT NULL,
    costos double precision NOT NULL,
    aseguradora character varying(255) NOT NULL,
    telefono character varying(14) NOT NULL,
    tipo_transporte public.tipo_tranporte NOT NULL
);
    DROP TABLE public.transporte;
       public         heap    postgres    false    876            �            1259    16403 
   user_admin    TABLE     �   CREATE TABLE public.user_admin (
    id_admin integer DEFAULT 0 NOT NULL,
    "user" character varying(20)[] NOT NULL,
    admin_password character varying(20)[] NOT NULL
);
    DROP TABLE public.user_admin;
       public         heap    postgres    false            �            1259    16444 
   user_agent    TABLE     s  CREATE TABLE public.user_agent (
    id_agent integer DEFAULT 0 NOT NULL,
    nom_comercial character varying(255) DEFAULT ' '::character varying NOT NULL,
    nit integer DEFAULT 0 NOT NULL,
    servicios integer NOT NULL,
    telefono character varying(14) NOT NULL,
    direccion_oficina character varying(255) NOT NULL,
    password character varying(60) NOT NULL
);
    DROP TABLE public.user_agent;
       public         heap    postgres    false            �            1259    16427    user_viajero    TABLE     F  CREATE TABLE public.user_viajero (
    id_viajero integer DEFAULT 0 NOT NULL,
    tipo_identificacion public.tipo_identificacion NOT NULL,
    num_identificacion integer DEFAULT 0 NOT NULL,
    nombres character varying(60) DEFAULT ''::character varying NOT NULL,
    apellidos character varying(60) DEFAULT ''::character varying NOT NULL,
    correo character varying(255) DEFAULT ''::character varying NOT NULL,
    fecha_nac date NOT NULL,
    ciudad_residencia character varying(60) DEFAULT ''::character varying NOT NULL,
    password_viajero character varying(60) NOT NULL
);
     DROP TABLE public.user_viajero;
       public         heap    postgres    false    834            �            1259    16475    viajero_x_servicio    TABLE     �  CREATE TABLE public.viajero_x_servicio (
    usuario character varying(60) NOT NULL,
    fecha_pedido date NOT NULL,
    costo double precision DEFAULT 0 NOT NULL,
    puntuacion integer DEFAULT 0 NOT NULL,
    servicio_hotelero integer DEFAULT 0 NOT NULL,
    servico_transporte integer DEFAULT 0 NOT NULL,
    servicio_alimentacion integer DEFAULT 0 NOT NULL,
    servicio_experiencias integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public.viajero_x_servicio;
       public         heap    postgres    false            U          0    16585    alimentacion 
   TABLE DATA           �   COPY public.alimentacion (id_alimentacion, nombre_restaurante, tipo_restaurante, direccion, telefono, menu_virtual, ubicacion, categoria) FROM stdin;
    public          postgres    false    216   :       S          0    16478    estadisticas 
   TABLE DATA           �   COPY public.estadisticas (id_admin, visitas_web, porcentaje_usuarios, ventas, comision, puntuaciones, qr, registros_pasados) FROM stdin;
    public          postgres    false    214   :       W          0    16617    experiencias 
   TABLE DATA           s   COPY public.experiencias (id_experiencia, nombre, descripcion, ubicacion, direccion, telefono, costos) FROM stdin;
    public          postgres    false    218   ;:       T          0    16539    hoteles 
   TABLE DATA           �   COPY public.hoteles (id_hotel, nom_hotel, ubicacion, direccion, telefono, tipo, costos, habitaciones, tipo_habitaciones, estrellas) FROM stdin;
    public          postgres    false    215   X:       Q          0    16467    servicio 
   TABLE DATA           �   COPY public.servicio (id_servicio, paquetes, id_servi_hoteles, id_servi_alimentacion, id_servi_transporte, id_servi_experiencias) FROM stdin;
    public          postgres    false    212   u:       V          0    16609 
   transporte 
   TABLE DATA           y   COPY public.transporte (id_transporte, nom_empresa, puestos, costos, aseguradora, telefono, tipo_transporte) FROM stdin;
    public          postgres    false    217   �:       N          0    16403 
   user_admin 
   TABLE DATA           F   COPY public.user_admin (id_admin, "user", admin_password) FROM stdin;
    public          postgres    false    209   �:       P          0    16444 
   user_agent 
   TABLE DATA           t   COPY public.user_agent (id_agent, nom_comercial, nit, servicios, telefono, direccion_oficina, password) FROM stdin;
    public          postgres    false    211   �:       O          0    16427    user_viajero 
   TABLE DATA           �   COPY public.user_viajero (id_viajero, tipo_identificacion, num_identificacion, nombres, apellidos, correo, fecha_nac, ciudad_residencia, password_viajero) FROM stdin;
    public          postgres    false    210   �:       R          0    16475    viajero_x_servicio 
   TABLE DATA           �   COPY public.viajero_x_servicio (usuario, fecha_pedido, costo, puntuacion, servicio_hotelero, servico_transporte, servicio_alimentacion, servicio_experiencias) FROM stdin;
    public          postgres    false    213   ;       �           2606    16624    experiencias experiencias_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.experiencias
    ADD CONSTRAINT experiencias_pkey PRIMARY KEY (id_experiencia);
 H   ALTER TABLE ONLY public.experiencias DROP CONSTRAINT experiencias_pkey;
       public            postgres    false    218            �           2606    16592    alimentacion habitacion_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.alimentacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id_alimentacion);
 F   ALTER TABLE ONLY public.alimentacion DROP CONSTRAINT habitacion_pkey;
       public            postgres    false    216            �           2606    16545    hoteles hoteles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id_hotel);
 >   ALTER TABLE ONLY public.hoteles DROP CONSTRAINT hoteles_pkey;
       public            postgres    false    215            �           2606    16474    servicio servicio_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id_servicio);
 @   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pkey;
       public            postgres    false    212            �           2606    16616    transporte transporte_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_pkey PRIMARY KEY (id_transporte);
 D   ALTER TABLE ONLY public.transporte DROP CONSTRAINT transporte_pkey;
       public            postgres    false    217            �           2606    16410    user_admin user_admin_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.user_admin
    ADD CONSTRAINT user_admin_pkey PRIMARY KEY (id_admin);
 D   ALTER TABLE ONLY public.user_admin DROP CONSTRAINT user_admin_pkey;
       public            postgres    false    209            �           2606    16453    user_agent user_agent_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.user_agent
    ADD CONSTRAINT user_agent_pkey PRIMARY KEY (id_agent);
 D   ALTER TABLE ONLY public.user_agent DROP CONSTRAINT user_agent_pkey;
       public            postgres    false    211            �           2606    16439    user_viajero user_viajero_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_viajero
    ADD CONSTRAINT user_viajero_pkey PRIMARY KEY (id_viajero);
 H   ALTER TABLE ONLY public.user_viajero DROP CONSTRAINT user_viajero_pkey;
       public            postgres    false    210            U      x������ � �      S      x������ � �      W      x������ � �      T      x������ � �      Q      x������ � �      V      x������ � �      N      x������ � �      P      x������ � �      O      x������ � �      R      x������ � �     