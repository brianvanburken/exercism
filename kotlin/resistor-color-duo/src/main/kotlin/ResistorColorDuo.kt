object ResistorColorDuo {

    fun value(vararg colors: Color): Int = colors
        .take(2)
        .joinToString(separator = "") { it.ordinal.toString() }
        .toInt()
}
