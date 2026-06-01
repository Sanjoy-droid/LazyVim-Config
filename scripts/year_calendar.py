#!/usr/bin/env python3
import datetime, calendar

today        = datetime.date.today()
year         = today.year
day_of_year  = today.timetuple().tm_yday
days_in_year = 366 if calendar.isleap(year) else 365
days_left    = days_in_year - day_of_year
weeks_left   = days_left // 7
percent_gone = (day_of_year / days_in_year) * 100

RESET  = "\033[0m"
PAST   = "\033[38;5;28m"     # github dark green — committed days
TODAY  = "\033[1;38;5;46m"   # bright green — today
FUTURE = "\033[38;5;235m"    # near black — empty squares
GONE   = "\033[1;38;5;196m"  # red stat
LEFT   = "\033[1;38;5;40m"   # github green stat
TITLE  = "\033[1;38;5;255m"  # white title
MONTH  = "\033[38;5;244m"
DAYLBL = "\033[38;5;240m"

# start from Monday of week containing Jan 1
jan1  = datetime.date(year, 1, 1)
start = jan1 - datetime.timedelta(days=jan1.weekday())

weeks = []
d = start
while True:
    week = [d + datetime.timedelta(days=i) for i in range(7)]
    weeks.append(week)
    d += datetime.timedelta(days=7)
    if d.year > year:
        break

# month first-letter at correct week column
month_cols = {}
for wi, week in enumerate(weeks):
    for dd in week:
        if dd.year == year and dd.day == 1:
            month_cols[wi] = calendar.month_abbr[dd.month][0]

month_row = "".join(month_cols.get(wi, " ") for wi in range(len(weeks)))

DAY_LABELS = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]

print()
print(f"  {TITLE}{year}  ·  Day {day_of_year}/{days_in_year}  ·  {percent_gone:.0f}% gone{RESET}")
print()
print(f"     {MONTH}{month_row}{RESET}")

for row in range(7):
    line = f"{DAYLBL}{DAY_LABELS[row]}{RESET} "
    for week in weeks:
        dd = week[row]
        if dd.year != year:
            line += " "
        elif dd < today:
            line += f"{PAST}▓{RESET}"
        elif dd == today:
            line += f"{TODAY}█{RESET}"
        else:
            line += f"{FUTURE}░{RESET}"
    print("  " + line)

print()
print(f"  {GONE}▓ {day_of_year} days gone  ·  {percent_gone:.1f}% of {year} is dead{RESET}")
print(f"  {LEFT}░ {days_left} days  ·  {weeks_left} weeks still ahead{RESET}")
print()
