namespace Application {
public class App : Gtk.Application {
    
    public static MainWindow window = null;

    construct {
        application_id = Constants.APPLICATION_NAME;
        Intl.setlocale (LocaleCategory.ALL, "");
    }

    protected override void activate () {
        new_window ();
    }

    public static int main (string[] args) {
        Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
        Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");
        Intl.textdomain (Config.GETTEXT_PACKAGE);
        var app = new Application.App ();
        return app.run (args);
    }

    public void new_window () {
        if (window != null) {
            window.present ();
            return;
        }

        window = new MainWindow (this);
        window.show_all ();
    }
  }
}
