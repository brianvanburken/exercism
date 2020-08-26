object ResistorColor {
    enum class Color {
        BLACK,
        BROWN,
        RED,
        ORANGE,
        YELLOW,
        GREEN,
        BLUE,
        VIOLET,
        GREY,
        WHITE
    }

    fun colorCode(input: String): Int = Color.valueOf(input.toUpperCase()).ordinal;

    fun colors(): List<String> = Color.values().map { it.name.toLowerCase() }

}
