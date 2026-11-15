-- Migration: 005_trips_created_at.sql
-- The admin trip list orders by trips.created_at, which the base schema
-- did not define. Add it for existing databases; safe to re-run.

ALTER TABLE trips ADD COLUMN IF NOT EXISTS created_at timestamptz NOT NULL DEFAULT now();
