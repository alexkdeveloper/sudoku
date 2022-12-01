
namespace Application {
public class WelcomeView : Gtk.ScrolledWindow {

    private StackManager stack_manager = StackManager.get_instance ();
    
    public WelcomeView () {

        var new_game_button = new Gtk.Button.with_label (_("New game"));
        var resume_game_button = new Gtk.Button.with_label (_("Resume game"));

        var settings = new SudokuSettings ();
        var sudoku_board = new SudokuBoard.from_string (settings.load ());

        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);

        if (settings.load () != null && !sudoku_board.isFinshed ()) {
            box.pack_start (new_game_button);
            box.pack_start (resume_game_button);
        }else{
            box.pack_start (new_game_button);
        }
        new_game_button.clicked.connect (()=>{
            stack_manager.get_stack ().visible_child_name = "difficulty-view";
            });
        resume_game_button.clicked.connect(()=>{
                    var settings_current = new SudokuSettings ();
                    var sudoku_board_current = new SudokuBoard.from_string (settings_current.load ());
                    if (sudoku_board_current.isFinshed ()) {
                        sudoku_board = null;
                    }
                    stack_manager.set_current_board (sudoku_board_current);
                    stack_manager.get_stack ().visible_child_name = "game-view";
            });
       
        var image = new Gtk.Image();
        image.icon_name = "com.github.alexkdeveloper.sudoku";
        image.set_pixel_size (128);
        image.set_margin_bottom(30);

        var label = new Gtk.Label ("Sudoku");
        Pango.AttrList attrs = new Pango.AttrList (); 
        attrs.insert (Pango.attr_scale_new (Pango.Scale.XX_LARGE)); 
        label.attributes = attrs;

        var welcome_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 12);
        welcome_box.set_halign (Gtk.Align.CENTER);
        welcome_box.set_valign (Gtk.Align.CENTER);
        welcome_box.pack_start (image);
        welcome_box.pack_start (label);
        welcome_box.pack_start (box);

        this.add (welcome_box);
    }
  }
}
