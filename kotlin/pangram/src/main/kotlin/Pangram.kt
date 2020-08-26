object Pangram {
    private val alphabet = ('a'..'z').toList()

    fun isPangram(input: String): Boolean {
        return input
            .toCharArray()
            .distinct()
            .map { it.toLowerCase() }
            .filter { it in 'a'..'z' }
            .sorted() == alphabet
    }
}
