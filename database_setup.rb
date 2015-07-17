
# CONNECTION.execute("DROP TABLE owners;")
# CONNECTION.execute("DROP TABLE pets;")
# CONNECTION.execute("DROP TABLE events;")
# CONNECTION.execute("DROP TABLE pet_events;")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS owners (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS pets (id INTEGER PRIMARY KEY, name TEXT, owner_id INTEGER);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS events (id INTEGER PRIMARY KEY, name TEXT, date TEXT,
category_id INTEGER, reminder_time TEXT, comment TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS pet_events (pet_id INTEGER, event_id INTEGER);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true
