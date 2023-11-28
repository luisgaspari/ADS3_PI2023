﻿﻿/* 
* SEGUNDA ENTREGA PI DA DISCIPLINA DE BANCO DE DADOS.
*   ALESSANDRA THAIS FREITAS
*   LUIS GASPARI
*   LUCAS DE JESUS 
*/

CREATE DATABASE Brindes
USE Brindes

drop table LinhasCompras
drop table LinhasVendas
drop table Compras
drop table Vendas
drop table produtos
drop table clientes
drop table fornecedores

-- CRIAR TABELA FORNECEDOR
CREATE TABLE Fornecedores (
cod_fornecedor int Primary Key,
nome varchar(50) not null,
cnpj char(20) not null,
telefone char(20) not null,
email varchar(50) not null,
endereco varchar(100) not null,
bairro varchar(20) not null,
cidade varchar(20) not null,
cep char(10) not null,
uf char(5) not null
)

-- CRIAR TABELA CLIENTES
CREATE TABLE Clientes (
cod_cliente int Primary Key,
nome varchar(50) not null,
cpf char(15) not null,
telefone char(20) not null,
email varchar(50) not null,
endereco varchar(100) not null,
bairro varchar(20) not null,
cidade varchar(20) not null,
cep char(10) not null,
uf char(5) not null
)

--CRIAR TABELA DO PRODUTO
CREATE TABLE Produtos (
cod_produto int primary Key,
descricao varchar(50) not null,
ficha_tecnica varchar(100) not null,
unidade_medida varchar(10) not null,
tipo_produto varchar(20) not null,
valor_compra money not null,
valor_venda money not null,
qtde_estoque decimal not null
)

-- CRIAR TABELA PEDIDO DE COMPRA
CREATE TABLE Compras (
cod_pedido int primary key,
data_pedido date not null,
data_entrega date not null,
forma_pagamento varchar(20) not null,
valor_total money not null,
cod_fornecedor int not null references Fornecedores
)

-- CRIAR TABELA DE LINHAS DO PEDIDO COMPRA
CREATE TABLE LinhasCompras (
linha_pedido int  not null,
quantidade decimal not null,
valor_total_produto money not null,
cod_pedido int not null references Compras,
cod_produto int not null references Produtos
)

-- CRIAR TABELA PEDIDO VENDA
CREATE TABLE Vendas (
cod_pedido int primary Key,
data_pedido date not null,
data_entrega date not null,
forma_pagamento varchar(20) not null,
valor_total money not null,
cod_cliente int not null references Clientes
)

-- CRIAR TABELA DE LINHAS DO PEDIDO VENDA
CREATE TABLE LinhasVendas (
linha_pedido int not null,
quantidade decimal not null,
valor_total_produto money not null,
descricao_adicional varchar(100),
cod_pedido int not null references Vendas,
cod_produto int not null references Produtos
)

-- ADICIONA DADOS NA TABELA FORNECEDOR
INSERT INTO Fornecedores (cod_fornecedor, nome, cnpj, telefone, email, endereco, bairro, cidade, cep, uf) 
VALUES
	(1, 'Produtos Importados', '12.345.678/0001-90', '(11)12345-6789', 'prodimportados@gmail.com', 'Rua Brasil, 3555', 'Centro', 'Indaiatuba', '03124-579', 'SP'),
	(2, 'Canecas personalizadas', '98.765.432/0001-21', '(21)98765-4322', 'canecaspersonal@gmail.com', 'Rua Chile,3533', 'Cidade Nova', 'Indaiatuba', '13124-579', 'SP'),
	(3, 'Brindes para você', '34.567.890/0001-45', '(31)34567-8900', 'brindesparavoce@gmail.com', 'Rua Brasil, 3512', 'Morada do Sol', 'Indaiatuba', '13124-579', 'SP'),
	(4, 'Camisetas e cia', '67.890.123/0001-56', '(67)89012-3455', 'camisetasecia@gmail.com', 'Rua Alemanha, 3599', 'Jd. Regina', 'Indaiatuba', '13124-579', 'SP'),
	(5, 'Lembranças personalizadas', '23.456.789/0001-34', '(23)45678-9011', 'lembrancaspersonal@gmail.com', 'Rua Argentina, 4535', 'Ch. Areal', 'Indaiatuba', '13124-579', 'SP'),
	(6, 'Meu brinde', '45.678.901/0001-12', '(45)67890-1232', 'meubrinde@gmail.com', 'Rua Portugual, 7835', 'Vl. Suiça', 'Indaiatuba', '13124-579', 'SP'),
	(7, 'Preferido presente', '89.012.345/0001-67', '(89)01234-5677', 'preferidopresente@gmail.com', 'Rua Canadá, 3235', 'Pau Preto', 'Indaiatuba', '13124-579', 'SP'),
	(8, 'Querida lembrança', '56.789.012/0001-23', '(56)78901-1234', 'queridalembranca@gmail.com', 'Rua Índia, 9835', 'Esplanada', 'Indaiatuba', '13124-579', 'SP'),
	(9, 'Lembrança personalizada', '78.901.234/0001-78', '(78)90123-2456', 'lembrancapersonal@gmail.com', 'Rua Itália, 2335', 'Centro', 'Indaiatuba', '13124-579', 'SP'),
	(10,'Canecas e brindes', '90.123.456.0001.89', '(90)1234-5678', 'canecasebrindes@gmail.com', 'Rua China, 3445', 'Cidade Nova', 'Indaiatuba', '13124579', 'SP');

select * from Fornecedores

-- ADICIONA DADOS NA TABELA CLIENTE
INSERT INTO Clientes (cod_cliente, nome, cpf, telefone, email, endereco, bairro, cidade, cep, uf) 
VALUES
	(1, 'Marcelo Cruz','222.333.444-55','(19)99688-3333','marcelo@gmail.com','Rua Brasil, 35','Centro','Campinas','13124-579','SP'),
	(2, 'Bianca Melo','111.333.444-55','(19)99688-3333','bianca@gmail.com','Rua Chile, 35','Cidade Nova','Indaiatuba','13124-579','SP'),
	(3, 'Mariana Silva','333.333.444-55','(19)99688-3333','mariana@gmail.com','Rua Brasil, 35','Morada do Sol','Indaiatuba','13124-579','SP'),
	(4, 'Brenda Pereira','444.333.444-55','(19)99688-3333','brenda@gmail.com','Rua Alemanha, 35','Jd. Regina','Indaiatuba','13124-579','SP'),
	(5, 'Hanrique Andrade','555.333.444-55','(19)99688-3333','henrique@gmail.com','Rua Argentina, 35','Vl. Suiça','Indaiatuba','13124-579','SP'),
	(6, 'Enzo Marques','666.333.444-55','(19)99688-3333','enzo@gmail.com','Rua Portugual, 35','Taquaral','Campinas','13124-579','SP'),
	(7, 'Martina Santos','777.333.444-55','(19)99688-3333','martina@gmail.com','Rua Canadá, 35','Centro','Salto','13124-579','SP'),
	(8, 'Juliana Gomide','888.333.444-55','(19)99688-3333','juliana@gmail.com','Rua Índia, 35','Esplanada','Indaiatuba','13124-579','SP'),
	(9, 'Guilherme Silva','999.333.444-55', '(19)99688-3333','guilherme@gmail.com','Rua Itália, 35','Centro','Itu','13124-579','SP'),
	(10,'Rodrigo Marques','000.333.444-55','(19)99688-3333','rodrigo@gmail.com','Rua China, 35','Centro','Sorocaba','13124-579','SP');

select * from Clientes

-- ADICIONA DADOS NA TABELA PRODUTO
INSERT INTO Produtos (cod_produto, descricao, ficha_tecnica, unidade_medida, tipo_produto, valor_compra, valor_venda, qtde_estoque)
VALUES
    (1, 'Caneca Personalizada', 'Material: Cerâmica; Capacidade: 350ml', 'PC', 'Canecas', 5.00, 10.00, 100),
    (2, 'Camiseta Personalizada', 'Material: Algodão; Tamanho: M', 'PC', 'Camisetas', 8.50, 18.00, 50),
    (3, 'Chaveiro Personalizado', 'Material: Metal; Tamanho: 5cm', 'PC', 'Brindes', 2.25, 5.00, 200),
    (4, 'Pen Drive Personalizado', 'Capacidade: 16GB; USB 3.0', 'PC', 'Eletrônicos', 6.75, 15.00, 75),
    (5, 'Bolsa Térmica Personaliz', 'Material: Poliéster; Capacidade: 6 latas', 'PC', 'Bolsas', 12.00, 25.00, 30),
    (6, 'Boné Personalizado', 'Material: Algodão; Tamanho: Ajustável', 'PC', 'Bonés', 4.75, 12.00, 80),
    (7, 'Agenda Personalizada', 'Tamanho: A5; Páginas: 200', 'PC', 'Papelaria', 7.50, 16.00, 60),
    (8, 'Mochila Personalizada', 'Material: Nylon; Tamanho: 40cm', 'PC', 'Bolsas', 15.00, 30.00, 40),
    (9, 'Caneta Personalizada', 'Material: Plástico; Tinta: Azul', 'PC', 'Canecas', 1.25, 3.00, 150),
    (10,'Mouse Pad Personalizado', 'Material: Borracha; Tamanho: 20cm x 20cm', 'PC', 'Eletrônicos', 2.50, 6.00, 100);

select * from Produtos

-- ADICIONA DADOS NA TABELA PEDIDO DE COMPRA
INSERT INTO Compras (cod_pedido, data_pedido, data_entrega, forma_pagamento, valor_total, cod_fornecedor)
VALUES
	(1, '01/06/11','01/11/11','Dinheiro', 31.50, 03),
	(2, '01/06/11','01/11/11','Crédito', 52.90, 05),
	(3, '01/06/11','01/10/11','Dinheiro', 45.90, 01),
	(4, '01/06/11','01/11/11','Crédito', 52.90, 05),
	(5, '01/03/11','01/09/11','Dinheiro', 55.90, 03),
	(6, '01/02/11','01/03/11','Crédito', 43.60, 01),
	(7, '01/08/11','01/10/11','Dinheiro', 55.90, 08),
	(8, '01/07/11','01/11/11','Crédito', 23.90, 04),
	(9, '01/03/11','01/07/11','Dinheiro', 65.90, 02),
	(10,'01/06/11','01/10/11','Crédito', 33.90, 07);

select * from Compras

-- ADICIONA DADOS NA TABELA LINHAS DO PEDIDO DE COMPRA
INSERT INTO LinhasCompras (linha_pedido, quantidade, valor_total_produto, cod_pedido, cod_produto)
VALUES
	(1, 10, 351, 01, 01),
	(1, 10, 529, 02, 02),
	(1, 10, 459, 03, 03),
	(1, 10, 529, 04, 04),
	(1, 10, 559, 05, 05),
	(1, 10, 436, 06, 06),
	(1, 10, 559, 07, 07),
	(1, 10, 239, 08, 08),
	(1, 10, 659, 09, 09),
	(1, 10, 339, 10, 10);

select * from LinhasCompras

-- ADICIONA DADOS NA TABELA PEDIDO DE VENDA
INSERT INTO Vendas (cod_pedido, data_pedido, data_entrega, forma_pagamento, valor_total, cod_cliente)
VALUES
	(1, '01/06/11','01/11/11','Dinheiro', 31.50, 03),
	(2, '01/06/11','01/11/11','Crédito', 52.90, 05),
	(3, '01/06/11','01/10/11','Dinheiro', 45.90, 01),
	(4, '01/06/11','01/11/11','Crédito', 52.90, 05),
	(5, '01/03/11','01/09/11','Dinheiro', 55.90, 03),
	(6, '01/02/11','01/03/11','Crédito', 43.60, 01),
	(7, '01/08/11','01/10/11','Dinheiro', 55.90, 08),
	(8, '01/07/11','01/11/11','Crédito', 23.90, 04),
	(9, '01/03/11','01/07/11','Dinheiro', 65.90, 02),
	(10,'01/06/11','01/10/11','Crédito', 33.90, 07);

select * from Vendas

-- ADICIONA DADOS NA TABELA LINHAS DO PEDIDO DE VENDA
INSERT INTO LinhasVendas (linha_pedido, quantidade, valor_total_produto, descricao_adicional, cod_pedido, cod_produto)
VALUES
	(1, 10, 351, 'Imprimir Foto', 01, 01),
	(1, 10, 529, 'Imprimir Mensagem', 02, 02),
	(1, 10, 459, 'Dia dos Pais', 03, 03),
	(1, 10, 529, 'Dia dos Namorados', 04, 04),
	(1, 10, 559, 'Feliz 2023', 05, 05),
	(1, 10, 436, 'Texto personalizado', 06, 06),
	(1, 10, 559, 'Dia das Mães', 07, 07),
	(1, 10, 239, 'Mensagem de Natal', 08, 08),
	(1, 10, 659, 'Sua Profissão', 09, 09),
	(1, 10, 339, 'Festa de 15 anos', 10, 10);

select * from LinhasVendas
