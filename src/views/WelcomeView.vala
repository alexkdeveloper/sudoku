
namespace Application {
public class WelcomeView : Gtk.ScrolledWindow {

    private StackManager stack_manager = StackManager.get_instance ();
    
    public WelcomeView () {
        var welcome_view = new Granite.Widgets.Welcome ("","");
        welcome_view.append ("input-gaming", _("New game"), _("Choose difficulty and start a new puzzle"));
        
        var settings = new SudokuSettings ();
        var sudoku_board = new SudokuBoard.from_string (settings.load ());

        if (settings.load () != null && !sudoku_board.isFinshed ()) {
            welcome_view.append ("input-gaming", _("Resume game"), _("Continue your game"));
        }

        welcome_view.activated.connect ((option) => {
            switch (option) {
                case 0:
                    stack_manager.get_stack ().visible_child_name = "difficulty-view";
                    break;
                case 1:
                    var settings_current = new SudokuSettings ();
                    var sudoku_board_current = new SudokuBoard.from_string (settings_current.load ());
                    if (sudoku_board_current.isFinshed ()) {
                        sudoku_board = null;
                    }

                    stack_manager.set_current_board (sudoku_board_current);
                    stack_manager.get_stack ().visible_child_name = "game-view";
                    break;
            }
        });
        this.add (welcome_view);
    }
}
}
