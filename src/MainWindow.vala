namespace Application {
public class MainWindow : Gtk.Window {
    private HeaderBar header_bar = HeaderBar.get_instance ();
    private StackManager stack_manager = StackManager.get_instance ();
    public MainWindow (Gtk.Application application) {
        Object (application: application,
                icon_name: Constants.APPLICATION_NAME,
                default_height: Constants.APPLICATION_HEIGHT,
                default_width: Constants.APPLICATION_WIDTH);
    }

    construct {
        set_titlebar (header_bar);
        try {
            var provider = new Gtk.CssProvider ();
            provider.load_from_data ("
.win-label {
   color: green;
   font-size: 30px;
   margin: 10px;
}
.win-button {
    border-color: shade (mix (rgb (67%, 13%, 16%), rgb (67%, 13%, 16%), 0.6), 1);
}
");
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            } catch (Error e) {
                 error (e.message);
            }
        this.delete_event.connect (on_window_closing);
        stack_manager.load_views (this);
        add_shortcuts();
    }

    private bool on_window_closing () {
        stack_manager.save_current_board();
        return false;
    }

    private void add_shortcuts () {
        key_press_event.connect ((e) => {
            switch (e.keyval) {
                case Gdk.Key.q:
                  if ((e.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                    stack_manager.save_current_board();
                    this.destroy ();
                  }
                  break;
            }

            return false;
        });
    }
  }
}
