# slash_migrate demo

A demo app for trying [slash_migrate](https://github.com/firstdraft/slash_migrate),
the development-only GUI for common database migrations. It's built on firstdraft's
Rails 8 template and ships with a deliberately varied schema so you can see every
part of the tool.

## Open it in a Codespace (easiest)

On GitHub, click **Code ▸ Codespaces ▸ Create codespace on main**. The container
sets everything up automatically — `bin/setup` runs on creation: it installs the
gems, creates the database, runs the migrations, and seeds sample data. When it's
finished, start the server:

```bash
bin/dev
```

then open the forwarded **port 3000** and visit **`/rails/migrate`**.

## Or run it locally

Needs Ruby 4.0.1 (see `.ruby-version`) and PostgreSQL:

```bash
bin/setup   # install gems, create + migrate + seed the database
bin/dev     # start the server
```

Open **<http://localhost:3000/rails/migrate>**.

slash_migrate is in the `development` group and mounts itself there — there's no
`routes.rb` change to make, and it never loads in production.

## What's in the database

Four related tables, chosen to exercise the whole tool:

| Table | Notable columns |
|---|---|
| **authors** | `email` (unique index), `active` (boolean, default `true`), `born_on` (date), `bio` (text), `age` (integer) |
| **categories** | `slug` (unique index), `featured` (boolean, default `false`) |
| **posts** | `author` + `category` foreign keys, `view_count` (integer, default `0`), `rating` (decimal 3,2), `reading_time` (float), `legacy_id` (bigint), `published` (boolean, default `false`), `published_at` (datetime), and an index on `title` |
| **comments** | `post` foreign key, plus `commenter` — a **differently-named** foreign key pointing at `authors` |

So you'll see every column type, `NOT NULL` and default values (including
`default: false`), unique and plain indexes, and both conventional and
differently-named foreign keys.

(The app also has Rails' built-in `solid_*` tables for caching, jobs, and cable —
those are infrastructure; the demo's tables are the four above.)

## Things to try at `/rails/migrate`

- **Browse** a table to see its columns, types, indexes, and foreign keys.
- **Add, edit, or drop** a column — dropping one that has an index or foreign key
  shows a reversibility caveat.
- **Add or drop an index**, including a unique one.
- **Create a new table** — `id` and the timestamps are shown locked because Rails
  adds them for you, and the migration and model code preview as you type.
- Open **Migrations** to run the migration you just generated, then roll it back or
  delete it.

Every action previews the exact migration code it will write before you commit to it.
