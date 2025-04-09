-- Criação do Banco de Dados Projeto Lógico E-commerce 
create database ecommerce;
-- drop database ecommerce;
use ecommerce;

-- Criar Tabela Conta

create table conta(
  idconta int auto_increment key not null,
  CPF char(11) not null,
  constraint unique_cpf_para_cliente unique (CPF)
);
-- Atualiza o auto_incriment=1 para seguir uma lógica de criação automática correta

alter table conta auto_increment=1;

-- Criar Tabela Cliente

create table cliente(
   idcliente int auto_increment primary key not null,
   idconta_cliente int not null,
   nome varchar(20) not null,
   nome_do_meio varchar(20),  
   sobrenome varchar(20),
   contato varchar(20),
   email varchar(40) not null default 'n/a',
   rua varchar(20),
   bairro varchar(20),
   número_complemento varchar(100),
   cidade varchar(20),
   estado varchar(20),
   país varchar(20),
   CEP int,
   data_de_nascimento date,
   constraint fk_cliente_conta foreign key (idconta_cliente) references conta(idconta)
);

-- Criar Tabela Produto

create table produto(
  idproduto int auto_increment primary key not null,
  nome_do_produto varchar(25) not null,
  departamento ENUM('Informática', 'Eletrodomésticos', 'Games', 'Móveis', 'Livros', 'Eletroportáteis', 'Celulares_Smartphones', 'Câmeras', 'bebê', 'Moda') not null,
  sexo ENUM('Masculino', 'Feminino', 'Criança', 'Bebê', 'N/A') default 'N/A',
  valor_do_produto float default 0,
  avaliação float default 0,
  dimensão_do_produto varchar(20)
);
alter table produto auto_increment=1;
-- Criar Tabela Estoque

create table estoque(
   idestoque int auto_increment primary key not null,
   nome_estoque varchar(50),
   rua varchar(20),
   bairro varchar(20),
   complemento varchar(100),
   cidade varchar(20),
   estado varchar(20),
   país varchar(20),
   CEP int
);
alter table estoque auto_increment=1;
-- Criar Tabela Pedido 
-- Com Update cascade (Atualiza todas as tabelas que a FK esteja relacionada)

create table pedido(
   idpedido int auto_increment primary key not null,
   idpedido_cliente int not null,
   status_pedido ENUM('Confirmado', 'Cancelado', 'Processando', 'Enviado', 'Entregue') default 'processando',
   descrição_pedido varchar(255),
   valor_total float default 0,
   frete float default 25,
   constraint fk_pedido_cliente foreign key (idpedido_cliente) references cliente(idcliente)
           on update cascade
);
alter table pedido auto_increment=1;
-- Criar Tabela Pagamento
drop table pagamento;
create table pagamento(
  idpagamento int auto_increment primary key not null,
  nome_titular_cartão varchar(50) not null default 'n/a',
  método_de_pagamento ENUM('Dinheiro', 'Boleto', 'Cartão Débito', 'Cartão Crédito', 'Pix') not null default 'Dinheiro',
  número_cartão varchar(16) not null default 'n/a',
  financeira_cartão varchar(16) not null default 'n/a',
  vencimento_fatura date,
  constraint unique_para_número_cartão unique (número_cartão)
);  
-- Alteração necessária para devida validação de inserção dos dados em unique do número do cartão de crédito / autorizando valores nulos em financeira_cartão e número_cartão/ nome_titular_cartão
alter table pagamento modify financeira_cartão varchar(16) default 'n/a';
ALTER TABLE pagamento modify número_cartão varchar(16) default 'n/a';
alter table pagamento modify nome_titular_cartão varchar(50) default 'n/a';
alter table pagamento auto_increment=1;
-- Criar Tabela Entrega

create table entrega(
   identrega int auto_increment primary key not null,   
   status_entrega enum('Processando Pagamento', 'Processando Envio', 'Enviado', 'Concluído') default 'Processando Pagamento',
   código_rastreio varchar(50) default 'Confirmar Envio',
   Tipo_veículo enum('Carro', 'Caminhão', 'Van', 'Carreta', 'Motocicleta', 'n/a') not null default 'n/a',
   modelo_veículo varchar(15) not null,
   marca_veículo varchar(15) not null,
   placa_veículo varchar(15) not null,
   cor_veículo varchar(15) not null,
   ano_veículo varchar(15) not null,
   Nome_entregador varchar(50) not null,
   contato_entregador varchar(20) not null default 'n/a',
   constraint unique_para_placa_veículo unique (placa_veículo)
);
alter table entrega auto_increment=1;
-- Criar Tabela Fornecedor

create table fornecedor(
   idfornecedor int auto_increment primary key not null,
   CNPJ char(14) not null default 00000000000000,
   razão_social varchar(50) not null,  
   nome_fantasia varchar(50),
   contato varchar(20),
   email varchar(40) not null default 'n/a',
   rua varchar(20),
   bairro varchar(20),
   complemento varchar(100),
   cidade varchar(20),
   estado varchar(20),
   país varchar(20),
   CEP int,
   constraint unique_para_CNPJ_fornecedor unique (CNPJ),
   constraint unique_para_razão_social_fornecedor unique (razão_social)
);
alter table fornecedor auto_increment=1;

-- Criar Tabela Vendedores - Terceiros

create table vendedores_terceiros(
   idvendedores int auto_increment primary key not null,
   CNPJ_ou_MEI varchar(50) not null,
   razão_social varchar(50) not null,  
   nome_fantasia varchar(50),
   contato varchar(20),
   email varchar(40) not null default 'n/a',
   rua varchar(20),
   bairro varchar(20),
   complemento varchar(100),
   cidade varchar(20),
   estado varchar(20),
   país varchar(20),
   CEP int,
   constraint unique_para_numero_CNPJ_MEI unique (CNPJ_ou_MEI),
   constraint unique_para_razão_social_terceiros unique (razão_social)
);

alter table vendedores_terceiros auto_increment=1;
-- show tables;

-- Criar Tabela(relação) produto_terceiros

create table produto_terceiros(
   idPproduto int not null,
   idPvendedores_terceiros int not null,
   produto_quantidade_terceiros int default 1,
   constraint fk_produto_PPT foreign key (idPproduto) references produto(idproduto),
   constraint fk_produto_PVT foreign key (idPvendedores_terceiros) references vendedores_terceiros(idvendedores)
);


-- Criar Tabela (relação) Disponibilidade de Produto_Fornecedor

create table produto_fornecedor(
   idPFproduto int not null,
   idPFfornecedor int not null,
   produto_quantidade_fornecedor int default 1,
   constraint fk_produto_PFP foreign key (idPFproduto) references produto(idproduto),
   constraint fk_produto_PFF foreign key (idPFfornecedor) references fornecedor(idfornecedor)
);

-- Criar Tabela(relação) Produto em Estoque

create table produto_estoque(
   idPEproduto int not null,
   idPEestoque int not null,
   status_estoque ENUM('Disponível', 'Indisponível', 'Sem Estoque') default 'Disponível',
   produto_quantidade_estoque int default 1,
   constraint fk_produto_PEP foreign key (idPEproduto) references produto(idproduto),
   constraint fk_produto_PEE foreign key (idPEestoque) references estoque(idestoque)
);

-- Criar Tabela(relação) Pedido_Produto

create table pedido_produto(
   idPPproduto int not null,
   idPPpedido int not null,
   status_produto ENUM('Disponível', 'Indisponível', 'Sem Estoque') default 'Disponível',
   produto_quantidade_estoque int default 1,
   constraint fk_pedido_produto foreign key (idPPproduto) references produto(idproduto),
   constraint fk_pedido_pedido foreign key (idPPpedido) references pedido(idpedido)
);

-- Criar Tabela(relação) Relação_Pagamento

create table relação_pagamento(
   idRPpagamento int not null,
   idRPpedido int not null,
   status_pagamento ENUM('Pendente', 'Em Processamento', 'Concluído') default 'Pendente',
   pagamento_quantidade int default 1,
   constraint fk_pagamento_pagamento foreign key (idRPpagamento) references pagamento(idpagamento),
   constraint fk_pagamento_pedido foreign key (idRPpedido) references pedido(idpedido)
);

-- Criar Tabela(relação) Entrega_Liberação

create table entrega_liberação(
   idELentrega int not null,
   idELpedido int not null,
   idELpagamento int not null,
   status_liberação ENUM('Pendente', 'Em Processamento', 'Concluído') default 'Pendente',
   entrega_quantidade int default 1,
   constraint fk_entrega_entrega foreign key (idELentrega) references entrega(identrega),
   constraint fk_entrega_pedido foreign key (idELpedido) references pedido(idpedido),
   constraint fk_entrega_pagamento foreign key (idELpagamento) references pagamento(idpagamento)
);

-- alteração das descrições da coluna status_liberação da tabela entrega_liberação por erro no tipo da descrição

alter table entrega_liberação modify status_liberação ENUM('Liberado', 'Em Análise', 'Não Liberado') default 'Liberado';
-- desc entrega_liberação;