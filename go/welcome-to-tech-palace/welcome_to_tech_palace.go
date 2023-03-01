package techpalace

import "strings"

func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	stars := strings.Repeat("*", numStarsPerLine)
	return stars + "\n" + welcomeMsg + "\n" + stars
}

func CleanupMessage(oldMsg string) string {
	msgWithoutStars := strings.ReplaceAll(oldMsg, "*", "")
	return strings.TrimSpace(msgWithoutStars)
}
