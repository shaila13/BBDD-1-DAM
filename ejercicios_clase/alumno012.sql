ALTER TABLE pedidos

ADD CONSTRAINT importe_CK CHECK (importe BETWEEN 10 AND 900000);
