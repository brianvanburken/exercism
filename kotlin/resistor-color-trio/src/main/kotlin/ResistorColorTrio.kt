object ResistorColorTrio {

    fun text(vararg input: Color): String {
        val (c1, c2, c3) = input
        var value = 10 * c1.ordinal + c2.ordinal
        repeat(times = c3.ordinal) { value *= 10 }
        var magnitude = 0
        while (value % 1000 == 0) {
            value /= 1000
            magnitude++
        }
        val unit = Unit.values()[magnitude].name.toLowerCase()
        return "$value $unit"
    }
}
