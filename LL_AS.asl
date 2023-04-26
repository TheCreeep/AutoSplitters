state("ProjectCoop-Win64-Shipping")
{
    int book_count : 0x442BBB0, 0x30, 0x570, 0x250;
    int in_game_time : 0x4442DF0, 0x1F0, 0x60, 0x2B0;
    int hud_state : 0x03F463E8, 0x8;
    int is_main_menu : 0x0440CEB8, 0x1DC;
    int is_in_spawn : 0x04449AC8, 0x118,0x50, 0x930, 0x2B0;
}

init{
    print("Init Initiated");
}

startup {
    print("Startup Initiated");
    settings.Add("startOnLamp", true, "Auto Start");
    settings.Add("splitOnBook", true, "Split on Books");
    settings.Add("resetOnRestart", true, "Reset on Restart Map");
    settings.Add("endOnHUD", false, "End on HUD Disappear (Safe in multi but .5 delay)");
    settings.Add("endOnSpawn", true, "End on Spawn (SOLO ONLY)");
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
    
    if(settings["endOnHUD"] && current.book_count == 10 && current.hud_state == 3) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && current.is_in_spawn != 0) {
        return true;
    }
}

reset {
    if(settings["resetOnRestart"] && current.in_game_time < 1000 ) {
        return true;
    }
}