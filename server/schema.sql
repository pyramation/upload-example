begin;

create extension citext;

CREATE DOMAIN image AS jsonb CHECK ( (((value) ?& (ARRAY['url', 'mime'])) AND ((((value) ->> ('url'))) ~ ('^(https?)://[^\s/$.?#].[^\s]*$'))) );
COMMENT ON DOMAIN image IS E'@name launchqlInternalTypeImage';

CREATE DOMAIN upload AS text CHECK ( ((value) ~ ('^(https?)://[^\s/$.?#].[^\s]*$')) );
COMMENT ON DOMAIN upload IS E'@name launchqlInternalTypeUpload';

create table public.post (
  id serial primary key,
  header text,
  body text,
  image image,
  icon upload,
  file upload
);

comment on column public.post.image is E'@upload';
comment on column public.post.icon is E'@upload';

commit;