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
MONTH  = "\033[38;5;249m"   # was 244 gray → LazyVim cursor blue
DAYLBL = "\033[38;5;249m"   # was 240 gray → LazyVim cursor blue
GONE = "\033[1;38;5;203m"   # warm salmon-red
LEFT   = "\033[1;38;5;35m"  # matches FUTURE block
TITLE  = "\033[1;38;5;255m"
DIM    = "\033[38;5;244m"

def block(fg):
    return f"\033[{fg}m■ \033[0m"

# Graph blocks — red gradient (dark → bright, old → recent)
FUTURE = block("38;5;35")    # was 242 gray → now darkest green (dim, "not yet lived")
TODAY   = block("38;5;196")   # brightest red
OLD     = block("38;5;52")    # darkest red
MED     = block("38;5;88")    # dark red
RECENT  = block("38;5;124")   # mid red
HOT     = block("38;5;160")   # bright red
SKIP    = "  "


def day_block(dd):
    if dd.year != year:
        return SKIP
    delta = (today - dd).days
    if dd > today:
        return FUTURE
    if dd == today:
        return TODAY
    if delta <= 7:
        return HOT
    if delta <= 30:
        return RECENT
    if delta <= 60:
        return MED
    return OLD

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

# month labels row
month_cols = {}
for wi, week in enumerate(weeks):
    for dd in week:
        if dd.year == year and dd.day == 1:
            month_cols[wi] = calendar.month_abbr[dd.month][:1]

month_row = "".join(
    f"{MONTH}{month_cols[wi]}{RESET} " if wi in month_cols else "  "
    for wi in range(len(weeks))
)

DAY_LABELS = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]

print()
print(f"  {TITLE}{year}{RESET}  {DIM}·{RESET}  {TITLE}Day {day_of_year}/{days_in_year}{RESET}  {DIM}·{RESET}  {TITLE}{percent_gone:.0f}% gone{RESET}")
print()
print(f"     {month_row}")

for row in range(7):
    line = f"{DAYLBL}{DAY_LABELS[row]}{RESET} "
    for week in weeks:
        line += day_block(week[row])
    print("  " + line)

print()
print(f"  {GONE}■ {day_of_year} days gone  ·  {percent_gone:.1f}% of {year} is dead{RESET}")
print(f"  {LEFT}■ {days_left} days  ·  {weeks_left} weeks still ahead{RESET}")
print()
