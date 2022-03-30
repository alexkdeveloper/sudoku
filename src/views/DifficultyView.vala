
namespace Application {
public class DifficultyView : Gtk.ScrolledWindow {

    private StackManager stack_manager = StackManager.get_instance ();

    public DifficultyView () {
        var difficulty_view = new Granite.Widgets.Welcome ("", "");
        foreach (Difficulty diff in Difficulty.all ()) {
    		difficulty_view.append ("input-gaming",diff.to_translated_string (), "");
    	}

        difficulty_view.activated.connect ((index) => {
            var choosenDifficulty = Difficulty.all ()[index];
            var sudoku_board = new SudokuBoard (choosenDifficulty);

            stack_manager.set_current_board(sudoku_board);
            stack_manager.get_stack ().visible_child_name = "game-view";
        });
        this.add (difficulty_view);
    }
}
}
