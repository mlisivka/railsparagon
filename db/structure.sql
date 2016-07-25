CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar NOT NULL, "text" text NOT NULL, "user_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "matches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "match_begins" datetime NOT NULL, "team_id" integer NOT NULL, "agora_link" varchar NOT NULL, "end" boolean DEFAULT 'f', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teams" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "full_name" varchar NOT NULL, "tag_name" varchar, "country" varchar, "rating" integer, "image" varchar, "captain_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "played_matches" integer, "win" integer, "lose" integer, "kda" integer, "team_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "tournaments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar NOT NULL, "max_team" integer NOT NULL, "payment" integer, "prize" integer, "team_id" integer, "end" boolean DEFAULT 'f', "tournament_begins" datetime NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teams_users" ("team_id" integer, "user_id" integer);
CREATE TABLE "invites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "team_id" integer NOT NULL, "sender_id" integer NOT NULL, "recipient_id" integer NOT NULL, "accepted" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teams_tournaments" ("team_id" integer, "tournament_id" integer);
INSERT INTO schema_migrations (version) VALUES ('20160417152923');

INSERT INTO schema_migrations (version) VALUES ('20160417153039');

INSERT INTO schema_migrations (version) VALUES ('20160417153057');

INSERT INTO schema_migrations (version) VALUES ('20160417153111');

INSERT INTO schema_migrations (version) VALUES ('20160417153128');

INSERT INTO schema_migrations (version) VALUES ('20160610145505');

INSERT INTO schema_migrations (version) VALUES ('20160612110235');

INSERT INTO schema_migrations (version) VALUES ('20160621103950');

