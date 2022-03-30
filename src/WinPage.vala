
namespace Application {
public class WinPage : Gtk.AspectFrame {
    
	public signal void return_to_welcome ();

	public WinPage () {
		set_shadow_type (Gtk.ShadowType.IN);
		var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
		box.homogeneous = false;
		this.add (box);

		var text = new Gtk.Label (_("GAME OVER!"));
		text.get_style_context ().add_class ("win-label");
		text.margin = 20;
		text.margin_bottom = 50;
		box.add (text);
		
		var button = new Gtk.Button.with_label (_("Back to menu"));
		button.get_style_context ().add_class ("win-button");
		button.margin = 20;
		button.clicked.connect (() => {
			return_to_welcome ();
		});
		box.add (button);
	}
  }
}
