state("ProjectCoop-Win64-Shipping")
{
    int book_count : 0x442BBB0, 0x30, 0x570, 0x250;
    int in_game_time : 0x4442DF0, 0x1F0, 0x60, 0x2B0;
    int hud_state : 0x03F463E8, 0x8;
    int is_main_menu : 0x0440CEB8, 0x1DC;
}

init{
    print("Init Initiated");
}

startup {
    print("Startup Initiated");
    settings.Add("splitOnBook", false, "Split on Books");
    settings.Add("resetOnRestart", false, "Reset on Restart Map");
    settings.Add("startOnLamp", false, "Auto Start");
}

start{
    print("In in_game_time" + current.in_game_time);
    if(settings["startOnLamp"] && current.in_game_time >= 13000 && current.book_count == 0 && current.hud_state != 7 && current.is_main_menu != 1) {
        return true;
    }
}

split { 
    if(settings["splitOnBook"] && (current.book_count != old.book_count) && (current.book_count != 0 ) ) {
        return true;
    }
    
    if(current.book_count == 10 && current.hud_state == 3) {
        return true;
    }
}

reset {
    if(settings["resetOnRestart"] && current.in_game_time < 1000 ) {
        return true;
    }
}