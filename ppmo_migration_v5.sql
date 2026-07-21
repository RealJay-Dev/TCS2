-- ============================================================
-- PPMo v5 마이그레이션
-- - 관리자 계정에 차량 및 사진 파일 삭제 권한 부여
-- - ppmo_vehicles 삭제 시 CASCADE로 rounds/measurements/photos/feedback 자동 삭제
-- - Storage 파일은 별도 삭제 필요 (앱에서 처리)
-- ============================================================

-- ppmo_vehicles DELETE 정책
drop policy if exists "admins can delete ppmo_vehicles" on public.ppmo_vehicles;
create policy "admins can delete ppmo_vehicles" on public.ppmo_vehicles
  for delete using (
    (auth.jwt() ->> 'email') in ('jaehong.park@continental.com', 'sangyong.2.jung@continental.com')
  );

-- Storage 사진 파일 DELETE 정책
drop policy if exists "admins can delete ppmo photos" on storage.objects;
create policy "admins can delete ppmo photos" on storage.objects
  for delete using (
    bucket_id = 'ppmo-photos' and
    (auth.jwt() ->> 'email') in ('jaehong.park@continental.com', 'sangyong.2.jung@continental.com')
  );
