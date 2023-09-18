CREATE TABLE "public.pessoa" (
	"id_pessoa" serial NOT NULL,
	"nm_pessoa" varchar NOT NULL,
	"ds_email" varchar NOT NULL,
	"ds_senha" varchar NOT NULL,
	"tp_usuario" integer NOT NULL,
	CONSTRAINT "pessoa_pk" PRIMARY KEY ("id_pessoa")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.professor" (
	"id_pessoa" serial NOT NULL,
	"id_evento" integer NOT NULL,
	CONSTRAINT "professor_pk" PRIMARY KEY ("id_pessoa")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.aluno" (
	"id_pessoa" serial NOT NULL,
	"ra_aluno" integer NOT NULL UNIQUE,
	"id_gosto" integer NOT NULL,
	"ds_curso" varchar NOT NULL,
	CONSTRAINT "aluno_pk" PRIMARY KEY ("id_pessoa")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.gosto" (
	"id_gosto" serial NOT NULL,
	"nm_gosto" varchar NOT NULL,
	CONSTRAINT "gosto_pk" PRIMARY KEY ("id_gosto")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.evento" (
	"id_evento" serial NOT NULL,
	"ds_titulo" varchar NOT NULL,
	"ds_evento" varchar NOT NULL,
	"dt_evento" zone NOT NULL,
	"ds_local" varchar NOT NULL,
	"ds_imagem" TEXT NOT NULL,
	"id_professor" integer NOT NULL,
	"st_evento" integer NOT NULL,
	"dt_criacao" DATE NOT NULL,
	CONSTRAINT "evento_pk" PRIMARY KEY ("id_evento")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "professor" ADD CONSTRAINT "professor_fk0" FOREIGN KEY ("id_pessoa") REFERENCES "pessoa"("id_pessoa");
ALTER TABLE "professor" ADD CONSTRAINT "professor_fk1" FOREIGN KEY ("id_evento") REFERENCES "evento"("id_evento");

ALTER TABLE "aluno" ADD CONSTRAINT "aluno_fk0" FOREIGN KEY ("id_pessoa") REFERENCES "pessoa"("id_pessoa");
ALTER TABLE "aluno" ADD CONSTRAINT "aluno_fk1" FOREIGN KEY ("id_gosto") REFERENCES "gosto"("id_gosto");


ALTER TABLE "evento" ADD CONSTRAINT "evento_fk0" FOREIGN KEY ("id_professor") REFERENCES "professor"("id_pessoa");






