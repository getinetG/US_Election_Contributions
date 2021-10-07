-- election.address definition

-- Drop table

-- DROP TABLE address;

CREATE TABLE address (
	id serial NOT NULL,
	address_one varchar NULL,
	address_two varchar NULL,
	city varchar NULL,
	state bpchar(2) NULL,
	zip int4 NULL,
	CONSTRAINT address_pk PRIMARY KEY (id)
);

-- election.address definition

-- Drop table

-- DROP TABLE address;

CREATE INDEX address_zip_idx ON election.address USING btree (zip);
CREATE TABLE election.transactions(
	id serial NOT NULL,
	tran_id varchar NOT null,
	CONSTRAINT transactions_pk PRIMARY KEY(id);
);
CREATE INDEX transaction_idx ON election.transactions USING btree (tran_id);


-- election.datecontribut definition

-- Drop table

-- DROP TABLE datecontribut;

CREATE TABLE datecontribut (
	id serial NOT NULL,
	contr_date date NULL,
	CONSTRAINT datecontribut_pk PRIMARY KEY (id)
);
CREATE INDEX datecontribut_contr_date_idx ON election.datecontribut USING btree (contr_date);


-- election.occupation definition

-- Drop table

-- DROP TABLE occupation;

CREATE TABLE occupation (
	id serial NOT NULL,
	employer varchar NULL,
	occupation_name varchar NULL,
	CONSTRAINT occupation_pk PRIMARY KEY (id)
);
CREATE INDEX occupation_occupation_name_idx ON election.occupation USING btree (occupation_name);


-- election.recipient definition

-- Drop table

-- DROP TABLE recipient;

CREATE TABLE recipient (
	id serial NOT NULL,
	fecid varchar NOT NULL,
	committee_name text NOT NULL,
	CONSTRAINT recipient_pk PRIMARY KEY (id)
);
CREATE INDEX recipient_committee_name_idx ON election.recipient USING btree (committee_name);


-- election.contribution definition

-- Drop table

-- DROP TABLE contribution;

CREATE TABLE contribution (
	filing_id bpchar(8) NOT NULL,
	amount float8 NULL,
	count int4 NULL,
	transid varchar NOT NULL,
	addressid int4 NOT NULL,
	dateid int4 NOT NULL,
	occupationid int4 NOT NULL,
	recipientid int4 NOT NULL,
	CONSTRAINT contribution_pk PRIMARY KEY (trans_id),
	CONSTRAINT contribution_address_fk FOREIGN KEY (addressid) REFERENCES election.address(id),
	CONSTRAINT contribution_datecontribut_fk FOREIGN KEY (dateid) REFERENCES election.datecontribut(id),
	CONSTRAINT contribution_occupation_fk FOREIGN KEY (occupationid) REFERENCES election.occupation(id),
	CONSTRAINT contribution_recipient_fk FOREIGN KEY (recipientid) REFERENCES election.recipient(id)
);
CREATE INDEX contribution_addressid_idx ON election.contribution USING btree (addressid);
CREATE INDEX contribution_dateid_idx ON election.contribution USING btree (dateid);
CREATE INDEX contribution_occupationid_idx ON election.contribution USING btree (occupationid);
CREATE INDEX contribution_recipientid_idx ON election.contribution USING btree (recipientid);
CREATE INDEX contribution_transid_idx ON election.transactions USING btree (transid);