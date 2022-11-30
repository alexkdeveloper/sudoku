namespace Application {
public class HeaderBar : Gtk.HeaderBar {
	static HeaderBar? instance;
	
	private StackManager stack_manager = StackManager.get_instance ();
	public Gtk.Button return_button = new Gtk.Button ();

	HeaderBar () {
	    set_title ("Sudoku");
		generate_return_button ();
		pack_start (return_button);
		this.show_close_button = true;
	}

    public static HeaderBar get_instance () {
        if (instance == null) {
            instance = new HeaderBar ();
        }
        return instance;
    }

    private void generate_return_button () {
        return_button.no_show_all = true;
        return_button.visible = false;
        return_button.set_image (new Gtk.Image.from_icon_name ("go-previous-symbolic", Gtk.IconSize.SMALL_TOOLBAR));
        return_button.set_tooltip_text(_("Back"));
        return_button.clicked.connect (() => {
            stack_manager.save_current_board();
            stack_manager.get_stack ().visible_child_name = "welcome-view";
        });
    }

    public void show_return_button (bool answer) {
        return_button.visible = answer;
    }
  }
}
