#include <amxmodx>
#include <amxmisc>
#include <cstrike>
#include <fun>

#define TAG    "[ArenaGames]"

new say_text
public plugin_init()
{
    register_plugin("Reset Score", "1.0", "JkDev")

    register_clcmd("say reset", "reset_score")
    register_clcmd("say /reset", "reset_score")
    register_clcmd("say !reset", "reset_score")
    register_clcmd("say .reset", "reset_score")
    register_clcmd("say rs", "reset_score")
    register_clcmd("say /rs", "reset_score")
    register_clcmd("say !rs", "reset_score")
    register_clcmd("say .rs", "reset_score")

    say_text = get_user_msgid("SayText");
}

public reset_score(id)
{
    cs_set_user_deaths(id, 0)
    set_user_frags(id, 0)
    cs_set_user_deaths(id, 0)
    set_user_frags(id, 0)
    ChatColor(id, "!g%s !tScore Reseteado!"), TAG;
    return PLUGIN_HANDLED
}

stock ChatColor(const id, const string[], {Float, Sql, Resul,_}:...) {

    new msg[191], players[32], count = 1;
    vformat(msg, sizeof msg - 1, string, 3);

    replace_all(msg,190,"!g","^4");
    replace_all(msg,190,"!y","^1");
    replace_all(msg,190,"!t","^3");

    if(id)
        players[0] = id;
    else
        get_players(players,count,"ch");

    for (new i = 0 ; i < count ; i++)
    {
        if (is_user_connected(players[i]))
        {
            message_begin(MSG_ONE_UNRELIABLE, say_text,_, players[i]);
            write_byte(players[i]);
            write_string(msg);
            message_end();
        }
    }
}

/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1055\\ f0\\ fs16 \n\\ par }
*/
