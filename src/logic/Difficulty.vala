
namespace Application {
public enum Difficulty {
    EASY,
    MEDIUM,
    HARD,
    EXPERT;

    public string to_string () {
        switch (this) {
            case EASY:
                return "simple";
            case MEDIUM:
                return "easy";
            case HARD:
                return "intermediate";
            case EXPERT:
                return "expert";
            default:
                assert_not_reached ();
        }
    }

    public string to_translated_string () {
        switch (this) {
            case EASY:
                return _("Easy");
            case MEDIUM:
                return _("Medium");
            case HARD:
                return _("Hard");
            case EXPERT:
                return _("Master");
            default:
                assert_not_reached ();
        }
    }

    public static Difficulty from_string (string input) {
        switch (input) {
            case "simple":
                return EASY;
            case "easy":
                return MEDIUM;
            case "intermediate":
                return HARD;
            case "expert":
                return EXPERT;
            default:
                warning ("Could not parse difficulty level. Falling back to Easy difficulty");
                return EASY;
        }
    }

    public static Difficulty[] all() {
       return { EASY, MEDIUM, HARD, EXPERT };
    }
}
}
