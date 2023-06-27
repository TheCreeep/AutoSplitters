state("ProjectCoop-Win64-Shipping")
{
    int book_count : 0x04441DF0, 0x118, 0x318;
    int is_main_menu : 0x440BEB8, 0x1DC;
    int is_char_select: 0x03EFA410, 0x8, 0x370, 0x50, 0x124;

    int in_game_time : 0x3F02BBC;

    int crux_spawn : 0x04448AC8, 0x118,0x50, 0x7F0, 0x2B0;
    int swim_spawn : 0x04448AC8, 0x118,0x50, 0x4D0, 0x2B0;
    int hhs_spawn : 0x04448AC8, 0x118,0x50, 0x6E0, 0x2B0;
    int burcks_spawn : 0x04448AC8, 0x118,0x50, 0x8E0, 0x2B0;
    int melbury_spawn : 0x04448AC8, 0x118,0x50, 0x820, 0x2B0;
    int manic_spawn : 0x04448AC8, 0x118,0x50, 0x940, 0x2B0;
    int hibashi_spawn : 0x04308B18, 0x8F0, 0x0, 0x610, 0x218;

}




startup {
    print("Startup Initiated");
    settings.Add("startOnLamp", true, "Auto Start");
    settings.Add("splitOnBook", true, "Split on Books");
    settings.Add("resetOnRestart", true, "Reset on Restart Map");
    settings.Add("endOnSpawn", true, "End when reaching Spawn (SOLO ONLY)");
}

start{
    print("In in_game_time" + current.in_game_time);
    if(settings["startOnLamp"] && current.in_game_time >= 1150 && current.book_count == 0 && current.is_main_menu != 1 && current.is_char_select != 1) {
        return true;
    }
}

split { 
    if(settings["splitOnBook"] && (current.book_count != old.book_count) && (current.book_count != 0 ) ) {
        return true;
    }
    
    if(settings["endOnSpawn"] && current.book_count == 10 && old.swim_spawn == 0 && current.swim_spawn != 0) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && old.hhs_spawn == 0 && current.hhs_spawn != 0) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && old.crux_spawn == 0 && current.crux_spawn != 0) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && old.burcks_spawn == 0 && current.burcks_spawn != 0) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && old.melbury_spawn == 0 && current.melbury_spawn != 0) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && old.manic_spawn == 0 && current.manic_spawn != 0) {
        return true;
    }

    if(settings["endOnSpawn"] && current.book_count == 10 && old.hibashi_spawn != 10 && current.hibashi_spawn == 10) {
        return true;
    }
}

reset {
    if(settings["resetOnRestart"] && current.in_game_time < 1150 && old.in_game_time >= 1150 && current.is_main_menu != 1 && current.is_char_select != 1) {
        return true;
    }
}