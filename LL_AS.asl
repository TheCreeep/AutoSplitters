state("ProjectCoop-Win64-Shipping")
{
    int book_count : 0x442BBB0, 0x30, 0x570, 0x250;
    int in_game_time : 0x4442DF0, 0x1F0, 0x60, 0x2B0;
    int is_in_game: 0x0443E740, 0x110, 0x974;
    int swim_spawn : 0x04449AC8, 0x118,0x50, 0x4C0, 0x2B0;
    int hhs_spawn : 0x04449AC8, 0x118,0x50, 0x6D0, 0x2B0;
    int crux_spawn : 0x04449AC8, 0x118,0x50, 0x7E0, 0x2B0;
    int burcks_spawn : 0x04449AC8, 0x118,0x50, 0x8D0, 0x2B0;
    int melbury_spawn : 0x04449AC8, 0x118,0x50, 0x810, 0x2B0;
    int manic_spawn : 0x04449AC8, 0x118,0x50, 0x930, 0x2B0;

}

init{
    print("Init Initiated");
}

startup {
    print("Startup Initiated");
    settings.Add("startOnLamp", true, "Auto Start");
    settings.Add("splitOnBook", true, "Split on Books");
    settings.Add("resetOnRestart", true, "Reset on Restart Map");
    settings.Add("endOnSpawn", true, "End on Spawn (SOLO ONLY)");
}

start{
    if(settings["startOnLamp"] && current.in_game_time >= 13000 && current.in_game_time <= 16000 && current.book_count == 0 && current.is_in_game == 1) {
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
}

reset {
    if(settings["resetOnRestart"] && current.in_game_time < 1000 ) {
        return true;
    }
}