
CREATE SCHEMA IF NOT EXISTS person_schema;

CREATE TABLE person_schema.typeId (
                                      id uuid,
                                      name text,
                                      shortName text,
                                      PRIMARY KEY (id)
);


CREATE TABLE person_schema.person
(
    id uuid,
    name    text,
    lastname   text,
    typeId uuid,
    email text,
    userId uuid,
    birthDay time,

    PRIMARY KEY (id),
    CONSTRAINT fk_typeId_person_schema
        FOREIGN KEY (typeId)
        REFERENCES person_schema.typeId (id)
);



CREATE TABLE person_schema.contact (
    id uuid,
    name text,
    description text,
    phone text,
    address text,
    zipCode text,
    country text,
    state text,
    personId uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_userId_person_schema
        FOREIGN KEY (personId)
        REFERENCES person_schema.person (id)
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";