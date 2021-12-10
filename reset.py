import datetime
import json
import os

home_dir = os.path.expanduser("~")
LAST_RESET_FILE = ".last_reset_date.json"
last_reset_file_path = os.path.join(home_dir, LAST_RESET_FILE)
DAY_IN_SECONDS = datetime.timedelta(days=1).total_seconds()
RESET_THRESHOLD_IN_DAYS = 25


def get_last_reset_date(
        reset_file_path: str = last_reset_file_path
) -> datetime.datetime:
    try:
        with open(reset_file_path) as f:
            last_reset = json.load(f)
    except FileNotFoundError:
        last_reset_date = datetime.datetime(year=1990, month=1, day=1)
    else:
        last_reset_date = datetime.datetime.fromtimestamp(last_reset['date'])

    return last_reset_date


def _reset(upper_pattern, lower_pattern):
    path = os.path.join(
            home_dir,
            ".config/JetBrains"
    )
    eval_path = os.path.join(path, upper_pattern, "eval")
    other_path = os.path.join(path, upper_pattern, "options/other.xml")
    user_preferences_path = os.path.join(
            home_dir,
            ".java/.userPrefs/jetbrains",
            lower_pattern
    )
    commands = [
        f"rm -r {eval_path}",
        f"rm -r {other_path}",
        f"rm -r {user_preferences_path}"
    ]
    for command in commands:
        result = os.system(command)
        print("Result: %s, command: %s" % (result, command))



def reset():
    pycharm_up = "PyCharm*"
    pycharm_low = "pycharm"
    intelij_up = "IntelliJIdea*"
    intelij_low = "idea"
    webstorm_up = "WebStorm*"
    webstorm_low = "webstorm"
    _reset(pycharm_up, pycharm_low)
    _reset(intelij_up, intelij_low)
    _reset(webstorm_up, webstorm_low)
     

def update_last_reset_date(
        new_reset_date: datetime.datetime,
        reset_file_path: str = last_reset_file_path):
    timestamp = new_reset_date.timestamp()
    with open(reset_file_path, "w") as f:
        json.dump(
            {"date": timestamp},
            f, indent=2
        )


def main():
    last_reset_date = get_last_reset_date()
    today = datetime.datetime.today()
    time_from_last_reset = today - last_reset_date
    last_reset_in_days = time_from_last_reset.total_seconds() / DAY_IN_SECONDS

    if last_reset_in_days > RESET_THRESHOLD_IN_DAYS:
        reset()
        update_last_reset_date(new_reset_date=today)
        print("Reset done")
    else:
        print("Last reset was %s days ago" % last_reset_in_days)


if __name__ == "__main__":
    main()
