-- ============================================================
-- PPMo v3 마이그레이션
-- - 차량 마스터에 장착 타이어 스펙 필드 추가
--   tire_size    : 사이즈 (예: 195/70R15)
--   load_index   : 하중지수 (예: 106/104)
--   speed_index  : 속도지수 (예: R)
-- ============================================================

alter table public.ppmo_vehicles
  add column if not exists tire_size text,
  add column if not exists load_index text,
  add column if not exists speed_index text;

comment on column public.ppmo_vehicles.tire_size is '장착 타이어 사이즈 (예: 195/70R15)';
comment on column public.ppmo_vehicles.load_index is '하중지수 (예: 106/104)';
comment on column public.ppmo_vehicles.speed_index is '속도지수 (예: R)';
