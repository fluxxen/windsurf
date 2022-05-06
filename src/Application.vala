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
            default_height = 150,
            default_width = 500,
            title = "Calculate - Hang Loose"
        };
        
        var coming_soon_label = new Gtk.Label (_("Coming soon: Weatherforecast, choose unit, choose database of calculating... much more"));
        
        var sailor_weight_label = new Gtk.Label (_("Enter your weight in kg."));
        var sailor_weight_spin_button = new Gtk.SpinButton.with_range (25,200,2) {
            value = 75,
        };
        var sailor_weight = sailor_weight_spin_button.get_value ();
        
        var wind_force_label = new Gtk.Label (_("Enter currently wind force in kn."));
        var wind_force_spin_button = new Gtk.SpinButton.with_range (8,50,2) {
            value = 20,
        };
        var wind_force = wind_force_spin_button.get_value ();
        
        var calc_sail_check = new Gtk.CheckButton.with_label (_("Calc sail size?")){
            active = true,
            sensitive = false,
        };
        var calc_sail_spin_button = new Gtk.SpinButton.with_range (1,12,0.1) {
            value = 4.7,
            editable = false,
        };
        
        var calc_vol_check = new Gtk.CheckButton.with_label (_("Calc board volume?")){
            active = true,
            sensitive = false,
        };
        var calc_vol_spin_button = new Gtk.SpinButton.with_range (35,300,5) {
            value = 105,
            editable = false,
        };
        
        var calc_button = new Gtk.Button.with_label (_("Calculate"));
        var result_vol = 0.0;
        var result_sail = 0.0;
        
        var reset_button = new Gtk.Button.with_label (_("Reset Calculation"));
        
        
        var grid = new Gtk.Grid () {
            column_spacing = 6,
            row_spacing = 6,
        };
        
//grid.attach ('widget','column number', 'row number', 'column span', 'row span')
        //add 1st row of widgets
        grid.attach (sailor_weight_label, 0,1,1,1);
        grid.attach_next_to (sailor_weight_spin_button, sailor_weight_label, Gtk.PositionType.RIGHT, 1,1);
        
        //add 2nd row of widgets
        grid.attach (wind_force_label, 0,2,1,1);
        grid.attach_next_to (wind_force_spin_button, wind_force_label,Gtk.PositionType.RIGHT, 1,1);
        
        //add 3rd row of widgets
        grid.attach (calc_sail_check, 0,3,1,1);
        grid.attach_next_to (calc_sail_spin_button, calc_sail_check,Gtk.PositionType.RIGHT, 1,1);
        
        //add 4th row of widgets
        grid.attach (calc_vol_check, 0,4,1,1);
        grid.attach_next_to (calc_vol_spin_button, calc_vol_check,Gtk.PositionType.RIGHT, 1,1);
        
        //add 5th row of widgets
        grid.attach (calc_button, 1,5,1,1);
        grid.attach_next_to (reset_button, calc_button,Gtk.PositionType.RIGHT, 1,1);
        //add 6th row of widgets
        grid.attach (coming_soon_label, 0,6,4,1);
        
        main_window.add (grid);
        
        //Actions on buttons
        calc_button.clicked.connect (() => {
            sailor_weight = sailor_weight_spin_button.get_value ();
            wind_force = wind_force_spin_button.get_value ();
            result_vol = (sailor_weight * 1.5 + 70);
            calc_vol_spin_button.set_value (result_vol);
            result_sail = (0.62 * sailor_weight / wind_force);
            calc_sail_spin_button.set_value (result_sail);
        });
        
        reset_button.clicked.connect (() => {
            sailor_weight_spin_button.set_value (75);
            wind_force_spin_button.set_value (20);
            calc_sail_spin_button.set_value (4.7);
            calc_vol_spin_button.set_value (105);
            reset_button.sensitive = true;
        });
        
        main_window.show_all ();
    }
    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
