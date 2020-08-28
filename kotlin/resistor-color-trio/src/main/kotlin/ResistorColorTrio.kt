import kotlin.math.pow

object ResistorColorTrio {

    fun text(vararg input: Color): String {
        var value = 10
            .times(input[0].ordinal)
            .plus(input[1].ordinal)
            .times((10.0).pow(input[2].ordinal))
            .toInt()
        var magnitude = 0
        while (value % 1000 == 0) {
            value /= 1000
            magnitude++
        }
        val unit = Unit.values()[magnitude].name.toLowerCase()
        return "$value $unit"
    }
}
