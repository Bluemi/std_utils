#!/usr/bin/env python3


import datetime
from simple_term_menu import TerminalMenu


def list_dates_for_next_year(selected_day_index):
    """
    Calculates and prints every date for the selected weekday over the next year.

    Args:
        selected_day_index (int): The index (0-6) of the chosen weekday.
    """
    # Get today's date
    today = datetime.date.today()

    # Get today's weekday (Monday is 0 and Sunday is 6)
    today_weekday = today.weekday()

    # Calculate the number of days until the next occurrence of the selected weekday
    days_until_next = (selected_day_index - today_weekday + 7) % 7
    
    # If the selected day is today, we want to start from today.
    # Otherwise, we find the date for the upcoming selected day.
    if days_until_next == 0:
        first_date = today
    else:
        first_date = today + datetime.timedelta(days=days_until_next)

    print(f"\nHere are the dates for your selected day over the next 365 days:\n")

    # Loop 52 times to get one year's worth of dates
    for i in range(52):
        next_date = first_date + datetime.timedelta(weeks=i)
        print(next_date.strftime("%d.%m.%Y"))
    
    print("\n")


def main():
    """
    Main function to run the terminal menu application.
    """
    # Define the days of the week for the menu
    days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    # Create and display the terminal menu
    try:
        menu = TerminalMenu(
            days_of_week,
            title="Select a day of the week:",
            # Show a brief help message
            menu_cursor_style=("fg_green", "bold"),
            menu_highlight_style=("bg_green", "fg_black"),
        )
        selected_index = menu.show()

        # Check if the user made a selection (not None) and process it
        if selected_index is not None:
            print(f"\nYou selected: {days_of_week[selected_index]}")
            list_dates_for_next_year(selected_index)
        else:
            print("\nNo selection was made. Exiting.")

    except KeyboardInterrupt:
        # Handle graceful exit on Ctrl+C
        print("\nExiting program.")
    

if __name__ == "__main__":
    main()

