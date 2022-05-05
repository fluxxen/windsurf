/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2022 fluxxen <fluxen@posteo.de>
 */

public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.fluxxen.windsurf",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 500,
            default_width = 500,
            title = "Weather Forecast - Calculate - Hang Loose"
        };
        
        var header = new Gtk.Label ("With this app you cann calculate board and sail size based on your weight and wind contitions");
        
        var calc = new Gtk.Label ("Calculate");
        var forecast = new Gtk.Label ("Forecast");
        
        main_window.add (header);
        main_window.add (calc);
        main_window.add (forecast);
        main_window.show_all ();
    }
    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
