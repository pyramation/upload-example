begin;

create extension citext;

CREATE DOMAIN upload AS text;
COMMENT ON DOMAIN upload IS E'@name internalTypeUpload';

create table public.post (
  id serial primary key,
  header text,
  body text,
  image upload,
  icon upload,
  file upload
);

comment on column public.post.image is E'@upload';
comment on column public.post.icon is E'@upload';

commit;
