
namespace Application {
    public const string saveFile = "savegame";
    public const string highscoreFile = "highscore";

    public class SudokuSettings : Object {
        private File dataFolder;
        private int _highscore = 0;
        public int highscore {
            get { return _highscore; }
            set
            {
                if (value > _highscore) {
                    _highscore = value;
                    save_file (highscoreFile, "%i".printf (_highscore));
                }
            }
        }

        construct {
            try {
                dataFolder = File.new_for_path (Environment.get_user_data_dir ());
                if (!dataFolder.query_exists ()) {
                    dataFolder.make_directory ();
                }

                if (!isSaved_file (saveFile)) {
                    dataFolder.get_child (saveFile).create (FileCreateFlags.NONE);
                }

                if (isSaved_file (highscoreFile)) {
                    _highscore = int.parse (load_file (highscoreFile));
                }
            } catch (Error e) {
                error (e.message);
            }
        }

        public bool isSaved () {
            return isSaved_file (saveFile);
        }

        public bool isSaved_file (string file) {
            return dataFolder.get_child (file).query_exists ();
        }

        public string? load () {
            return load_file (saveFile);
        }

        public string? load_file (string file) {
            try {
                var dis = new DataInputStream (dataFolder.get_child (file).read ());
                return dis.read_line ();
            } catch (Error e) {
                error (e.message);
            }
        }

        public void save (string data) {
            save_file (saveFile, data);
        }

        public void save_file (string file_name, string data) {
            try {
                var file = dataFolder.get_child (file_name);
                if (file.query_exists ()) {
                    file.delete ();
                }
                var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));

                dos.put_string (data);
            } catch (Error e) {
                error (e.message);
            }
        }

        public void delete () {
            var file = dataFolder.get_child (saveFile);
            if (file.query_exists ()) {
                try {
                    file.delete ();
                } catch (Error e) {
                    error (e.message);
                }
            }
        }
    }
}
