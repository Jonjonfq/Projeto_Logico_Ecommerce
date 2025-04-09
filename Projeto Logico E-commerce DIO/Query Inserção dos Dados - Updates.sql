-- INSERÇÃO DE DADOS DO PROJETO ECOMMERCE

-- show databases;
use ecommerce; 
-- show tables; 

-- desc conta;
-- select * from conta;
-- delete from conta where idconta=1; ( teste realizado para entender o auto_incremente e seu funcionamento)

-- Inserção dados da tabela conta: (idconta , CPF)
insert into conta(CPF)
           values(30045768912),
           (11236048120),
           (08954848810),
           (74850118913),
           (81122320013),
           (14237752011),
           (13842033378),
           (13358023912),
           (11182036910),
           (14237720120);
           
-- select * from conta order by idconta;

-- select * from cliente;
-- Inserção dados da tabela cliente:(idconta_cliente, nome , nome_do_meio, sobrenome, contato, email, rua, bairro, complemento, cidade, estado, país, CEP, data_de_nascimento)
insert into cliente(idconta_cliente, nome, nome_do_meio, sobrenome, contato, email, rua, bairro, complemento, cidade, estado, país, CEP, data_de_nascimento)
	    -- values(1,'Jóse', 'Silva', 'de Melo', 21999354022, 'josemelocaramelo@yahoo.com.br', 'sem nome', 'não sei', 'n/a', 'Nova Iguaçu', 'Rio de Janeiro', 'Brasil', 25133829, 19781023);
           values(2,'Fábio', 'Silva', 'de Melo', 21999555822, 'melofabio@gmail.com', 'Cabral Junior', 'não sei', '10', 'Nova Iguaçu', 'Rio de Janeiro', 'Brasil', 25133829, 19810818),
           (3,'Karina', 'Lopes', 'Tropvão', 21989354022, 'karinatrovao@yahoo.com.br', 'Senador Gomes ', 'Ladeira', '22' 'Casa 2', 'Muriqui', 'Rio de Janeiro', 'Brasil', 24135829, 19880111),
           (4,'Marcos', 'Ferreira', 'Carvalho', 22988714718, 'ferreura02fb@yahoo.com.br', 'Luis Carlos Gomes', 'Boco do Lobo', '18', 'Campos', 'Rio de Janeiro', 'Brasil', 300123522, 19870605),
           (5,'Francisco', 'Küster', 'Hoffmann', 24999573811, 'hoffmanku@hotmail.com', 'Neusa Maria','Quitandinha','123 Apto 1205', 'Nova Iguaçu', 'Rio de Janeiro', 'Brasil', 25650000, 19690223),
           (6,'Nathália', 'Pires', 'Carvalho', 21989237861, 'carvalhonathy@outlook.com', 'Mariz e Barros', 'Icaraí', ' 877 Apto 701', 'Niterói', 'Rio de Janeiro', 'Brasil', 24220120, 19781023),
           (7,'Lara', 'Pérez', 'Martínez', +59521988012374, 'laraperezz@gmail.com', 'Denis Roa', 'San Cristonal', 'PC5R+34W', 'Asunción', 'Asunción', 'Paraguai', 001409, 19930319);
  
  
  -- alter table para atualização de informação do número que não havia na tabela 
alter table cliente rename column complemento to número_complemento;

-- update correção do contato 
UPDATE cliente 
SET contato = '+59521988012374'
WHERE idcliente = 7;  

-- Update correção da ordem na inclusão do dados do idcliente = 5     
UPDATE cliente 
SET bairro = 'Quitandinha', complemento = '123 Apto 1205' 
WHERE idcliente = 5;  

-- desc produto;
-- Inserção dados da tabela produto:(nome_do_produto, departamento('Informática','Eletrodomésticos','Games','Móveis','Livros','Eletroportáteis','Celulares_Smartphones','Câmeras','bebê','Moda'),
-- sexo('Masculino','Feminino','Criança','Bebê','N/A'), valor_do_produto,avaliação,dimensão_do_produto)

-- alteração de quantidade de caracteres de varchar para nome do produto e dimensão do produto
alter table produto modify nome_do_produto varchar(255) not null;
alter table produto modify dimensão_do_produto varchar(50);

insert into produto(nome_do_produto, departamento, sexo, valor_do_produto, avaliação, dimensão_do_produto)
		     Values('Placa-Mãe ASRock B450M Steel Legend AMD AM4', 'Informática', default, '848.24', default,'Micro ATX: 9,6 pol. X 9,6 pol., 24,4 cm x 24,4 cm'),
				   ('Processador AMD Ryzen 5 5600, 3.5GHz (4.4GHz Max Turbo)', 'Informática', default, '944.43', default,'420 gramas (bruto com embalagem)'),
				   ('Memória RAM Kingston Fury Beast, RGB, 16GB, 3200MHz, DDR4, CL16, Preto', 'Informática', default,'326.08', default,'Altura 1,62 (41,2 mm), com dissipador de calor'),
				   ('SSD Kingston Fury Renegade, 1TB, M.2 2280, PCIe 4.0 x4, NVMe, Leitura: 7300 MB/s, Gravação: 6000 MB/s, Compatível com PS5 - SFYRS/1000G', 'Informática', default,'741.16', default,'80mm x 22mm x 2,21mm'),
				   ('Placa de Vídeo RTX 4060 TI Rog-Strix O8G Gaming NVIDIA GeForce, 8GB GDDR6, ARGB', 'Informática', default,'3764.69', default,'311,4 x 133,5 x 61,9mm'),
				   ('Mouse Gamer Corsair M65 Ultra, RGB LED, 26000 DPI, 8 Botões, Optical, Preto - CH-9309411-NA2', 'Informática', default,'433.32', default,'117,0 x77,0 x 39,0mm'),
				   ('Teclado Mecânico Gamer HyperX Alloy Origins Core, RGB, Switch HyperX Red, ABNT2', 'Informática', default,'776.46', default,'360 mm x 132,5 mm x 34,5mm'),
				   ('Headset Gamer Sem Fio Logitech G733 7.1 Dolby Surround RGB LIGHTSYNC, Blue VOICE para PC e PlayStation, Preto','informática', default,'922.82', default,'N/A'),
                   ('Gabinete Gamer Neologic Aquario Full Glass, Mid-tower, Lateral E Frontal Vidro Temperado, Preto, 3 Fans ARGB', 'Informática', default,'319.22', default,'350 x 270 x 350mm');
                   
-- Inserção dados da tabela pedido:(idpedido_cliente, status_pedido(enum('Confirmado','Cancelado','Processando','Enviado','Entregue') default, descrição_pedido, valor_total, frete
-- desc pedido;

insert into pedido(idpedido_cliente, status_pedido, descrição_pedido,valor_total,frete)
			values(2, 'Confirmado', 'compra via aplicativo', '5265.09',default),
				  (5, 'Confirmado', 'compra via web site', '1493.70','155'),
                  (1, default, 'compra sistema loja física', '10952.45','250'),
                  (3, 'Enviado', 'compra via aplicativo', '4461.98',default);
                  


-- delete from pedido where idpedido in (13,14,15,16); teste

-- desc pedido_produto;
-- Inserção dados da tabela pedido_produto:(idPPproduto,idPPpedido,Status_produto('Disponível','Indisponível', 'Sem Estoque') default 'Disponível' ,produto_quantidade_estoque)
insert into pedido_produto(idPPproduto,idPPpedido,status_produto,produto_quantidade_estoque)
			values(57,17,default,800),
				  (57,17,default,800),
                  (59,17,default,150),
                  (55,17,default,300),
                  (60,18,default,600),
                  (58,18,default,300),
                  (63,18,default,200),
                  (57,19,default,800),
                  (57,19,default,800),
                  (57,19,default,800),
                  (57,19,default,800),
                  (57,19,default,800),
                  (59,19,default,150),
                  (59,19,default,150),
                  (56,19,default,520),
                  (55,19,default,300),
                  (61,20,default,600),
                  (61,20,default,600),
                  (61,20,default,600),
                  (61,20,default,600),
                  (62,20,default,350),
                  (60,20,default,600);
                  
                  
-- desc fornecedor;
-- Inserção dados da tabela Fornecedor:(CNPJ,razão_social,nome_fantasia,contato,email,rua,bairro,complemento,cidade,estado,país,CEP)
insert into fornecedor(CNPJ,razão_social,nome_fantasia,contato,email,rua,bairro,complemento,cidade,estado,país,CEP)
            values('25589320000129','Technologia Brasil LTDA', 'Tem Technlogia', '11988192523','technoliavendas@technoliabr.com.br', '13 de Abril','centro','589 - galpão 5','São Paulo','SP','Brasil','01599129'),
				  ('12520359000135','Hardware Vision EIRELI', 'Vision Info', '11999930214','visioninfo_comercial@admvision.com', 'Comendador Fraga','centro','201 - Prédio','São Paulo','SP','Brasil', '01599120');
                  
                  -- select * from fornecedor;
     
-- desc vendedores_terceiros;     
-- Inserção dados da tabela vendedores_terceiros:(CNPJ_ou_MEI,razão_social,nome_fantasia,contato,email,rua,bairro,complemento,cidade,estado,país,CEP)
insert into vendedores_terceiros(CNPJ_ou_MEI,razão_social,nome_fantasia,contato,email,rua,bairro,complemento,cidade,estado,país,CEP)
		   values('59233589000147', 'Games Fisionary LTDA', 'Tudo Games', '21977253982','comercialtudogames@gmail.com','Visconde de Uruguai','centro','125 - galeria-stand 22','Niterói','RJ','Brasil',24125300),
                 ('58355089000121', 'Nosso Hardware LTDA', 'Mister Hardware RJ', '21981293590','comercialmisterrj@gmail.com','Quinze de Novembro','centro','300 - galeria-stand 05','Niterói','RJ','Brasil',24130122);
    
-- desc estoque;
-- Inserção dados da tabela estoque: (nome_estoque,rua,bairro,complemento,cidade,estado,país,CEP)
insert into estoque(nome_estoque,rua,bairro,complemento,cidade,estado,país,CEP)
            values('Galpão 01','Visconde de Uruguai','centro','211 - Galpão 01','Niterói','RJ','Brasil',24130122);
            
-- desc pagamento;
-- Inserção dados da tabela pagmento: (nome_titular_cartão,método_de_pagamento,número_cartão,financeira_cartão,vencimento_fatura)
insert into pagamento(nome_titular_cartão,método_de_pagamento,número_cartão,financeira_cartão,vencimento_fatura)
            values('Karina Lopes Tropvão','pix',null, default,20250403),
                  ('Francisco Küster Hoffmann', 'pix', null, default,20250411);
				  

-- desc entrega;
-- Inserção dados da tabela entrega:(status_entrega('Processando Pagamento','Processando Envio','Enviado','Concluído'), código_rastreio,Tipo_veículo('Carro','Caminhão','Van','Carreta','Motocicleta','n/a') default n/a,modelo_veículo,marca_veículo,placa_veículo,cor_veículo,ano_veículo,Nome_entregador,contato_entregador)
insert into entrega(status_entrega, código_rastreio,Tipo_veículo,modelo_veículo,marca_veículo,placa_veículo,cor_veículo,ano_veículo,Nome_entregador,contato_entregador)
			values(default,default,'carro','sandero','renault','ple-1823','branco','2019','Carlos Jóse de Andrade', '21988368090'),
				  (default,default,'motocicleta','crosser','yamaha','ptp-3958','verde','2023','Clara Gomes Machado', '21988368090');
                 
                -- select * from entrega;
               
-- desc relação_pagamento;
-- Inserção dados da tabela relação_pagamento:(idRPpagamento, idRPpedido,status_pagamento('Pendente','Em Processamento','Concluído') default pendente, pagamento_quantidade)
insert into relação_pagamento(idRPpagamento,idRPpedido,status_pagamento,pagamento_quantidade)
            values(3,20,'concluído',1),
				  (4,18,default,1);

-- desc entrega_liberação;				
-- Inserção dados da tabela entrega_liberação:(idELentrega,idELpedido,idELpagamento,status_liberaçãoenum('Pendente','Em Processamento','Concluído'),entrega_quantidade)
insert into entrega_liberação(idELentrega,idELpedido,idELpagamento,status_liberação,entrega_quantidade)
            values(1,20,3,'em processamento',default),
				  (2,18,4,default,default);
              
              -- select * from entrega_liberação;    
              
-- desc produto_estoque;
-- Inserção dados da tabela produto_estoque:(idPEproduto,idPEestoque,status_estoque('disponível','indiponível','sem estoque') default disponível,produto_quantidade_estoque)
insert into produto_estoque(idPEproduto,idPEestoque,status_estoque,produto_quantidade_estoque)
            values(55,1,default,300),
				  (56,1,default,520),
                  (57,1,default,800),
                  (58,1,default,300),
                  (59,1,default,150),
                  (60,1,default,600),
                  (61,1,default,650),
                  (62,1,default,350),
                  (63,1,default,200);
                  
-- desc produto_fornecedor;
-- Inserção dados da tabela produto_fornecedor: (idPFproduto,idPFfornecedor,produto_quantidade_fornecedor)
insert into produto_fornecedor(idPFproduto,idPFfornecedor,produto_quantidade_fornecedor)
            values(55,1,100),
				  (56,1,20),
                  (57,1,50),
                  (58,1,35),
                  (59,1,60),
                  (60,1,50),
                  (61,1,50),
                  (62,1,default),
                  (63,1,default),
                  (55,2,55),
                  (56,2,default),
                  (57,2,default),
                  (58,2,10),
                  (59,2,70),
                  (60,2,10),
                  (61,2,50),
                  (62,2,10),
                  (63,2,20);
                  

-- desc produto_terceiros;
-- Inserção dados da tabela produto_terceiros: (idPproduto,idPvendedores_terceiros,produto_quantidade_terceiros)
insert into produto_terceiros(idPproduto,idPvendedores_terceiros,produto_quantidade_terceiros)
            values(55,3,30),
				  (56,3,20),
                  (57,3,50),
                  (58,3,35),
                  (59,3,40),
                  (60,3,100),
                  (61,3,100),
                  (62,3,50),
                  (63,3,26),
                  (55,4,55),
                  (56,4,30),
                  (57,4,default),
                  (58,4,10),
                  (59,4,70),
                  (60,4,10),
                  (61,4,50),
                  (62,4,10),
                  (63,4,20);

-- Concluída inserção de todos os danos e realizadas todas as correções tanto na criação do BD quanto no updates de inserções em 09/04/25 - Jônatas F. Q.