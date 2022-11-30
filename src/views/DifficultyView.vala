
namespace Application {
public class DifficultyView : Gtk.ScrolledWindow {

    private StackManager stack_manager = StackManager.get_instance ();

    public DifficultyView () {

        var easy_button = new Gtk.Button.with_label (_("Easy"));
        var medium_button = new Gtk.Button.with_label (_("Medium"));
        var hard_button = new Gtk.Button.with_label (_("Hard"));
        var expert_button = new Gtk.Button.with_label (_("Master"));
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
        box.pack_start (easy_button);
        box.pack_start (medium_button);
        box.pack_start (hard_button);
        box.pack_start (expert_button);

        easy_button.clicked.connect(()=>{
            difficulty_chooser(0);
        });
        medium_button.clicked.connect(()=>{
            difficulty_chooser(1);
        });
        hard_button.clicked.connect(()=>{
            difficulty_chooser(2);
        });
        expert_button.clicked.connect(()=>{
            difficulty_chooser(3);
        });

        var image = new Gtk.Image();
        image.icon_name = "input-gaming";
        image.set_pixel_size (128);
        image.set_margin_bottom(30);

        var label = new Gtk.Label (_("Choose difficulty and start a new puzzle"));
        label.set_line_wrap(true);
        Pango.AttrList attrs = new Pango.AttrList (); 
        attrs.insert (Pango.attr_scale_new (Pango.Scale.MEDIUM)); 
        label.attributes = attrs;

        var difficulty_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 12);
        difficulty_box.set_halign (Gtk.Align.CENTER);
        difficulty_box.set_valign (Gtk.Align.CENTER);
        difficulty_box.pack_start (image);
        difficulty_box.pack_start (label);
        difficulty_box.pack_start (box);

        this.add (difficulty_box);
    }
    private void difficulty_chooser(int index){
        var choosenDifficulty = Difficulty.all ()[index];
        var sudoku_board = new SudokuBoard (choosenDifficulty);

        stack_manager.set_current_board(sudoku_board);
        stack_manager.get_stack ().visible_child_name = "game-view";
    }
}
}
