fsds.theme = {
    background_editor = Color( 30, 30, 30 ),
    background_window = Color( 37, 37, 38 ),
    background_tool   = Color( 45, 45, 48 ),
    background_panel  = Color( 62, 62, 66 ),
    background_menu   = Color( 51, 51, 51 ),

    divider_window = Color( 52, 52, 55 ),
    divider_other  = Color( 63, 63, 70 ),
    divider_active = Color( 0, 122, 204 ),

    text_primary   = Color( 212, 212, 212 ),
    text_secondary = Color( 153, 153, 153 ),
    text_disabled  = Color( 109, 109, 112 ),
    text_selected  = Color( 255, 255, 255 ),

    high_active_text   = Color( 38, 79, 120 ),
    high_inactive_text = Color( 51, 153, 255 ),
    high_match_text    = Color( 81, 81, 0 ),
    high_active_line   = Color( 43, 43, 43 ),

    interact_accent = Color( 0, 122, 204 ),
    interact_hover  = Color( 62, 62, 64 ),
    interact_press  = Color( 0, 122, 204 ),

    status_info    = Color( 75, 192, 255 ),
    status_success = Color( 89, 168, 105 ),
    status_warning = Color( 255, 204, 0 ),
    status_error   = Color( 244, 71, 71 ),

    syntax_keyword = Color( 86, 156, 214 ),
    syntax_class   = Color( 78, 201, 176 ),
    syntax_string  = Color( 214, 157, 133 ),
    syntax_number  = Color( 181, 206, 168 ),
    syntax_comment = Color( 106, 153, 85 ),
    syntax_preproc = Color( 155, 155, 155 ),

    type_sans = system.IsLinux() and "Roboto Light" or "Roboto-Light",
    type_mono = system.IsLinux() and "Consolas"     or "Consolas",
}