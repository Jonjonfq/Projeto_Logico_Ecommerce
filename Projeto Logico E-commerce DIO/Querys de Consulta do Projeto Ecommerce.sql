-- Query de Consulta do Projeto Ecommerce
-- verificar database para validar o banco devido e acessá-lo
show databases;
use ecommerce;

show tables; 

-- consulta rerente a pedido por cliente
select * from cliente;
select * from pedido;

select idpedido, descrição_pedido,valor_total,frete, concat(nome,' ',nome_do_meio,' ', sobrenome) as Cliente, cidade, estado 
from pedido , cliente 
where idcliente = idpedido_cliente;

-- consulta somando os valores total mais frete
-- Criando soma de duas colunas de mesma tabelas mais group by
select p.idpedido,idcliente, round(sum(p.valor_total+p.frete),2) as valor_com_frete , concat(nome,' ',nome_do_meio,' ',sobrenome) as Cliente
from pedido p,cliente
where idcliente=p.idpedido_cliente
group by p.idpedido;

-- Criando soma de duas colunas de mesma tabelas mais group by e order by

select p.idpedido,idcliente,round(sum(p.valor_total+p.frete),2) as valor_com_frete , concat(nome,' ',nome_do_meio,' ',sobrenome) as Cliente
from pedido p,cliente
where idcliente=p.idpedido_cliente
group by p.idpedido
order by idcliente;

-- consultando relação do pagamento do pedido e seu status de pagamento/liberação para entrega
select * from relação_pagamento;
select * from entrega_liberação;
select idRPpagamento as pagamento, status_pagamento, status_liberação, idELentrega,entrega_quantidade from relação_pagamento , entrega_liberação where idRPpedido=idELpedido;