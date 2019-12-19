-- Drop table

-- DROP TABLE "MI181_GCCORTEZ".batch;

CREATE TABLE "MI181_GCCORTEZ".batch (
	id serial NOT NULL,
	batch_start time NOT NULL,
	batch_end time NOT NULL,
	trainer_id int4 NOT NULL,
	batch_type varchar(20) NOT NULL,
	CONSTRAINT trainer_id FOREIGN KEY (trainer_id) REFERENCES trainer(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Permissions

ALTER TABLE "MI181_GCCORTEZ".batch OWNER TO datama2mi181;
GRANT ALL ON TABLE "MI181_GCCORTEZ".batch TO datama2mi181;


-- Drop table

-- DROP TABLE "MI181_GCCORTEZ".trainer;

CREATE TABLE "MI181_GCCORTEZ".trainer (
	id serial NOT NULL,
	train_hoursalary int2 NULL,
	train_address varchar(60) NOT NULL,
	train_fname varchar(15) NOT NULL,
	train_lname varchar(15) NOT NULL,
	train_mi varchar(6) NULL,
	train_sex varchar(6) NOT NULL,
	CONSTRAINT trainer_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE "MI181_GCCORTEZ".trainer OWNER TO datama2mi181;
GRANT ALL ON TABLE "MI181_GCCORTEZ".trainer TO datama2mi181;



CREATE OR REPLACE PROCEDURE "MI181_GCCORTEZ".updatebatchtime(time without time zone, time without time zone, text)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
	update "MI181_GCCORTEZ".batch
	set batch_start = $1
	where batch_type = $3;
	
	update "MI181_GCCORTEZ".batch
	set batch_end = $2
	where batch_type = $3;
	commit;
END;
$procedure$
;
